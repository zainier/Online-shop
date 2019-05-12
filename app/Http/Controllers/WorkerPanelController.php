<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Session;

class WorkerPanelController extends Controller
{


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
        $status = OrderController::getStatus($id_order);
        $id_status = $status->id_status;

        if($id_status == OrderController::$ORDER_SHIPPED)
            return redirect()->back()->with('alert_error','The order has already been sent!');
        elseif($id_status == OrderController::$ORDER_CONFIRMED){
            //Update status and send email to Client
            OrderController::updateStatus($id_order,OrderController::$ORDER_SHIPPED);

            $data = (['id_order' => $id_order, 'status' => OrderController::getStatus($id_order)->type]);

            OrderController::ship($data);

        }
        else return redirect()->back()->with('alert_error','The order must be confirmed!');

        return redirect()->back()->with('alert','The order has been sent successfully!');
    }

    public function confirmOrder($id_order){
        $status = OrderController::getStatus($id_order);
        $id_status = $status->id_status;

        if(($id_status == OrderController::$ORDER_CONFIRMED))
            return redirect()->back()->with('alert_error','The order has already been confirmed!');
        elseif ($id_status == OrderController::$ORDER_SHIPPED)
            return redirect()->back()->with('alert_error','The order was sent!');
        elseif ($id_status == OrderController::$ORDER_CANCELED)
            return redirect()->back()->with('alert_error','The order was canceled!');
        else{
            //Update status and send email to Client
            OrderController::updateStatus($id_order,OrderController::$ORDER_CONFIRMED);

            $data = (['id_order' => $id_order, 'status' => OrderController::getStatus($id_order)->type]);

            OrderController::confirm($data);
        }

        return redirect()->back()->with('alert','The order has been confirmed successfully!');
    }

    public function cancelOrder($id_order){
        $status = OrderController::getStatus($id_order);
        $id_status = $status->id_status;

        if($id_status == OrderController::$ORDER_CANCELED)
            return redirect()->back()->with('alert_error','The order has already been canceled!');

        OrderController::updateStatus($id_order,OrderController::$ORDER_CANCELED);

        return redirect()->back()->with('alert','The order has been canceled successfully!');
    }
}

