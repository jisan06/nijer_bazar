@extends('frontend.master')

@section('mainContent')
<?php
 use App\ShippingCharges;
 use App\Product;
 use App\ProductSections;
   
 ?>
 	<div class="cart-grid row">
	 	<div class="cart-grid-body col-xs-12 col-lg-8">
	 		<div class="card cart-container">
	 			<div class="card-block">
	 				<h1 class="h1">Shopping Cart</h1>
	 			</div>
	 			<hr class="separator">
	 			<div class="cart-overview js-cart" id="cartProduct">
	 				
	 			</div>
	 		</div>
	 		<a class="label" href="{{url('/')}}">
            	<i class="material-icons">chevron_left</i>Continue shopping
          	</a>
	 		<!-- shipping informations -->
	 	</div>
	 	<div class="cart-grid-right col-xs-12 col-lg-4">
	 		<div class="card cart-summary" id="cartSummary">
	 			
	 		</div>
	 	</div>
 	</div>
@endsection