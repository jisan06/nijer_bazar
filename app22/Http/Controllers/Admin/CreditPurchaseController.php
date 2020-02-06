<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\CashPurchase;
use App\CreditPurchase;
use App\CreditPurchaseItem;
use App\Vendors;
use App\Product;
use DB;

class CreditPurchaseController extends Controller
{
    public function index()
    {
        $creditPurchase = CreditPurchase::orderBy('id','DESC')->get();
        $title = 'Credit Purchase';
        return view('admin.creditPurchase.index')->with(compact('creditPurchase','title'));
    }

    public function add(){
        $vendors = Vendors::where('vendorStatus',1)->get();
        $products = Product::where('status',1)->get();
        $cashPurchase = CashPurchase::all();
        $title = 'Add Credit Purchase';
        return view('admin.creditPurchase.add')->with(compact('title','vendors','products','cashPurchase'));
    }

     public function save(Request $request){
        $credit_invoice_date = date('Y-m-d', strtotime($request->credit_invoice_date));
      
        $this->validate(request(), [       
             'purchase_id' => 'required',  
             'credit_invoice' => 'required',  
             'supplier_id' => 'required',  
             'purchase_by' => 'required',  
        ]);
        $creditPurchase = CreditPurchase::create( [
            'purchase_id' => $request->purchase_id,            
            'credit_invoice' => $request->credit_invoice,            
            'supplier_id' => $request->supplier_id,            
            'credit_invoice_date' => $credit_invoice_date,            
            'purchase_by' => $request->purchase_by,            
            'total_qty' => $request->total_qty, 
            'total_amount' => $request->total_amount, 
            'discount' => $request->discount, 
            'vat' => $request->vat, 
            'net_amount' => $request->net_amount, 
                   
        ]);

        $countProduct = count($request->product_id);
            if($request->product_id){
                $postData = [];
                for ($i=0; $i <$countProduct ; $i++) { 
                    $postData[] = [
                        'credit_puchase_id'=> $creditPurchase->id,
                        'product_id' => $request->product_id[$i],
                        'qty' => $request->qty[$i], 
                        'rate' => $request->rate[$i],
                        'amount' => $request->amount[$i],
                    ];
                }
                
                CreditPurchaseItem::insert($postData);
            }

       return redirect(route('creditPurchase.index'))->with('msg','Credit Purchase Added Successfully');     
    }

    public function edit($id){
    	$cashPurchase = CashPurchase::all();
    	$creditPurchase = CreditPurchase::where('id',$id)->first();
        $vendors = Vendors::where('vendorStatus',1)->get();
        $products = Product::where('status',1)->get();
        $creditPurchaseItem = CreditPurchaseItem::where('credit_puchase_id',$id)->get();
        $title = 'Edit Credit Purchase';
        return view('admin.creditPurchase.edit')->with(compact('creditPurchase','cashPurchase','title','vendors','products','creditPurchaseItem'));
    }

     public function update(Request $request){
         $credit_invoice_date = date('Y-m-d', strtotime($request->credit_invoice_date));
      
        $this->validate(request(), [       
             'purchase_id' => 'required',  
             'credit_invoice' => 'required',  
             'supplier_id' => 'required',  
             'purchase_by' => 'required', 
        ]);
        $creditPurchaseId = $request->creditPurchaseId;
        $creditPurchase = CreditPurchase::find($creditPurchaseId);

        $creditPurchase->update( [            
            'purchase_id' => $request->purchase_id,            
            'credit_invoice' => $request->credit_invoice,            
            'supplier_id' => $request->supplier_id,            
            'credit_invoice_date' => $credit_invoice_date,            
            'purchase_by' => $request->purchase_by,            
            'total_qty' => $request->total_qty, 
            'total_amount' => $request->total_amount, 
            'discount' => $request->discount, 
            'vat' => $request->vat, 
            'net_amount' => $request->net_amount,            
        ]);

        $countProduct = count($request->product_id);
         DB::table('credit_purchase_items')->where('credit_puchase_id', $creditPurchaseId)->delete();
        if($request->product_id){
                $postData = [];
                for ($i=0; $i <$countProduct ; $i++) { 
                    $postData[] = [
                        'credit_puchase_id'=> $creditPurchase->id,
                        'product_id' => $request->product_id[$i],
                        'qty' => $request->qty[$i], 
                        'rate' => $request->rate[$i],
                        'amount' => $request->amount[$i],
                    ];
                }
                
                CreditPurchaseItem::insert($postData);
            }

        return redirect(route('creditPurchase.index'))->with('msg','Credit Purchase Updated Successfully');     
    }


public function destroy(Request $request){   
    CreditPurchase::where('id',$request->creditPurchaseId)->delete();
    CreditPurchaseItem::where('credit_puchase_id',$request->creditPurchaseId)->delete();
    }
}
