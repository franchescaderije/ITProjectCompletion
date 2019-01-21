<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Patient;
use App\Service;
use App\Appointment;
use App\Immunization;
use DB;
use MaddHatter\LaravelFullcalendar\Facades\Calendar;
use Carbon\Carbon;

class AppointmentController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(){
        $patients = DB::table('patients')
        ->select('id','patient_lname','patient_fname','patient_mname','patient_bday','patient_gender')
        ->where(DB::raw("DATEDIFF(CURRENT_DATE , patient_bday)"), '<',6570)
        ->get();
        return view('pages.appointment')->with('patients', $patients);
    }

    // public function create(){
    //     $patient = DB::table('patients')
    //     ->select('id','patient_lname','patient_fname','patient_mname','patient_bday','patient_gender')
    //     ->where(DB::raw("DATEDIFF(CURRENT_DATE , patient_bday)"), '<',6570)
    //     ->get();
    //     return view ('pages.newschedule')->with('patient', $patient);
    // }
    
    // public function store(Request $request)
    // {
    //     $this->validate($request,[
    //         'appointment_date' => 'required|date_format:Y-m-d|after:now',            
 
    //     ]);
        
    //     $appointment_date= $request->input('appointment_date');
    //     $patientid = $request->input('patients_id');

    //     DB::table('appointments')->insert(
            
    //         [
    //             'appointment_date' => $appointment_date,
    //             'patients_id' => $patientid,
    //     ]);

    //     session()->flash('notif','Date Appointed');

    //     return redirect()->route('appointment.index');
        
    // }


    public function patient_list(Request $req){

          $this->validate($req,[
            'appointment_date' => 'required|date_format:Y-m-d|after:now',  
        ]);
        $appointment_date= $req->input('appointment_date');
        $patientid = $req->input('patients_id');

        if(Appointment::where([['patients_id','=',$patientid],['appointment_date','=', $appointment_date]])
        ->count() > 0)
        {
            session()->flash('message', "Patient is already scheduled the day!");
            return redirect()->route('appointment.index')->with(' Patient is already scheduled for the day!');
        }else{
    
            
        DB::table('appointments')->insert(
            
            [
                'appointment_date' => $appointment_date,
                'patients_id' => $patientid,
            ]);


        $patient_of_appoint = $req->input('patients_id');
        // return $patient_of_appoint;
        // dd($patient_of_appoint);

        $appointments = DB::table('appointments')
        ->where('patients_id',$patient_of_appoint)
        ->get(); 

        $patient = DB::table('patients')
        ->where('id', '=', $patient_of_appoint)
        ->get();

        
        session()->flash('notif','Patient Scheduled for Appointment!');

        return redirect()->route('appointment.index')->with(' Patient Scheduled for Appointment!');
        
    }


    }

    public function administervaccine(Request $req){
        //Validation   
      

        
        $immune = new Immunization;
        $immune->vaccine_types_id = $req->input("vaccine_id");
        $immune->patients_id = $req->input('patient_id');
        $immune->vdate_administered = $req->input('date_administered');
        $immune->vaccine_lot_number = $req->input('lot_number');
        $immune->created_at = Carbon::now()->setTimezone('Asia/Singapore');
        $immune->updated_at = Carbon::now()->setTimezone('Asia/Singapore');
        $immune->save();

        return back();
    }
}
