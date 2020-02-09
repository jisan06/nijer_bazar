@extends('frontend.master') 

@section('title', 'product')

@section('mainContent')

 <?php
  use App\Product;
  use App\ProductImage;
  use App\ProductSections;
  use App\Review;
  $image = ProductImage::where('productId',$products->id)->first();

  $allImage = ProductImage::where('productId',$products->id)->get();
  
  $customerId = Session::get('customerId');

  $allReview = Review::where('productId',$products->id)->count();

  $totalStar = $allReview*5;

  $totalRating = Review::where('productId',$products->id)->sum('star');

  @$rating = @$totalRating*100/$totalStar;

  $setReview = @$_GET['setReview'];
    if (@$setReview == $products->id) {
      $activeReview = 'active';
      $activeTab = 'active in';
    }else{
      $activeReview = '';
    }

    if(!@$setReview){
      $active = 'active';
    }
 ?>
    <div class="product-row clearfix">
      <div class="col-lg-6">
        <section class="page-content" id="content">
          <div class="images-container">
            <?php 
              if(count($allImage) > 1){
            ?>
              <div class="product-cover">
                <img class="js-qv-product-cover" src="{{ asset('/').$image->images }}" alt="" title="" style="width:100%;height: 500px !important;" itemprop="image">
                <div class="layer hidden-sm-down" data-toggle="modal" data-target="#product-modal">
                  <i class="material-icons zoom-in"></i>
                </div>
              </div>
            <?php }else{ ?>
              <div class="product-cover">
                <img class="js-qv-product-cover" src="{{ asset('/').$image->images }}" alt="" title="" style="width:100%;height: 500px !important;" itemprop="image" >
                <div class="layer hidden-sm-down" data-toggle="modal" data-target="#product-modal">
                  <i class="material-icons zoom-in"></i>
                </div>
              </div>
            <?php } ?>
            <div class="js-qv-mask mask tptncarousel">
              <ul class="product-images js-qv-product-images thumbcrsl">
                @foreach($allImage as $miniImage)
                  <li class="thumb-container">
                    <img
                      class="thumb js-thumb  selected"
                      data-image-medium-src="{{ asset('/').$miniImage->images }}"
                      data-image-large-src="{{ asset('/').$miniImage->images }}"
                      src="{{ asset('/').$miniImage->images }}"
                      alt=""
                      title=""
                      width="100"
                      style="height: 100px;"
                    >
                  </li>
                @endforeach
              </ul>
            </div>
          </div>
          <div class="scroll-box-arrows">
            <i class="material-icons left"></i>
            <i class="material-icons right"></i>
          </div>
        </section>
      </div>

      <div class="col-lg-6">
        <h1 class="h1" itemprop="name">{{$products->name}}</h1>
        <h4 class="h4" itemprop="name">Code: {{$products->deal_code}}</h4>
        <div id="product-description-short-3" class="product-description-short" >
          <?php echo $products->description1 ?>
        </div>
        <div class="product-actions">
          <div class="product-variants">
          </div>
          <div class="product-prices">
            <div class="product-price h5 " itemprop="offers" itemscope="" itemtype="https://schema.org/Offer">
              <link itemprop="availability" href="https://schema.org/InStock">
              <meta itemprop="priceCurrency" content="USD">
              <div class="product-price-and-shipping">
                <span class="sr-only">Price</span>
                <?php  if($products->discount){ ?>
                  <span itemprop="price" class="price">৳ {{@$products->discount}}</span>{{-- </br> --}}
                  <span class="sr-only">Regular price</span>
                  <span class="regular-price with-discount">৳ {{@$products->price}}</span>
                <?php }else{ ?>
                  <span class="regular-price">৳ {{@$products->price}}</span>
                <?php } ?>
              </div>
            </div>
            <div class="tax-shipping-delivery-label">
            </div>
          </div>
          <div class="product-add-to-cart">
            <span class="control-label">Quantity</span>
            <div class="product-quantity clearfix">
              <div class="qty">
                <div class="input">
                  <input type="number" name="qty" id="quantity_wanted" value="1" class="input-group" min="1" aria-label="Quantity" style="display: none;">
                </div>
              </div>
              <div class="add">
                <button class="btn btn-primary add-to-cart" onclick="addCartFromSingleProduct('{{ $products->id}}')" <?php if ($products->stockUnit == 2){ echo "disabled";} ?> {{-- data-button-action="add-to-cart" type="submit" --}}>
                  <i class="material-icons shopping-cart"></i>
                  Add to cart 
                </button>
              </div>
            </div>
          </div>

          <div class="product-additional-info">
            <div class="social-sharing">
              <span>Share</span>
              <ul>
                <li class="facebook icon-gray">
                  <a href="https://www.facebook.com/sharer/sharer.php?u={{URL::current()}}" class="text-hide" title="Share" target="_blank">
                    Share
                  </a>
                </li>
                <li class="twitter icon-gray">
                  <a href="https://twitter.com/intent/tweet?text={{URL::current()}}" class="text-hide" title="Tweet" target="_blank">
                    Tweet
                  </a>
                </li>
                <li class="googleplus icon-gray">
                  <a href="https://plus.google.com/share?url={{URL::current()}}" class="text-hide" title="Google+" target="_blank">
                    Google+
                  </a>
                </li>
                <li class="pinterest icon-gray">
                  <a href="http://pinterest.com/pin/create/button?media={{URL::current()}}" class="text-hide" title="Pinterest" target="_blank">
                    Pinterest
                  </a>
                </li>
              </ul>
            </div>
          </div>
        </div>
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
    <div class="tabs">
      <ul class="nav nav-tabs" role="tablist">
        <li class="nav-item">
          <a class="nav-link {{@$active}}" data-toggle="tab" href="#description" role="tab" aria-controls="description" aria-selected="true">Description</a>
        </li>
        <li class="nav-item">
          <a class="nav-link {{$activeReview}}" data-toggle="tab" href="#extra-0" role="tab" aria-controls="extra-0" aria-expanded="true">Reviews</a>
        </li>
      </ul>
      <div class="tab-content" id="tab-content">
        <div class="tab-pane fade in {{@$active}}" id="description" role="tabpanel">
          <div class="product-description">
            <?php echo $products->description2 ?>
          </div>
        </div>

        <div class="tab-pane fade {{@$activeTab}}" id="extra-0" role="tabpanel" aria-expanded="true">
          <script type="text/javascript">
            var productcomments_controller_url = '../module/productcomments/default.html';
            var confirm_report_message = 'Are you sure that you want to report this comment?';
            var secure_key = '58a69d4723cdfc335180d0d244641d12';
            var productcomments_url_rewrite = '1';
            var productcomment_added = 'Your comment has been added!';
            var productcomment_added_moderation = 'Your comment has been submitted and will be available once approved by a moderator.';
            var productcomment_title = 'New comment';
            var productcomment_ok = 'OK';
            var moderation_active = 1;
          </script>

          <div id="product_comments_block_tab">
            @foreach($reviews as $review)
            <?php
              $reviewDate = date('d-m-Y',strtotime($review->created_at));
              @$revewRating = 1*100/$review->star;
            ?>
              <div class="comment" itemprop="review" itemscope="" itemtype="">
                <div class="comment_author">
                  <div class="star_content" itemprop="reviewRating" itemscope="" itemtype="">
                    <div class="star star_on"></div>
                    <div class="star star_on"></div>
                    <div class="star star_on"></div>
                    <div class="star star_on"></div>
                    <div class="star"></div>
                    <meta itemprop="worstRating" content="0">
                    <meta itemprop="ratingValue" content="4">
                    <meta itemprop="bestRating" content="5">
                  </div>
                  <div class="comment_author_infos">
                    <span itemprop="author">{{$review->name}}</span>
                    <meta itemprop="datePublished" content="">
                    <em>{{$reviewDate}}</em>
                  </div>
                </div>
                <div class="comment_details">
                  <p itemprop="name" class="title_block">
                   {{$review->summary}}
                  </p>
                  <p itemprop="reviewBody">{{$review->review}}</p>
                  <ul>
                  </ul>
                </div> <!-- .comment_details -->
              </div>
            @endforeach
            <?php if(!isset( $customerId )){ ?>
                <p style="color: red;">/*Please <a style="font-size: 15px;color: #0f7a9a;" href="{{route('customer.login',['setReview'=>@$products->id])}}">Login</a> First and complete your review*\</p>
              <?php } ?>
            <form <?php if(!isset($customerId)){ ?> style="display: none;" <?php } ?> action="{{route('customerReview.save')}}"  method="post" role="form">
              {{ csrf_field() }}
              <input type="hidden" name="productId" value="{{$products->id}}">
              <input type="hidden" name="productName" value="{{$products->name}}">

              <h2 id="review-title">Write a review</h2>
              <div class="contacts-form">
                <div class="row">
                  <div class="col-md-5">
                    <label>Your Name</label>
                    <div class="form-group"> <span class="icon icon-user"></span>
                      <input type="text" name="name" class="form-control" placeholder="Your Name" required> 
                    </div>
                  </div>
                  <div class="col-md-7">
                    <label>Subject</label>
                    <div class="form-group"> <span class="icon icon-user"></span>
                      <input type="text" name="summary" class="form-control" placeholder="subject" required> 
                    </div>
                  </div>
                </div>

                <div class="row">
                  <div class="col-md-12">
                    <label>Reveiew</label>
                    <div class="form-group"> <span class="icon icon-bubbles-2"></span>
                      <textarea class="form-control" name="review" required></textarea>
                    </div> 
                  </div>
                </div>
  
                <div class="form-group">
                   <span><b>Rating</b></span>&nbsp;
                   <input type="radio" name="star" value="1" onclick="Starvalue(1)" required> &nbsp;
                   <input type="radio" name="star"
                   value="2" onclick="Starvalue(2)"> &nbsp;
                   <input type="radio" name="star"
                   value="3" onclick="Starvalue(3)"> &nbsp;
                   <input type="radio" name="star"
                   value="4" onclick="Starvalue(4)"> &nbsp;
                   <input type="radio" name="star"
                   value="5" onclick="Starvalue(5)"> &nbsp;

                   <span id="ratingBadOrGood"> </span>
                </div>
                 <div class="buttons clearfix">
                  <button id="button-review" class="btn btn-primary">Continue</button>
                </div>
              </div>
            </form>
          </div>

          <!-- Fancybox -->
          <div style="display:none">
            <div id="new_comment_form">
              <form id="id_new_comment_form" action="#">
                <h2 class="title">Write your review</h2>
                <div class="product">
                  Galaxy Android Smartphone
                </div>
                <div class="new_comment_form_content">
                  <div id="new_comment_form_error" class="error" style="display:none">
                    <ul></ul>
                  </div>
                  <ul id="criterions_list">
                    <li>
                      <label>Quality</label>
                      <div class="star_content">
                        <input type="hidden" name="criterion[1]" value="5"><div class="cancel"><a title="Cancel Rating"></a></div><div class="star star_on"><a title="1">1</a></div>
                        <div class="star star_on"><a title="2">2</a></div>
                        <div class="star star_on"><a title="3">3</a></div>
                        <div class="star star_on"><a title="4">4</a></div>
                        <div class="star star_on"><a title="5">5</a></div>
                      </div>
                      <div class="clearfix"></div>
                    </li>
                  </ul>
                  <label for="comment_title">Title for your review<sup class="required">*</sup></label>
                  <input id="comment_title" name="title" type="text" value="">

                  <label for="content">Your review<sup class="required">*</sup></label>
                  <textarea id="content" name="content"></textarea>


                  <div id="new_comment_form_footer">
                    <input id="id_product_comment_send" name="id_product" type="hidden" value="5">
                    <p class="f-left required"><sup>*</sup> Required fields</p>
                    <p class="f-right">
                      <button class="btn btn-primary " id="submitNewMessage" name="submitMessage" type="submit">Send</button>
                    </p>
                    <div class="clearfix"></div>
                  </div>
                </div>
              </form><!-- /end new_comment_form_content -->
            </div>
          </div>
          <!-- End fancybox -->

        </div>
      </div>
    </div>
   
@include('frontend.product.element.relatedProduct')

<div class="modal fade js-product-images-modal" id="product-modal">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-body">
        <figure>
          <img 
          class="js-modal-product-cover product-cover-modal" 
          width="800" src="{{ asset('/').$image->images }}" alt="" title="" 
          itemprop="image">
          <figcaption class="image-caption">

            <div id="product-description-short" itemprop="description">
              @php
               echo $products->description1;
              @endphp
            </div>

          </figcaption>
        </figure>
        <aside id="thumbnails" class="thumbnails js-thumbnails text-sm-center">
          <div class="js-modal-mask mask  nomargin ">
            <ul class="product-images js-modal-product-images">

              @foreach($allImage as $miniImage)
                <li class="thumb-container">
                  <img 
                  data-image-large-src="{{ asset('/').$miniImage->images }}" 
                  class="thumb js-modal-thumb" 
                  src="{{ asset('/').$miniImage->images }}" alt="" title="" 
                  width="220" itemprop="image">
                </li>
              @endforeach

            </ul>
          </div>
          
        </aside>
      </div>
    </div>
  </div>
</div>

@endsection
