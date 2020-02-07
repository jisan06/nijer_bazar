@extends('frontend.master')

@section('title', 'View Cart')

@section('mainContent')
<?php
	use App\CustomerGroupSections;
?>
 <style type="text/css">
    .left{
        text-align: left !important;
    }
    .center{
        text-align: center !important;
    }

    .cart-image img{
    	width: 95px !important;
    	height: 65px;
    }



</style>
	<div class="cart-grid row">
	    <div class="cart-grid-body col-xs-12 col-lg-9">
	        <div class="card cart-container">
	            <div class="card-block">
	                <h1 class="h1">Order List</h1>
	            </div>
	            <hr class="separator">
	            <div class="cart-overview js-cart">
	                <div class="table-responsive" style="padding: 20px;">
	                    <table class="table table-bordered table-striped">
	                        <thead>
								<tr>
									<th width="100px" class="cart-description item center">Image</th>
									<th width="90px" class="item left">Code</th>
									<th class="left">Product Name</th>
									<th width="30px" class="item left">Quantity</th>
									<th width="120px" class="left">Price</th>
									<th width="120px" class="last-item left">Subtotal</th>
								</tr>
							</thead>
	                        <tbody id="tbody">
	                            <?php
	                                $i = 0;
	                            ?>
	                            @foreach($orderlist as $order)
	                            	<tr>
		                            	<?php
			                            	$customerId = Session::get('customerId');
			                            	$customers =  DB::table('customers')->where(['id'=>$customerId])->first();
			                            	$productImage =  DB::table('product_images')->where(['productId'=>$order->product_id])->first();
			                            	$name = str_slug($order->name,'-');
			                            	$customer_group =  DB::table('customer_group_sections')->where(['customerGroupId'=>@$customers->clientGroup])
			                            	->where(['productId'=>$order->product_id])
			                            	->first();
			                            	if(@$customer_group->customerGroupId){
			                            		$subtotal = $customer_group->customerGroupPrice*$order->qty;
			                            	}else{
			                            		$subtotal = $order->price*$order->qty;	
			                            	}

		                            	?>
		                            	<td class="cart-image">
		                            		<a class="entry-thumbnail" href="{{url('product/'.@$order->product_id.'/'.@$name)}}">
		                            			<img src="{{asset('/'.@$productImage->images) }}" alt="">
		                            		</a>
		                            	</td>

		                            	<td class="cart-product-name-info item left">
		                            		{{$order->deal_code}}
		                            	</td>

		                            	<td class="cart-product-name-info item left">
		                            		<h4 class='cart-product-description'><a href="{{url('product/'.@$order->product_id.'/'.@$name)}}">{{$order->name}}</a></h4>
		                            	</td>

		                            	<td class="cart-product-quantity center">
		                            		<div class="quant-input">
		                            			{{$order->qty}}
		                            		</div>
		                            	</td>

		                            	<td class="left">৳ 
		                            		<?php 
		                            		if(@$customer_group->customerGroupId){
		                            			?>
		                            			<span class="product-price"> {{$customer_group->customerGroupPrice}}</span>
		                            			<?php }else{ ?>
		                            			<span class="product-price"> {{$order->price}}</span>
		                            		<?php } ?>
		                            	</td>

	                            		<td class="left">৳ 
	                            			<span class="product-price"> {{$subtotal}}</span>
	                            		</td>
	                            	</tr>
	                            @endforeach  
	                        </tbody>
	                    </table>
	                    <div class="shopping-cart-btn">
						<span class="">
							<a href="{{route('home.index')}}" class="btn btn-upper btn-primary outer-left-xs" style="color: #fff;">Continue Shopping</a>
							
						</span>
					</div>
	                </div>
	            </div>
	        </div>
	    </div>
	    <div class="cart-grid-right col-xs-12 col-lg-3">
	        <div class="card cart-summary">
	            @include('frontend.include.others.profileLink')
	        </div>
	    </div>
	</div>
@endsection

