<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreatePaymentsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('payments', function (Blueprint $table) {
            $table->increments('id');
            $table->float('amount');
            $table->integer('patients_id')->unsigned();
            $table->integer('appointments_id')->unsigned();
            $table->timestamps();

            $table->foreign('patients_id')
                    ->references('id')->on('patients')
                    ->onDelete('restrict')
                    ->onUpdate('cascade');

         

            $table->foreign('appointments_id')
                    ->references('id')->on('appointments')
                    ->onDelete('restrict')
                    ->onUpdate('cascade');
         
            
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('payments');
    }
}
