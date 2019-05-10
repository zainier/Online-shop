<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateOrdersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
    	Schema::create('orders', function(Blueprint $table) {
      	    $table->increments('id');
      	    $table->integer('user_id');
     	    $table->text('address');
      	    $table->decimal('total', 10, 2);
      	    $table->integer('id_status')->unsigned();
     	    $table->timestamps();

     	    $table->foreign('status')->references('id_status')->on('order_status');
    	});
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('orders', function (Blueprint $table) {
            //
        });
    }
}
