<!DOCTYPE html>
<html>
<head>
  @include('layouts.head')
</head>
@include('layouts.header')
@include('layouts.navigation')
<body class="hold-transition skin-purple sidebar-mini">
  <div class="wrapper">
    <div class="content-wrapper">
      <section class="content">
        <div class="box">
        <div class="box-header">
        <h1>Inventory Report</h1>
          <div class="box-body">
              <div class="row"> 
                  
                      <table border="1" id="printTable" class="table table-bordered table-hover dataTable" role="grid" aria-describedby="example2_info">
                        <thead>
                          <tr role="row" class="odd">
                            <th>Vaccine Name</th>
                            <th>Available Quantity</th>
                                
                          </tr>
                        </thead>             
                        <!--./Fetch data table-start-->
                        <tbody>
                          <form action="vaccinetypes" method="POST">
                            {{csrf_field()}}

                            @foreach($vaccines as $vaccine)
          
                            <tr>
                              <!--.Vaccine Types-->
                              <td><a href="/rendered_vaccines/{{$vaccine->vaccine_types_id}}">{{ $vaccine->vaccine_type_name }}</td>
                              
                            
                              <td class="sorting_1" >
                              {{ $vaccine->quantity }}
                            </td>
                          </tr>
                          @endforeach
                  
                          
                        </form>
                      </tbody>
                    </table>
                </div>
        </div>       
        <div class="box-footer">
          <button class="btn btn-primary pull-right">Print</button>   
      </div>
      </div>
      <!--./box-->
    </section>
    <!--./content-->
  </div>
  <!--./content-wrapper-->
</div>
<!--./wrapper-->
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
