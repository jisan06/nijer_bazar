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
  <nav data-depth="3" class="breadcrumb hidden-sm-down">
    <ol itemscope="" itemtype="http://schema.org/BreadcrumbList">  
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
    <section id="main">
      <nav class="subcategories tptncarousel tptnprods">
        <div class="subcatcrsl owl-loaded owl-drag">
          <?php
          $countP = 0; 
          ?>
          @foreach($products as $product)
          <?php  
          $image = ProductImage::where('productId',$product->id)->first();
          $name = str_replace(' ', '-', $product->name);
          ?>
          <div class="owl-stage-outer">
            <div class="owl-stage" style="transform: translate3d(0px, 0px, 0px); transition: all 0s ease 0s; width: 925px;">
              <div class="owl-item active" style="width: 185px;">

                <input type="hidden" id="pro_id<?php echo $countP;?>" value="{{@$product->id}}"/>
                <div class="subcat-item" style="float: right;">
                  <?php if(file_exists($image->images)){ ?>
                  <a href="{{url('product/'.@$product->id.'/'.@$name)}}" class="subcat-image .third-img">
                    <img src="{{ asset('/').$image->images }}" alt="" style="height: 250px;width: 100%;">
                  </a>
                  <?php }else{ ?>
                  <a href="{{url('product/'.@$product->id.'/'.@$name)}}" class="subcat-image third-img">
                    <img src="{{ asset('/')}}public/frontend/no-image.png" alt="">
                  </a>
                  <?php } ?>
                  <a href="{{url('product/'.@$product->id.'/'.@$name)}}" class="subcat-name">{{ str_limit($product->name, 30) }}
                  </a>
                </div>


              </div>
            </div>
          </div>
          <?php $countP++?>
          @endforeach
          <div class="owl-nav disabled">
            <button type="button" role="presentation" class="owl-prev disabled"></button>
            <button type="button" role="presentation" class="owl-next disabled"></button>
          </div>
          <div class="owl-dots disabled"></div>
        </div>
        
      </nav>


      <section id="products">
        <div id="js-product-list-top"></div>
        <div id="js-product-list"></div>
        <div id="js-product-list-bottom"></div>
      </section>
    </section>
  </div>
@endsection