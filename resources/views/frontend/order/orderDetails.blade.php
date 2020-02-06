@extends('frontend.master')

@section('title', 'View Cart')

@section('mainContent')
<?php
	use App\CustomerGroupSections;
?>
 <style type="text/css">
    .left{
        text-align: left !important;
        padding-left: 0 !important;
    }
    .center{
        text-align: center !important;
    }

    .cart-image img{
    	width: 96px !important;
    	height: 85px;
    }

</style>


<!-- Main Container  -->
<div class="main-container container">
    <div class="row">
      <aside class="col-sm-4 col-md-3 content-aside" id="column-left">
            
       </aside>
            <!--Left Part End -->

        <!--Middle Part Start-->
        <div id="content" class="col-md-9 col-sm-8">
             <div class="row">
                <div class="col-md-9">
                    <div class="table-responsive">
						<table class="table">
							<thead>
								<tr>
									<th class="cart-description item center">Image</th>
									<th class="cart-product-name item left">Product Code</th>
									<th class="cart-product-name item left">Product Name</th>
									<th class="cart-qty item left">Quantity</th>
									<th class="left">Price</th>
									<th class="cart-total last-item left">Subtotal</th>
								</tr>
							</thead><!-- /thead -->
							<tfoot>
								<tr>
									<td colspan="7">
										<div class="shopping-cart-btn">
											<span class="">
												<a href="{{route('home.index')}}" class="btn btn-upper btn-primary outer-left-xs" style="color: #fff;">Continue Shopping</a>
												
											</span>
										</div><!-- /.shopping-cart-btn -->
									</td>
								</tr>
							</tfoot>
							<tbody>
					
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

							<td class="cart-product-quantity left">
								<div class="quant-input">
						             
						                <input type="number" min="1" value="{{$order->qty}}">
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
					
							</tbody><!-- /tbody -->
						</table><!-- /table -->
					</div>
                </div>

        @include('frontend.include.profileLink')

    </div>  
            
        </div>
        <!--Middle Part End-->
    </div>
</div>
  <!-- //Main Container -->


@endsection

