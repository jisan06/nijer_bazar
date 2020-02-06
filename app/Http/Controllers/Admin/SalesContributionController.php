<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

use DB;
use PDF;
use MPDF;

class SalesContributionController extends Controller
{
    public function index(Request $request)
    {
    	$title = "Sales Contribution";

    	$option = $request->option;

    	$totalQtyAndAmount = DB::table('sales_contribution')
    		->select(DB::raw('SUM(sales_contribution.cashSaleQty) + SUM(sales_contribution.creditSaleQty) as totalSalesQty'), DB::raw('SUM(sales_contribution.cashSaleAmount) + SUM(sales_contribution.creditSaleAmount) as totalSalesAmount'))
    		->first();

    	if ($option == 'Categories')
    	{
    		$salesContributes = DB::table('sales_contribution')
    			->select('categories.categoryName as name', DB::raw('SUM(sales_contribution.cashSaleQty) + SUM(sales_contribution.creditSaleQty) as salesQty'), DB::raw('SUM(sales_contribution.cashSaleAmount) + SUM(sales_contribution.creditSaleAmount) as salesAmount'))
    			->join('categories','categories.id','=','sales_contribution.categoryId')
    			->groupBy('categories.categoryName')
    			->get();
    	}

    	if ($option == 'Products')
    	{
    		$salesContributes = DB::table('sales_contribution')
    			->select('products.name as name', DB::raw('SUM(sales_contribution.cashSaleQty) + SUM(sales_contribution.creditSaleQty) as salesQty'), DB::raw('SUM(sales_contribution.cashSaleAmount) + SUM(sales_contribution.creditSaleAmount) as salesAmount'))
    			->join('products','products.id','=','sales_contribution.productId')
    			->groupBy('products.name')
    			->get();
    	}

    	if ($option == '' && $option == '')
    	{
    		$salesContributes = array();
    	}
    	
        return view('admin.salesContribution.index')->with(compact('title','salesContributes','totalQtyAndAmount','option'));
    }

    public function print(Request $request)
    {
    	$title = "Print Sales Contribution";

    	$option = $request->option;

    	$totalQtyAndAmount = DB::table('sales_contribution')
    		->select(DB::raw('SUM(sales_contribution.cashSaleQty) + SUM(sales_contribution.creditSaleQty) as totalSalesQty'), DB::raw('SUM(sales_contribution.cashSaleAmount) + SUM(sales_contribution.creditSaleAmount) as totalSalesAmount'))
    		->first();

    	if ($option == 'Categories')
    	{
    		$salesContributes = DB::table('sales_contribution')
    			->select('categories.categoryName as name', DB::raw('SUM(sales_contribution.cashSaleQty) + SUM(sales_contribution.creditSaleQty) as salesQty'), DB::raw('SUM(sales_contribution.cashSaleAmount) + SUM(sales_contribution.creditSaleAmount) as salesAmount'))
    			->join('categories','categories.id','=','sales_contribution.categoryId')
    			->groupBy('categories.categoryName')
    			->get();
    	}

    	if ($option == 'Products')
    	{
    		$salesContributes = DB::table('sales_contribution')
    			->select('products.name as name', DB::raw('SUM(sales_contribution.cashSaleQty) + SUM(sales_contribution.creditSaleQty) as salesQty'), DB::raw('SUM(sales_contribution.cashSaleAmount) + SUM(sales_contribution.creditSaleAmount) as salesAmount'))
    			->join('products','products.id','=','sales_contribution.productId')
    			->groupBy('products.name')
    			->get();
    	}

    	if ($option == '' && $option == '')
    	{
    		$salesContributes = array();
    	}

        $pdf = PDF::loadView('admin.salesContribution.print',['title'=>$title,'salesContributes'=>$salesContributes,'totalQtyAndAmount'=>$totalQtyAndAmount,'option'=>$option]);

        return $pdf->stream('sales_contributes_by_'.$option.'.pdf');   	
    }
}
