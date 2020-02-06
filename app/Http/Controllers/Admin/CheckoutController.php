<?php

namespace App\Http\Controllers\Admin;
use App\Http\Controllers\Controller;
use App\Checkout;
use App\Customer;
use App\Order;
use App\Shipping;
use App\Transaction;
use App\Product;
use App\Settings;
use App\ProductSections;
use Illuminate\Http\Request;
use Cart;
use Session;
use DB;
use PDF;

class CheckoutController extends Controller
{
    public function index()
    {
        $title = "Manage Orders";
        $checkouts = Checkout::latest()->get();
        return view('admin.checkouts.index')->with(compact('title','checkouts'));
    }


    public function create()
    {

        return view('frontend.products.checkout');
    }
    
    public function show(Checkout $checkout)
    {
        
    }

    public function edit(Checkout $checkout, Request $request)
    {
        $checkout = Checkout::find($request->checkout_id);
        if($request->ajax())
            {
                if($request->option == 'customer')
                    return response()->json([
                        'customer'=>$checkout->customer
                    ]);
                if($request->option == 'order'){
                    $products = Order::select('orders.*', 'products.name', 'products.deal_code')
                    ->join('products', 'products.id', '=', 'orders.product_id')
                        ->where('orders.checkout_id', $request->checkout_id)->get();
                        return response()->json([
                        'products'=>$products
                    ]);
                }
                    
                if($request->option == 'transaction')
                    return response()->json([
                        'payment'=>$checkout->transaction
                    ]);
                if($request->option == 'shipping')
                    return response()->json([
                        'shipping'=>$checkout->shipping
                    ]);
                if($request->option == 'status')
                    return response()->json([
                        'checkout'=>$checkout,
                        'transaction'=>$checkout->transaction->status,
                        'shipping'=>$checkout->shipping->status
                    ]);
            }
        // return "view is not completed yet!! its from controller .";
    }

  
    public function status(Request $request)
    {
        $checkout = Checkout::find($request->checkout_id);
        if($request->ajax())
            {
            
                if($request->option == 'checkout'){
                    if($request->status == 'Waiting') {
                        $checkout->shipping->update(['status'=>'Waiting']);
                        $checkout->update(['status'=>'Waiting']);
                    } else if($request->status == 'Processing') {
                        $checkout->shipping->update(['status'=>'Processing']);
                        $checkout->update(['status'=>'Processing']);
                    } else if($request->status == 'Shipping') {
                        $checkout->shipping->update(['status'=>'Shipping']);
                        $checkout->update(['status'=>'Shipping']);
                    } else if($request->status == 'Complete') {
                        $checkout->transaction->update(['status'=>'Complete']);
                        $checkout->shipping->update(['status'=>'Complete']);
                        $checkout->update(['status'=>'Complete']);
                    }
                }

                $checkout->update();
                return response()->json([
                        'checkout'=>$checkout,
                        'transaction'=>$checkout->transaction,
                        'shipping'=>$checkout->shipping,
                    ]);
            }
        // return "view is not completed yet!! its from controller .";
    }

    public function checkoutPage(){
        return view('frontend.order.checkout');
    }

    public function orderSave(Request $request){
        $customerId = Session::get('customerId');
       /* $this->validate(request(), [
            'fullName' => 'required|string|max:100',
            'email' => 'nullable|string|max:100',
            'phone' => 'required|numeric|max:100',
            'address' => 'required|string|max:150',
        ]);

*/      if($request->email){
            $existCustomer = Customer::where('email',$request->email)->orWhere('mobile',$request->phone)->first();    
        }else{
            $existCustomer = Customer::where('mobile',$request->phone)->first();
        }
        
        if($existCustomer){
            $customer = Customer::find($existCustomer->id);
            $customer->update( [
                'name'=>$request->fullName,
                'email'=>$request->email,
                'mobile'=>$request->phone,
                'address'=>$request->address,         
            ]);
            }else{
                $customer = Customer::create([
                'name'=>$request->fullName,
                'email'=>$request->email,
                'mobile'=>$request->phone,
                'address'=>$request->address,
            ]);
        } 

        $shipping = Shipping::create([            
            'name'=>$request->fullName,
            'mobile'=>$request->phone,
            'email'=>$request->email,
            'address'=>$request->address,
        ]);
            $carts=Cart::content();
            $checkout = Checkout::create([
                'customer_id'=>$customerId,
                'shipping_id'=>$shipping->id
            ]);
            
            $total = 0;

            foreach($carts as $cart){
                $product=Product::find($cart->id);
                $order = Order::create([
                    'checkout_id'=>$checkout->id,
                    'product_id'=>$product->id,
                    'qty'=>$cart->qty,
                    'weight'=>'',
                    'price'=>$cart->price,
                    'discount'=>$product->discount,
                ]);
               
                $total+=$cart->subtotal;
            }
            if($request->payment_method=='bkash') $reference = $request->bkash_number;
            
            $transaction = Transaction::create([
                'checkout_id'=>$checkout->id,
                'total'=>$total,
                'method'=>$request->payment_method,
                'payment'=>0,
                'reference'=>$customer->id,
            ]);
            
            Cart::destroy();
            return view('frontend.order.ordersuccess');
    
    }

    

    public function validation(Request $request)
    {
        $this->validate(request(), [
            'first_name' => 'required|string|max:100',
            'mobile' => 'required|string|max:100',
            'email' => 'nullable|string|max:100',
            'address' => 'required|string|max:150',
        ]);
    }
}
