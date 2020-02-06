<!DOCTYPE html>
<html>
    <head>
        <title>{{ $title }}</title>
        <link href="{{ asset('/public/admin-elite/dist/css/prints.css') }}" rel="stylesheet">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <style type="text/css">
            body {
                font-family: 'common', sans-serif;
            }
        </style>
    </head>
    <style type="text/css">
    	.print-table{
    		border-bottom: 1px solid #333;
    	}
    </style>
    <body>
        <div style="margin-bottom: 0px; text-align: center;">
            <p>Techno Park Bangladesh</p>
            <p style="font-size: 10px;">DIT Project, Badda, Dhaka</p>
            <p style="font-size: 10px;">Email:technoparkbd@gmail.com</p>
        </div>
        <div style="border: 1px solid black; box-shadow: 5px 5px #888888; padding: 0px; margin-bottom: 10px; text-align: center;">
            Product Wise Report On Date {{ Date('d-M-Y',strtotime($fromDate)) }} To {{ Date('d-M-Y',strtotime($toDate)) }}
        </div>                          
        <table class="print-table">
			<thead>
				<tr>
					<th width="20px">Sl</th>
					<th>Category</th>
					<th width="70px">Code</th>
					<th>Name</th>
					<th width="60px">Qty</th>
					<th width="80px">Price</th>
					<th width="80px">Vat</th>
					<th width="80px">Discount</th>
					<th width="80px">Total</th>
					<th width="80px">Costing</th>
					<th width="80px">Profit</th>
					<th width="75px">% Profit</th>
				</tr>
			</thead>

            <tbody id="tbody">
                @php
                	$sl = 0;
                    $total = 0;
                    $costing = 0;
                    $profit = 0;
                    $percentageProfit = 0;
                @endphp
                @foreach ($productWiseProfits as $productWiseProfit)
                    @php
                        $sl++;
                        $total = ($productWiseProfit->price + $productWiseProfit->vat) - $productWiseProfit->discount;
                        $avgPrice = DB::table('stock_valuation_report')
                            ->select(DB::raw('((SUM(stock_valuation_report.cashPurchaseAmount) + SUM(stock_valuation_report.creditPurchaseAmount)) - SUM(stock_valuation_report.purchaseReturnAmount)) / ((SUM(stock_valuation_report.cashPurchaseQty) + SUM(stock_valuation_report.creditPurchaseQty)) - SUM(stock_valuation_report.purchaseReturnQty)) as avgPrice'))
                            ->where('productId',$productWiseProfit->productId)
                            ->first();
                        $costing = $avgPrice->avgPrice * $productWiseProfit->qty;
                        $profit = $total - $costing;
                        $percentageProfit = ($profit * 100)/$total;
                    @endphp
                    <tr>
                        <td>{{ $sl }}</td>
                        <td>{{ $productWiseProfit->categoryName }}</td>
                        <td>{{ $productWiseProfit->productId }}</td>
                        <td>{{ $productWiseProfit->productName }}</td>
                        <td style="text-align: right;">{{ $productWiseProfit->qty }}</td>
                        <td style="text-align: right;">{{ $productWiseProfit->price }}</td>
                        <td style="text-align: right;">{{ $productWiseProfit->vat }}</td>
                        <td style="text-align: right;">{{ $productWiseProfit->discount }}</td>
                        <td style="text-align: right;">{{ $total }}</td>
                        <td style="text-align: right;">{{ number_format($costing,'2','.','') }}</td>
                        <td style="text-align: right;">{{ number_format($profit,'2','.','') }}</td>
                        <td style="text-align: right;">{{ number_format($percentageProfit,'2','.','') }}</td>
                    </tr>                                    
                @endforeach
            </tbody>

            {{-- <tfoot>
                <tr>
                    <th colspan="6"></th>
                </tr>
            </tfoot> --}}
        </table>

        {{-- <div class="footer">
            <table width="100%">
            	<tr>
            		<th style="text-align: center;">Total Collection Summery : {{ number_format($totalCollection,'2','.','') }}</th>
            	</tr>
            </table> 
        </div> --}}
    </body>
</html>

