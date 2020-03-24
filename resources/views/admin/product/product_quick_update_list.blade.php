@extends('admin.layouts.master')

@section('custom_css')
    <style type="text/css">
        .table td{
            /*height: 30px;
            line-height:30px;*/
            vertical-align: middle !important;
        }
        .table select, .table input{
            height: 100%;
            width: 100%;
        }
        .table textarea{
            height: 32px;
            vertical-align: middle;
            width: 100%;
        }
    </style>
@endsection

@section('content')
    @php
      use App\ProductImage;      
      use App\Category;        
    @endphp

    <div class="row">
        <div class="col-12">
            <div class="card">            
                <div class="card-header">
                    <div class="row">
                        <div class="col-md-6"><h4 class="card-title">{{ $title }}</h4></div>
                        <div class="col-md-6">                      
                        </div>
                    </div>
                </div>

                <div class="card-body">
                    <div class="table-responsive">
                        @php
                            $message = Session::get('msg');
                            if (isset($message))
                            {
                                echo"<div style='display:inline-block;width: auto;' class='alert alert-success'><strong>" .$message."</strong></div>";
                            }

                            Session::forget('msg');
                            $sl = 0;
                        @endphp

                        <table id="productTable" class="table table-bordered table-striped"  name="productTable">
                            <thead>
                                <tr>
                                    <th width="10px">SL</th>
                                    <th width="200px">Product Name</th>
                                    <th width="90px">Code</th>
                                    <th width="150px">Category</th>
                                    <th width="100px">Old Price</th>
                                    <th width="105px">New Price</th>
                                    <th width="105px">Discount</th>
                                    {{-- <th>Image</th> --}}
                                    <th width="100px">Order</th>
                                    <th width="20px">Action</th>
                                </tr>
                            </thead>
                            <tbody id="tbody">
                            	@foreach($products as $product)                        
                                	<tr>
                                        @php
                                            $sl++;
                                            if($product->discount){
                                                $discount = $product->discount;
                                            }else{
                                                $discount = '0.00';
                                            }
                                        @endphp
                                        <td>{{ $sl }}</td>
                                        <td>
                                            <textarea name="name" class="name_{{$product->id}}">{{ @$product->name }}</textarea>
                                        </td>
                                        <td>
                                           {{ @$product->deal_code }}
                                        </td>
                                        <td>
                                            <select class="chosen-select category_id_{{$product->id}}" name="category_id">
                                                <option>Select Category</option>
                                                @php
                                                    foreach ($categories as $category) {
                                                        if($category->id == $product->category_id){
                                                            $selected = "selected";
                                                        }else{
                                                            $selected = "";
                                                        }                                   
                                                    @endphp
                                                <option {{@$selected}} value="{{$category->id}}">{{$category->categoryName}}</option>
                                                @php } @endphp
                                            </select>
                                        </td>
                                        <td>
                                           {{ @$product->price }}
                                        </td>
                                        <td>
                                            <input type="number" name="price" value="{{ @$product->price }}" class="form-control price_{{$product->id}}">
                                        </td>
                                        <td>
                                            <input type="number" name="discount" value="{{ @$discount}}" class="form-control discount_{{$product->id}}">
                                        </td>
                                        {{-- <td>
                                            @php
                                                if(file_exists($product->images)){
                                                    $image = asset('/').@$product->images;
                                                }else{
                                                    $image = $noImage;
                                                }
                                            @endphp
                                            <a data-fancybox="gallery" href="{{ asset(@$image) }}">
                                                <img src="{{ @$image }}" style="width: 75px; height: 75px; margin: 0px;">
                                            </a>
                                        </td> --}}
                                        <td>
                                            <input type="number" name="orderBy" value="{{ @$product->orderBy}}" class="form-control orderBy_{{$product->id}}">
                                        </td>        
                                        <td class="text-nowrap">
                                            <button class="btn btn-success btn-md" onclick="UpdateProduct({{ $product->id }})" style="font-size: 12px;">
                                                <i class="fa fa-save"></i> UPDATE
                                            </button>
                                        </td>
                                    </tr>
                            	@endforeach
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- ============================================================== -->
    <!-- End PAge Content -->
    <!-- ============================================================== -->
@endsection

@section('custom-js')
    
    <script type="text/javascript">
        $(document).ready(function() {
            var updateThis ;

            var table = $('#productTable').DataTable( {
                "order": [[ 0, "asc" ]]
            } );

            table.on('order.dt search.dt', function () {
                table.column(0, {search:'applied', order:'applied'}).nodes().each( function (cell, i) {
                    cell.innerHTML = i+1;
                } );
            } ).draw();
        });

        function UpdateProduct(productId) {
                var deal_code = $('.deal_code_'+productId).val();
                var name = $('.name_'+productId).val();
                var category_id = $(".category_id_"+productId+" option:selected").val();
                var price = $('.price_'+productId).val();
                var discount = $('.discount_'+productId).val();
                var orderBy = $('.orderBy_'+productId).val();
                $.ajax({
                    headers: {
                        'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                    },
                    type: "post",
                    url: "{{ route('product.quickUpdate') }}",
                    data: {
                        productId:productId,
                        deal_code:deal_code,
                        name:name,
                        category_id:category_id,
                        price:price,
                        discount:discount,
                        orderBy:orderBy,
                    },
                    success: function(response) {
                        swal({
                            title: "<small class='text-success'>Success!</small>", 
                            type: "success",
                            text: "Product Successfully Updated!",
                            timer: 1000,
                            html: true,
                        });
                    },
                    error: function(response) {
                        error = "Failed.";
                        swal({
                            title: "<small class='text-danger'>Error! Not Updated</small>", 
                            type: "error",
                            text: error,
                            timer: 2000,
                            html: true,
                        });
                    }
                });
            }
                
    </script>
@endsection