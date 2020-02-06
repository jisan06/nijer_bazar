<?php

namespace App\Http\Middleware;

use Closure;
use App\UserRoles;
use App\UserMenu;
use Auth;

class menuPermission
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle($request, Closure $next)
    {   $routeName = \Request::route()->getName();
        $userMenus = UserMenu::where('menuLink',$routeName)->first();
        $roleId =  Auth::user()->role;
        $userRoles = UserRoles::where('id',$roleId)->first();
        $rolePermission = explode(',', $userRoles->permission);
        if($userMenus != null){
            if (in_array($userMenus->id, @$rolePermission)) {
                return $next($request);
            }else{
                return redirect(route('admin.index'));
            }
        }else{
            return $next($request);
        }
    }
}
