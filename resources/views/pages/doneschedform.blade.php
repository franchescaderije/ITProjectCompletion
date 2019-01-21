<thead>


    <tr role="row">
                  <th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1">Patient Name: 
                    <input type="text" class="form-control" id="patname" name="patient_fname" value="{{ isset($list->patient_fname) ? $list->patient_fname : ''}}" readonly> </th>
                  </tr>
                
                  <tr role="row">
                    <input type="hidden" class="form-control" value="{{ isset($list->id) ? $list->id: ''}}" name="patients_id" id="pat_id" readonly> </th>
                  </tr>
               
    <br>
            
                  <tr role="row">
              <th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1">Confirm:
                <select class="form-control" name="status" id="pat_stat" data-parsley-required="true"> 
                  <option value="Done"> Done</option> 
                
                </select> 
              </th>
            </tr>
                  
              </thead>
    
            
    
    
    
    
    
    
    
    
    
    