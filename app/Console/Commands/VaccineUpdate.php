<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use Carbon\Carbon;
use App\Vaccines;
use App\Inventory_Adjustments;

class VaccineUpdate extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'vaccine:update';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Checks Vaccine Expiration';

    /**
     * Create a new command instance.
     *
     * @return void
     */
    public function __construct()
    {
        parent::__construct();
    }

    /**
     * Execute the console command.
     *
     * @return mixed
     */
    public function handle()
    {
        $vaccine_list = Vaccines::where('vaccine_expiration_date', '<=', \Carbon\Carbon::now())->get();
        $adjustments= new Inventory_Adjustments;
            foreach($vaccine_list as $vaccine)
            {
                //Update each application as you want to
                $vaccine->status = "Expired";
                $vaccine->save();

            }
                $adjustments= new Inventory_Adjustments;
                $adjustments->adjustment_date = now();
                $adjustments->adjustment_reason = "Expired";
                $adjustments->amount_qty = $vaccine->quantity;
                $adjustments->vaccine_lists_id = $vaccine->id;
                $adjustments->vaccine_types_id = $vaccine->vaccine_types_id;
                $adjustments->created_at = $vaccine->vaccine_types_id;
                $adjustments->updated_at = null;
                $adjustments->save();
             
    }
}
