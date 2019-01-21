

<!DOCTYPE html>
<html>

@include('layouts.head')

<body class="hold-transition skin-purple sidebar-mini">
  <div class="wrapper">


    @include('layouts.header')


    <!-- NAVIGATION -->
    @include('layouts.navigation')
    <!-- END -->
    
    <div class="content-wrapper">
      <section class="content">
        <div class="box box-solid box-primary">
          <div class="box-header">
            <h3 class="box-title">Inventory Adjustment Record</h3>
          </div>
          <!-- /.box-header -->
          <div class="box-body">
            <div id="example2_wrapper" class="dataTables_wrapper form-inline dt-bootstrap">
              
             <table id="printTable" class="table table-bordered table-hover dataTable" role="grid" aria-describedby="example2_info">
               
              <thead>
                <tr role="row">
                  <th>VACCINE NAME</th>
                  <th>LOT NUMBER</th>
                  <th>QUANTITY</th>
                  <th>ADJUSTMENT DATE</th>
                  <th>ADJUSTMENT REASON</th>
                </tr>
                
              </thead>
              <tbody>
                  @foreach($adjust as $adjustment)
                   
                  <tr id="orderdata">
                      <td>{{$adjustment->vaccine_name}}</td>
                      <td>{{$adjustment->vaccine_lot_number}}</td>
                      <td>{{$adjustment->amount_qty}}</td>
                      <td>{{$adjustment->adjustment_date}}</td>
                      <td>{{$adjustment->adjustment_reason}}</td>
                  </tr>
              
                  @endforeach
            </tbody>
            
          </table></div></div>
          <div class="box-footer">
              <button class="btn btn-primary pull-right">Print Report</button>   
            </div>
      </div>
        </div>
        <!-- /.box-body --> 
      </div>
    </section>

    @include('layouts.footer')

    <script>
        $(document).ready( function () {
          $('#printTable').DataTable();
        } );
        function printData()
          {
            var divToPrint=document.getElementById("printTable");
            newWin= window.open("");
            newWin.document.write(divToPrint.outerHTML);
            newWin.print();
            newWin.close();
          }
      
          $('button').on('click',function(){
          printData();
          })
      </script>
    </body>
  </html>
