<?php

namespace App\Http\Controllers\Admin;
use App\Brand;
use DB;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class BrandController extends Controller
{
    public function index()
    {
       $brands = Brand::all();

        return view('admin.brands.index')->with(compact('brands'));
    }

    public function changebrandStatus(Request $request)
    {
        if($request->ajax())
        {
            $data = Brand::find($request->brand_id);
            $data->brandStatus = $data->brandStatus ^ 1;
            $data->update();
            print_r(1);       
            return;
        }
        return redirect(route('brands.index')) -> with( 'message', 'Wrong move!');
    }

    
    /*public function subbrands(Brand $brand, Request $request)
    {        
        if($request->ajax())
            {
                $brand = Brand::find($request->Brand_id);
                return response()->json([
                    'subbrands'=>$brand->subbrands
                ]);
            }
        return view('admin.brands.edit')->with(compact('Brand'));
    }*/

    
     public function addBrand(){
        $brands = Brand::all();
        return view('admin.brands.addbrand')->with(compact('brands'));
    }

     public function saveBrand(Request $request){
        $this->validation($request);

        $this->validate(request(), [
            'BrandLogo' => 'image|mimes:jpeg,png,jpg,gif,svg',       
            'brandCoverImage' => 'image'       
        ]);

        if (isset($request->brandLogo)) {
            $brandLogo = \App\helperClass::_brandLogo($request->brandLogo);
        }
        if (isset($request->brandCoverImage)) {
            $brandCoverImage = \App\helperClass::_brandCoverImage($request->brandCoverImage);
        }

        $brand = Brand::create( [     
            'brandName' => $request->brandName,
            'brandCoverImage' => @$brandCoverImage,
            'brandLogo' => @$brandLogo,                         
            'brandStatus' => $request->brandStatus, 
            'brandDescription' => $request->brandDescription,
            'brandProduct' => $request->brandProduct,
            'metaTitle' => $request->metaTitle,            
            'metaKeyword' => $request->metaKeyword,            
            'metaDescription' => $request->metaDescription,            
            'orderBy' => $request->orderBy,           
        ]);

        // $product = Product::create($request->all());

        return redirect(route('brand.add'))->with('msg','Brand Added Successfully');     
    }

  
    public function editBrand($id){
        $brandDescriptionBrand = Brand::all();
        $brands = Brand::where('id',$id)->first();
        return view('admin.brands.updateBrand')->with(compact('brands','brandDescriptionBrand'));
    }


    public function updateBrand(Request $request){
        $this->validation($request);
        $brandId = $request->brandId;

        $brand = Brand::find($brandId);

        if($request->brandLogo){
            @unlink($brand->brandLogo);
            $brandLogo = \App\helperClass::_brandLogo($request->brandLogo);
            $brand->update( [
                'brandLogo' => $brandLogo,          
            ]);
        }
        if($request->brandCoverImage){
            @unlink($brand->brandCoverImage);
            $brandCoverImage = \App\helperClass::_brandCoverImage($request->brandCoverImage);
            $brand->update( [
                 'brandCoverImage' => @$brandCoverImage,               
            ]);
        }
        
        $brand->update( [
            'brandName' => $request->brandName,              
            'brandStatus' => $request->brandStatus,
            'brandDescription' => $request->brandDescription,
            'brandProduct' => $request->brandProduct,
            'metaTitle' => $request->metaTitle,            
            'metaKeyword' => $request->metaKeyword,            
            'metaDescription' => $request->metaDescription,            
            'orderBy' => $request->orderBy,          
        ]);

        // $product = Product::create($request->all());

        return redirect(route('brands.index'))->with('msg','Brand Updated Successfully');     
    }

    //Delete Brand from update page

    public function deleteBrand($id){

        Brand::where('id',$id)->delete();

        return redirect(route('brands.index')) -> with( 'msg', 'Deleted Successfully');
    }

    //View Brand

     public function edit(Brand $brand, Request $request)
    {
        
        $brand = Brand::find($request->Brand_id);
        if($request->ajax())
            {
                return response()->json([
                    'Brand'=>$brand
                ]);
            }
        return view('admin.brands.edit')->with(compact('Brand'));
    }
    public function destroy(Brand $brand, Request $request)
    {
        if($request->ajax())
        {
            $brand->delete();
            print_r(1);       
            return;
        }

      
    }
    public function validation(Request $request)
    {
        $this->validate(request(), [
            'brandName' => 'required|string'
        ]);
    }
}
