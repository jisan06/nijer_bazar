<?php

namespace App\Http\Controllers\Admin;

use App\Category;
use DB;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class CategoryController extends Controller
{
    
    public function index()
    {
       $categories = Category::all();

        return view('admin.categories.index')->with(compact('categories'));
    }

    public function changecategoryStatus(Request $request)
    {
        if($request->ajax())
        {
            $data = Category::find($request->category_id);
            $data->categoryStatus = $data->categoryStatus ^ 1;
            $data->update();
            print_r(1);       
            return;
        }
        return redirect(route('categories.index')) -> with( 'message', 'Wrong move!');
    }

    
    /*public function subCategories(Category $category, Request $request)
    {        
        if($request->ajax())
            {
                $category = Category::find($request->category_id);
                return response()->json([
                    'subCategories'=>$category->subCategories
                ]);
            }
        return view('admin.categories.edit')->with(compact('category'));
    }*/

    
     public function addcategory(){
        $categories = Category::all();
        return view('admin.categories.addcategory')->with(compact('categories'));
    }

     public function savecategory(Request $request){
        $this->validation($request);

        $this->validate(request(), [
            'categoryImage' => 'image|mimes:jpeg,png,jpg,gif,svg',       
            'categoryCoverImage' => 'image'       
        ]);

        if (isset($request->categoryImage)) {
            $categoryImage = \App\helperClass::_categoryImage($request->categoryImage);
        }
        if (isset($request->categoryCoverImage)) {
            $categoryCoverImage = \App\helperClass::_categoryCoverImage($request->categoryCoverImage);
        }

        $category = Category::create( [     
            'categoryName' => $request->categoryName,
            'categoryImage' => @$categoryImage,              
            'categoryCoverImage' => @$categoryCoverImage,              
            'categoryStatus' => $request->categoryStatus, 
            'parent' => $request->parent,
            'showInHomepage' => $request->showInHomepage,
            'metaTitle' => $request->metaTitle,            
            'metaKeyword' => $request->metaKeyword,            
            'metaDescription' => $request->metaDescription,            
            'orderBy' => $request->orderBy,           
        ]);

        // $product = Product::create($request->all());

        return redirect(route('categoryadd.page'))->with('msg','Category Added Successfully');     
    }

  
    public function editCategory($id){
        $parentCategory = Category::all();
        $categories = Category::where('id',$id)->first();
        return view('admin.categories.updatecategory')->with(compact('categories','parentCategory'));
    }


    public function updateCategory(Request $request){
        $this->validation($request);
        $categoryId = $request->categoryId;

        $category = Category::find($categoryId);

        if($request->categoryImage){
            @unlink($category->categoryImage);
            $categoryImage = \App\helperClass::_categoryImage($request->categoryImage);
            $category->update( [
                'categoryImage' => $categoryImage,          
            ]);
        }
        if($request->categoryCoverImage){
            @unlink($category->categoryCoverImage);
            $categoryCoverImage = \App\helperClass::_categoryCoverImage($request->categoryCoverImage);
            $category->update( [
                 'categoryCoverImage' => @$categoryCoverImage,               
            ]);
        }
        
        $category->update( [
            'categoryName' => $request->categoryName,              
            'categoryStatus' => $request->categoryStatus,
            'parent' => $request->parent,
            'showInHomepage' => $request->showInHomepage,
            'metaTitle' => $request->metaTitle,            
            'metaKeyword' => $request->metaKeyword,            
            'metaDescription' => $request->metaDescription,            
            'orderBy' => $request->orderBy,          
        ]);

        // $product = Product::create($request->all());

        return redirect(route('categories.index'))->with('msg','Category Updated Successfully');     
    }

    //Delete Category from update page

    public function deleteCategory($id){

        Category::where('id',$id)->delete();

        return redirect(route('categories.index')) -> with( 'msg', 'Deleted Successfully');
    }

    //View Category

     public function edit(Category $category, Request $request)
    {
        

        $category = Category::find($request->category_id);
        if($request->ajax())
            {
                return response()->json([
                    'category'=>$category
                ]);
            }
        return view('admin.categories.edit')->with(compact('category'));
    }

    public function destroy(Category $category, Request $request)
    {
        if($request->ajax())
        {
            $category->delete();
            print_r(1);       
            return;
        }

      
    }

    public function validation(Request $request)
    {
        $this->validate(request(), [
            'categoryName' => 'required|string'
            
        ]);
    }
}
