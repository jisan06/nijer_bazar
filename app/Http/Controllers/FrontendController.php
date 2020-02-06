<?php

namespace App\Http\Controllers;

use App\Team;
use Illuminate\Http\Request;

use DB;
use Session;
use App\Category;
use App\Banner;
use App\Policy;
use App\Product;
use App\Slider;
use App\Review;
use App\About;
use App\Faq;
use App\DeliveryPolicies;
use App\PaymentPolicies;
use App\RefundPolicies;
use App\HelpCenters;
use App\Terms;
use App\Blog;
use App\Settings;
use App\ProductSections;


class FrontendController extends Controller
{
    public function index()
    {    $metaInfo = Settings::first();
         $sliders = Slider::where('status',1)->orderBy('orderBy','ASC')->get();

         $categories = Category::where('categoryStatus',1)->orderBy('orderBy','ASC')->orderBy('categoryName','ASC')->get();

         $homeCategories = DB::table('categories')
            ->select('categories.id as categoryId','categories.categoryName as categoryName','categories.orderBy','products.root_category')
            ->join('products','products.root_category','=','categories.id')
            ->groupBy('products.root_category','categories.id','categories.categoryName','categories.orderBy')
            ->orderBy('categories.orderBy','ASC')
            ->take('2')
           ->get();

         Category::where('categoryStatus',1)
             ->where('showInHomepage','yes')
             ->where('parent',null)
             ->orderBy('orderBy','ASC')
             ->orderBy('categoryName','ASC')
             ->get();

         $banners = Banner::where('bannerStatus','1')->orderBy('orderBy','ASC')->get();
         $policies = Policy::where('policiesStatus','1')->orderBy('orderBy','ASC')->get();
         $blogs = Blog::where('status','1')->orderBy('orderBy','ASC')->get();

         $metaTag =[
            'meta_keyword'=>$metaInfo->metaKeyword,
            'meta_title' =>$metaInfo->metaTitle,
            'meta_description' =>$metaInfo->metaDescription
         ];

         $featuredProductList = Product::where('status','1')
                                ->whereRaw('FIND_IN_SET(?,productSection)',['2'])
                                ->orderBy('orderBy','ASC')
                                ->orderBy('name','ASC')
                                ->get();

        $newProductList = Product::where('status','1')
                              ->whereRaw('FIND_IN_SET(?,productSection)',['1'])
                              ->orderBy('orderBy','ASC')
                              ->orderBy('name','ASC')
                              ->get();

        $bestSellProductList = Product::where('status','1')
                              ->whereRaw('FIND_IN_SET(?,productSection)',['4'])
                              ->orderBy('orderBy','ASC')
                              ->orderBy('name','ASC')
                              ->get();


        return view('frontend.home.home',['categories'=>$categories,'sliders'=>$sliders,'featuredProductList'=>$featuredProductList,'newProductList'=>$newProductList,'bestSellProductList'=>$bestSellProductList])->with(compact('title','metaTag','banners','policies','homeCategories','blogs'));
    }

    public function searchProduct(Request $request){
        //$search = $request->searchProduct;
        $search = $_GET['search_query'];
        // dd($search);
        $categories = @$request->categorySelect;
        if ($categories) {
          $products = Product::where('status',1)
                            ->where('name','LIKE','%'.$search.'%')
                            ->orWhere('deal_code','LIKE','%'.$search.'%')
                            ->paginate(10);
          $products->appends(['searchProduct' => $search]);
        }else{
          $products = Product::where('status',1)
                            ->where('name','LIKE','%'.$search.'%')
                            ->orWhere('deal_code','LIKE','%'.$search.'%')
                            ->paginate(10);
          $products->appends(['searchProduct' => $search]);
        }

        $categorySelect = Category::where('id',$categories)->first();

        return view('frontend.search.searchProduct')->with(compact('products','search','categorySelect'));

  }

      public function categoryLanding($id){

         $category = Category::where('id',$id)->first();

         $subCategory = Category::where('parent',$id)->where('categoryStatus',1)->paginate(20);
         $allSubcat = Category::where('parent',$id)->where('categoryStatus',1)->get();
         $homeCategories = Category::where('categoryStatus',1)->where('showInHomepage','yes')->where('parent',null)->orderBy('orderBy','ASC')->orderBy('categoryName','ASC')->get();

         $metaTag =[
            'meta_keyword'=>$category->metaKeyword,
            'meta_title' =>$category->metaTitle,
            'meta_description' =>$category->metaDescription
         ];

         $title = $category->categoryName;

         return view('frontend.category.categoryLanding')->with(compact('subCategory','metaTag','title','category','allSubcat','homeCategories'));
      }

      public function productByCategory($id){

        $rootCategory = Product::where('root_category',$id)->first();

        if ($rootCategory) {
         @$products = Product::whereRaw('FIND_IN_SET(?,root_category)',[$rootCategory->root_category])->where('status',1)->orderBy('orderBy','ASC')->paginate(40);

        }else{
          @$products = Product::whereRaw('FIND_IN_SET(?,category_id)',[$id])->where('status',1)->orderBy('orderBy','ASC')->paginate(40);
        }
         
         $category = Category::where('id',$id)->first();

         $metaTag =[
            'meta_keyword'=>$category->metaKeyword,
            'meta_title' =>$category->metaTitle,
            'meta_description' =>$category->metaDescription
         ];

         $title = $category->categoryName;

         return view('frontend.category.productbycategory')->with(compact('products','category','metaTag','title'));
      }

      public function productSort($id, $sortId){
        if($sortId == 1){
          $orderBy = 'orderBy';
          $orders = "ASC";
        }
        if($sortId == 2){
          $orderBy = 'name';
          $orders = "ASC";
        }
        if($sortId == 3){
          $orderBy = 'name';
          $orders = "DESC";
        }
        if($sortId == 4){
          $orderBy = 'price';
          $orders = "ASC";
        }
        if($sortId == 5){
          $orderBy = 'price';
          $orders = "DESC";
        }
        $rootCategory = Product::where('root_category',$id)->first();

        if ($rootCategory) {
         @$products = Product::whereRaw('FIND_IN_SET(?,root_category)',[$rootCategory->root_category])->where('status',1)->orderBy($orderBy,$orders)->paginate(40);

        }else{
          @$products = Product::whereRaw('FIND_IN_SET(?,category_id)',[$id])->where('status',1)->orderBy($orderBy,$orders)->paginate(40);
        }
         
         $category = Category::where('id',$id)->first();

         $metaTag =[
            'meta_keyword'=>$category->metaKeyword,
            'meta_title' =>$category->metaTitle,
            'meta_description' =>$category->metaDescription
         ];

         $title = $category->categoryName;

         return view('frontend.category.productbycategory')->with(compact('products','category','metaTag','title','sortId'));
      }

      public function singleProduct($id){
         $products = Product::where('id',$id)->first();
         $reviews = Review::where('status','1')->where('productId',$id)->get();
         $metaTag =[
            'meta_keyword'=>$products->metaKeyword,
            'meta_title' =>$products->metaTitle,
            'meta_description' =>$products->metaDescription
         ];
         
         $title = "Our Latest Product";
         return view('frontend.product.singleproduct')->with(compact('products','metaTag','title','reviews'));
      }

      public function viewProduct(Product $product, Request $request)
    {
        $products = Product::where('id',$request->product_id)->first();
        if($request->ajax())
            {
                return response()->json([
                    'products'=>$products
                ]);
            }
        return view('frontend.category.viewProduct')->with(compact('products'));
    }

    public function ViewAllProduct(){
      $section = @$_GET['section'];
      if($section == 'flash_sell'){
        $title = "Deals of The Day";
        $products = FlashSell::where('id',1)->where('flashDate','!=','')->first();
      }elseif($section == 'best_sell'){
        $title = "Best Selling";
        $products = Product::whereRaw('FIND_IN_SET(?,productSection)',['4'])->where('status',1)->orderBy('id','ASC')->paginate(20);
      }elseif($section == 'new_arrival'){
        $title = "New Arrival";
        $products = Product::whereRaw('FIND_IN_SET(?,productSection)',['1'])->where('status',1)->orderBy('id','ASC')->paginate(20);
      }elseif($section == 'featured_product'){
        $title = "Featured Product";
        $products = Product::whereRaw('FIND_IN_SET(?,productSection)',['2'])->where('status',1)->orderBy('id','ASC')->paginate(20);
      }elseif($section == 'trending'){
        $title = "Trending Product";
        $products = Product::whereRaw('FIND_IN_SET(?,productSection)',['3'])->where('status',1)->orderBy('id','ASC')->paginate(20);
      }else{
      }
      return view('frontend.product.viewAllProduct')->with(compact('section','products','title'));
    }

    public function customerOrder(){
      $packages = Package::all();
      $categories = Category::where('status','1')->get();
      $products = Product::where('status','1')->get();
    
      return view('frontend.package.package')->with(compact('packages','categories','products'));
    }


      public function productPage()
      {
         return view('frontend.pages.productPage');
      }
    public function productPage2()
    {
      return view('frontend.pages.productPage2');
    }

    public function career()
    {
      return view('frontend.pages.career');
    }

      public function contactUs()
      { $title = "Nakshighor || Contact Us";
         return view('frontend.contact.contact')->with(compact('title'));
      }

      public function aboutUs()
      { $title = "Nakshighor || About Us";
        $about = About::where('status','1')->first();
        return view('frontend.about.about')->with(compact('about','title'));
      }

    public function faq()
      {  $faqs = Faq::where('status','1')->orderBy('orderBy',"ASC")->get();
         return view('frontend.faq.faq')->with(compact('faqs'));
      }

    public function deliveryPolicy(){
      $deliveryPolicy = DeliveryPolicies::where('status','1')->first();

       return view('frontend.delivery.policy')->with(compact('deliveryPolicy'));
      }

    public function paymentPolicy(){
    $paymentPolicy = PaymentPolicies::where('status','1')->first();
     return view('frontend.payment-policy.policy')->with(compact('paymentPolicy'));
    }

    public function refundPolicy(){
    $refundPolicy = RefundPolicies::where('status','1')->first();
     return view('frontend.refund-policy.policy')->with(compact('refundPolicy'));
    }

    public function helpCenter(){
    $helpCenter = HelpCenters::where('status','1')->first();
     return view('frontend.help-center.help_center')->with(compact('helpCenter'));
    }

    public function termsCondition(){
    $termsCondition = Terms::where('status','1')->first();
     return view('frontend.terms-condition.termsCondition')->with(compact('termsCondition'));
    }

    public function blog(){
    $blogs = Blog::where('status','1')->get();
     return view('frontend.blog.blog')->with(compact('blogs'));
    }

    public function blogDetails($id){
    $blogs = Blog::where('id',$id)->first();
     return view('frontend.blog.blogDetails')->with(compact('blogs'));
    }


    public function page404()
    {
      return view('frontend.pages.page404');
    }
}
