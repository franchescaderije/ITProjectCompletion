<thead>

  <h4>Adjust Inventory</h4>  
  
  <tr role="row">
      <input type="hidden" class="form-control" value="{{ isset($vac->vaccine_types_id) ? $vac->vaccine_types_id: ''}}" name="vaccine_types_id" id="vac_type" readonly> 
    </tr>
  <tr role="row">
    <input type="hidden" class="form-control" value="{{ isset($vac->id) ? $vac->id: ''}}" name="vaccine_lists_id" id="vac_id" readonly> 
  </tr>

  <tr role="row">
    <th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1">Adjustment Date: </th>
    <input type="date" class="form-control" id="vacadjust" name="adjustment_date" value="{{ isset($vac->adjustment_date) ? $vac->adjustment_date : ''}}"> 
  </tr>

  <tr role="row">
    <th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1">Adjustment Reason </th>
    <select class="form-control" name="adjustment_reason" id="adjustreason" data-parsley-required="true"> 
      <option value="0"> Choose Reason:</option> 
      <option value="Damaged"> Damaged</option> 
      <option value="Restock"> Restock</option>  
    </select> 
  </tr>
<!-- 
  <script>
    function decrease(){
    var n1 = parseInt(document.getElementById('qty').value);
    var n2 = parseInt(document.getElementById('qty2').value);
    document.getElementById('result').value = n1-n2;
    }
  </script> -->

  <tr role="row">
    <th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1">Current Quantity: </th>
    <input type="number" class="form-control" id="qty" name="quantity" value="{{ isset($vac->quantity) ? $vac->quantity: ''}}" disabled>
  </tr>

  <tr role="row">
    <th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1">Adjust Quantity: </th>
    <input type="number" class="form-control" id="qty2"  name="amount_qty"/> 
  </tr>


  <!-- <tr role="row">
    <th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1">Result: </th>
    <input type="number" class="form-control" id="result" name="result" disabled/> 
  </tr>       -->

</thead>