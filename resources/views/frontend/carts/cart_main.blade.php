@extends('frontend.master')

@section('title', 'View Cart')

@section('mainContent')
<?php
 use App\ShippingCharges;
 use App\Product;
 use App\ProductSections;
   
 ?>
<!-- Main Container  -->
<section id="wrapper">
  	<div class="container">     
  		<div id="content-wrapper">
  		<section id="main">
    		<div class="cart-grid row">
      <!-- Left Block: cart product informations & shpping -->
      			<div class="cart-grid-body col-xs-12 col-lg-8">
        <!-- cart products detailed -->
					<div class="card cart-container">
						<div class="card-block">
							<h1 class="h1">Shopping Cart</h1>
						</div>
						<hr class="separator">       
					  	<div class="cart-overview js-cart">
					        <ul class="cart-items">
					        	@php($carts = Cart::content())
								@php($total = 0)
								@foreach($carts as $cart)
								<?php
									$name =  str_slug($cart->name);
					                $orderdetails = ProductSections::where('productId',$cart->id)->first();
					                $products = Product::where('id',$cart->id)->first();
					                $free_shipping = ProductSections::where('free_shipping','free')->first();
								?>
					            <li class="cart-item parentRow_{{ $cart->rowId }}">
					            <input type="hidden" name="rowId" class="rowId_{{ $cart->rowId }}" value="{{ $cart->rowId }}">
					     			<div class="product-line-grid">
									  <!--  product left content: image-->
									  	<div class="product-line-grid-left col-md-2 col-xs-4">
					    					<span class="product-image media-middle">
										      <img src="{{asset('/').$cart->options->image }}" class="img-thumbnail" />
										    </span>
										</div>
										  <!--  product left body: description -->
										<div class="product-line-grid-body col-md-5 col-xs-8">
										    <div class="product-line-info product-title">
										      <a class="label" href="{{url('product/'.@$cart->id.'/'.@$name)}}" data-id_customization="0">{{$cart->name}}</a>
										    </div>
										    <div class="product-line-info product-title">
										      Products Deal Code: {{$products->deal_code}}
										    </div>
										    <div class="product-line-info product-price has-discount">
										        <?php if($products->discount){?>
										      	<div class="current-price cart-product-price">
										        	৳ <span class="product-price">{{@$products->discount}}</span>
										        </div>
										        <?php } ?>
										        <div class="product-discount cart-product-price">
										        	৳ <span class="product-price"> {{$cart->price}}</span>
										        </div>
										    </div>
										</div>
					  <!--  product left body: description -->
										<div class="product-line-grid-right product-line-actions col-md-5 col-xs-12">
											<div class="row">
											    <div class="col-xs-4 hidden-md-up"></div>
										      	<div class="col-md-10 col-xs-6">
										        	<div class="row">
										          		<div class="col-md-6 col-xs-6 qty">
										                    <div class="input-group bootstrap-touchspin quant-input">
										                    	<input type="number" name="quantity" value="{{$cart->qty}}" size="1" class="js-cart-line-product-quantity form-control" min="1" style="display: block;">
										                    </div>
										                 </div>
													    <div class="col-md-6 col-xs-2 price">
													        <span class="product-price cart-product-subtotal">
													            ৳<strong class="cart-sub-total-price"> {{$cart->subtotal}}</strong>
													        </span>
													    </div>
										            </div>
										      	</div>
												<div class="col-md-2 col-xs-2 text-xs-right">
												    <div class="cart-line-product-actions">
												        <a  onclick="removeCartRow('{{ $cart->rowId }}')" >
												        <i class="material-icons float-xs-left">delete</i>
												    	</a>
												    </div>
												</div>
											</div>
										</div>
						  				<div class="clearfix"></div>
									</div>
					        	</li>
						       	@php($total += $cart->subtotal)
								@endforeach
						    </ul>
						 </div>
					</div>
	        <a class="label" href="">
	            <i class="material-icons">chevron_left</i>Continue shopping
	        </a>
	        <!-- shipping informations -->
	      </div>
	      <!-- Right Block: cart subtotal & cart total -->
	      <div class="cart-grid-right col-xs-12 col-lg-4">
	          <div class="card cart-summary">      
	<div class="cart-detailed-totals">
	  <div class="card-block">
	                  <div class="cart-summary-line" id="cart-subtotal-products">
	          <span class="label js-subtotal">
	                          2 items
	                      </span>
	          <span class="value">
	            $237.50
	          </span>
	                  </div>
	                                  <div class="cart-summary-line" id="cart-subtotal-shipping">
	          <span class="label">
	                          Shipping
	                      </span>
	          <span class="value">
	            $7.00
	          </span>
	                        <div><small class="value"></small></div>
	                  </div>
	                      </div>
	    <div class="card-block cart-summary-totals">
	          <div class="cart-summary-line">
	        <span class="label">Total&nbsp;(tax excl.)</span>
	        <span class="value">$244.50</span>
	      </div>
	      <div class="cart-summary-line cart-total">
	        <span class="label">Total (tax incl.)</span>
	        <span class="value">$244.50</span>
	      </div>
	          <div class="cart-summary-line">
	        <span class="label sub">Taxes:</span>
	        <span class="value sub">$0.00</span>
	      </div>
	</div>
	    <div class="block-promo">
	      <div class="cart-voucher">
	        <p class="promo-code-button display-promo">
	          <a class="collapse-button" href="#promo-code">
	            Have a promo code?
	          </a>
	        </p>
	        <div id="promo-code" class="collapse">
	          <div class="promo-code">
	              <form action="" data-link-action="add-voucher" method="post">
	                <input type="hidden" name="token" value="027e7fbf8173118cca49940b08e67480">
	                <input type="hidden" name="addDiscount" value="1">
	                <input class="promo-input" type="text" name="discount_name" placeholder="Promo code">
	                <button type="submit" class="btn"><i class="material-icons">check</i></button>
	              </form>
	              <div class="alert alert-danger js-error" role="alert">
	                <i class="material-icons"></i><span class="ml-1 js-error-text"></span>
	              </div>
	            <a class="collapse-button promo-code-button cancel-promo" role="button" data-toggle="collapse" data-target="#promo-code" aria-expanded="true" aria-controls="promo-code">
	              Close
	            </a>
	          </div>
	        </div>

	              </div>
	    </div>
	</div>           
	  <div class="checkout cart-detailed-actions card-block">
	          <div class="text-sm-center">
	        <a href="" class="btn btn-primary">Proceed to checkout</a>
	        
	      </div>
	      </div>
	          </div>
	      </div>
	    </div>
	  </section>
	  </div>
	        </div>
	      </section>
	    <!--Middle Part End-->
	@endsection