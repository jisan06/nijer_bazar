<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\PurchaseOrder;
use App\PurchaseOrderItem;
use App\PurchaseOrderReceive;
use App\PurchaseOrderReceiveItem;
use App\Product;
use DB;


class PurchaseOrderReceiveController extends Controller
{
    public function index()
    {
        $purchaseOrderReceive = PurchaseOrderReceive::orderBy('id','DESC')->get();
        $title = 'Purchase Order Receive';
        return view('admin.purchaseOrderReceive.index')->with(compact('purchaseOrderReceive','title'));
    }

    public function add(){
        $purchaseOrder = PurchaseOrder::all();
        $products = Product::where('status',1)->get();
        $title = 'Create Purchase Order Receive';
        return view('admin.purchaseOrderReceive.add')->with(compact('title','purchaseOrder','products'));
    }

     public function save(Request $request){
        $receive_date = date('Y-m-d', strtotime($request->receive_date));
        
        $this->validate(request(), [       
             'purchaseOrderNo' => 'required',  
        ]);
        $purchaseOrderReceive = PurchaseOrderReceive::create( [     
            'purchaseOrderNo' => $request->purchaseOrderNo,                      
            'receive_date' => $receive_date,                                  
            'total_qty' => $request->total_qty, 
            'total_amount' => $request->total_amount, 
                   
        ]);

        $countProduct = count($request->product_id);
            if($request->product_id){
                $postData = [];
                for ($i=0; $i <$countProduct ; $i++) { 
                    $postData[] = [
                        'purchase_order_receive_id'=> $purchaseOrderReceive->id,
                        'product_id' => $request->product_id[$i],
                        'product_name' => $request->product_name[$i],
                        'qty' => $request->qty[$i], 
                        'rate' => $request->rate[$i],
                        'amount' => $request->amount[$i],
                    ];
                }
                
                PurchaseOrderReceiveItem::insert($postData);
            }

       return redirect(route('purchaseOrderReceive.index'))->with('msg','Purchase Order Receive Successfully');     
    }

    public function edit($id){
    	$purchaseOrder = PurchaseOrder::all();
        $products = Product::where('status',1)->get();
        $purchaseOrderReceive = PurchaseOrderReceive::where('id',$id)->first();
        $purchaseOrderReceiveItem = PurchaseOrderReceiveItem::where('purchase_order_receive_id',$id)->get();
        $title = 'Edit Purchase Order Receive';
        return view('admin.purchaseOrderReceive.edit')->with(compact('purchaseOrder','title','products','purchaseOrderReceiveItem','purchaseOrderReceive'));
    }

   /* public function view($id){
    	$purchaseOrder = PurchaseOrder::where('id',$id)->first();
        $vendors = Vendors::where('vendorStatus',1)->get();
        $products = Product::where('status',1)->get();
        $purchaseOrderItem = PurchaseOrderItem::where('purchase_order_id',$id)->get();
        $title = 'View Purchase Order';
        return view('admin.purchaseOrderReceive.view')->with(compact('purchaseOrder','title','vendors','products','purchaseOrderItem'));
    }*/

     public function update(Request $request){
        $receive_date = date('Y-m-d', strtotime($request->receive_date));
        
        $this->validate(request(), [       
             'purchaseOrderNo' => 'required',  
        ]);
        $purchaseOrderReceiveId = $request->purchaseOrderReceiveId;
        $purchaseOrderReceive = PurchaseOrderReceive::find($purchaseOrderReceiveId);

        $purchaseOrderReceive->update( [            
            'purchaseOrderNo' => $request->purchaseOrderNo,                      
            'receive_date' => $receive_date,                                  
            'total_qty' => $request->total_qty, 
            'total_amount' => $request->total_amount,             
        ]);

        $countProduct = count($request->product_id);
         DB::table('purchase_order_receive_items')->where('purchase_order_receive_id', $purchaseOrderReceiveId)->delete();
        if($request->product_id){
                $postData = [];
                for ($i=0; $i <$countProduct ; $i++) { 
                    $postData[] = [
                        'purchase_order_receive_id'=> $purchaseOrderReceive->id,
                        'product_id' => $request->product_id[$i],
                        'product_name' => $request->product_name[$i],
                        'qty' => $request->qty[$i], 
                        'rate' => $request->rate[$i],
                        'amount' => $request->amount[$i],
                    ];
                }
                
                PurchaseOrderReceiveItem::insert($postData);
            }

        return redirect(route('purchaseOrderReceive.index'))->with('msg','Purchase Order Received Updated Successfully');     
    }


public function destroy(Request $request){   
    PurchaseOrderReceive::where('id',$request->purchaseOrderReceiveId)->delete();
    PurchaseOrderReceiveItem::where('purchase_order_receive_id',$request->purchaseOrderReceiveId)->delete();
    }

  public function getPurchaseOrderItem(Request $request){
  	$purchaseOrderItems = PurchaseOrderItem::select('purchase_order_items.*', 'products.name','products.id as productId')
                    ->join('products', 'products.id', '=', 'purchase_order_items.product_id')
                    ->where('purchase_order_items.purchase_order_id', $request->purchaseOrderId)
                    ->get();
    $purchaseOrder = PurchaseOrder::where('id',$request->purchaseOrderId)->first();
    $data = ['purchaseOrderItems' => $purchaseOrderItems, 'purchaseOrder' => $purchaseOrder];

    return $data;
  }
}


