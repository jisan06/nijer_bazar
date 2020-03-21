<?php
  use App\ProductSections;
  use App\ProductImage;
  use App\Product;
?>
@if(count(@$featuredProductList) > 0)
    <section class="tptnprodtabs clearfix"> 
  <div class="crsl-title">
    <h4>Featured Products</h4>
    <div class="crsl-link">
      <a href="{{route('viewAll.product',['section'=>'featured_product'])}}" title="All featured products">Show all
        <i class="material-icons">&#xE315;</i></a>
    </div>
  </div>
  <div class="prodtabs">
    <?php
      $countP = 1; 
    ?>
    @foreach($featuredProductList as $product)
    <?php
      $image = ProductImage::where('productId',$product->id)->first();
      $name = str_replace(' ', '-', $product->name);
      $percentChange = (($product->price - $product->discount) / $product->price) * 100;
      $discount_percent = round(abs($percentChange));
    ?>    
      <article class="prodtabs-miniature js-product-miniature col-xs-12 col-sm-6 col-lg-4" data-id-product="1" data-id-product-attribute="46" itemscope itemtype="http://schema.org/Product">
        <div class="thumbnail-container">
          <div class="product-thumbnail">
            <a href="{{url('product/'.@$product->id.'/'.@$name)}}" class="thumbnail" title="{{@$product->name}}" >
              <?php if(file_exists($image->images) ){ ?>
                <img class="first-img" src="{{ @$image->images}}" alt="image1">
              <?php }else{ ?>
                <img class="first-img " src="{{ asset('/')}}public/frontend/no-image.png" alt="slider Image" class="first-img" alt="image1">
              <?php } ?>
            </a>
          </div>
          <div class="product-description">
            <h3 class="h3 product-title" itemprop="name"><a href="{{url('product/'.@$product->id.'/'.@$name)}}" target="_self">{{ str_limit($product->name, 20) }} </a>
            </h3>

            <div class="product-price-and-shipping">
              <p style="font-size: 10px; margin-top: 5px; margin-bottom: 5px;">
                Code: {{@$product->deal_code}}
              </p>
            </div>                         
            <div class="product-price-and-shipping">      
                <span class="sr-only">Price</span>
              <?php  if($product->discount){ ?>
                <span itemprop="price" class="price">৳ {{@$product->discount}}</span>
                <span class="sr-only">Regular price</span>
                <span class="regular-price">৳ {{@$product->price}}</span>
              <?php }else{ ?>
                <span itemprop="price" class="price">৳ {{@$product->price}}</span>
              <?php } ?>
              <?php  if($product->discount){ ?>
                <span class="discount-percentage discount-product"><?php echo  $discount_percent ; ?>
                  %
                </span>
              <?php } ?>
            </div>
          </div>
        </div>
      </article>
    <?php $countP++ ?>
    @endforeach         
  </div>
</section>
@endif