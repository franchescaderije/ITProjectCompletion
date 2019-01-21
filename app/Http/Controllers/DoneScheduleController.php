<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Employee;
use App\Vaccine;
use App\Patient;
use App\Delivery;
use App\Service;
use App\Appointment;
use App\Payment;
use App\Vaccines;
use App\Archive;
use Carbon\Carbon;
use DB;


class DoneScheduleController extends Controller
{
    public function index(){
         $donepatients = DB::table('appointments')
         ->join('patients','patients.id','=','appointments.patients_id')
        ->leftjoin('payments','payments.appointments_id','=','appointments.id')
        ->select('payments.amount','patients.id', 'patients.patient_lname', 'patients.patient_fname', 'patients.patient_bday', 'patients.patient_gender','appointments.appointment_date','appointments.status','appointments.id as appointments_id')
        ->where([['appointments.appointment_date','<',Carbon::today()->toDateString()],['payments.amount','!=',null]])
        ->orWhere('status','=','Paid')
        ->get();

        
        return view('pages.doneschedule', compact ('donepatients'));
    }


}
