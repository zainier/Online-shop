<?php

namespace App\Http\Controllers;
use App\Http\Traits\CartTrait;
use App\Users;
use App\Cart;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;


class ProfileController extends Controller
{

    public function countProductsInCart() {
            if (Auth::check()) {

                $user_id = Auth::user()->id;
                $cart_count = Cart::where('user_id', '=', $user_id)->count();
                return $cart_count;
            }
        }

    public function edit()
    {
        return view('profile')->with('user', auth()->user());
    }
    public function editEmail(Request $request){

        $this->validate($request,[
            'Email'       => 'regex:/^[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,})$/i|
                                    required|email|unique:users,Email|',

        ]);

        $users = Auth::user();
        $users->email = $request->input('Email');

        $users->save();
        return back();
    }
    public function editPassword(Request $request){

        $this->validate($request,[
            'Password'    => 'required',
        ]);

        $users = Auth::user();
        $users->password = bcrypt($request->input('Password'));


        $users->save();
        return back();
    }
    public function editPhoneNumber(Request $request){

        $this->validate($request,[
            'Password'    => 'required',
            'PhoneNumber' => 'required|max:15',
        ]);

        $users = Auth::user();
        $users->phonenumber = $request->input('PhoneNumber');

        $users->save();
        return back();
    }
    public function editAddress(Request $request){

        $this->validate($request,[

            'Address'     => 'required|max:50',

        ]);

        $users = Auth::user();
        $users->address = $request->input('Address');


        $users->save();
        return back();
    }
    public function editPostalCode(Request $request){

        $this->validate($request,[
            'PostalCode'  => 'required|regex:/^[0-9]{2}-[0-9]{3}$/',
        ]);

        $users = Auth::user();
        $users->postalcode = $request->input('PostalCode');


        $users->save();
        return back();
    }
    public function editCity(Request $request){

        $this->validate($request,[

            'Id_City'      => 'required',
        ]);

        $users = Auth::user();

        $users->Id_City = $request->input('Id_City');

        $users->save();
        return back();
    }


    public static function getProfile(){

        if (Auth::check()) {
            $user_id = Auth::user()->id;
            $cart_count = Cart::where('user_id', '=', $user_id)->count();

        }

        $users = Auth::user();
        $cities = DB::table('cities')->pluck('Id_City','cityName');
        return view('profile', [
            'cities' => $cities,
            'user' => $users,
            'cart_count' => $cart_count,
        ]);
    }
}
