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
	<body>
		<div style="margin-bottom: 0px; text-align: center;">
			<p>Techno Park Bangladesh</p>
            <p style="font-size: 10px;">DIT Project, Badda, Dhaka</p>
            <p style="font-size: 10px;">Email:technoparkbd@gmail.com</p>
		</div>
		<div style="border: 1px solid black; box-shadow: 5px 5px #888888; padding: 0px; margin-bottom: 10px; text-align: center;">
			Purchase History On Date {{ Date('d-M-Y',strtotime($fromDate)) }} To {{ Date('d-M-Y',strtotime($toDate)) }}
		</div>							
		<table class="print-table">
			<thead>
				<tr>
					<th>Sl</th>
					<th>Invoice Date</th>
					<th>Invoice No</th>
					<th>Type</th>
					<th>Supplier Name</th>
					<th>Category Name</th>
					<th>Product Name</th>
                    <th>Qty</th>
					<th>Rate</th>
                    <th>Amount</th>
				</tr>
			</thead>

			<tbody>
				@php
					$sl = 0;
					$totalCashPurchaseQty = 0;
					$totalCashPurchaseAmount = 0;

					$totalCreditPurchaseQty = 0;
					$totalCreditPurchaseAmount = 0;
				@endphp

                @foreach ($cashPurchases as $cashPurchase)
                    @php
                    	$sl++;
                    	$totalCashPurchaseQty = $totalCashPurchaseQty + $cashPurchase->qty;
                    	$totalCashPurchaseAmount = $totalCashPurchaseAmount + $cashPurchase->amount;
                    @endphp
                    <tr>
                        <td>{{ $sl }}</td>
                        <td>{{ Date('d-m-Y',strtotime($cashPurchase->invoice_date)) }}</td>
                        <td>{{ $cashPurchase->cash_serial }}</td>
                        <td>{{ $cashPurchase->type }}</td>
                        <td>{{ $cashPurchase->vendorName }}</td>
                        <td>{{ $cashPurchase->categoryName }}</td>
                        <td>{{ $cashPurchase->name }}</td>
                        <td>{{ $cashPurchase->qty }}</td>
                        <td>{{ $cashPurchase->rate }}</td>
                        <td>{{ $cashPurchase->amount }}</td>
                    </tr>                                    
                @endforeach

				@foreach ($creditPurchases as $creditPurchase)
					@php
						$sl++;
                    	$totalCreditPurchaseQty = $totalCreditPurchaseQty + $creditPurchase->qty;
                    	$totalCreditPurchaseAmount = $totalCreditPurchaseAmount + $creditPurchase->amount;
					@endphp
					<tr>
                        <td>{{ $sl }}</td>
                        <td>{{ Date('d-m-Y',strtotime($creditPurchase->invoice_date)) }}</td>
                        <td>{{ $creditPurchase->credit_serial }}</td>
                        <td>{{ $creditPurchase->type }}</td>
                        <td>{{ $creditPurchase->vendorName }}</td>
                        <td>{{ $creditPurchase->categoryName }}</td>
                        <td>{{ $creditPurchase->name }}</td>
                        <td>{{ $creditPurchase->qty }}</td>
                        <td>{{ $creditPurchase->rate }}</td>
                        <td>{{ $creditPurchase->amount }}</td>
					</tr>                                    
				@endforeach
			</tbody>
		</table>


        <div style="border: 1px solid black; padding: 0px; margin-top: 20px;">
            <table class="total-table">
                <tr>
                    <td>Total Cash Purchase Quantity</td>
                    <td>{{ $totalCashPurchaseQty }}</td>
                    <td>Total Cash Purchase Amount</td>
                    <td>{{ $totalCashPurchaseAmount }}</td>
                </tr>

                <tr>
                    <td>Total Credit Purchase Quanity</td>
                    <td>{{ $totalCreditPurchaseQty }}</td>
                    <td>Total Credit Purchase Amount</td>
                    <td>{{ $totalCreditPurchaseAmount }}</td>
                </tr>
                
                <tr>
                    <td>Grand Total Quantity</td>
                    <td>{{ $totalCashPurchaseQty + $totalCreditPurchaseQty }}</td>
                    <td>Grand Total Amount</td>
                    <td>{{ $totalCashPurchaseAmount + $totalCreditPurchaseAmount }}</td>
                </tr>
            </table>
        </div>
	</body>
</html>

