<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;
use Illuminate\Support\Facades\Schema;
use App\Category;
use App\SubCategory;
use App\Menu;
use App\Settings;
use App\Social;
use DB;
use View;
use Cart;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Bootstrap any application services.
     *
     * @return void
     */
    public function boot()
    {
        Schema::defaultStringLength(191);

        View::composer('frontend.*', function ($view) {

        $categories = \App\Category::where('categoryStatus', 1)->get();


        /*$menus = [];
        $subCat = [];
        foreach ($categories as $category) {            
            $menus[$category->name] = [];
            $subCat[$category->name] = [];
            $subCategories = DB::table('sub_categories')
            ->join('categories', 'categories.id', '=', 'sub_categories.category_id')
            ->where('sub_categories.category_id', $category->id)
            ->where('sub_categories.status', 1)
            ->select('sub_categories.*')
            ->get();
            foreach ($subCategories as $subCategory) { 
                $menus[$category->name][$category->id][$subCategory->name]['id'] = $subCategory->id;
                $subCat[$category->name][$subCategory->name]['id'] = $subCategory->id;
           
            }            
        }*/



        /*$view->with('menus', $menus);
        $view->with('males', $males);
        $view->with('females', $females);
        $view->with('fixedProducts', $fixedProducts);
        $view->with('featuredImges', $featuredImges);
        $view->with('newProducts', $newProducts);*/
    });

        View::composer('*',function($categories){
            $publishedCategories = Category::where('categoryStatus',1)->orderBy('orderBy','ASC')->orderBy('categoryName','ASC')->get();
            $categories->with('publishedCategories',$publishedCategories);
        });

        View::composer('*',function($menus){
            $activeMenu = Menu::where('menuStatus',1)->get();
            $menus->with('activeMenu',$activeMenu);
        });

        View::composer('*',function($siteInfo){
            $information = Settings::where('siteStatus',1)->first();
            $siteInfo->with('information',$information);
        });

        View::composer('*',function($socialInfo){
            $socialLink = Social::where('status',1)->first();
            $socialInfo->with('socialLink',$socialLink);
        });
    }

    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {
        //
    }
}
