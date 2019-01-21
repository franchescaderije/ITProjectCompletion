<thead>


    <tr role="row">
                  <th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1">Patient Name: 
                    <input type="text" class="form-control" id="patname" name="patient_fname" value="{{ isset($list->patient_fname) ? $list->patient_fname : ''}} {{ isset($list->patient_lname) ? $list->patient_lname : ''}}" readonly> </th>
                  </tr>
                
                
               
    <br>

    <tr role="row">
        <th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1">Date Scheduled: 
        <input type="date" class="form-control" value="{{ isset($list->appointment_date) ? $list->appointment_date: ''}}" name="appointment_date" id="date" readonly> </th>
      </tr>

      <br>

      <br>

      <tr role="row">
          <th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1">Total Amount: 
          <input type="text" class="form-control" name="amount" min="0" step=".01" id="amnt" required> </th>
        </tr>              
    </thead>
    
            
    
    
    
    
    
    
    
    
    
    