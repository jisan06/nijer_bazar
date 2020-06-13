@extends('frontend.master')

@section('mainContent')
 <?php
  use App\ProductSections;
  use App\ProductImage;
  use App\Product;
  use App\Category;
  use App\Review;

  $catLink = Category::where('id',$category->parent)->first();

  if(@$catLink){
  $categoryName = str_replace(' ', '-', $catLink->categoryName);
  $categoryLink = url('/categories/'.@$catLink->id.'/'.@$categoryName);
  }

  ?>
  <nav data-depth="3" class="breadcrumb hidden-sm-down">
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
        <a itemprop="item">
          <span itemprop="name">{{$category->categoryName}}</span>
        </a>
        <meta itemprop="position" content="2">
      </li> 
    </ol>
  </nav>
  <!-- <div id="left-column">
    <div id="search_filters_wrapper">
      <div id="search_filter_controls">
        <button class="btn btn-primary ok">
          <i class="material-icons rtl-no-flip"></i>OK
        </button>
      </div>
    </div>
  </div> -->

  <div id="content-wrapper" class="left-column">
    <section id="products">
      
      <div id="">
        <div id="js-product-list-top" class="row products-selection">
          <div class="col-md-4 col-xl-5 hidden-sm-down total-products">
            <p>There are {{count($products)}} products.</p>
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
            @php
              foreach ($products as $product) { 
                $image = ProductImage::where('productId',$product->id)->first();
                $name =str_replace(' ', '-', $product->name);
                $percentChange = (($product->price - $product->discount) / $product->price) * 100;
                $discount_percent = round(abs($percentChange));

                $totalReview = Review::where('productId',$product->id)->count();
                $totalRating = Review::where('productId',$product->id)->sum('star');

                @$finalRating = round(@$totalRating/$totalReview);
                if(@$totalRating < 1){
                 @$rating = 5; 
                }else{
                  @$rating = $finalRating;
                }
                @$remainRating = 5 - $rating;

                $stockCheck = \App\Helper\StockStatus::StockCheck($product->id);
                $stockCheck = \App\Helper\StockStatus::StockCheck($product->id);
                if($stockCheck->id != NULL && $stockCheck->remainingQty == 0 || $stockCheck->remainingQty < 0){
                  $disabled = "disabled";
                }else{
                  $disabled = "";
                }
              @endphp
              <article class="product-miniature js-product-miniature col-xs-12 col-sm-6 col-lg-4 col-xl-3" data-id-product="1" data-id-product-attribute="46" itemscope="" itemtype="">
                <div class="thumbnail-container">
                  <div class="product-thumbnail">
                    <a href="{{url('product/'.@$product->id.'/'.@$name)}}" class="thumbnail" title="{{@$product->name}}">
                      <img class="first-img" src="{{ asset('/'). @$image->images}}" alt="image1">
                    </a>
                  </div>
                  <div class="product-description">
                    <h2 class="h3 product-title" itemprop="name"><a href="{{url('product/'.@$product->id.'/'.@$name)}}" target="_self">{{ str_limit($product->name, 25) }}</a></h2>
                    <div class="product-price-and-shipping">
                      <h5>Code: {{@$product->deal_code}}</h5>
                      <span class="sr-only">Price</span>
                      <?php  if($product->discount){?>
                      <span itemprop="price" class="price">৳ {{@$product->discount}}</span>

                      <span class="sr-only">Regular price</span>
                      <span class="regular-price">৳ {{@$product->price}}</span>
                      <?php }else{ ?>
                      <span class="price">৳ {{@$product->price}}</span>
                      <?php } ?>
                      <?php  if($product->discount){?>
                      <span class="discount-percentage discount-product"><?php echo  $discount_percent ; ?>%</span><?php } ?>
                    </div>
                    <div class="comments_note" itemprop="aggregateRating" itemscope="" itemtype=""> 

                      <div class="star_content"> 
                        @for($i = 0;$i < $rating;$i++)
                          <div class="star star_on"></div>
                        @endfor
                        @for($i = 0;$i < $remainRating;$i++)
                          <div class="star star_of"></div>
                        @endfor
                      </div>

                      <div class="nb-comments">
                        (<span itemprop="reviewCount">{{@$totalReview}}</span>)
                      </div>
                    </div>

                    <div class="product-list-actions">

                      <form action="" method="post" class="product-qty-cart">
                        <input type="hidden" name="id_product" value="1">
                        <button class="btn btn-primary" data-button-action="add-to-cart" type="button" onclick="addCart('{{ $product->id}}')" {{$disabled}}>
                          <i class="material-icons shopping-cart"></i>Add to cart
                        </button>
                      </form>

                    </div>

                  </div>

                </div>
              </article>
              <?php $countP++?>
              @php } @endphp
            </div>
       {{--  <nav class="pagination row">
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
        </nav> --}}

      </div>
      </div>
      <div id="js-product-list-bottom">
        <div id="js-product-list-bottom"></div>
      </div>
    </section>
  </div>
@endsection