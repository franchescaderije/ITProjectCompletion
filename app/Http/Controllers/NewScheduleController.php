<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Patient;
use App\Service;
use App\Appointment;
use DB;
use MaddHatter\LaravelFullcalendar\Facades\Calendar;
use Carbon\Carbon;

class NewScheduleController extends Controller
{
    public function index(){
        $schedpatients = DB::table('appointments')
        ->join('patients','patients.id','=','appointments.patients_id')
        ->leftjoin('payments','payments.appointments_id','=','appointments.id')
        ->select('patients.id', 'patients.patient_lname', 'patients.patient_fname', 'patients.patient_bday', 'patients.patient_gender','appointments.appointment_date','appointments.id as appointments_id')
        ->Where([['status','=','Scheduled'],['payments.amount','=',null]])
        ->get();

        return view('pages.scheduledpatients', compact ('schedpatients'));
        
    }
    public function edit_sched(Request $request,$pid,$aid){
        //Validation   
     
        $this->validate($request,[   
            'appointment_date' => 'required|date_format:Y-m-d|after:now',      

        ]);

        $appointment_date= $request->input('appointment_date');
        $patientid = $request->input('patients_id');
     

        DB::table('appointments')->where([['id', '=', $aid],['patients_id','=',$pid]])
        ->update(
            [
                'appointment_date' => $appointment_date,
                'updated_at' => Carbon::now()->setTimezone('Asia/Singapore')            
            ]
        );

 session()->flash('resched','Schedule Changed!');
                    

 return back()->with('Success','Schedule Changed!');

    

}


    
}
