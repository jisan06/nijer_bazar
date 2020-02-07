@extends('frontend.master')

@section('title', 'View Cart')

@section('mainContent')

<?php
	$customerId = Session::get('customerId');
?>	

<!-- Main Container  -->
<div class="main-container container" style="background-color: #F0F2F5; border:.5px; border-radius: 50px; text-align: center; height: 350px ">
    <div class="row">
     
		<!--Middle Part Start-->
		<div id="content" class="col-md-12 col-sm-12" style="margin-top: 50px">
				<div class="x-text text-center">
					<h2 class="text-success" style=" font-size:20px; font-weight: bold">Your order is complete</h2>
					<p style="font-size: 14px;">Thank's for visite our website. </p>
					<div class="shopping-cart-btn">
						<span class="">
							<a style="color: #fff;font-size: 20px; border-radius: 5px" href="{{route('home.index')}}" class="btn btn-upper btn-primary outer-left-xs">Continue Shopping</a>
							
						</span>
					</div>
					<br>
			<?php if(!isset($customerId)){ ?>
					<a href="{{url('/shipping-email')}}" class="btn btn-info" style="font-size: 16px;color: #fff;border-radius: 5px"> You can check your order summary</a>
			<?php }else{ ?>
				<a href="{{route('customer.order')}}"  class="btn btn-info" style="font-size: 16px;color: #fff;border-radius: 5px"> You can now check your order</a>
			<?php } ?>
				</div>
			
		</div>
		<!--Middle Part End-->
	</div>
</div>
  <!-- //Main Container -->

@endsection
