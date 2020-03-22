@extends('frontend.master')
@section('title', 'Nasta Hut')
@section('mainContent')
<?php
 use App\ProductSections;
 use App\ShippingCharges;
?>
  <section id="content">
    <div class="row">
      <div class="cart-grid-body col-lg-8">              
        <section id="checkout-addresses-step" class="checkout-step -current -reachable js-current-step">
          <h1 class="step-title h3" style="color: #fff; background-color: #3E66BD ; font-weight: bold; height:40px; font-size: 20px; margin-bottom: 15px; padding-top: 8px; padding-left: 30px;">
            Address
          </h1>
          <div class="content">
            <ul class="nav nav-inline my-2" role="tablist">
              <li class="nav-item">
                <a class="nav-link active" data-toggle="tab" href="#checkout-guest-form" role="tab" aria-controls="checkout-guest-form" aria-selected="true" aria-expanded="true">
                  Order as a guest
                </a>
              </li>
              <li class="nav-item">
                <span class="nav-separator"> | </span>
              </li>
              <li class="nav-item">
                <a class="nav-link" data-link-action="show-login-form" data-toggle="tab" href="#checkout-login-form" role="tab" aria-controls="checkout-login-form" aria-expanded="false">
                  Sign in
                </a>
              </li>
            </ul>
            <div class="tab-content">
              <div class="tab-pane active" id="checkout-guest-form" role="tabpanel" aria-expanded="true">
                <form action="{{route('order.save')}}" id="customer-form" class="js-customer-form" method="post">
                  {{ csrf_field() }}
                  <section>

                   {{--  <input type="hidden" name="id_customer" value="">
                    <div class="form-group row ">
                      <label class="col-md-3 form-control-label">
                        Social title
                      </label>
                      <div class="col-md-6 form-control-valign">
                        <label class="radio-inline">
                          <span class="custom-radio">
                            <input name="id_gender" type="radio" value="1">
                            <span></span>
                          </span>
                          Mr.
                        </label>
                        <label class="radio-inline">
                          <span class="custom-radio">
                            <input name="id_gender" type="radio" value="2">
                            <span></span>
                          </span>
                          Mrs.
                        </label>
                      </div>
                      <div class="col-md-3 form-control-comment">
                      </div>
                    </div> --}}

                    <div class="form-group row ">
                      <label class="col-md-3 form-control-label required"> Full name </label>
                      <div class="col-md-6">
                        <input type="text" class="form-control" placeholder="your name" name="fullName" required>
                      </div>
                    </div>                          
                    <div class="form-group row ">
                      <label class="col-md-3 form-control-label required"> Email </label>
                      <div class="col-md-6">
                        <input type="email" class="form-control" placeholder="email address" value="" name="email">
                      </div>
                    </div>
                    <div class="form-group row ">
                      <label class="col-md-3 form-control-label"> Phone </label>
                      <div class="col-md-6">
                        <input type="text" class="form-control" placeholder="phone no" value="" name="phone" required>        
                      </div>
                    </div>             
                    <div class="form-group row ">
                      <label class="col-md-3 form-control-label"> Shipping Address </label>
                      <div class="col-md-6">
                        <input type="text" class="form-control" placeholder="shipping address for receive product" value="" name="address" required>              
                      </div>
                    </div>

                    {{-- <p>
                      <span class="font-weight-bold">Create an account</span> <span class="font-italic">(optional)</span>
                      <br>
                      <span class="text-muted">And save time on your next order!</span>
                    </p>
                    <div class="form-group row ">
                      <label class="col-md-3 form-control-label">
                        Password
                      </label>
                      <div class="col-md-6">
                        <div class="input-group js-parent-focus">
                          <input class="form-control js-child-focus js-visible-password" name="password" title="At least 5 characters long" type="password" value="" pattern=".{5,}">
                          <span class="input-group-btn">
                            <button class="btn" type="button" data-action="show-password" data-text-show="Show" data-text-hide="Hide">
                              Show
                            </button>
                          </span>
                        </div>
                      </div>
                      <div class="col-md-3 form-control-comment">
                       Optional
                     </div>
                    </div>
                    <div class="form-group row ">
                      <label class="col-md-3 form-control-label">
                        Birthdate
                      </label>
                      <div class="col-md-6">
                        <input class="form-control" name="birthday" type="text" value="" placeholder="MM/DD/YYYY">
                        <span class="form-control-comment">
                          (E.g.: 05/31/1970)
                        </span>
                      </div>
                      <div class="col-md-3 form-control-comment">
                        Optional
                      </div>
                    </div>

                    <div class="form-group row ">
                      <label class="col-md-3 form-control-label"></label>
                      <div class="col-md-6">
                        <span class="custom-checkbox">
                          <label>
                            <input name="newsletter" type="checkbox" value="1">
                            <span><i class="material-icons rtl-no-flip checkbox-checked"></i></span>
                            Sign up for our newsletter&lt;br&gt;&lt;em&gt;You may unsubscribe at any moment. For that purpose, please find our contact info in the legal notice.&lt;/em&gt;
                          </label>
                        </span>
                      </div>
                      <div class="col-md-3 form-control-comment">
                      </div>
                    </div> --}}

                  </section>
                  <footer class="form-footer clearfix">
                    <input type="hidden" name="submitCreate" value="1">
                    <button class="continue btn btn-primary float-xs-right" name="continue" type="submit">
                      Continue
                    </button>
                  </footer>
                </form>
              </div>
              <div class="tab-pane" id="checkout-login-form" role="tabpanel" aria-hidden="true" aria-expanded="false">
                <form id="login-form" action="" method="post">
                  <section>
                    <input type="hidden" name="back" value="">
                    <div class="form-group row ">
                      <label class="col-md-3 form-control-label required">
                        Email
                      </label>
                      <div class="col-md-6">
                        <input class="form-control" name="email" type="email" value="" required="">
                      </div>
                      <div class="col-md-3 form-control-comment">
                      </div>
                    </div>
                    <div class="form-group row ">
                      <label class="col-md-3 form-control-label required">
                        Password
                      </label>
                      <div class="col-md-6">
                        <div class="input-group js-parent-focus">
                          <input class="form-control js-child-focus js-visible-password" name="password" title="At least 5 characters long" type="password" value="" pattern=".{5,}" required="">
                          <span class="input-group-btn">
                            <button class="btn" type="button" data-action="show-password" data-text-show="Show" data-text-hide="Hide">
                              Show
                            </button>
                          </span>
                        </div>
                      </div>
                      <div class="col-md-3 form-control-comment">
                      </div>
                    </div>
                    <div class="forgot-password">
                      <a href="" rel="nofollow">
                        Forgot your password?
                      </a>
                    </div>
                  </section>
                  <footer class="form-footer text-sm-center clearfix">
                    <input type="hidden" name="submitLogin" value="1">

                    <button class="continue btn btn-primary float-xs-right" name="continue" data-link-action="sign-in" type="submit" value="1">
                      Continue
                    </button>
                  </footer>
                </form>
              </div>
            </div>
          </div>
        </section>
      </div>
      <div class="cart-grid-right col-lg-4">
        <section id="js-checkout-summary" class="card js-cart">
          <div class="card-block">
            <div class="cart-summary-products">
              <p>{{Cart::count()}} items</p>
              <p>
                <a href="#" data-toggle="collapse" data-target="#cart-summary-product-list" class="collapsed" aria-expanded="false">
                  show details
                  <i class="material-icons">expand_more</i>
                </a>
              </p>
              <div class="collapse" id="cart-summary-product-list" aria-expanded="false" style="">
                <ul class="media-list">
                  @php
                    $total = 0;
                  @endphp
                  @foreach(Cart::content() as $cart)
                  @php 
                    $name = str_replace(' ', '-', $cart->name);
                    $orderdetails = ProductSections::where('productId',$cart->id)->first();
                    $free_shipping = ProductSections::where('free_shipping','free')->first();
                    $total += $cart->subtotal;

                    if(file_exists($cart->options->image)){
                      $image = asset('/').$cart->options->image;
                    }else{
                      $image = $noImage;
                    }

                    $total = str_replace(',', '', $total);
                    $shipping_charges = ShippingCharges::where('shippingStatus',1)->get();
                    foreach($shipping_charges as $k ){ 
                        $diff[abs($k->shippingAmount - $total)] = $k;
                         }

                    if (@$k && $total) {
                        ksort($diff, SORT_NUMERIC);
                        $charge = current($diff);
                        if (@$free_shipping) {
                            
                            $shippingCharge = 0;
                        }else{
                            $shippingCharge = $charge->shippingCharge;
                        }
                        
                    }else{
                        $shippingCharge = 0; 
                    } 

                    $grandTotal = $total + $shippingCharge;

                  @endphp
                    <li class="media">
                      <div class="media-left">
                        <a href="{{url('product/'.@$cart->id.'/'.@$name)}}">
                          <img class="media-object" src="{{$image}}">
                        </a>
                      </div>
                      <div class="media-body">
                       <span>{{$cart->qty}}</span> X 
                       <span>{{$cart->name}}</span> <br>
                       <span>৳ {{$cart->subtotal}}</span>

                        {{-- <div class="product-line-info product-line-info-secondary">
                          <span class="label">Variant:</span>
                          <span class="value">16 GB</span>
                        </div>
                        <div class="product-line-info product-line-info-secondary">
                          <span class="label">Color:</span>
                          <span class="value">Black</span>
                        </div> --}}
                      </div>
                    </li>
                  @endforeach
                </ul>
              </div>
            </div>
            <div class="card-block cart-summary-subtotals-container">
              <div class="cart-summary-line cart-summary-subtotals" id="cart-subtotal-products">
                <span class="label">
                  Subtotal
                </span>
                <span class="value">৳ {{$total}}</span>
              </div>
              <div class="cart-summary-line cart-summary-subtotals" id="cart-subtotal-shipping">
                <span class="label">
                  Shipping
                </span>
                <span class="value">৳ {{$shippingCharge}}</span>
              </div>

              <div class="totalTop"></div>

              <div class="cart-summary-line cart-summary-subtotals" id="cart-subtotal-shipping">
                <span class="label">
                  Total
                </span>
                <span class="value">৳ {{$grandTotal}}</span>
              </div>

            </div>
          </div>
          

          {{-- <div class="block-promo">
            <div class="cart-voucher">
              <p class="promo-code-button display-promo">
                <a class="collapse-button" href="#promo-code">
                  Have a promo code?
                </a>
              </p>
              <div id="promo-code" class="collapse">
                <div class="promo-code">
                  <form action="http://demo.templatin.com/megashop17/en/cart" data-link-action="add-voucher" method="post">
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
          </div> --}}

        </section>

        {{-- <div id="block-reassurance">
          <ul>
            <li>
              <i class="material-icons">done</i>
              <span>We provide best quality hand-picked products</span>
            </li>
            <li>
              <i class="material-icons">done</i>
              <span>Order before 6 PM to get express delivery</span>
            </li>
            <li>
              <i class="material-icons">done</i>
              <span>Easy return policy with no questions asked</span>
            </li>
          </ul>
        </div> --}}

      </div>
    </div>
  </section>
@endsection

