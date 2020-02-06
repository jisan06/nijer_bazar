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
            Payment Log History On Date {{ Date('d-M-Y',strtotime($fromDate)) }} To {{ Date('d-M-Y',strtotime($toDate)) }}
        </div>                          
        <table class="print-table">
            <thead>
                <tr>
                    <tr>
                        <th width="20px">Sl</th>
                        <th width="100px">Date</th>
                        <th>Name</th>
                        <th width="100px">Amount</th>
                    </tr>
                </tr>
            </thead>

            <tbody>
                @php
                	$sl = 0;
                	$totalPayment  = 0;
                @endphp
                @foreach ($paymentLogs as $paymentLog)
                	@php
                		$sl++;
                		$totalPayment = $totalPayment + $paymentLog->payment;
                	@endphp
                    <tr>
                        <td>{{ $sl }}</td>
                        <td>{{ Date('d-m-Y',strtotime($paymentLog->date)) }}</td>
                        <td>{{ $paymentLog->vendorName }}</td>
                        <td style="text-align: right;">{{ $paymentLog->payment }}</td>
                    </tr>                                    
                @endforeach
            </tbody>

            <tfoot>
                <tr>
                    <th colspan="3" style="text-align: right;">Grand Total</th>
                    <th style="text-align: right;">{{ $totalPayment }}</th>
                </tr>
            </tfoot>
        </table>
    </body>
</html>

