<?php

namespace App\Http\Controllers;

use App\Career;
use Illuminate\Http\Request;

class CareerController extends Controller
{
    function __construct()
    {
        $this->middleware('auth:admin')->except('store');
    }
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $careers = Career::all();
        return view('admin.careers.index')->with(compact('careers'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $this->validation($request);
        $cv = \App\helperClass::_uploadImage($request->cv);
        Career::create([
            'name'=>$request->name,
            'cv'=>$cv,
        ]);
        // $message = Career::create($request->all());
        if($request->ajax())
            {
                echo true;
                return ;
            }
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Career  $career
     * @return \Illuminate\Http\Response
     */
    public function show(Career $career)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Career  $career
     * @return \Illuminate\Http\Response
     */
    public function edit(Career $career)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Career  $career
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Career $career)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Career  $career
     * @return \Illuminate\Http\Response
     */
    public function destroy(Career $career)
    {
        //
    }

    /**
     * Internal function for validation.
     *
     * @param  $request
     * @return \validation
     */
    public function validation(Request $request)
    {
        $this->validate(request(), [
            'name' => 'required|string|max:100',
            'cv' => 'required|mimes:pdf,doc,docx|max:2048',
        ]);
    }
}
