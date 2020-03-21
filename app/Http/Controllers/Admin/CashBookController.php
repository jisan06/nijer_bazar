<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

use App\CoaSetup;

use Auth;
use DB;
use PDF;

class CashBookController extends Controller
{
	public function index(Request $request)
	{
		$title = "Cash Book";
		$searchFormLink = "cashBook.index";
		$printFormLink = "cashBook.print";
        $print = $request->print;

        $fromDate = date('Y-m-d',strtotime($request->fromDate));
        $toDate = date('Y-m-d',strtotime($request->toDate));
        $lastDate = Date('Y-m-d',strtotime("-1 day", strtotime($fromDate)));

        $coaHeadCode = CoaSetup::where('head_name','Cash In Hand')->first();

    	$previousBalance = DB::table('tbl_account_transactions')
    		->select(DB::raw('(SUM(debit_amount) - SUM(credit_amount)) as previousBalance'))
            // ->where('showroom_id',$this->showroomId)
    		->where('voucher_date','<=',$lastDate)
    		->where('coa_head_code',$coaHeadCode->head_code)
    		->where('approve',1)
    		->first();

    	$cashBookReports = DB::table('tbl_account_transactions')
    		->select('tbl_account_transactions.*')
            // ->where('showroom_id',$this->showroomId)
    		->whereBetween('voucher_date', array($fromDate,$toDate))
    		->where('coa_head_code',$coaHeadCode->head_code)
    		->where('approve',1)
    		->orderby('voucher_no')
    		->get();

		return view('admin.cashBook.index')->with(compact('title','searchFormLink','printFormLink','print','fromDate','toDate','cashBookReports','previousBalance'));
	}

	public function print(Request $request)
	{
		$title = "Print Cash Book";
		$searchFormLink = "cashBook.index";
		$printFormLink = "cashBook.print";
        $print = $request->print;

        $fromDate = date('Y-m-d',strtotime($request->fromDate));
        $toDate = date('Y-m-d',strtotime($request->toDate));
        $lastDate = Date('Y-m-d',strtotime("-1 day", strtotime($fromDate)));

        $coaHeadCode = CoaSetup::where('head_name','Cash In Hand')->first();

    	$previousBalance = DB::table('tbl_account_transactions')
    		->select(DB::raw('(SUM(debit_amount) - SUM(credit_amount)) as previousBalance'))
            // ->where('showroom_id',$this->showroomId)
    		->where('voucher_date','<=',$lastDate)
    		->where('coa_head_code',$coaHeadCode->head_code)
    		->where('approve',1)
    		->first();

    	$cashBookReports = DB::table('tbl_account_transactions')
    		->select('tbl_account_transactions.*')
            // ->where('showroom_id',$this->showroomId)
    		->whereBetween('voucher_date', array($fromDate,$toDate))
    		->where('coa_head_code',$coaHeadCode->head_code)
    		->where('approve',1)
    		->orderby('voucher_no')
    		->get();

        $pdf = PDF::loadView('admin.cashBook.print',['title'=>$title,'fromDate'=>$fromDate,'toDate'=>$toDate,'print'=>$print,'cashBookReports'=>$cashBookReports,'previousBalance'=>$previousBalance],[],['orientation'=>'P']);
        return $pdf->stream('cash_book_'.$fromDate.'_'.$toDate.'.pdf');
	}
}
