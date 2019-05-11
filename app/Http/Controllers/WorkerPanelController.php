<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Session;

class WorkerPanelController extends Controller
{
    public static $ORDER_CONFIRMED = 2;
    public static $ORDER_CANCELED = 5;
    public static $ORDER_SHIPPED = 4;

    private $orders_data;


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
        $this->orders_data = DB::table('orders')
            ->join('users', 'orders.user_id', '=', 'users.id')
            ->join('cities','users.Id_City','=','cities.Id_City')
            ->join('order_status','orders.id_status','=','order_status.id_status')
            ->select('orders.id','orders.created_at','name','surname','orders.address',
                'postalcode','cityName','phonenumber','email','total','type')
            ->orderBy('orders.id')
            ->get();

        return view('worker', ['orders' => $this->orders_data]);
    }

    public function shipOrder($id_order){
        $status = $this->getStatus($id_order);
        $id_status = $status->id_status;

        if($id_status == self::$ORDER_SHIPPED)
            return redirect()->back()->with('alert_error','The order has already been sent!');
        elseif($id_status == self::$ORDER_CONFIRMED){
            //Update status and send email to Client
            $this->updateStatus($id_order,self::$ORDER_SHIPPED);
            $this->sendEmail($id_order, $this->getStatus($id_order)->type);
        }
        else return redirect()->back()->with('alert_error','The order must be confirmed!');

        return redirect()->back()->with('alert','The order has been sent successfully!');
    }

    public function confirmOrder($id_order){
        $status = $this->getStatus($id_order);
        $id_status = $status->id_status;

        if(($id_status == self::$ORDER_CONFIRMED))
            return redirect()->back()->with('alert_error','The order has already been confirmed!');
        elseif ($id_status == self::$ORDER_SHIPPED)
            return redirect()->back()->with('alert_error','The order was sent!');
        elseif ($id_status == self::$ORDER_CANCELED)
            return redirect()->back()->with('alert_error','The order was canceled!');
        else
            $this->updateStatus($id_order,self::$ORDER_CONFIRMED);

        return redirect()->back()->with('alert','The order has been confirmed successfully!');
    }

    public function cancelOrder($id_order){
        $status = $this->getStatus($id_order);
        $id_status = $status->id_status;

        if($id_status == self::$ORDER_CANCELED)
            return redirect()->back()->with('alert_error','The order has already been canceled!');

        $this->updateStatus($id_order,self::$ORDER_CANCELED);

        return redirect()->back()->with('alert','The order has been canceled successfully!');
    }

    private function getStatus($id_order){
        $status = DB::table('orders')
            ->join('order_status', 'orders.id_status', '=', 'order_status.id_status')
            ->select('order_status.id_status', 'type')
            ->where('id', $id_order)
            ->get()->values();

        return $status[0];
    }

    private function updateStatus($id_order, $status){
        DB::table('orders')
            ->where('id', $id_order)
            ->update(['id_status' => $status]);
    }

    private function getOrderProducts($id_order){
        $products =  DB::table('order_product')
            ->join('products', 'products.Id_Product', '=', 'order_product.Id_Product')
            ->select('Name','amount','total')
            ->where('order_id', '=', $id_order)
            ->get();

        return $products;
    }

    private function sendEmail($id_order, $status){
        (new OrderController)->ship($id_order, $status, $this->getOrderProducts($id_order));
    }

}
