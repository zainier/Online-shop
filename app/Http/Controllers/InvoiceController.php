<?php

namespace App\Http\Controllers;

use App\Order;
use Illuminate\Http\Request;
use phpDocumentor\Reflection\Types\Array_;

class InvoiceController extends Controller
{
    public function invoice($id_order) {
        $pdf = new \App\Invoice;
        $pdf->generate($this->set_data($id_order));
    }

    private function set_data($id_order){
        $products = OrderController::getOrderProducts($id_order);
        $data = Order
            ::join('users', 'orders.user_id', '=', 'users.id')
            ->join('cities','users.Id_City','=','cities.Id_City')
            ->select('name','surname','orders.address', 'postalcode','cityName','email','total','orders.created_at')
            ->where('orders.id','=',$id_order)
            ->getQuery()
            ->first();

        return (['products' => $products,
                'identifier' => $id_order,
                'name' => $data->name,
                'surname' => $data->surname,
                'created_at' => $data->created_at,
                'address' => $data->address,
                'postalcode' =>$data->postalcode,
                'city' => $data->cityName,
                'price' => $data->total]);
    }
}
