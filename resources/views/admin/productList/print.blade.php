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
            Product Lists
        </div>                          
        <table class="print-table">
            <thead>
                <tr>
                    <th width="20px">Sl</th>
                    <th>Category</th>
                    <th>Product Name</th>
                    <th width="100px">Unit Price</th>
                </tr>
            </thead>

            <tbody>
                @php $sl = 0; @endphp

                @foreach ($productLists as $productList)
                	@php $sl++; @endphp
                    <tr>
                        <td>{{ $sl }}</td>
                        <td>{{ $productList->categoryName }}</td>
                        <td>{{ $productList->productName }}</td>
                        <td style="text-align: right;">{{ $productList->unitPrice }}</td>
                    </tr>                                    
                @endforeach
            </tbody>
        </table>
    </body>
</html>

