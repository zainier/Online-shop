<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateUsersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('users', function (Blueprint $table) {
            $table->bigIncrements('Id_User');
            $table->string('Name', 30);
            $table->string('Surname', 30);
            $table->string('Sex', 1)->default(null);
            $table->string('Address', 50)->default(null);
            $table->string('PostalCode', 10)->default(null);
            $table->integer('Id_City')->default(null);
            $table->string('PhoneNumber', 30)->default(null);
            $table->string('Email', 50);
            $table->string('Password', 100);

            $table->foreign('Id_City')->references('Id_City')->on('cities');
            $table->unique('Email');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('users');
    }
}
