@extends('frontend.master')  

@section('mainContent')
  <?php
    use App\ProductSections;
    use App\ProductImage;
    use App\Product;
    use App\Category;
  ?>
  <!-- Main Container  -->
  <section id="content" class="page-home">
    @include('frontend.home.element.slider_grid')
    @include('frontend.home.element.banner_second')
    @include('frontend.home.element.featured_product')
    @include('frontend.home.element.new_products')
    {{-- @include('frontend.home.element.on_sale') --}}
    @include('frontend.home.element.best_seller_grid')
    @include('frontend.home.element.category_product_grid')
    <!-- ('frontend.home.element.banner_first')  -->
    @include('frontend.home.element.blog_grid')
    {{-- @include('frontend.home.element.shop_by_brands') --}}
  </section>
@endsection