<?php
 use App\ShippingCharges;
 use App\Product;
 use App\ProductSections;
 ?>
<?php
  use App\Category;
  $customerId = Session::get('customerId');
  $referrer_url = URL::previous();
  $customerId = Session::get('customerId');
     if(!isset($customerId)){ 
        $orderHistory = url('/shipping-email');
     }else{
        $orderHistory = url('/customer/order');
     }
?>

<div class="header-bottom hidden-lg-down">
  <div class="container">
    <div class="row">
      <div id="tptndesktopmenu" class="col-xl-3 hidden-lg-down">
        <div class="desktopmenu-title">Categories<i class="material-icons">&#xE5D2;</i></div>
        <div class="desktopmenu">
          <ul id="megamenu" class="menu right">
            @foreach($publishedCategories as $category)
              <?php  if ($category->parent == '') { 
                $categoryName = str_replace(' ', '-', $category->categoryName);
                $firstMenuLink = url('/categories/'.@$category->id.'/'.@$categoryName);
                $subcategory = Category::where('parent',$category->id)->where('categoryStatus',1)->get(); 
              ?> 
                <li data-depth="0">
                  <a href="{{$firstMenuLink}}" class="clearfix">
                   <span>{{$category->categoryName}}</span>
                  </a>
                    @if(count(@$subcategory) > 0)
                      <ul>
                        <?php
                          foreach ($subcategory as $subcat) {
                            if ($subcat->parent == $category->id) { 
                              $subCategoryName = str_replace(' ', '-', $subcat->categoryName);
                              $secondMenuLink = url('/subcategories/'.@$subcat->id.'/'.@$subCategoryName);
                        ?>
                          <li data-depth="1">
                            <a href="{{$secondMenuLink}}" >
                              {{$subcat->categoryName}}
                            </a>
                          </li>
                        <?php } } ?>
                      </ul>
                    @endif
                </li>
              <?php } ?>
            @endforeach
          </ul>
        </div>
      </div>

      <div id="_desktop_tptnmobilemenu" class="hidden-xl-up">
        <div class="m-toggle">
          <i class="material-icons">&#xE5D2;</i>
          <span class="m-toggle-title">Categories</span>
        </div>
        <div class="mobilemenu">
          <div class="mobilemenu-title">Categories<i class="material-icons">&#xE5CD;</i></div>


        </div>
      </div>

      <div id="_desktop_tptnheaderlinks" class="tptnheaderlinks col-xl-7">
        <div class="m-toggle">
          <i class="material-icons">more_horiz</i>
          <span class="m-toggle-title hidden-xl-up">Links</span>
        </div>
        <ul>
          <li><a href="<?php echo url('/') ?>">Home</a></li>
          <li><a href="{{url('/about-us')}}">About Us</a></li>
          <li><a href="{{url('/contact-us')}}">Contact Us</a></li>
        </ul>
      </div>

      <div id="_desktop_blockcart-wrapper" class="tptncart col-xs-2">
        <div class="blockcart cart-preview">
          <div class="m-toggle">
            <span>
              <i class="material-icons">shopping_cart</i>
              <span class="items_cart cart_count">{{Cart::count()}}</span>
            </span>
            <span class="m-toggle-title hidden-xl-up">Cart</span>
          </div>
          <div class="minicart-body">
            <div class="minicart-title">Cart
              <i class="material-icons"></i>
            </div>
            <div id="minicartProduct">
              
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div> 

<div class="mobile-header hidden-xl-up">
  <div class="mobile-header-top">
    <div id="_mobile_shop-logo" class="shop-logo"></div>
  </div>
  <div class="mobile-header-bottom">
    <div id="_mobile_tptnmobilemenu" class="tptnmobilemenu"></div>
    <div id="_mobile_user-info" class="user-info"></div>
    <div id="_mobile_tptnsearch" class="tptnsearch"></div>
    <div id="_mobile_tptnheaderlinks" class="tptnheaderlinks"></div>
    <div id="_mobile_blockcart-wrapper" class="tptncart"></div>
  </div>
</div>