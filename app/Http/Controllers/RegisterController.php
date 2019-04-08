<?php

namespace App\Http\Controllers;

use App\Users;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;


class RegisterController extends Controller
{
    public function register(Request $request){
        $this->validate($request,[
            'Name'        => 'required|max:30',
            'Surname'     => 'required|max:30',
            'Sex'         => 'required',
            'Email'       => 'regex:/^[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,})$/i|
                                    required|email|unique:users,Email|',
            'Password'    => 'required',
            'PhoneNumber' => 'required|max:15',
            'Address'     => 'required|max:50',
            'PostalCode'  => 'required|regex:/^[0-9]{2}-[0-9]{3}$/',
            'Id_City'      => 'required',
        ]);

        $users = new Users;
        $users->name = $request->input('Name');
        $users->role_id = 2;
        $users->surname = $request->input('Surname');
        $users->sex = $request->input('Sex');
        $users->email = $request->input('Email');
        $users->password = bcrypt($request->input('Password'));
        $users->phonenumber = $request->input('PhoneNumber');
        $users->address = $request->input('Address');
        $users->postalcode = $request->input('PostalCode');
        $users->Id_City = $request->input('Id_City');

        $users->save();
        return redirect('/');
    }

    public static function getCities(){
        $cities = DB::table('cities')->pluck('Id_City','cityName');
        return view('register', ['cities' => $cities]);
    }
}
