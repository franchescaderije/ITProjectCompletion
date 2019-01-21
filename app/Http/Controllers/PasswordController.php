<?php

namespace App\Http\Controllers;

use DB;
use Carbon;
use App\User;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Auth;
use Illuminate\Contracts\Auth\CanResetPassword;
use Illuminate\Foundation\Auth\Access\Authorizable;

class PasswordController extends Controller
{
    public function index()
    {
        $employee = User::all();
        return with('employee', $employee);
    }   
    
    // public function passwordreset(){
    //     return view('pages.passwordreset');
    // }

    public function passReset(Request $request){

        // if(strcmp($request->get('employ_id'), $request->get($employee->id)) == 0){
        //     //Current password and new password are same
        //     return redirect()->back()->with("error","New Password cannot be same as your current password. Please choose a different password.");
        // }

        if (!(Hash::check($request->get('employ_oldpass'), Auth::user()->password))) {
            // The passwords matches
            return redirect()->back()->with("error","Your current password does not matches with the password you provided. Please try again.");
        }

        $validatedData = $request->validate([
            'new-pass' => 'required|string|min:6|confirmed',
            'employ_id' => 'required|number|min:2'
        ]);

        // $employee->id = $user;
        $user = $request->get('employ_id');
        // $user = Auth::user();
        $user->password = bcrypt($request->get('new-pass'));
        $user->save();
        // $user->fill(['password' => Hash::make($request->get('new-pass')])->save();

        return back();
    }
}
