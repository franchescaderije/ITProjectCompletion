<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateInventoryAdjustmentsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('inventory_adjustments', function (Blueprint $table) {
            $table->increments('id');
            $table->date('adjustment_date');
            $table->enum('adjustment_reason',['Damaged','Restock', 'Consumed']);
            $table->integer('amount_qty');
            $table->integer('vaccine_lists_id')->unsigned();
            $table->integer('vaccine_types_id')->unsigned();
            $table->timestamps();

        
            
         $table->foreign('vaccine_lists_id')
            ->references('id')->on('vaccine_lists')
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
        Schema::dropIfExists('inventory_adjustments');
    }
}