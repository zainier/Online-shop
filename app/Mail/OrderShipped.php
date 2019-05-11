<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;
use Illuminate\Contracts\Queue\ShouldQueue;

class OrderShipped extends Mailable
{
    use Queueable, SerializesModels;

    public $id_order;
    public $status;
    public $products;

    /**
     * Create a new message instance.
     *
     * @return void
     */
    public function __construct($orderId, $status, $products)
    {
        $this->id_order = $orderId;
        $this->status = $status;
        $this->products = $products;
    }

    /**
     * Build the message.
     *
     * @return $this
     */
    public function build()
    {
        return $this->markdown('emails.orders.shipped');
    }
}
