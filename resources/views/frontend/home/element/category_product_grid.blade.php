@php
  use App\Product;
  use App\ProductImage;
@endphp
@php
    $homeCategory = 0;
    foreach ($homeCategories as $category) {
      $categoryProducts = Product::where('status',1)
                                ->where('root_category',$category->categoryId)
                                ->get();
    $categoryName = str_replace(' ', '-', $category->categoryName);
    $viewAllLink = url('/categories/'.@$category->categoryId.'/'.@$categoryName);
     $homeCategory++;
@endphp
@if(count(@$categoryProducts) > 0)
  <section class="tptncarousel tptnprods">
    <div class="crsl-title">
      <h4>{{$category->categoryName}}</h4>
      <div class="crsl-link">
        <a href="{{@$viewAllLink}}" title="All products">Show all
          <i class="material-icons">&#xE315;</i>
        </a>
      </div>
    </div>

    <div class="prodcrsl">
      @php
        foreach ($categoryProducts as $product) { 
        $image = ProductImage::where('productId',$product->id)->first();
        $name =str_replace(' ', '-', $product->name);
        $percentChange = (($product->price - $product->discount) / $product->price) * 100;
        $discount_percent = round(abs($percentChange));
      @endphp       
        <article class="product-miniature js-product-miniature col-xs-12 col-sm-6 col-lg-4 col-xl-3" data-id-product="1" data-id-product-attribute="46" itemscope itemtype="">
          <div class="thumbnail-container">
            <div class="product-thumbnail">
              <a href="{{url('product/'.@$product->id.'/'.@$name)}}" class="thumbnail" title="{{@$product->name}}">
                <img class="cat-img" src="{{ @$image->images}}" alt="image1">
                <img class="cat2-img" src="{{ @$image->images}}" alt="image1">
              </a>
            </div>
            <div class="product-description">
              <h3 class="h3 product-title" itemprop="name">
                <a href="{{url('product/'.@$product->id.'/'.@$name)}}" target="_self">{{ str_limit($product->name, 25) }} </a>
              </h3>
              <div class="product-price-and-shipping">
                <p style="font-size: 10px; margin-top: 5px; margin-bottom: 5px;">Code: {{@$product->deal_code}}</p>
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

              <div class="product-list-actions">
                <button class="btn btn-primary" type="button" onclick="addCart('{{ $product->id}}')">
                  <i class="material-icons shopping-cart">&#xE547;</i>Add to cart
                </button>
              </div>
            </div>
          </div>
        </article>
        <?php } ?>        
    </div>
  </section>
@endif
<?php } ?> 