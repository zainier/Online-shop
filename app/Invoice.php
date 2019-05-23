<?php

namespace App;

use Dompdf\Dompdf;
use Illuminate\Support\Facades\View;

class Invoice
{
    protected $pdf;

    public function __construct() {
        $this->pdf = new Dompdf;
    }

    public function generate($data) {
        $this->pdf->loadHtml(
            View::make('invoice')
                ->with($data)
                ->render());
        $this->pdf->render();
        $this->pdf->stream('invoice.pdf', ['Attachment' => false]);
    }
}

