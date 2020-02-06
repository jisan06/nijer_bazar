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
            Sales Contributes By {{ $option }}
        </div>                          
        <table class="print-table">
            <thead>
                <tr>
                    <th width="20px">Sl</th>
                    @if ($option == 'Categories')
                        <th>Category Name</th>
                    @endif

                    @if ($option == 'Products')
                        <th>Products Name</th>
                    @endif

                    @if ($option == '' && $option == '')
                        <th>Name</th>
                    @endif                                    
                    <th>Sale Qty</th>
                    <th>% By Qty</th>
                    <th>Sale Amount</th>
                    <th>% By Amount</th>
                </tr>
            </thead>

            <tbody id="tbody">
                @php
                    $sl = 0;
                    $saleQtyPercentage = 0;
                    $saleAmountPercentage = 0;
                @endphp

                @foreach ($salesContributes as $salesContribute)
                    @php
                        $sl++;
                        $saleQtyPercentage = ($salesContribute->salesQty * 100)/$totalQtyAndAmount->totalSalesQty;
                        $saleAmountPercentage = ($salesContribute->salesAmount * 100)/$totalQtyAndAmount->totalSalesAmount;                                    
                    @endphp
                    <tr>
                        <td>{{ $sl }}</td>
                        <td>{{ $salesContribute->name }}</td>
                        <td style="text-align: right;">{{ $salesContribute->salesQty }}</td>
                        <td style="text-align: right;">{{ number_format($saleQtyPercentage,2,'.','') }}</td>
                        <td style="text-align: right;">{{ $salesContribute->salesAmount }}</td>
                        <td style="text-align: right;">{{ number_format($saleAmountPercentage,2,'.','') }}</td>
                    </tr>                                 
                @endforeach
            </tbody>

            <tfoot>
            	<tr>
	            	<th colspan="2"></th>
	            	<th style="text-align: right;">{{ $totalQtyAndAmount->totalSalesQty }}</th>
	            	<th></th>
	            	<th style="text-align: right;">{{ $totalQtyAndAmount->totalSalesAmount }}</th>
	            	<th></th>
            	</tr>
            </tfoot>
        </table>
    </body>
</html>

