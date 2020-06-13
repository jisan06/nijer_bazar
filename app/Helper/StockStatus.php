<?php

namespace App\Helper;
use DB;
class StockStatus
{

    public static function StockCheck($id = null) {
        $stockOutReports = DB::table('stock_valuation_report')
                  ->select('products.id','products.stockUnit','stock_valuation_report.productId as productId', DB::raw('(((SUM(stock_valuation_report.cashPurchaseQty) + SUM(stock_valuation_report.creditPurchaseQty)) - SUM(stock_valuation_report.purchaseReturnQty)) - ((SUM(stock_valuation_report.cashSaleQty) + SUM(stock_valuation_report.creditSaleQty)) - SUM(stock_valuation_report.salesReturnQty))) as remainingQty'))
                  ->join('products','products.id','=','stock_valuation_report.productId')
                  ->where('products.stockUnit','1')
                  ->where('stock_valuation_report.productId',$id)
                  ->first();
        
        return $stockOutReports;
    }
}
