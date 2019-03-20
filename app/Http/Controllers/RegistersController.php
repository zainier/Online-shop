<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Clients;
use Illuminate\Support\Facades\Hash;



class RegistersController extends Controller
{
    public function register(Request $request){
        $this->validate($request,[
            'ClientName'        => 'required|max:30',
            'ClientSurname'     => 'required|max:30',
            'ClientSex'         => 'required',
            'ClientEmail'       => 'regex:/^[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,})$/i|
                                    required|email|unique:clients,ClientEmail|',
            'ClientPassword'    => 'required',
            'ClientPhoneNumber' => 'required|max:15',
            'ClientAddress'     => 'required|max:50',
            'ClientPostalCode'  => 'required|regex:/^[0-9]{2}-[0-9]{3}$/',
            'ClientCityID'      => 'required',
        ]);

        $clients = new Clients;
        $clients->ClientName = $request->input('ClientName');
        $clients->ClientSurname = $request->input('ClientSurname');
        $clients->ClientSex = $request->input('ClientSex');
        $clients->ClientEmail = $request->input('ClientEmail');

        $hash_pwd = Hash::make($request->input('ClientPassword'));
        $clients->ClientPassword = $hash_pwd;

        $clients->ClientPhoneNumber = $request->input('ClientPhoneNumber');
        $clients->ClientAddress = $request->input('ClientAddress');
        $clients->ClientPostalCode = $request->input('ClientPostalCode');
        $clients->ClientCityID = $request->input('ClientCityID');

        $clients->save();
        return redirect('/');
    }

    public static function getCities(){
        $cities = \DB::table('cities')->pluck('CityID','CityName');
        return view('register', ['cities' => $cities]);
    }
}
