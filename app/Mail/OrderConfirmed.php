<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;
use Illuminate\Contracts\Queue\ShouldQueue;

class OrderConfirmed extends Mailable
{
    use Queueable, SerializesModels;

    public $subject = 'Order Confirmed';
    public $id_order;
    public $status;

    /**
     * Create a new message instance.
     *
     * @return void
     */
    public function __construct($data)
    {
        $this->id_order = $data['id_order'];
        $this->status = $data['status'];
    }

    /**
     * Build the message.
     *
     * @return $this
     */
    public function build()
    {
        return $this->subject($this->subject)->markdown('emails.orders.confirmed');
    }
}