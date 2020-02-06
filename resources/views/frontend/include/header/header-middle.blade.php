<?php
 use App\Product;
 use App\ProductSections;
  $customerId = Session::get('customerId');
  $referrer_url = URL::previous();
  $customerId = Session::get('customerId');
   if(!isset($customerId)){ 
      $orderHistory = url('/shipping-email');
   }else{
      $orderHistory = url('/customer/order');
   }
?>
<?php
  use App\Customer;
      $customerId = Session::get('customerId');
      $customers =Customer::where('id',$customerId)->first();
?>
<div class="header-top hidden-lg-down">
  <div class="container">
    <div class="row">
      <div id="_desktop_shop-logo" class="shop-logo col-xl-3">
        <h1>
          <a href="<?php echo  url('/') ?>">
            @if(file_exists(@$information->siteLogo))
              <img class="logo" src="{{asset('/').@$information->siteLogo}}">
            @else
              <img class="logo" src="{{$noImage}}" style="height: 100px;">
            @endif
          </a>
        </h1>
      </div>

      <div id="_desktop_tptnsearch"  class="tptnsearch col-xl-7">
        <div class="search-btn m-toggle">
          <i class="material-icons">&#xE8B6;</i>
          <span class="m-toggle-title hidden-xl-up">Search</span>
        </div>
        <div class="search-form">
          <form method="GET" action="{{route('product.search')}}">
            {{ csrf_field() }}
            <input type="hidden" name="controller" value="search" />
            <input type="text"  value="" size="50" autocomplete="off" id="input_search" name="search_query" placeholder="Search our catalog" class="ui-autocomplete-input" autocomplete="off" name="searchProduct" required />
            <button type="submit" name="submit_search">
              <i class="material-icons search">&#xE8B6;</i>
            </button>
            <span class="search-close"><i class="material-icons">&#xE5CD;</i></span>
          </form>
        </div>
        <div id="search_popup"></div>
      </div>

      <div id="_desktop_user-info" class="user-info col-xl-2">
        <div class="login-register">
          <div class="m-toggle">
            <i class="material-icons">&#xE8A6;</i>
            <span class="m-toggle-title">Account</span>
          </div>
          <ul class="dropdown-content">
            <?php
              if (!isset($customerId)) {
            ?>
              <li><a href="{{url('/customer/login')}}" title="Log in to your customer account" rel="nofollow">Sign in</a></li>
              <li><a href="{{url('/customer/registration')}}" title="Register your new customer account" rel="nofollow">Register</a></li>
              <?php }else{ ?>
              <li><a href="{{route('customer.profile',$customerId)}}" title="View my customer account" rel="nofollow">My Account</a></li>
              <li><a href="{{url('/customer/order')}}" title="Order details" rel="nofollow">Order details</a></li>
              <li><a class="log login" href="{{route('customer.logout')}}" title="Sign out" rel="nofollow">Sign out</a></li>
            <?php } ?> 
          </ul>
        </div>
      </div>
    </div>
  </div>
</div>