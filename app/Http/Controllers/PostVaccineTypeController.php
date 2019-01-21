<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\PostVaccineType;
use App\Vaccines;
use App\VaccineType;
use DB;
use Carbon\Carbon;
use Validator;
use Session;

class PostVaccineTypeController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
       //COUNT VACCINES
        $vaccines = DB::table('vaccine_types')
        ->leftJoin('vaccine_lists','vaccine_lists.vaccine_types_id','=','vaccine_types.id')
        ->select('vaccine_types.id','vaccine_types.vaccine_type_name','vaccine_types.vaccine_type_description','vaccine_types.vaccine_dose',
            DB::raw('SUM(vaccine_lists.quantity) as vaccine_count'))
        ->groupBy('vaccine_types.id')
        ->get();
        
        return view('pages.vaccinetypes',compact('vaccines'));
        
    }

    public function returnList(Request $req){
        $id_of_vac = $req->input('id_vac');
        // return $id_of_vac;
        // dd($id_of_vac);

        $vaccine_lists = DB::table('vaccine_lists')
        ->where('vaccine_types_id',$id_of_vac)
        ->where('quantity','!=','0')
        ->get(); 

        $vaccine_type = DB::table('vaccine_types')
        ->where('id', '=', $id_of_vac)
        ->first();

        return view('pages.vaccinelist', compact('vaccine_lists', 'vaccine_type', 'id_of_vac'));
    }
    
    
    public function adjust_inventory(Request $req){

        $this->validate($req,[
            'adjustment_date' => 'required|date_format:Y-m-d|before:now',
            'adjustment_reason' => 'required',
            'amount_qty' => 'required|integer|min:1|max:1000000',
        ]);

            $adjustment_date = $req->input('adjustment_date');
            $adjustment_reason = $req->input('adjustment_reason');
            $total_amount = $req->input('amount_qty');
            $vaccineid = $req->input('vaccine_lists_id');
			$vactype = $req->input('vaccine_types_id');
            

        DB::table('inventory_adjustments')->insert(
            
            [
                'adjustment_date' => $adjustment_date,
                'adjustment_reason' => $adjustment_reason,
                'amount_qty' => $total_amount,
                'vaccine_lists_id' => $vaccineid,
				'vaccine_types_id' => $vactype,
        ]);
        
   session()->flash('updated','Updated!');
   
   return redirect()->route('vaccinetypes.index')->with('Success','Inventory Updated!');


    }

    public function add_vaccine(Request $req){
        //Validation   
        $this->validate($req,[
            'vaccine_name' => 'required',
            'quantity' => 'required|integer|min:1|max:1000000',
            'vaccine_price' => 'required',
            'vaccine_lot_number' => 'required|unique:vaccine_lists,vaccine_lot_number', 
            'vaccine_receive_date' => 'required|date_format:Y-m-d|before:now',
            'vaccine_expiration_date' => 'required|date_format:Y-m-d|after:now',
            'status' => 'required'

        ]);

        

        $vaccine_name = $req->input("vaccine_name");
        $vaccine_lot_number = $req->input('vaccine_lot_number');
        $quantity = $req->input('quantity');
        $vaccine_price = $req->input('vaccine_price');
        $vaccine_expiration_date = $req->input('vaccine_expiration_date');
        $vaccine_receive_date = $req->input('vaccine_receive_date'); //date received
        $status = $req->input('status');
        $id_of_vac = $req->input('vaccine_list_id');

        DB::table('vaccine_lists')->insert(
            [
                'vaccine_name' => $vaccine_name,
                'quantity' => $quantity,
                'vaccine_price'=>$vaccine_price,
                'vaccine_lot_number' => $vaccine_lot_number,
                'vaccine_expiration_date' => $vaccine_expiration_date,
                'vaccine_types_id' => $id_of_vac,
                'vaccine_receive_date' => $vaccine_receive_date,
                'status' => $status,
                'created_at' => Carbon::now()->setTimezone('Asia/Singapore'),
                'updated_at' => Carbon::now()->setTimezone('Asia/Singapore') 
            ]
        );

        //Redirect 
        $vaccine_lists = DB::table('vaccine_lists')
        ->where('vaccine_types_id',$id_of_vac)
        ->get(); 

        $vaccine_type = DB::table('vaccine_types')
        ->where('id', '=', $id_of_vac)
        ->first();

        // POPUP MESSAGES
        session()->flash('add','Successfully added');

        return view('pages.vaccinelist', compact('id_of_vac', 'vaccine_lists', 'vaccine_type'));
    }

    
    // Update Vaccines

    public function edit_vaccine(Request $request){
        //Validation   
     
        $this->validate($request,[   
     'vaccine_name' => 'required',
     'quantity' => 'required|integer|min:1|max:1000000',
     'vaccine_price' => 'required',   
     'vaccine_lot_number' => 'required', 
     'vaccine_receive_date' => 'required|date_format:Y-m-d|before:now',
     'vaccine_expiration_date' => 'required|date_format:Y-m-d|after:now',
     'status' => 'required'

 ]);
   
   $vaccine_lists = Vaccines::findOrFail($request->vaccines_id);
   
   $id_of_vac = $request->input('vaccines_id');
   $vac_name = $request->input('vaccine_name');
   $vac_lot_number = $request->input('vaccine_lot_number');
   $prc = $request->input('vaccine_price');
   $qty = $request->input('quantity');
   $vac_expiration_date = $request->input('vaccine_expiration_date');
   $vac_created = $request->input('vaccine_receive_date');
   $vac_status = $request->input('status');
   

   DB::table('vaccine_lists')->where('id', '=', $id_of_vac)
   ->update(
     [
         'vaccine_name' => $vac_name,
         'vaccine_lot_number' => $vac_lot_number,
         'vaccine_price'=>$prc,
         'quantity'=>$qty,
         'vaccine_expiration_date' => $vac_expiration_date,
         'vaccine_receive_date' => $vac_created,
         'status' => $vac_status,
         'updated_at' => Carbon::now()->setTimezone('Asia/Singapore')            
     ]
 );
   
   $vaccine_lists = DB::table('vaccine_lists')
   ->where('vaccine_types_id', $id_of_vac)
   ->get(); 

   $vaccine_type = DB::table('vaccine_types')
   ->where('id', '=', $id_of_vac)
   ->first();


   session()->flash('updated','Updated!');
   
   return redirect()->route('vaccinetypes.index')->with('Success','Vaccine Type Updated!');

   
 }


    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
     return view ('pages.newvaccinetype');
 }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $this->validate($request,[
            'vaccine_type_name' => 'required|unique:vaccine_types,vaccine_type_name',            
            'vaccine_dose' => 'required|integer|min:1|max:1000',                                        
            'vaccine_type_description' => 'required'
        ]);

        PostVaccineType::create($request->all());
        session()->flash('notif','Successfully added');

        return redirect()->route('vaccinetypes.index');
    }

    
    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $vaccine_types = VaccineType::find($id);

        return view ('pages.formtype')->with('vaccine', $vaccine_types);
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


        request()->validate([
            
            'vaccine_type_name' => 'required|unique:vaccine_types,vaccine_type_name,'.$id,     
            'vaccine_dose' => 'required|integer|min:1|max:1000',                                        
            'vaccine_type_description' => 'required'
        ]);
        $vaccine_types = VaccineType::find($id);
        $vaccine_types->vaccine_dose= $request->input('vaccine_dose');
        $vaccine_types->vaccine_type_name = $request->input('vaccine_type_name');
        $vaccine_types->vaccine_type_description = $request->input('vaccine_type_description');
        $vaccine_types->save(); 

        session()->flash('update','Updated!');

        return redirect()->route('vaccinetypes.index')->with('Success','Vaccine Type Updated!');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */   
    public function destroy($id)
    {
        //
    }
}
