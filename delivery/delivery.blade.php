<!DOCTYPE html>
<html>
@include('layouts.head')
<body class="hold-transition skin-purple sidebar-mini">
    <div class="wrapper">
    @include('layouts.header')
    @include('layouts.navigation')
    
    <div class="content-wrapper">
        <section class="content">
            <div class="box box-solid box-primary">
                <div class="box-header">
                    <h3 class="box-title">Delivery</h3>
                </div>
                <div class="box-body">
                    <table id="deliveryTable" class="table table-bordered table-hover dataTable" role="grid" aria-describedby="example2_info">
                        <thead>
                            <tr>
                                    <th>Vaccine Type</th>
                                    <th>Lot Number</th>
                                    <th>PO Number</th>
                                    <th>Quantity</th>
                                    <th>Date Received</th>
                                    <th>OR Receipt</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <!-- ./box-body -->
                <div class="box-footer">

                </div>
            </div>
            <!-- ./box -->
        </section>
        <!-- ./content -->
    </div>
    <!-- ./content-wrapper -->
    </div>
    <!-- ./wrapper -->

@include('layouts.footer')

<script>
    $(document).ready(function () {
        $('#deliveryTable').DataTable();
    });
</script>

</body>
</html>