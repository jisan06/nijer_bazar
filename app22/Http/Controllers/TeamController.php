<?php

namespace App\Http\Controllers;

use App\Team;
use Illuminate\Http\Request;

class TeamController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $teams = Team::all();
        return view('admin.teams.index')->with(compact('teams'));
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

        // $team = Team::create($request->all());
        $photo = \App\helperClass::_uploadImage($request->photo);
        $team = Team::create([
            'name'=>$request->name,
            'designation'=>$request->designation,
            'photo'=>$photo,
        ]);
        if($request->ajax())
            {
                return response()->json([
                    'team'=>$team
                ]);
            }

        return redirect(route('teams.index')) -> with( 'message', 'Added Successfully');
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Team  $team
     * @return \Illuminate\Http\Response
     */
    public function show(Team $team)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Team  $team
     * @return \Illuminate\Http\Response
     */
    public function edit(Team $team, Request $request)
    {
        $team = Team::find($request->team_id);
        if($request->ajax())
            {
                return response()->json([
                    'team'=>$team
                ]);
            }
        return view('admin.teams.edit')->with(compact('team'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Team  $team
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Team $team)
    {
        $this->validation($request);

        if($request->photo)
            $photo = \App\helperClass::_uploadImage($request->photo);
        else $photo = $team->photo;
        $team->update([
            'name'=>$request->name,
            'designation'=>$request->designation,
            'photo'=>$photo,
        ]);

        if($request->ajax())
            {
                return response()->json([
                    'team'=>$team
                ]);
            }
        
        return redirect(route('teams.index')) -> with( 'message', 'Updated Successfully');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Team  $team
     * @return \Illuminate\Http\Response
     */
    public function destroy(Team $team, Request $request)
    {
        if($request->ajax())
        {
            $team->delete();
            print_r(1);       
            return;
        }

        $team->delete();
        return redirect(route('teams.index')) -> with( 'message', 'Deleted Successfully');
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
            'designation' => 'required|string|max:100',
            'photo' => 'required|image|mimes:jpeg,png,jpg,gif,svg|max:2048',  
        ]);
    }
}
