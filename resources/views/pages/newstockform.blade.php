<thead>

  <h4>New Stock Inventory</h4>  
  <tr role="row">
      <input type="hidden" class="form-control" value="{{ isset($vac->vaccine_types_id) ? $vac->vaccine_types_id: ''}}" name="vaccine_types_id" id="vac_type" readonly> 
    </tr>
  <tr role="row">
    <input type="hidden" class="form-control" value="{{ isset($vac->id) ? $vac->id: ''}}" name="vaccine_lists_id" id="vac_id" readonly> 
  </tr>

  <tr role="row">
    <th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1">Restock Date:</th>
    <input type="date" class="form-control" id="vacadjust" name="adjustment_date" value="{{ isset($vac->adjustment_date) ? $vac->adjustment_date : ''}}"> 
  </tr>
  <tr role="row">
    <th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1">Reason </th>
    <input type="text" class="form-control" id="vacadjust" name="adjustment_reason" value="New Stock" readonly> 
  </tr>

  <!-- <script>
    function add(){
    var n3 = parseInt(document.getElementById('qty3').value);
    var n4 = parseInt(document.getElementById('qty4').value);
    document.getElementById('result1').value = n3+n4;
    }
  </script> -->

  <tr role="row">
    <th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1">Current Quantity: </th>
    <input type="number" class="form-control" id="qty" name="quantity" value="{{ isset($vac->quantity) ? $vac->quantity: ''}}" disabled>
  </tr>

  <tr role="row">
    <th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1">Quantity:  </th>
    <input type="number" class="form-control" id="qty4" name="increase_amount"/>
  </tr>

  <!-- <tr role="row">
    <th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1">Result: </th>
    <input type="number" class="form-control" id="result1" name="sum" disabled/> 
  </tr> -->
  
</thead>