<?php

namespace App\Http\Controllers;
use Session;
Use Redirect;
use Illuminate\Http\Request;
use App\Patient;
use App\Patient_records;
use App\Medical_records;
use App\Immunization;
use App\VaccineType;
use App\Diagnoses;
use App\Service;
use App\Payment;
use App\Service_use;
use App\Vaccine_used;
use App\Vaccine_list;
use Carbon\Carbon;
use DB;

class PatientController extends Controller
{
    /**
     * Display a listing of the resource.1
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $patients = Patient::all();
        return view('pages.patient-records')->with('patients', $patients);
        
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('pages.patient-records');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    { 
        if (Patient::where('patient_fname', '=', $request->input('fname'))
        ->where('patient_lname', '=', $request->input('lname'))
        ->where('patient_mname', '=', $request->input('mname'))
        ->where('patient_bday', '=', $request->input('dofbirth'))
        ->where('patient_gender', '=', $request->input('sex'))
        ->where('father_name', '=', $request->input('fathername'))
        ->where('mother_name', '=', $request->input('mothername'))
        ->count() > 0) 
        {
            Session::flash('message', "Record Already exist");
            return Redirect::back();
            
        }
        else
        {
        $patient = new Patient;
        $patient->patient_lname = $request->input('lname');
        $patient->patient_fname = $request->input('fname');
        $patient->patient_mname = $request->input('mname');
        $patient->patient_bday = $request->input('dofbirth');
        $patient->patient_address = $request->input('address');
        $patient->patient_gender = $request->input('sex');
        $patient->father_name = $request->input('fathername');
        $patient->mother_name = $request->input('mothername');
        $patient->father_occupation = $request->input('foccu');
        $patient->mother_occupation = $request->input('moccu');
        $patient->contact_number = $request->input('connum');
        $patient->type_of_delivery = $request->input('typeofdelivery');
        $patient->save();

        //$patientId = Patient::where('patient_fname', $request->input('firstname'))->first()->id;
        $patientId = Patient::all()->last()->id;

        $patient_record = new Patient_records;
        $patient_record->patient_id = $patientId;
        $patient_record->blood_type = $request->input('btype');
        $patient_record->birth_weight = $request->input('bw');
        $patient_record->birth_length = $request->input('bl');
        $patient_record->head_cire = $request->input('headcirc');
        $patient_record->chest_cire = $request->input('chestcirc');
        $patient_record->abdominal_cire = $request->input('abdocirc');
        $patient_record->save();
        
        return redirect('/appointment');
        }
    }
    
    public function vitalsign(Request $request)
    {
        $patientId = Patient::where('id',  $request->input('patId'))->first()->id;
        $medical_record = new Medical_records;
        $medical_record->patient_id = $patientId;
        $medical_record->date = $request->input('visitDate');
        $medical_record->height = $request->input('newHeight');
        $medical_record->weight = $request->input('NewWeight');
        $medical_record->pulse_rate = $request->input('pulseRate');
        $medical_record->respiration = $request->input('respiration');
        $medical_record->temperature = $request->input('temperature');
        $medical_record->save();
        return redirect('create/' . $patientId);
    }

    public function diagnoses(Request $request){
        $patientId = Patient::where('id', $request->input('patId'))->first()->id;
        $diagnose = new Diagnoses;
        $diagnose->diagnosisNotes = $request->input('diagnosis');
        $diagnose->allergies = $request->input('allergies');
        $diagnose->date_administered = $request->input('visitDate2');
        $diagnose->save();

        $latestRec = Medical_records::where('patient_id', $request->input('patId'))
        ->get()->last();
        $diagnose->medical_records_id = $latestRec->id;
        $diagnose->save();

        return redirect('create/' . $patientId);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */

    public function show($id)
    {
        $patient = Patient::find($id);

        $immpanel = DB::table('vaccine_types')
        ->join('immunizations','immunizations.vaccine_types_id', '=', 'vaccine_types.id')
        ->select('vaccine_types.id','vaccine_types.vaccine_type_name','vaccine_types.vaccine_dose',DB::raw('count(immunizations.vaccine_types_id)as shots'))
        ->where('immunizations.patients_id','=', $id)
        ->groupBy('vaccine_types.id')
        ->get();


        $vtl= DB::table('medical_records')
        ->select('date','height','weight','pulse_rate','temperature','respiration')
        ->whereDate('date','=',Carbon::today()->toDateString())
        ->where('patient_id','=', $id)
        ->whereNotIn('id', function($q){
            $q->select('medical_records_id')->from('diagnoses');})
        ->orderBy('created_at', 'ASC')
        ->get()->last();
       
/* 
        $medrecord=DB::table('diagnoses')
        ->join('medical_records','medical_records.patient_id','=','diagnoses.id')
        ->where('patient_id','=',$id)
        ->select('medical_records.date','medical_records.height','medical_records.weight','medical_records.respiration','medical_records.pulse_rate','medical_records.temperature','diagnoses.diagnosisNotes','diagnoses.allergies')
        ->orderBy('diagnoses.created_at','DESC')
        ->get(); */
        
        $medrecord=DB::table('medical_records')
        ->join('diagnoses','diagnoses.medical_records_id','=','medical_records.id')
        ->select('medical_records.date','medical_records.height','medical_records.weight','medical_records.respiration','medical_records.pulse_rate','medical_records.temperature','diagnoses.diagnosisNotes','diagnoses.allergies')
        ->where('patient_id','=',$id)
        ->orderBy('diagnoses.created_at','DESC')
        ->get();
        
        $patient = DB::table('patient_records')
        ->join('patients','patients.id','=','patient_records.patient_id')
        ->where('patient_id','=',$id)
        ->select('patients.id','patients.patient_mname','patients.id','patient_records.blood_type','patient_records.birth_weight',
         'patient_records.birth_length','patient_records.head_cire','patient_records.chest_cire','patient_records.abdominal_cire',
         'patients.patient_lname','patients.patient_fname','patients.patient_bday','patients.patient_address',
         'patients.patient_gender','patients.father_name','patients.mother_name','patients.mother_occupation','patients.father_occupation',
         'patients.contact_number','patients.type_of_delivery')
        ->get()
        ->first();

       $vaccine_types=DB::table('vaccine_types')
       ->select('id','vaccine_type_name')
       ->get();
    

        return view('pages.patient-profile', compact('patient', 'vaccine_types','vtl','immpanel','medrecord'));
    }


    public function vaccine_type(Request $request)
    {
        
        $patientVacId = Patient::where('id',  $request->input('patVacId'))->first()->id;
        $vaccineId = VaccineType::where('vaccine_type_name', $request->input('vaccinetype'))->first()->id;
        $numberOfShot = VaccineType::where('vaccine_type_name', $request->input('vaccinetype'))->first()->number_of_shots;
        $immunization_type = new immunization;
        $immunization_type->vaccine_type_id = $vaccineId;
        $immunization_type->save();
        $latest_immunization_record = DB::table('immunizations')->orderBy('id', 'DESC')->first()->id;
        $latest_medical_record = DB::table('medical_records')->where('patient_id','=',$patientVacId)->orderBy('id', 'DESC')->first()->id;
        $latest_medical_record_check = DB::table('medical_records')->where('patient_id','=',$patientVacId)->orderBy('id', 'DESC')->first()->immunization_id;
        $count = 0;
        while ($count != $numberOfShot) {
            $count++;
            $vaccine_shot = new Vaccine_used;
            $vaccine_shot->immunization_id = $latest_immunization_record;
            $vaccine_shot->save();
        }
        if($latest_medical_record_check == null) {
            $up_med_immunization = Medical_records::find($latest_medical_record);
            $up_med_immunization->immunization_id = $latest_immunization_record;
            $up_med_immunization->save();
            return redirect('create/' . $patientVacId);
        } else {
            
            return redirect('create/' . $patientVacId);
        }

        
        //return redirect('/create/{{$patientVacId}}');
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $patient = Patient::find($id);
        $patient = DB::table('patient_records')
        ->join('patients','patients.id','=','patient_records.patient_id')
        ->where('patient_id','=',$id)
        ->select('patients.patient_mname','patients.id','patient_records.blood_type','patient_records.birth_weight',
            'patient_records.birth_length','patient_records.head_cire','patient_records.chest_cire','patient_records.abdominal_cire',
            'patients.patient_lname','patients.patient_fname','patients.patient_bday','patients.patient_address',
            'patients.patient_gender','patients.father_name','patients.mother_name','patients.mother_occupation','patients.father_occupation',
            'patients.contact_number','patients.type_of_delivery')
        ->get()->first();

        return view('includes.editinfo', compact('patient'));
       // $patients = Patient::find($id);
       // return view('pages.edit')->with('patients', $patients);
    }
    public function loadModal($id)
    {
        $vac = DB::table('vaccine_lists')
        ->select('vaccine_lot_number')
        ->where([['vaccine_types_id','=',$id],['quantity','>=', 1],['status','!=',"Expired"]])
        ->get();
        
        return response()->json( $vac );
    }
    public function loadtable($vacid,$pid)
    {
        
        $data = DB::table('immunizations')
        ->select('vdate_administered','vaccine_lot_number')
        ->where([['vaccine_types_id','=',$vacid],['patients_id','=',$pid]])
        ->orderBy('created_at','ASC')
        ->get();
        
        return response()->json( $data );
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response 
     */
    public function update(Request $request, $id)
    {
        $patient = Patient::find($id);
        $patient->patient_lname = $request->input('lname');
        $patient->patient_mname = $request->input('mname');
        $patient->patient_fname = $request->input('fname');
        $patient->patient_bday = $request->input('dofbirth');
        $patient->patient_address = $request->input('address');
        $patient->patient_gender = $request->input('sex');
        $patient->father_name = $request->input('fathername');
        $patient->mother_name = $request->input('mothername');
        $patient->father_occupation = $request->input('foccu');
        $patient->mother_occupation = $request->input('moccu');
        $patient->contact_number = $request->input('connum');
        $patient->type_of_delivery = $request->input('typeofdelivery');
        $patient->save();

        //$patientId = Patient::where('patient_fname', $request->input('firstname'))->first()->id;
        $patientId = Patient::all()->last()->id;

        $patient_record = Patient_records::find($id);
        $patient_record->patient_id = $patientId;
        $patient_record->blood_type = $request->input('btype');
        $patient_record->birth_weight = $request->input('bw');
        $patient_record->birth_length = $request->input('bl');
        $patient_record->head_cire = $request->input('headcirc');
        $patient_record->chest_cire = $request->input('chestcirc');
        $patient_record->abdominal_cire = $request->input('abdocirc');
        $patient_record->save();
        return back();
    }
    

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
     
    }
}