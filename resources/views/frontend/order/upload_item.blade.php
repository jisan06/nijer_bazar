@extends('frontend.master')
@section('title', 'Nasta Hut')
@section('mainContent')
<?php
 use App\ProductSections;
 use App\ShippingCharges;
?>
  <section id="content">
    <div class="row">
      <div class="col-lg-1"></div>
      <div class="cart-grid-body col-lg-10">              
        <section id="checkout-addresses-step" class="checkout-step -current -reachable js-current-step">
          <h1 class="step-title h3" style="color: #fff; background-color: #3E66BD ; font-weight: bold; height:40px; font-size: 20px; margin-bottom: 15px; padding-top: 8px; padding-left: 30px;">
            Your Information
          </h1>
          <div class="content">

            <div class="row">
              <div class="col-md-1"></div>
              <div class="col-md-10">
                 <?php
                  $message = Session::get('msg');
                    if (isset($message)) {
                      echo $message;
                  }
                  Session::forget('message')
                ?>
                <h3>Upload Your Item List (as a picture)</h3>
              </div>
            </div>
            <br>

            <div class="tab-content">
              <div class="tab-pane active" id="checkout-guest-form" role="tabpanel" aria-expanded="true">
                <form action="{{route('upload.itemList')}}" id="customer-form" class="js-customer-form" method="post" enctype="multipart/form-data">
                  {{ csrf_field() }}
                  <section>
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

                    <div class="form-group row ">
                      <label class="col-md-3 form-control-label"> Item List </label>
                      <div class="col-md-6">
                        <input type="file" class="form-control" name="itemList" required>              
                      </div>
                    </div>

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
      
    </div>
  </section>
@endsection

