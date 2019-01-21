<thead>


    <tr role="row">
                  <th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1">Patient Name: 
                    <input type="text" class="form-control" id="patnames" name="patient_fname" value="{{ isset($patientRet->patient_fname) ? $patientRet->patient_fname : ''}}{{ isset($patientRet->patient_lname) ? $patientRet->patient_lname : ''}}" readonly> </th>
                  </tr>
                
                  <tr role="row">
                    <input type="text" class="form-control" value="{{ isset($list->id) ? $list->id: ''}}" name="patients_id" id="pat_ids" readonly> </th>
                  </tr>
               
    
                <tr role="row">
                  <th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1">Schedule Date: 
                    <input type="date" class="form-control" id="dates" name="appointment_date" value="{{ isset($list->appointment_date) ? $list->appointment_date : ''}}"> </th>
                  </tr>
                  
              </thead>
    
            
    
    
    
    
    
    
    
    
    
    