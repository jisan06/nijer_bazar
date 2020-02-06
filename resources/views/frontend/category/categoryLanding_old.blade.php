@extends('frontend.master')
@section('mainContent')
<?php
use App\ProductSections;
use App\ProductImage;
use App\Product;
use App\Category;

$catLink = Category::where('id',$category->parent)->first();

if(@$catLink){
$categoryName = str_replace(' ', '-', $catLink->categoryName);
$categoryLink = url('/categories/'.@$catLink->id.'/'.@$categoryName);
}

?>
<!-- Main Container  -->
<section id="wrapper">
  <div class="container">
    
  <nav data-depth="2" class="breadcrumb hidden-sm-down">
    <ol itemscope="" itemtype="http://schema.org/BreadcrumbList">  
      <li itemprop="itemListElement" itemscope="" itemtype="">
        <a itemprop="item" href="{{url('/')}}">
          <span itemprop="name">Home</span>
        </a>
        <meta itemprop="position" content="1">
      </li>
  <?php if(@$catLink){ ?>
      <li itemprop="itemListElement" itemscope="" itemtype="">
        <a itemprop="item" href="{{$categoryLink}}">
          <span itemprop="name">{{$catLink->categoryName}}</span>
        </a>
        <meta itemprop="position" content="2">
      </li> 
<?php } ?>
      <li itemprop="itemListElement" itemscope="" itemtype="">
        <a itemprop="item" href="">
          <span itemprop="name">{{$category->categoryName}}</span>
        </a>
        <meta itemprop="position" content="2">
      </li> 
    </ol>
  </nav>  

    <div id="content-wrapper" class="left-column">
      <?php
        if ($allSubcat->count() >= 1) {
      ?>
      <section id="main">
        <div id="js-product-list-header">
        </div>
          <?php
              if ($allSubcat->count() >= 1) {
          ?>
        <nav class="subcategories tptncarousel tptnprods">
          <p class="subcat-title">{{$category->categoryName}}</p>
          
          <div class="subcatcrsl owl-loaded owl-drag">
            @foreach($subCategory as $subcat)
            <?php
                 $subCategoryName = str_replace(' ', '-', $subcat->categoryName);
                  $submenu = Category::where('parent',$subcat->id)->where('categoryStatus',1)->first();
                if($submenu){
                      $menuLink = url('/categories/'.@$subcat->id.'/'.@$subCategoryName);

                  }else{
                     $menuLink = url('/subcategories/'.@$subcat->id.'/'.@$subCategoryName);
                     
                  }

                  $categories = Category::where('categoryStatus',1)->where('parent',$subcat->id)->get();
                  $countCategories = count($categories);
                  
                  if ($countCategories >= 1) {
                    $countItem = count($categories);
                  }else{
                    $products = Product::whereRaw('FIND_IN_SET(?,category_id)',[$subcat->id])->where('status',1)->get();
                     $countItem = count($products);
                  }
                  
            ?>
            <div class="owl-stage-outer">
              <div class="owl-stage" style="transform: translate3d(0px, 0px, 0px); transition: all 0s ease 0s; width: 1480px;">
                <div class="owl-item active" style="width: 185px;">
                  <div class="subcat-item">
                    <a href="{{ $menuLink}}" target="_self" title="{{@$subcat->categoryName}}" class="subcat-image">
                      <?php if(file_exists($subcat->categoryImage)){ ?>
                      <img src="{{ asset('/').@$subcat->categoryImage}}" class="img-1 img-responsive subcategory_image third-img" alt="image1">
                      <?php }else{ ?>
                      <img src="{{ asset('/')}}public/frontend/no-image.png" class="img-1 img-responsive subcategory_image third-img" alt="image1">
                      <?php } ?>
                    </a>
                    <a href="{{ $menuLink}}" title="{{@$subcat->categoryName}}" class="subcat-name">
                      {{@$subcat->categoryName}}
                    </a>
                  </div>
                </div>
              </div>
            </div>
            
            <div class="owl-nav">
              <div class="owl-prev disabled"></div>
              <div class="owl-next"></div>
            </div>

            <div class="owl-dots disabled">
            </div>
            @endforeach
          </div>
          
        </nav>
        <?php } ?>

          <?php
           $homeCategory = 0;
           foreach ($homeCategories as $category) {
           $categoryProducts = Product::where('status',1)->where('root_category',$category->id)->get();
           $homeCategory++;
         ?>
        <section id="products">

          <div id="">
            <div id="js-product-list-top" class="row products-selection">
              <div class="col-md-4 col-xl-5 hidden-sm-down total-products">
                <p>There are 10 products.</p>
              </div>
              <div class="col-sm-12 hidden-md-up text-sm-center showing">
                Showing 1-8 of 10 item(s)
              </div>
            </div>
          </div>
          <div id="">
            <div id="js-product-list">
              <div class="products row">
                <?php
                 $countP = 1; 
                ?>
                <?php
                      foreach ($categoryProducts as $product) { 
                      $image = ProductImage::where('productId',$product->id)->first();
                      $name =str_replace(' ', '-', $product->name);
                      $percentChange = (($product->price - $product->discount) / $product->price) * 100;
                      $discount_percent = round(abs($percentChange));
                  ?>
                <article class="product-miniature js-product-miniature col-xs-12 col-sm-6 col-lg-4 col-xl-3" data-id-product="1" data-id-product-attribute="46" itemscope="" itemtype="">
                  <div class="thumbnail-container">
                    <div class="product-thumbnail">
                      <a href="{{url('product/'.@$product->id.'/'.@$name)}}" class="thumbnail" title="{{@$product->name}}">
                      <img class="first-img" src="{{ asset('/'). @$image->images}}" alt="image1">
                      <img class="second-img" src="{{ asset('/'). @$image->images}}" alt="image1">
                    </a>
                    </div>
                    <div class="product-description">
                      <h2 class="h3 product-title" itemprop="name"><a href="{{url('product/'.@$product->id.'/'.@$name)}}" target="_self">{{ str_limit($product->name, 25) }} </a></h2>
                      <div class="product-price-and-shipping">
                        <h5>Code: {{@$product->deal_code}}</h5>
                        <span class="sr-only">Price</span>
                        <?php  if($product->discount){?>
                        <span itemprop="price" class="price">৳ {{@$product->discount}}</span>
                                        
                        <span class="sr-only">Regular price</span>
                        <span class="regular-price">৳ {{@$product->price}}</span>
                        <?php }else{ ?>
                        <span class="regular-price">৳ {{@$product->price}}</span>
                        <?php } ?>
                        <?php  if($product->discount){?>
                        <span class="discount-percentage discount-product"><?php echo  $discount_percent ; ?>%</span><?php } ?>
                      </div>
                      <div class="comments_note" itemprop="aggregateRating" itemscope="" itemtype=""> 

                        <div class="star_content"> 
                          <div class="star star_on"></div>
                          <div class="star star_on"></div>
                          <div class="star star_on"></div>
                          <div class="star star_on"></div>
                          <div class="star star_on"></div>
                          <meta itemprop="worstRating" content="0">
                          <meta itemprop="ratingValue" content="4.7">
                          <meta itemprop="bestRating" content="5">
                        </div>

                        <div class="nb-comments">
                          (<span itemprop="reviewCount">3</span>)
                        </div>
                      </div>

                      <div class="product-list-actions">

                        <form action="" method="post" class="product-qty-cart">
                          <input type="hidden" name="token" value="bc93467e0ed41e85c670077e5a7f068a">
                          <input type="hidden" name="id_product" value="1">
                          <button class="btn btn-primary" data-button-action="add-to-cart" type="button" onclick="addCart('{{ $product->id}}')">
                            <i class="material-icons shopping-cart"></i>Add to cart
                          </button>
                        </form>

                      </div>

                    </div>

                  </div>
                </article>
                <?php $countP++?>
                <?php } ?>
              </div>
              <?php } ?>
              <nav class="pagination row">
                <div class="col-xs-12 col-md-4">Showing 1-8 of 10 item(s)</div>
                <div class="col-xs-12 col-md-8">
                  <ul class="page-list clearfix">
                    <li class="current">
                      <a rel="nofollow" href="3-electronics.html" class="disabled js-search-link">1</a>
                    </li>
                    <li>
                      <a rel="nofollow" href="3-electronics4658.html?page=2" class="js-search-link">2</a>
                    </li>
                    <li>
                      <a rel="next" href="3-electronics4658.html?page=2" class="next js-search-link">
                        <i class="material-icons"></i>
                      </a>
                    </li>
                  </ul>      
                </div>
              </nav>

            </div>
          </div>
          <div id="js-product-list-bottom">
            <div id="js-product-list-bottom"></div>
          </div>
        </section>
      </section>
      <?php  } else{ ?>
         <h3 class="text-center">No Sub Category Available</h3>
      <?php } ?>
    </div>
  </div>
</section>
    <!-- //Main Container -->
  @endsection