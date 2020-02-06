<?php

namespace App\Http\Controllers;

use App\Shipping;
use App\Product;
use App\Transaction;
use App\Order;
use App\Checkout;
use Illuminate\Http\Request;

use Aamarpay;
use Cart;

class ShippingController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $this->validation($request);
        if ($request->session()->exists('shipping') && $request->session()->get('shipping')->id==$request->shipping_id) {
            $carts=Cart::content();
            $checkout = Checkout::create([
                'customer_id'=>1,
                'shipping_id'=>$request->shipping_id
            ]);
            $total = 0;
            foreach($carts as $cart){
                $product=Product::find($cart->id);
                $order = Order::create([
                    'checkout_id'=>$checkout->id,
                    'product_id'=>$product->id,
                    'qty'=>$cart->qty,
                    'weight'=>'',
                    'price'=>$product->price,
                    'discount'=>$product->discount,
                ]);
                $total+=$cart->subtotal;
            }
            if($request->payment_method=='bkash') $reference = $request->bkash_number;
            if($request->payment_method=='rocket') $reference = $request->rocket_number;
            $transaction = Transaction::create([
                'checkout_id'=>$checkout->id,
                'total'=>$total,
                'method'=>$request->payment_method,
                'payment'=>0,
                'reference'=>$reference,
            ]);
            Cart::destroy();
            $request->session()->forget('shipping');
            return view('frontend.products.success');
        } else {
            return view('frontend.products.failure');
        }
        
        if($request->ajax())
            {
                echo true;
                return;
            }
    }
    public function online(Request $request)
    {
        $carts=Cart::content();
        $total = 0;
        foreach($carts as $cart){
            $total+=$cart->subtotal;
        }
        if($request->get('pay_status') == 'Failed') {
            return redirect()->back();
        }
        
        $amount = $total;
        $valid  = Aamarpay::valid($request, $amount);
        
        if($valid) {
            if ($request->session()->exists('shipping') && $request->session()->get('shipping')->id==$request->shipping_id) {
                $checkout = Checkout::create([
                    'customer_id'=>1,
                    'shipping_id'=>$request->shipping_id
                ]);
                $total = 0;
                foreach($carts as $cart){
                    $product=Product::find($cart->id);
                    $order = Order::create([
                        'checkout_id'=>$checkout->id,
                        'product_id'=>$product->id,
                        'qty'=>$cart->qty,
                        'weight'=>'',
                        'price'=>$product->price,
                        'discount'=>$product->discount,
                    ]);
                    $total+=$cart->subtotal;
                }
                $transaction = Transaction::create([
                    'checkout_id'=>$checkout->id,
                    'total'=>$total,
                    'method'=>$request->payment_method,
                    'payment'=>$total,
                    'reference'=>$request->reference_number,
                    'status'=>'recieved',
                ]);
                Cart::destroy();
                $request->session()->forget('shipping');
                return view('frontend.products.success');
            } else {
                return view('frontend.products.failure');
            }
        } else {
           return view('frontend.products.failure');
        }
        return redirect()->back();
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Shipping  $shipping
     * @return \Illuminate\Http\Response
     */
    public function show(Shipping $shipping)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Shipping  $shipping
     * @return \Illuminate\Http\Response
     */
    public function edit(Shipping $shipping)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Shipping  $shipping
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Shipping $shipping)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Shipping  $shipping
     * @return \Illuminate\Http\Response
     */
    public function destroy(Shipping $shipping)
    {
        //
    }

    /**
     * Internal function for validation.
     *
     * @param  $request
     * @return \validation
     */
    public function validation(Request $request)
    {
        $this->validate(request(), [
            'shipping_id' => 'required',
        ]);
    }
}
 