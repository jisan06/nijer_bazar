<?php
  use App\Product;
  use App\ProductImage;
  use App\ProductSections;

    $countP = 0; 
    $productInfo = ProductSections::where('productId',@$products->id)->first();
     
    $related_product = Product::where('id',@$productInfo->related_product)->get();
    $allsection = explode(',', @$productInfo->related_product);
?>
@if(@$productInfo->related_product != '')
    <!-- Related Products -->
    <section class="tptncarousel tptnprods clearfix">
        <h4>Related Products: </h4>
        <div class="prodcrsl">
            @foreach($allsection as $product)
        <?php
              $allProduct = Product::where('status',1)->where('id',$product)->first();
              $image = ProductImage::where('productId',@$allProduct->id)->first();
               
              if ($allProduct) {
                $name = str_replace(' ', '-', $allProduct->name);
                $percentChange = (($allProduct->price - $allProduct->discount) / $allProduct->price) * 100;
                $discount_percent = round(abs($percentChange));
        ?>      
            <article class="product-miniature js-product-miniature col-xs-12 col-sm-6 col-lg-4 col-xl-3" data-id-product="4" data-id-product-attribute="61">
                <div class="thumbnail-container">
                    <div class="product-thumbnail">
                        <a href="{{url('product/'.@$allProduct->id.'/'.@$name)}}" class="thumbnail">
                            <?php 
                            if (@$image->images && file_exists(@$image->images)) {
                            ?>
                            <img class="first-img img-1 img-responsive relatedImage" src="{{ asset('/').@$image->images}}" alt="image1">
                            <?php }else{ ?>
                            <img class="first-img img-1 img-responsive relatedImage" src="{{ asset('/')}}public/frontend/no-image.png" alt="NoImage">
                            <?php } ?>
                            
                        </a>
                    </div>
                    <div class="product-description">
                        <h2 class="h3 product-title" itemprop="name">
                            <a href="{{url('product/'.@$product->id.'/'.@$name)}}">{{ str_limit($allProduct->name, 25) }}</a>
                        </h2>
                        <h4>Code: {{@$allProduct->deal_code}}</h4>
                        <div class="product-price-and-shipping">
                            <?php  if(@$allProduct->discount){?>
                            <span class="sr-only">Price</span>
                            <span itemprop="price" class="price">৳ {{@$allProduct->discount}}</span>
                            <span class="sr-only">Regular price</span>
                            <span class="regular-price">৳ {{@$allProduct->price}}</span>
                            <?php }else{ ?>
                            <span class="sr-only">Price</span>
                            <span itemprop="price" class="price">৳ {{@$allProduct->price}}</span>
                            <?php } ?>
                            <?php  if($allProduct->discount){?>
                            <span class="discount-amount discount-product"><?php echo  $discount_percent ; ?>%</span>
                            <?php } ?> 
                        </div>
                        <div class="comments_note" itemprop="aggregateRating" itemscope itemtype="https://schema.org/AggregateRating">    
                            <div class="star_content">
                                <div class="star star_on"></div>
                                <div class="star star_on"></div>
                                <div class="star star_on"></div>
                                <div class="star star_on"></div>
                                <div class="star star_on"></div>
                                <meta itemprop="worstRating" content = "0" />
                                <meta itemprop="ratingValue" content = "5" />
                                <meta itemprop="bestRating" content = "5" />
                            </div>
                            <div class="nb-comments">(<span itemprop="reviewCount">1</span>)</div>
                        </div>
                        <div class="product-list-actions">
                            <form action="" method="post" class="product-qty-cart">
                              <input type="hidden" name="token" value="bc93467e0ed41e85c670077e5a7f068a">
                              <input type="hidden" name="id_product" value="4">
                              <button class="btn btn-primary addToCart" data-button-action="add-to-cart" type="submit" onclick="addCart('{{ $allProduct->id}}')" >
                                <i class="material-icons shopping-cart">&#xE547;</i>Add to cart
                              </button>
                            </form>
                        </div>
                    </div>
                </div>
            </article>
            <?php $countP++?>
            <?php } ?>
            @endforeach
        </div>
    </section>
    <!-- end Related  Products-->
@endif