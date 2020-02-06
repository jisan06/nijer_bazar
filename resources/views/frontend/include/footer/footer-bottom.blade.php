@php
  use App\ShippingCharges;
  use App\Product;
  use App\ProductSections;
@endphp
<div class="footer-bottom">
  <div class="container">
    <div class="row">
      <div class="tptncopyright col-xs-12 col-lg-7">
        © {{Date('Y')}} Nijer Bazar. All Rights Reserved.
      </div>
      <div class="tptnpayment col-xs-12 col-lg-5">
        {{-- <img src="{{ asset('public/frontend/assets/image') }}/modules/tptncopyright/img/payment.png" alt="Payment Options"> --}}
        Developed By 
        <a href="http://technoparkbd.com/" target="_blank">Techno Park Bangladesh</a>
      </div>
    </div>
  </div>
</div>        

<div id="blockcart-modal" class="modal fade in" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" style="display: none; padding-right: 17px;">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">
            <i class="material-icons">close</i>
          </span>
        </button>
        <h4 class="modal-title h6 text-sm-center" id="myModalLabel">
          <i class="material-icons rtl-no-flip"></i>
          Product successfully added to your shopping cart
        </h4>
      </div>

      <div class="modal-body">
        <div class="row">
          <div class="col-md-6 divide-right" id="product">
            
          </div>

          <div class="col-md-6">
            <div class="cart-content">
              <p class="cart-products-count">There are <span id="pop_cart_count"></span> items in your cart.</p>
              <p>
                <span>Total&nbsp;</span>&nbsp;
                <span id="popup_productSubtotal"> </span>
              </p>
              <div class="cart-content-btn">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Continue shopping
                </button>
                <a href="{{route('cart.checkout')}}" class="btn btn-primary">Proceed to checkout</a>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>