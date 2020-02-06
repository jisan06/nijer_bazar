<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Package;

class PackageController extends Controller
{   public function index(){
        $packages = Package::all();
        
        return view('admin.package.packagelist')->with(compact('packages'));
    }

    public function addPackage(){
    	return view('admin.package.addpackage');
    }

    public function savePackage(Request $request){
    	$this->validation($request);

    	$package = Package::create( [
            'packageName' => $request->packageName,
            'packageStatus' => $request->packageStatus
                       
        ]);

    	return redirect(route('package.add'))->with('msg','Package Added Successfully');
    }

  

    public function changeStatus(Request $request)
    {
        if($request->ajax())
        {
            $data = Package::find($request->package_id);
            $data->packageStatus = $data->packageStatus ^ 1;
            $data->update();
            print_r(1);       
            return;
        }
        return redirect(route('package.list')) -> with( 'message', 'Wrong move!');
    }

    public function editPackage($id){
        $packages = Package::where('id',$id)->orderBy('id','desc')->first();
        return view('admin.package.editpackage')->with(compact('packages'));
    }

    public function updatePackage(Request $request){
        $this->validate(request(), [
            'packageName' => 'required',           
            'packageStatus' => 'required',                  
        ]);
        $packageId = $request->packageId;

        $package = Package::find($packageId);

        $package->update( [
            'packageName' => $request->packageName,
            'packageStatus' => $request->packageStatus            
        ]);

        return redirect(route('package.edit',$packageId))->with('msg','Package Updated Successfully');
    }

    public function destroy(Package $package, Request $request)
    {
        if($request->ajax())
        {   
            $package->delete();
            print_r(1);       
            return;
        }

        $package->delete();
        return redirect(route('packages.index')) -> with( 'message', 'Deleted Successfully');
    }




     public function validation(Request $request)
    {
        $this->validate(request(), [
            'packageName' => 'required',            
            'packageStatus' => 'required',                    
        ]);

    }
}
