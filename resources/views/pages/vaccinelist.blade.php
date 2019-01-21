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
						<h1>{{$vaccine_type->vaccine_type_name}}</h1>

						@if(count($errors)>0)
            <ul>
              @foreach($errors->all() as $error)

              <div class="row">
                <div class="col-md-11">
                <div class="alert alert-danger">
                  <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                  <strong>{{$error}}</strong>
                </div>
              </div>
              </div>              
              @endforeach
            </ul>
            @endif
            <!-- Alert Message Added Vaccines -->
            <div class="container">
              @if(session()->has('notif'))
              <div class="row">
                <div class="col-md-11">
                <div class="alert alert-success">
                  <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                  <strong>Vaccine Type</strong> {{ session()->get('notif') }}
                </div>
              </div>
              </div>
              @endif
            </div>

            <!-- Alert Message Updated Vaccine type-->
            <div class="container">
              @if(session()->has('update'))
              <div class="row">
                <div class="col-md-11">
                <div class="alert alert-info">
                  <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                  <strong>Vaccine Type</strong> {{ session()->get('update') }}
                </div>
              </div>
              </div>
              @endif
            </div>

            <!-- Alert Message Updated Vaccines -->
            <div class="container">
              @if(session()->has('updated'))
              <div class="row">
		       <div class="col-md-11">
                <div class="alert alert-info">
                  <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                  <strong>Vaccine</strong> {{ session()->get('updated') }}
				</div>
			</div>
              </div>
              @endif
            </div>
          </div>
					<!-- /.box-header -->
					<div class="box-body">
						<table id="userTable" class="table table-bordered table-hover dataTable" role="grid" aria-describedby="example2_info">
							<thead>
								<tr role="row">
									<th class="sorting_asc" tabindex="0" aria-controls="example2" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Rendering engine: activate to sort column descending">Vaccine Name</th>
									<th class="sorting_asc" tabindex="0" aria-controls="example2" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Platform(s): activate to sort column ascending">Lot No.</th>
									<th class="sorting_asc" tabindex="0" aria-controls="example2" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Rendering engine: activate to sort column descending">Expiration Date</th>
									<th class="sorting_asc" tabindex="0" aria-controls="example2" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Platform(s): activate to sort column ascending">Date Received</th>
									<th class="sorting_asc" tabindex="0" aria-controls="example2" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Platform(s): activate to sort column ascending">Quantity</th>
									<th class="sorting_asc" tabindex="0" aria-controls="example2" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Platform(s): activate to sort column ascending">Price</th>
									@if(Auth::User()->position == "assistant")  
									<th class="sorting_asc" tabindex="0" aria-controls="example2" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Platform(s): activate to sort column ascending">Edit</th>
									<th class="sorting_asc" tabindex="0" aria-controls="example2" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Platform(s): activate to sort column ascending">Adjust</th>
									@endif
								</tr>

							</thead>             
							<!--./Fetch data table-start-->
							<tbody>
								@foreach($vaccine_lists as $vac)
								<tr>
									<td>{{$vac->vaccine_name}}</td>
									<td>{{$vac->vaccine_lot_number}}</td>
									<td>{{$vac->vaccine_expiration_date}}</td>
									<td>{{$vac->vaccine_receive_date}}</td>
									<td>{{$vac->quantity}}</td>
									<td>{{$vac->vaccine_price}}</td>
									@if(Auth::User()->position == "assistant") 
									<td>
										<button  data-vacname="{{$vac->vaccine_name}}" 
											data-receive="{{$vac->vaccine_receive_date}}" 
											data-prc="{{$vac->vaccine_price}}"
											data-vacqty="{{$vac->quantity}}"
											data-vaclot="{{$vac->vaccine_lot_number}}"  
											data-expdate="{{$vac->vaccine_expiration_date}}" 
											data-vacstatus="{{$vac->status}}" 
											data-vacid={{$vac->id}} data-toggle="modal" data-target="#edit">
											<i class="fa fa-fw fa-edit"> </i>
										</button>
									</td>
									<td><button data-qty="{{$vac->quantity}}"    data-vacid={{$vac->id}} data-vtype={{$vac->vaccine_types_id}} data-toggle="modal" data-target="#adjust">Adjust Here </button></td>
									{{-- <td><button data-qty="{{$vac->quantity}}"   data-vacid={{$vac->id}} data-vtype={{$vac->vaccine_types_id}} data-toggle="modal" data-target="#newstock">Restock Here </button></td> --}}
									@endif  
								</tr>
								@endforeach
							</tbody>
						</table>
					</div>
					@if(Auth::User()->position == "assistant")
					<div class="box-footer clearfix">
						<a href="javascript:void(0)" class="btn btn-primary" data-toggle="modal" data-target="#myVaccineModal">Add New Vaccine</a>
					</div>
					@endif
					<!--./Add-Modal Start-->
					<div class="myVaccineModal">
						<div class="modal-dialog">
							<div class="modal-content">
								<form action="/add_vaccine"  method="POST">
									{{ csrf_field() }}
									<div class="modal-body">
										@include('pages.addnewvaccinemodal')
									</div>
								</form>
							</div>
						</div>   
						<!--./Add-Modal End-->
						
						<!--/. edit modal start --> 
						<div class="modal fade" id="edit">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal" aria-label="Close">
											<span aria-hidden="true">&times;</span></button>
											<h4 class="modal-title">Edit New Vaccine</h4>
										</div>
										<form action="/edit_vaccine"  method="POST">
											{{ csrf_field() }}
											<div class="modal-body">
												@include('pages.totalform')
											</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-default pull-left" data-dismiss="modal">Cancel</button>
												<button type="submit" class="btn btn-primary">Save Changes </button>
											</div>
										</form>
									</div>
								</div>
								<!--/. edit modal end -->
							</div>

							<!--/. adjust modal start --> 
							<div class="modal fade" id="adjust">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal" aria-label="Close">
												<span aria-hidden="true">&times;</span></button>
												<h4 class="modal-title">Adjust Vaccine</h4>
											</div>
											<form action="/adjust_inventory"  method="POST">
												{{ csrf_field() }}
												<div class="modal-body">
													@include('pages.adjustform')
												</div>
												<div class="modal-footer">
													<button type="button" class="btn btn-default pull-left" data-dismiss="modal">Cancel</button>
													<button type="submit" name="adjust_vac" class="btn btn-primary">Save Changes </button>
												</div>
											</form>
										</div>
									</div>
									<!--/. adjust modal end -->
									</div>

									<!--/. Restock modal start --> 
									{{-- <div class="modal fade" id="newstock">
										<div class="modal-dialog">
											<div class="modal-content">
												<div class="modal-header">
													<button type="button" class="close" data-dismiss="modal" aria-label="Close">
														<span aria-hidden="true">&times;</span></button>
														<h4 class="modal-title">Vaccine New Stock</h4>
													</div>
													<form action="/new_stock"  method="POST">
														{{ csrf_field() }}
														<div class="modal-body">
															@include('pages.newstockform')
														</div>
														<div class="modal-footer">
															<button type="button" class="btn btn-default pull-left" data-dismiss="modal">Cancel</button>
															<button type="submit" name="newstock_vac"  class="btn btn-primary">Save Changes </button>
														</div>
													</form>
												</div>
											</div> --}}
											<!--/. Restock modal end -->
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
										$('#userTable').DataTable();
									} );
								</script>

								<!--./Edit Modal Script Start -->
								<script>
									$('#edit').on('show.bs.modal', function (event) {
										var button = $(event.relatedTarget) 
										var name = button.data('vacname')
										var exp = button.data('expdate')
										var qty = button.data('vacqty')
										var prcnum = button.data('prc')
										var lotno = button.data('vaclot')
										var statu = button.data('vacstatus')
										var receivedate = button.data('receive')
										var vac_id = button.data('vacid')
										var modal = $(this)
										
										modal.find('.modal-body #vacname').val(name);
										modal.find('.modal-body #Receive').val(receivedate);
										modal.find('.modal-body #expdate').val(exp);
										modal.find('.modal-body #vacqty').val(qty);
										modal.find('.modal-body #stat').val(statu); 
										modal.find('.modal-body #lot').val(lotno);    
										modal.find('.modal-body #vac_id').val(vac_id);
										modal.find('.modal-body #prc').val(prcnum);
									})
								</script>
								<!--./Edit Modal Script End -->

								
								<!--./Edit Adjust Script Start -->
								<script>
									$('#adjust').on('show.bs.modal', function (event) {
										var button = $(event.relatedTarget) 
										
										var qtyno = button.data('qty')           
										var vac_id = button.data('vacid')
										var vac_type = button.data('vtype')
										var modal = $(this)
										
										modal.find('.modal-body #qty').val(qtyno); 
										modal.find('.modal-body #vac_type').val(vac_type);         
										modal.find('.modal-body #vac_id').val(vac_id);
									})
								</script>
								<!--./Edit Adjust Script End -->

								<!--./Add Script Start -->
								{{-- <script>
									$('#newstock').on('show.bs.modal', function (event) {
										var button = $(event.relatedTarget) 
										
										var qtyno = button.data('qty')           
										var vac_id = button.data('vacid')
										var vac_type = button.data('vtype')
										var modal = $(this)
										
										modal.find('.modal-body #qty').val(qtyno);         
										modal.find('.modal-body #vac_id').val(vac_id);
										modal.find('.modal-body #vac_type').val(vac_type); 
									})
								</script> --}}
								<!--./Add Script End -->
								