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
        <div class="header">
            Out Of Stock Report 
        </div>                          
        <table class="print-table">
            <thead>
                <tr>
                    <th width="20px">Sl</th>
                    <th>Category</th>
                    <th width="110px">Product Code</th>
                    <th>Product</th>
                    <th width="105px">Available Qty</th>
                </tr>
            </thead>

            <tbody id="tbody">
                @php
                    $sl = 0;
                @endphp

                @foreach ($stockOutReports as $stockOutReport)
                    @php
                        $sl++;
                    @endphp
                    @if ($stockOutReport->remainingQty <= $stockOutReport->reorderQty)
                        <tr>
                            <td>{{ $sl }}</td>
                            <td>{{ $stockOutReport->categoryName }}</td>
                            <td>{{ $stockOutReport->productId }}</td>
                            <td>{{ $stockOutReport->productName }}</td>
                            <td style="text-align: right;">{{ $stockOutReport->remainingQty }}</td>
                        </tr>
                    @endif                                  
                @endforeach
            </tbody>

            <tfoot>
            	<tr>
            		<th colspan="5"></th>
            	</tr>
            </tfoot>
        </table> 
    </body>
</html>

