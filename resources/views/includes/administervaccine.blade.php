<thead>
 
      <tr  role="row">
      <th  class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1">
        <input style="display:none" type="number" name="vaccine_id" class="form-control" value="{{ isset($vaccine_types->id) ? $vaccine_types->id: ''}}" name="vaccine_lists_id" id="vac_id" readonly> </th>
      </tr>
      <tr  role="row">
        <th  class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1">
          <input style="display:none" type="number" name="patient_id" class="form-control" value="{{ isset($patient->id) ? $patient->id: ''}}" name="patient_id" id="patient_id" readonly> </th>
        </tr>

      <tr role="row">
        <th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1">Vaccine Type: 
          <input type="text" class="form-control" name="vaccine_type" value="{{ isset($vaccine_types->vaccine_type_name) ? $vaccine_types->vaccine_type_name: ''}}" name="vaccine_lists_name" id="vac_name" readonly> </th>
      </tr> 
   
      <tr role="row">
        <th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1">Date Administered: 
          <input type="date" class="form-control" name="date_administered" id="date_administered" max= Date();> </th>
      </tr><br>
     
      <tr role="row">
      <div class="form-group">
        <select name="lot_number" id="here" class="form-control">
         
        </select>
       </div>
      </tr>
      
  </thead>

  
    

  
 










