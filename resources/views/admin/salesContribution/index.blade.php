@extends('admin.layouts.master')

@section('custom-css')
    <meta name="csrf-token" content="{{ csrf_token() }}">
@endsection

@section('content')
    <div class="row">
        <div class="col-md-12 form-group">
            <div class="card" style="margin-bottom: 0px;">
                <div class="card-header">
                    <div class="row">
                        <div class="col-md-6"><h4 class="card-title">{{ $title }}</h4></div>
                    </div>
                </div>

                <div class="card-body">
                    <div class="row">
                        <div class="col-md-12">
                            @php
                                $message = Session::get('msg');
                                if (isset($message))
                                {
                                    echo "<div style='display:inline-block;width: auto;' class='alert alert-success'><strong>" .$message."</strong></div>";
                                }
                                Session::forget('msg')
                            @endphp
                        </div>
                    </div>

                    <div class="modal-body">
                        <form class="form-horizontal" action="{{ route('salesContribution.index') }}" method="post" enctype="multipart/form-data">
                            {{ csrf_field() }}
                            
                            <div class="row">
                                <div class="col-md-12">
                                    @if (count($errors) > 0)
                                        <div style="display:inline-block; width: auto;" class="alert alert-danger">
                                            {{ $errors->first() }}
                                        </div>
                                    @endif
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-8">
                                    <div class="form-group">
                                    	<div class="form-check-inline">
                                    		<label class="form-check-label">
                                    			<input type="radio" class="form-check-input" value="Categories" name="option" {{ $option == 'Categories' ? 'checked' : '' }}>Categories
                                    		</label>
                                    	</div>
                                    	<div class="form-check-inline">
                                    		<label class="form-check-label">
                                    			<input type="radio" class="form-check-input" value="Products" name="option" {{ $option == 'Products' ? 'checked' : '' }}>Products
                                    		</label>
                                    	</div>
                                    </div>  
                                </div>

                                <div class="col-md-4 text-right" style="padding-bottom: 10px;">
                                    <button type="submit" class="btn btn-outline-info btn-lg waves-effect">
                                        <span style="font-size: 16px;">
                                            <i class="fa fa-save"></i> Serach Data
                                        </span>
                                    </button>                                 
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-md-12 form-group">
            <div class="card" style="margin-bottom: 0px;">              
                <div class="card-header">
                    <div class="row">
                        <div class="col-md-6"><h4 class="card-title">{{ $title }}</h4></div>
                        <div class="col-md-6 text-right">
                            <form class="form-horizontal" action="{{ route('salesContribution.print') }}" target="_blank" method="post" enctype="multipart/form-data">
                                {{ csrf_field() }}
                                <input type="hidden" name="option" value="{{ $option }}">

                                <button type="submit" class="btn btn-outline-info btn-lg waves-effect">
                                    <span style="font-size: 16px;">
                                        <i class="fa fa-save"></i> Print Data
                                    </span>
                                </button>
                            </form>
                        </div>
                    </div>
                </div>

                <div class="card-body">
                    @php
                        $message = Session::get('msg');
                        if (isset($message))
                        {
                            echo "<div style='display:inline-block;width: auto;' class='alert alert-success'><strong>" .$message."</strong></div>";
                        }
                        Session::forget('msg');
                        // echo $fromDate;
                        // echo "<pre>";
                        // print_r($data);
                        // echo "</pre>";
                    @endphp

                    <div class="table-responsive">
                        <table id="dataTable" name="dataTable" class="table table-bordered">
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
                                    <th width="100px">Sale Qty</th>
                                    <th width="100px">% By Qty</th>
                                    <th width="110px">Sale Amount</th>
                                    <th width="105px">% By Amount</th>
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
                            	<td></td>
                            	<td></td>
                            	<td style="text-align: right;">{{ $totalQtyAndAmount->totalSalesQty }}</td>
                            	<td></td>
                            	<td style="text-align: right;">{{ $totalQtyAndAmount->totalSalesAmount }}</td>
                            	<td></td>
                            </tfoot>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection

@section('custom-js')
    <!-- This is data table -->
    <script src="{{ asset('/public/admin-elite/assets/node_modules/datatables/jquery.dataTables.min.js') }}"></script>

    <script type="text/javascript">
        $(document).ready(function() {
            var updateThis ;

            // Switchery
            var elems = Array.prototype.slice.call(document.querySelectorAll('.js-switch'));
            $('.js-switch').each(function() {
                new Switchery($(this)[0], $(this).data());
            });

            var table = $('#dataTable').DataTable( {
                "order": [[ 0, "asc" ]]
            } );

            table.on('order.dt search.dt', function () {
                table.column(0, {search:'applied', order:'applied'}).nodes().each( function (cell, i) {
                    cell.innerHTML = i+1;
                } );
            } ).draw();
        });
    </script>
@endsection