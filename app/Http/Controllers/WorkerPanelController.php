<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Session;

class WorkerPanelController extends Controller
{
    public function checkLoginStatus(){
        if (is_null(Session::get('key'))) {
            return redirect('/');
        } elseif (Session::get('role') != 3) {
            return redirect('products');
        } else {
            return $this->loadOrders();
        }
    }

    public function loadOrders(){
        $orders_data = DB::table('orders')
            ->join('users', 'orders.user_id', '=', 'users.id')
            ->join('cities','users.Id_City','=','cities.Id_City')
            ->select('orders.id','orders.created_at','name','surname','orders.address',
                'postalcode','cityName','phonenumber','email','total','status')
            ->get();

        return view('worker', ['orders' => $orders_data]);
    }

    public function confirmOrder($id_order){
        DB::table('orders')
            ->where('id', $id_order)
            ->update(['status' => 2]);

        return redirect('worker');
    }

    public function cancelOrder($id_order){
        DB::table('orders')
            ->where('id', $id_order)
            ->update(['status' => 0]);

        return redirect('worker');
    }
}
