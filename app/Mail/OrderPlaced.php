<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;
use Illuminate\Contracts\Queue\ShouldQueue;

class OrderPlaced extends Mailable
{
    use Queueable, SerializesModels;

    public $subject = 'Order Placed';
    public $id_order;
    public $status;
    public $products;
    public $created_at;
    public $price;

    /**
     * Create a new message instance.
     *
     * @return void
     */
    public function __construct($data)
    {
        $this->id_order = $data['id_order'];
        $this->status = $data['status'];
        $this->products = $data['products'];
        $this->created_at = $data['created_at'];
        $this->price = $data['price'];
    }

    /**
     * Build the message.
     *
     * @return $this
     */
    public function build()
    {
        return $this->subject($this->subject)->markdown('emails.orders.placed');
    }
}
