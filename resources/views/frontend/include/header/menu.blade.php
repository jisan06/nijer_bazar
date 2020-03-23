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

<style type="text/css">
  .uploadListButton{
    background: #2ac97a;
    color: #fff;
    font-size: 14px;
    display: inline-block;
    height: 50px;
    line-height: 50px;
    padding: 0 15px;
    text-transform: uppercase;
    font-weight: bold;
    margin-left: 26px;
  }
</style>

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
                              $secondMenuLink = url('/categories/'.@$subcat->id.'/'.@$subCategoryName);
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
          <ul data-depth="0">
            @foreach($publishedCategories as $category)
              <?php  if ($category->parent == '') { 
                $categoryName = str_replace(' ', '-', $category->categoryName);
                $firstMenuLink = url('/categories/'.@$category->id.'/'.@$categoryName);
                $subcategory = Category::where('parent',$category->id)->where('categoryStatus',1)->get(); 
              ?> 
              <li {{-- id="category-3" --}}>
                <a href="{{$firstMenuLink}}" data-depth="0"> 
                  @if(count(@$subcategory) > 0)
                    <span class="float-xs-right hidden-xl-up">
                      <span data-target="#mobile_menu_{{$category->id}}" data-toggle="collapse" class="navbar-toggler collapse-icons">
                          <i class="material-icons add">&#xE145;</i>
                          <i class="material-icons remove">&#xE15B;</i>
                      </span>
                    </span>
                  @endif

                  {{$category->categoryName}}
                </a>
                @if(count(@$subcategory) > 0)
                  <div class="collapse" id="mobile_menu_{{$category->id}}">
                    <ul data-depth="0">
                      <?php
                          foreach ($subcategory as $subcat) {
                            if ($subcat->parent == $category->id) { 
                              $subCategoryName = str_replace(' ', '-', $subcat->categoryName);
                              $secondMenuLink = url('/subcategories/'.@$subcat->id.'/'.@$subCategoryName);
                      ?>
                      <li>
                        <a href="{{$secondMenuLink}}" data-depth="0"> 
                          <span class="float-xs-right hidden-xl-up">
                            <span data-target="#mobile_menu_61066" data-toggle="collapse" class="navbar-toggler collapse-icons">
                                <i class="material-icons add">&#xE145;</i>
                                <i class="material-icons remove">&#xE15B;</i>
                            </span>
                          </span>
                          {{$subcat->categoryName}}
                        </a>

                        {{-- <div class="collapse" id="mobile_menu_61066">
                          <ul data-depth="2">
                            <li id="category-17">
                              <a href="17-high-definition-tv.html" data-depth="2">
                                High-Definition TV
                              </a>
                            </li>
                          </ul>
                        </div> --}}

                      </li>
                      <?php } } ?>
                    </ul>
                  </div>
                @endif
              </li>
            <?php } ?>
            @endforeach
          </ul>
        </div>
      </div>

      <div id="_desktop_tptnheaderlinks" class="tptnheaderlinks col-xl-6">
        <div class="m-toggle">
          <i class="material-icons">more_horiz</i>
          <span class=" hidden-xl-up">
            <a href="{{ route('upload.itemList') }}" style="color: #fff">Upload Item</a>
          </span>
        </div>

      </div>
    
      <div id="_desktop_blockcart-wrapper" class="tptncart col-xs-3">
        
        <div class="blockcart cart-preview">

          <a href="{{ route('upload.itemList') }}" class="uploadListButton">Upload Item List</a>
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