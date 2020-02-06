 <?php
  use App\ProductSections;
  use App\ProductImage;
  use App\Product;
  use App\Category;
?>
 <input type="hidden" value="{{count($homeCategories)}}" class="homeCategories">
<?php
  $homeCategory = 0;
    foreach ($homeCategories as $category) {
         $subCategories = Category::where('parent',$category->id)->where('showInHomepage','yes')->where('categoryStatus',1)->orderBy('orderBy','ASC')->orderBy('categoryName','ASC')->get();
      $homeCategory++;
 ?>
 <style type="text/css">
   .item-sub-cat .active a{
    color: #ff5e00 !important;
   }
 </style>
 <script type="text/javascript" src="{{ asset('public/frontend') }}/assets/js/jquery-2.2.4.min.js"></script>
 <script src="{{ asset('public/frontend') }}/assets/multislider.js"></script>   
<!-- Category Slider 1 -->
<div id="so_category_slider_1" class="so-category-slider container-slider module cateslider1" style="background: #fff;">
    <div class="modcontent">                                                      
        <div class="page-top">
            <div class="page-title-categoryslider">{{$category->categoryName}}</div>
            <div class="item-sub-cat">
                <ul>
                  <?php
                    $i = 0;
                    foreach ($subCategories as $subcat) {
                      $i++;
                  ?>
                    <li <?php if($i==1){ ?> class="active" <?php } ?>><a data-transition-type="backSlide" href="#homecat{{$subcat->id}}" data-toggle="tab">{{$subcat->categoryName}}</a></li>
                  <?php } ?>
                </ul>
            </div> 
        </div>

        <div class="tab-content" style="border: none">
          <input type="hidden" value ="{{count($subCategories)}}" class="category{{$homeCategory}}">
            <?php
                  $j = 0;
                  foreach ($subCategories as $subcat) {
                    $categoryProducts = Product::where('status',1)->where('category_id',$subcat->id)->get();
                      $j++;

                    $category_slider =  $category->id.'_'.$subcat->id;
                    $categoryName = str_replace(' ', '-', $subcat->categoryName);
                    
            ?>
         
            <div class="tab-pane <?php if($j==1){ ?>in active <?php } ?>" id="homecat{{$subcat->id}}">
                <div class="row">
                    <div class="col-md-3">
                      <div style="min-height: 258px;">
                          <a href="{{url('/categories/'.@$subcat->id.'/'.@$categoryName)}}">
                            <?php 
                            if (@$subcat->categoryImage && file_exists(@$subcat->categoryImage)) {
                            ?>
                            <img class="categories-loadimage" alt="{{$subcat->categoryName}}" src="{{ @$subcat->categoryImage}}" style="height: 355px;
    margin-left: -7px; width: 239px;">
                          <?php }else{ ?>
                            <img class="categories-loadimage" alt="{{$subcat->categoryName}}" src="{{ asset('/')}}public/frontend/no-image.png" style="height: 355px;
    margin-left: -7px; width: 239px;"><!-- 
                            <img src="{{ asset('/')}}public/frontend/no-image.png" alt="img cate" class="img-responsive"><br> -->
                          <?php } ?>
                              
                          </a>
                      </div>
                    </div>
          
                  <div class="col-md-9">
                    <div class="cat_{{$homeCategory}}_<?php echo $j; ?> mixedSlider" style="margin-top: 50px;">
                    <div class="MS-content">
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
                        <div class="item"> 
                            <div class="product-item-container">
                                <div class="left-block left-b">
                                  <?php  if($product->discount){?>
                                    <div class="box-label">
                                      <span class="label-product label-sale">
                                        <?php echo  $discount_percent ; ?>%
                                      </span>
                                    </div>
                                  <?php } ?> 
                                    <div class="custom" style="min-height: 238px !important;">
                                        <a href="{{url('product/'.@$product->id.'/'.@$name)}}" target="_self" title="{{@$product->name}}">
                                            <img src="{{ @$image->images}}" class="img-1 img-responsive" alt="image1">
                                            
                                        </a>
                                    </div>
                                   
                                </div>
                                <div class="right-block" style="margin-top: -17px;">
                                    <div class="button-group so-quickview cartinfo--left">
                                        <button type="button" onclick="addCart('{{ $product->id}}')" class="addToCart" title="Add to cart">
                                            <span>Add to cart </span>   
                                        </button>
                                        
                                    </div>
                                    <div class="caption hide-cont">
                                        <h5>Code: {{@$product->deal_code}}</h5>
                                        <h5 style="margin-top: -10px !important;"><a href="{{url('product/'.@$product->id.'/'.@$name)}}" target="_self">{{ str_limit($product->name, 25) }} </a></h5>
                                        
                                    </div>
                                    <p class="price" style="margin-top: -10px !important;">
                                    <?php  if($product->discount){?>
                                      <span class="price-new" style="font-size: 14px;">৳ {{@$product->discount}}</span>
                                      <span class="price-old"  style="font-size: 14px;">৳ {{@$product->price}}</span>
                                    <?php }else{ ?>
                                        <span class="price-new"  style="font-size: 14px;">৳ {{@$product->price}}</span>
                                    <?php } ?>
                                    </p>
                                </div>

                            </div>
                       
                        </div>
                        <?php $countP++?>
                          <?php } ?>

                    </div>
                    <div class="MS-controls">
                        <button class="MS-left"><i class="fa fa-angle-left" aria-hidden="true"></i></button>
                        <button class="MS-right"><i class="fa fa-angle-right" aria-hidden="true"></i></button>
                    </div>
                </div>
                  </div>
              </div>
             
            </div>
          <?php } ?>
        </div>
    </div>
</div>
<?php } ?>

<script>
  var homeCategories = $('.homeCategories').val();
  for (var homeCategory = 1; homeCategory <= homeCategories; homeCategory++) {
    var category = $('.category'+homeCategory).val();
      for(var j = 1; j <= category; j++){
         $('.cat_'+homeCategory+'_'+j).multislider({
          duration: false,
          interval: false
        });
      }
  }
 
</script>
