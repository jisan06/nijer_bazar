<?php

namespace App\Http\Controllers\Admin;
use App\Http\Controllers\Controller;
use DB;
use PDF;
use App\Checkout;
use App\Customer;
use App\Order;
use App\Shipping;
use App\Transaction;
use App\Product;
use App\Settings;
use App\ProductSections;
use Illuminate\Http\Request;

class OrderController extends Controller
{
    public function neworderList()
    {
        $title = "Manage Pending Orders";
        $checkouts = Checkout::latest()->get();
        return view('admin.orders.neworderList')->with(compact('title','checkouts'));
    }

    public function processingOrder()
    {
        $title = "Manage Processing Order";
        $checkouts = Checkout::latest()->get();
        return view('admin.orders.processingOrder')->with(compact('title','checkouts'));
    }

    public function shippingOrder()
    {
        $title = "Manage ShippingManage Complete Ordes Orders";
        $checkouts = Checkout::latest()->get();
        return view('admin.orders.shippingOrder')->with(compact('title','checkouts'));
    }
    

    public function completeorderList()
    {
        $title = "Manage Complete Ordes";
        $checkouts = Checkout::latest()->get();
        return view('admin.orders.completeorderList')->with(compact('title','checkouts'));
    }

     public function listProduct($id)
     {
        $title = "Order List";
         $orders = Order::where('checkout_id',$id)->get();
         $invoiceId = $id;
        return view('admin.orders.listProduct')->with(compact('title','orders','invoiceId'));
    }

     public function updateQuantity(Request $request, $rowId, $qty)
    {
        if($request->ajax())
        {   
            $orders = Order::find($rowId);
            $orders->update( [
            'qty' => $qty,                        
            ]);
            print_r(1);       
            return ;
        }

        return redirect(route('orders.updateQuantity'));
    }

     public function updatePrice(Request $request, $rowId, $price)
    {
        if($request->ajax())
        {   
            $orders = Order::find($rowId);
            $orders->update( [
            'price' => $price,                        
            ]);
            print_r(1);       
            return ;
        }

        return redirect(route('orders.updateQuantity'));
    }

    public function monthlySales($month,Request $request){
            $year = date("Y");
            $monthFrom = $year."-".$month."-01";
            $monthTo = $year."-".$month."-31";

            $monthName = date("F", mktime(0, 0, 0, $month, 10));

            $monthlyIncome =  Transaction::whereBetween('created_at', [$monthFrom, $monthTo])->sum('total');

             $salesbymonth = DB::table('orders')
            ->select('orders.product_id',DB::raw('sum(orders.price) as sum'))
            ->whereBetween('orders.created_at', [$monthFrom, $monthTo])
            ->groupBy('orders.product_id')
            ->orderBy('sum','DESC')
            ->get();

              $monthlySales = [];
            foreach ($salesbymonth as $monthlySale) { 
                 $products = Product::where('id',$monthlySale->product_id)->first();
                  $sales = '
                            <tr>
                                <td class="txt-oflo" width="71%">'.$products->name.'</td>
                                <td><span class="text-success">'.$monthlySale->sum.' BDT</span></td>
                                
                            </tr>
                   ';
               array_push($monthlySales, $sales);      
            }
            
        if($request->ajax())
            {
                return response()->json([
                    'monthlySales'=>$monthlySales,
                    'monthlyIncome'=>$monthlyIncome,
                    'monthName'=>$monthName,
                ]);
            } 
        }

    public function deleteOrder(Request $request)
    {   $shippingInfo = Checkout::where('id',$request->checkout_id)->first();
        if($request->ajax())
        {   
            Checkout::where('id',$request->checkout_id)->delete();
            Transaction::where('checkout_id',$request->checkout_id)->delete();
            Order::where('checkout_id',$request->checkout_id)->delete();
            Shipping::where('id',$shippingInfo->shipping_id)->delete();
        }
    }

    public function invoices($id)
    {
        $title = "View Invoice";
        $company = Settings::first();
        $checkouts = Checkout::where('id',$id)->first();
        $shippings = Shipping::where('id',$checkouts->shipping_id)->first();
        $transactions = Transaction::where('checkout_id',$id)->first();
        $orders = Order::select('orders.*', 'products.name','product_sections.free_shipping', 'products.deal_code')
                    ->join('products', 'products.id', '=', 'orders.product_id')
                    ->join('product_sections', 'product_sections.productId', '=', 'orders.product_id')
                    ->where('orders.checkout_id', $id)
                    ->get();

        return view('admin.orders.invoice')->with(compact('title','shippings','orders','transactions','checkouts','company'));
    }

    public function downloadInvoices($checkoutId){
        $company = Settings::first();
        $checkouts = Checkout::where('id',$checkoutId)->first();
        $shippings = Shipping::where('id',$checkouts->shipping_id)->first();
        $transactions = Transaction::where('checkout_id',$checkoutId)->first();
        $orders = Order::select('orders.*', 'products.name','product_sections.free_shipping', 'products.deal_code')
                    ->join('products', 'products.id', '=', 'orders.product_id')
                     ->join('product_sections', 'product_sections.productId', '=', 'orders.product_id')
                    ->where('orders.checkout_id', $checkoutId)
                    ->get();
        $pdf = PDF::loadView('admin.orders.downloadInvoices',['shippings'=>$shippings,'orders'=>$orders,'transactions'=>$transactions,'checkouts'=>$checkouts,'company'=>$company]);

        return $pdf->download('invoice.pdf');
        }

        public function viewPdf($checkoutId){
        $company = Settings::first();
        $checkouts = Checkout::where('id',$checkoutId)->first();
        $shippings = Shipping::where('id',$checkouts->shipping_id)->first();
        $transactions = Transaction::where('checkout_id',$checkoutId)->first();
        $orders = Order::select('orders.*', 'products.name', 'products.deal_code','product_sections.free_shipping')
                    ->join('products', 'products.id', '=', 'orders.product_id')
                    ->join('product_sections', 'product_sections.productId', '=', 'orders.product_id')
                    ->where('orders.checkout_id', $checkoutId)
                    ->get();
        $pdf = PDF::loadView('admin.orders.viewPdf',['shippings'=>$shippings,'orders'=>$orders,'transactions'=>$transactions,'checkouts'=>$checkouts,'company'=>$company]);

        return $pdf->stream('invoice.pdf');
        }

}
