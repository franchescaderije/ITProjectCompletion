<thead>


<tr role="row">
              <th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1">Patient Name: 
                <input type="text" class="form-control" id="patname" name="patient_fname" value="{{ isset($patientRet->patient_fname) ? $patientRet->patient_fname : ''}}{{ isset($patientRet->patient_lname) ? $patientRet->patient_lname : ''}}" readonly> </th>
              </tr>

              <tr role="row">
                  <input type="hidden" class="form-control" id="status" name="status" value="{{ isset($list->status) ? $list->status : 'scheduled'}}" readonly> </th>
                </tr>
            
              <tr role="row">
                <input type="hidden" class="form-control" value="{{ isset($patientRet->id) ? $patientRet->id: ''}}" name="patients_id" id="pat_id" readonly> </th>
              </tr>
           

            <tr role="row">
              <th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1">Schedule Date: 
                <input type="date" class="form-control" id="date" name="appointment_date" value="{{ isset($patientRet->appointment_date) ? $patientRet->appointment_date : ''}}"> </th>
              </tr>
              
          </thead>

        









