<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Session;

class WorkerPanelController extends Controller
{
    public static $ORDER_CONFIRMED = 2;
    public static $ORDER_CANCELED = 5;
    public static $ORDER_SENT = 4;


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
            ->join('order_status','orders.id_status','=','order_status.id_status')
            ->select('orders.id','orders.created_at','name','surname','orders.address',
                'postalcode','cityName','phonenumber','email','total','type')
            ->orderBy('orders.id')
            ->get();

        return view('worker', ['orders' => $orders_data]);
    }

    public function sentOrder($id_order){
        $status = $this->getStatus($id_order);

        if($status == self::$ORDER_SENT)
            return redirect()->back()->with('alert_error','The order has already been sent!');
        elseif($status == self::$ORDER_CONFIRMED){
            DB::table('orders')
                ->where('id', $id_order)
                ->update(['id_status' => self::$ORDER_SENT]);
        }
        else return redirect()->back()->with('alert_error','The order must be confirmed!');

        return redirect()->back()->with('alert','The order has been sent successfully!');
    }

    public function confirmOrder($id_order){
        $status = $this->getStatus($id_order);

        if(($status == self::$ORDER_CONFIRMED))
            return redirect()->back()->with('alert_error','The order has already been confirmed!');
        elseif ($status == self::$ORDER_SENT)
            return redirect()->back()->with('alert_error','The order was sent');
        elseif ($status == self::$ORDER_CANCELED)
            return redirect()->back()->with('alert_error','The order was canceled!');
        else{
            DB::table('orders')
                ->where('id', $id_order)
                ->update(['id_status' => self::$ORDER_CONFIRMED]);
        }

        return redirect()->back()->with('alert','The order has been confirmed successfully!');
    }

    public function cancelOrder($id_order){
        $status = $this->getStatus($id_order);

        if($status == self::$ORDER_CANCELED)
            return redirect()->back()->with('alert_error','The order has already been canceled!');


        DB::table('orders')
            ->where('id', $id_order)
            ->update(['id_status' => self::$ORDER_CANCELED]);

        return redirect()->back()->with('alert','The order has been canceled successfully!');
    }

    private function getStatus($id_order){
        $status = DB::table('orders')->select('id_status')
            ->where('id', $id_order)
            ->value('id_status');

        return $status;
    }
}
