<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Product;
use App\FlashSell;
use App\Order;
use App\ProductSections;
use App\Category;
use App\ProductImage;
use App\Slider;
use App\CustomerGroup;
use App\CustomerGroupSections;
use URL;
use DB;
use Session;

class ProductController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $title = "Products";

        $products = Product::select('products.*','categories.id as catId','categories.categoryName as catName',DB::raw('(select images from product_images where product_images.productId = products.id order by id asc limit 1) as images'))
            ->leftjoin('categories','categories.id','=','products.category_id')
            ->leftjoin('product_images','product_images.productId','=','products.id')
            ->orderBy('categories.categoryName','asc')
            ->orderBy('products.name','asc')
            ->get();

        return view('admin.product.index')->with(compact('title','products'));
    }

    public function runningProduct(){
        $title = "Running Product";
        $products = Product::where('status',1)->get();
        return view('admin.product.runningProduct')->with(compact('title','products'));
    }

    public function addproduct(){
        $title = "Add product";

        $tab1 = "Basic Information";
        $tab1Link = "productSetupBasicInfo.save";

        $tab2 = "Advance Information";
        $tab2Link = "productSetupAdvanceInfo.update";

        $tab3 = "Image";
        $tab3Link = "productSetupImage.save";

        $tab4 = "SEO Information";
        $tab4Link = "productSetupSeoInfo.update";

        $buttonName = "Save";
        $productId = "";

        $categories = Category::where('categoryStatus',1)
            ->orderBy('categoryName','asc')
            ->get();

        $relatedProducts = Product::where('status',1)
            ->where('id','!=',@$_GET['productId'])
            ->orderBy('name','asc')
            ->get();

        $customer_groups = CustomerGroup::where('groupStatus',1)->get();

        return view('admin.product.add')->with(compact('title','tab1','tab1Link','tab2','tab2Link','tab3','tab3Link','tab4','tab4Link','buttonName','categories','relatedProducts','customer_groups','productId'));
    }

     public function editProduct($productId)
    {
        $title = "Edit product";

        $tab1 = "Basic Information";
        $tab1Link = "productSetupBasicInfo.update";

        $tab2 = "Advance Information";
        $tab2Link = "productSetupAdvanceInfo.update";

        $tab3 = "Image";
        $tab3Link = "productSetupImage.save";

        $tab4 = "SEO Information";
        $tab4Link = "productSetupSeoInfo.update";

        $buttonName = "Update";

         $categories = Category::where('categoryStatus',1)
            ->orderBy('categoryName','asc')
            ->get();

        $relatedProducts = Product::where('status',1)
            ->where('id','!=',$productId)
            ->orderBy('name','asc')
            ->get();

        $customer_groups = CustomerGroup::where('groupStatus',1)->get();
        $customerGroup = CustomerGroupSections::where('productId',$productId)->get();

        $product = Product::where('id',$productId)->first();
        $productAdvance = ProductSections::where('productId',$productId)->first();
        $productImages = ProductImage::where('productId',$productId)->get();

        return view('admin.product.edit')->with(compact('title','tab1','tab1Link','tab2','tab2Link','tab3','tab3Link','tab4','tab4Link','buttonName','categories','relatedProducts','product','productAdvance','productImages','customer_groups','customerGroup','productId'));
    }
    
    public function saveProduct(Request $request){
        $this->validate(request(), [
            'category_id' => 'required',
            'name' => 'required|string',
            'deal_code' => 'required|unique:products',                              
            'price' => 'required',            
            'discount' => 'nullable|numeric',         
            'status' => 'required', 

        ]);
        if($request->category_id){
            $category_id = implode(',', $request->category_id);
        }
       

        $allCategory = Category::where('id',@$category_id)->first();
           if ($allCategory->parent) {
               $root_category = @$allCategory->parent;
           }else{
                $root_category =  @$category_id;
           }

        $product = Product::create( [
            'category_id' => @$category_id,
            'root_category' => @$root_category,
            'name' => $request->name,
            'deal_code' => $request->deal_code,
            'price' => $request->price,
            'discount' => $request->discount,
            'description1' => $request->description1,
            'description2' => $request->description2,                     
            'orderBy' => $request->orderBy,          
            'status' => $request->status,
            'youtubeLink' => $request->youtubeLink,  
            'tag' => $request->tag                            
        ]);

        $productId = $product->id;
        if($productId){
          $productAdvance = ProductSections::create([
            'productId' => $productId
        ]);  
        }
        

        return redirect(route('productadd.page',['productId'=>$productId]))->with('msg','Product Added Successfully')->withInput();     
    }

    public function updateProduct(Request $request){
        $this->validate(request(), [
            'category_id' => 'required',
            'name' => 'required|string',
            'deal_code' => 'required',                              
            'price' => 'required',            
            'discount' => 'nullable|numeric',         
            'status' => 'required', 

        ]);
      
        $productId = $request->productId;

        $product = Product::find($productId);
        if($request->category_id){
           $category_id = implode(',', @$request->category_id); 
        }
        
       
       $allCategory = Category::where('id',@$category_id)->first();
       if ($allCategory->parent) {
           $root_category = $allCategory->parent;
       }else{
            $root_category =  @$category_id;
       }

        $product->update( [
            'category_id' => @$category_id,
            'root_category' => $root_category,
            'name' => $request->name,
            'deal_code' => $request->deal_code,
            'price' => $request->price,
            'discount' => $request->discount,
            'description1' => $request->description1,
            'description2' => $request->description2,                     
            'orderBy' => $request->orderBy,          
            'status' => $request->status,
            'youtubeLink' => $request->youtubeLink,  
            'tag' => $request->tag                            
        ]);

        $productId = $product->id;

        return redirect(route('product.edit',['productId'=>$productId]))->with('msg','Product Basic Information Updated Successfully')->withInput();  
    }

    public function updateProductAdvanceInfo(Request $request)
    {
        $msg = "";
        $type = $request->type;

        $productId = $request->productId;
        $productAdvance = ProductSections::where('productId',$productId)->first();

        if($request->related_product){
            $related_product = implode(',', $request->related_product);
        }

        $product = Product::find($productId);
            if ($request->sections) {
                $productSection = implode(',', $request->sections);
                $product->update( [
                    'productSection' => @$productSection,                                                                  
                ]);
            }
        if(@$productAdvance != ''){
            $productAdvance->update( [
                'related_product' => @$related_product,
                'pre_orderDuration' => $request->pre_orderDuration,
                'free_shipping' => $request->free_shipping,
                'hotDiscount' => $request->hotDiscount,
                'hotDate' => $request->hotDate,
                'specialDiscount' => $request->specialDiscount,
                'specialDate' => $request->specialDate           
            ]);
        }else{
           $productAdvance = ProductSections::create([
                'related_product' => @$related_product,
                'pre_orderDuration' => $request->pre_orderDuration,
                'free_shipping' => $request->free_shipping,
                'hotDiscount' => $request->hotDiscount,
                'hotDate' => $request->hotDate,
                'specialDiscount' => $request->specialDiscount,
                'specialDate' => $request->specialDate           
            ]); 
        }

        $countGroup = count($request->customerGroupPrice);
        DB::table('customer_group_sections')->where('productId', $productId)->delete();
            if($request->customerGroupPrice){
                $postData = [];
                for ($i=0; $i <$countGroup ; $i++) { 
                    $postData[] = [
                        'productId' => $productId,
                        'customerGroupId' => $request->customerGroupId[$i], 
                        'customerGroupPrice' => $request->customerGroupPrice[$i]
                    ];
                }
                
                CustomerGroupSections::insert($postData);
            }

        if ($type == "add")
        {
            $msg = "Product Advance Information Added Successfully";
            return redirect(route('productadd.page',['productId'=>$productId,'productAdvance'=>$productAdvance]))->with('msg',$msg)->withInput(); 
        }
        
        if ($type == "update")
        {
            $msg = "Product Advance Information Updated Successfully";
            return redirect(route('product.edit',['productId'=>$productId,'productAdvance'=>$productAdvance]))->with('msg',$msg)->withInput();
        }       
    }

    public function updateProductSeoInfo(Request $request)
    {
        $msg = "";
        $type = $request->type;
        $productId = $request->productId;
        $productSeo = Product::find($productId);

        $productSeo->update( [
            'metaTitle' => $request->metaTitle,
            'metaKeyword' => $request->metaKeyword,
            'metaDescription' => $request->metaDescription,          
        ]);

        if ($type == "add")
        {
            $msg = "Product SEO Information Added Successfully";
            return redirect(route('productadd.page',['productId'=>$productId,'productSeo'=>$productSeo]))->with('msg',$msg)->withInput();
        }
        
        if ($type == "update")
        {
            $msg = "Product SEO Information Updated Successfully";
            return redirect(route('product.edit',['productId'=>$productId,'productSeo'=>$productSeo]))->with('msg',$msg)->withInput();
        }
        
    }

    public function saveProductImage(Request $request)
    {
        $productId = $request->productId;
        $product = Product::where('id',$productId)->first();
        $productSection = explode(',', $product->productSection);
        /*if(in_array('1', $productSection) OR in_array('2', $productSection)){
            $width = '245';
            $height = '245';
        }elseif(in_array('3', $productSection) OR $product->specialDiscount != ''){
            $width = '100';
            $height = '118';
        }elseif(in_array('4', $productSection)){
            $width = '200';
            $height = '400';
        }elseif($product->hotDiscount != ''){
            $width = '318';
            $height = '380';
        }*/

        $width = '800';
        $height = '800';
        if (isset($request->productImage))
        {
            $productImage = \App\helperClass::UploadImage($request->productImage,'product_images','public/uploads/product_image/',@$width,@$height);
        }
        else
        {
            $productImage = "";
        }

        $image = ProductImage::create( [
            'productId' => $productId,
            'images' => $productImage,         
        ]);

        $productImages = ProductImage::where('productId',$productId)->get();
        $product_image = "";

        foreach($productImages as $productImage){
            $product_image .=
            '
            <div class="card card_image_'.$productImage->id.'" style="width: 200px; display: inline-block;" align="center">
                <img class="card-img-top" src="'.url('/').'/'.$productImage->images.'" alt="Card image" style="width:150px; height: 150px;">
                <div class="card-body">
                    <a href="javascript:void(0)" data-id="'.$productImage->id.'" data-token="'.csrf_token().'" class="btn btn-outline-danger" onclick="removeImage('.$productImage->id.')" style="width: 100%;">Delete</a>
                </div>
            </div>
            ';
        }

        if($request->ajax())
        {
            return response()->json([
                'images'=>$product_image
            ]);
        }
        
    }


     public function deleteProductImage(Request $request)
    {
        $image = ProductImage::find($request->imageId);

        if($image->delete())
        {
            @unlink($image->images);
            return response()->json(true);
        }
        else
        {
            return response()->json(false);
        }
    }

      public function destroy(Request $request)
    {   $imageSction = ProductImage::where('productId',$request->product_id)->get();
        if($request->product_id)
        {   foreach ($imageSction as $singleImage) {
           @unlink($singleImage->images);
        }
        ProductImage::where('productId',$request->product_id)->delete();
        ProductSections::where('productId',$request->product_id)->delete();
        Product::where('id',$request->product_id)->delete();
        CustomerGroupSections::where('productId',$request->product_id)->delete();
        }
    }

    public function changeStatus(Request $request)
    {
        if($request->ajax())
        {   
            $data = Product::find($request->product_id);
            $data->status = $data->status ^ 1;
            $data->update();
            print_r(1);       
            
            $sliders = Slider::where('productId',$request->product_id)->first();
            $slider = Slider::find($sliders->id);
            $slider->status = $slider->status ^ 1;
            $slider->update(); 
            print_r(2);
        }

    }
    public function deleteProduct($id){
        Product::where('id',$id)->delete();
        return redirect(route('products.index'))->with('msg','Product Deleted Successfully');
    }

     public function FlashSell(){
        $title = "Flash Sell";
        $productsAll = Product::all();
        $flashProducts = FlashSell::where('id',1)->first();
        return view('admin.products.flashSell')->with(compact('productsAll','flashProducts','title'));
    }

    public function FlashSellUpdate(Request $request){
        if ($request->flashProduct) {
                $allproduct = implode(',', $request->flashProduct);
                $flashSell = FlashSell::find(1);
                 $flashSell->update( [
                    'flashPrice' => @$request->flashPrice,
                    'flashDate' => @$request->flashDate,
                    'flashProduct' => @$allproduct,
                 ]);
                }
        return redirect(route('flashSell'))->with('msg','Flash Product Updated Successfully');
    }

     public function ProductQuickUpdateList()
    {
        $title = "Quick Product Update";
        $categories = Category::where('categoryStatus',1)
            ->orderBy('categoryName','asc')
            ->get();
        $products = Product::select('products.*','categories.id as catId','categories.categoryName as catName',DB::raw('(select images from product_images where product_images.productId = products.id order by id asc limit 1) as images'))
            ->leftjoin('categories','categories.id','=','products.category_id')
            ->leftjoin('product_images','product_images.productId','=','products.id')
            ->orderBy('categories.categoryName','asc')
            ->orderBy('products.name','asc')
            ->where('products.status','1')
            ->get();

        return view('admin.product.product_quick_update_list')->with(compact('title','products','categories'));
    }

    public function ProductQuickUpdate(Request $request){
        $this->validate(request(), [
            'category_id' => 'required',
            'name' => 'required|string',
            'deal_code' => 'required',                              
            'price' => 'required',            
            'discount' => 'nullable|numeric',         
        ]);
      
        $productId = $request->productId;
        $product = Product::find($productId);
        /*if($request->category_id){
           $category_id = implode(',', @$request->category_id); 
        }*/
        
       $allCategory = Category::where('id',@$request->category_id)->first();
       if ($allCategory->parent) {
           $root_category = $allCategory->parent;
       }else{
            $root_category =  @$category_id;
       }

        $product->update( [
            'root_category' => @$root_category,
            'category_id' => @$request->category_id,
            'name' => $request->name,
            'deal_code' => $request->deal_code,
            'price' => $request->price,
            'discount' => $request->discount,                    
            'orderBy' => $request->orderBy,                             
        ]);
    }
     
}