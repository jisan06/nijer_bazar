<?php
  use App\Product;
  use App\ProductImage;
  @$best_seller_product = Product::whereRaw('FIND_IN_SET(?,productSection)',[4])->where('status',1)->get();
?>
<div id="tptnhomeslider" class="owlslider" data-speed="5000" data-play="true">
  @foreach($sliders as $slider)
    <?php 
      if (!empty($slider->productId)) {
        $sliderProduct = Product::where('id',$slider->productId)->first();
        @$name = str_slug($sliderProduct->name,'-');
      }
    ?>
    <div class="item">
      <a <?php if (!empty($slider->productId)) { ?> href="{{url('product/'.@$sliderProduct->id.'/'.@$name)}}"<?php } ?>>
        <?php if(file_exists($slider->source)){ ?>
          <img src="{{asset('/').$slider->source}}" alt="slider Image" class="img-responsive slider_image NBslider">
        <?php }else{ ?>
          <img src="{{ asset('/')}}public/frontend/no-image.png" alt="slider Image" class="img-responsive" style="width: 100%;height: 315px;">
        <?php } ?>
      </a>
    </div>
  @endforeach
</div>