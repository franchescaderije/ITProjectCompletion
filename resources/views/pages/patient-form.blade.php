<!DOCTYPE html>
<html>

@include('layouts.head')
<link rel="stylesheet" type="text/css" media="screen"  href="{{ asset('bower_components/jquery-ui.css')}}" />
    
<body class="hold-transition skin-purple sidebar-mini">
    <div class="wrapper">
        @include('layouts.header')
        <!-- NAVIGATION -->
        @include('layouts.navigation')
        <!-- END -->
        <div class="content-wrapper">
            <section class="content">
                  
                <div class="box box-solid box-primary">
                    <div class="box-header with-border">
                          
                        <h3 class="box-title">PATIENT FORM</h3>
                    </div>
                    <div class="box-body">
                        <div class="col-md-12">   
                            <div class="box box-primary">
                                <br>
                                <div class="box-header with-border">
                                    <h3 class="box-title">PERSONAL DETAILS</h3>
                                </div>
                                <div class="box-body">       
                                    <form role="form" action="/create" method="post" id="patientform">
                                        @csrf
                                        <div class="form-row">
                                            <div class="form-group col-md-4">
                                                <label >First Name</label>
                                                <input type="text" pattern="[A-Za-z ]{1,32}" title="First Name should only contain Letters" class="form-control" id="firstname" placeholder="First Name" name="fname" required="required">
                                            </div>
                                            <div class="form-group col-md-4">
                                                <label >Middle Name</label>
                                                <input type="text" pattern="[A-Za-z ]{1,32}" title="Middle Name should only contain Letters" class="form-control" id="middlename" placeholder="Middle Name" name="mname" required="required">
                                            </div>
                                            <div class="form-group col-md-4">
                                                <label >Last Name</label>
                                                <input type="text" pattern="[A-Za-z ]{1,32}" title="Last Name should only contain Letters" class="form-control" id="lastname" placeholder="Last Name" name="lname" required="required">
                                            </div>
                                        </div>
                                        <div class="form-row">
                                            <div class="form-group col-md-3">
                                                <label for="gender">Gender</label>
                                                <select id="gender" class="form-control" name="sex" required>
                                                    <option selected>Choose...</option>
                                                    <option value="Male">Male</option>
                                                    <option value="Female">Female</option>
                                                </select>
                                            </div>
                                            <div class="form-group col-md-3">
                                                <label >Date of Birth</label>
                                                <input id="dob" type="text"  class="form-control"  placeholder="Date of Birth" name="dofbirth" required="required" autocomplete=off>
                                            </div>
                                            <div class="form-group col-md-3">
                                                <label>Age</label>
                                                <input  type="text" id="age" readonly class="form-control"  placeholder="Age" name="age">
                                              </div>
                                            <div class="form-group col-md-3">
                                                <label >Contact No:</label>
                                                <input type="text" placeholder="09** *** ***" maxlength="11" minlength="10"  pattern="(\+?\d{2}?\s?\d{3}\s?\d{3}\s?\d{4})|([0]\d{3}\s?\d{3}\s?\d{4})" class="form-control" id="firstname" placeholder="Contact Number" name="connum"  minlength="10" required>
                                            </div>  
                                        </div>
                                        <div class="form-row">
                                            <div class="form-group col-md-12">
                                                <label >Address</label>
                                                <input type="text" class="form-control" id="firstname" placeholder="Address" name="address" required>
                                            </div>
                                        </div>
                                        <div class="form-row">
                                            <div class="form-group col-md-6">
                                                <label >Mother's Maiden Name</label>
                                                <input type="text" pattern="[A-Za-z ]{1,50}" title="Mother's Name should only contain Letters" class="form-control" id="firstname" placeholder="Mother's Name" name="mothername" required="required">
                                            </div>
                                            <div class="form-group col-md-6">
                                                <label >Occupation</label>
                                                <input type="text" pattern="[A-Za-z ]{1,50}" class="form-control" id="lastname" placeholder="Occupation" name="moccu" required>
                                            </div>
                                        </div>
                                        <div class="form-row">
                                            <div class="form-group col-md-6">
                                                <label >Father's Name</label>
                                                <input type="text" pattern="[A-Za-z ]{1,50}" title="Father's Name should only contain Letters" class="form-control" id="firstname" placeholder="Father's Name" name="fathername" required="required">
                                            </div>
                                            <div class="form-group col-md-6">
                                                <label >Occupation</label>
                                                <input type="text" pattern="[A-Za-z ]{1,50}" class="form-control" id="lastname" placeholder="Occupation" name="foccu" required>
                                            </div>
                                        </div>
                                        
                                        <div class="form-row">                  
                                            
                                        </div>
                                        <br>
                                        <div class="col-md-12">   
                                            <div class="box box-info">
                                                <div class="box-header with-border">
                                                    <br>
                                                    <h3 class="box-title">BIRTH HISTORY</h3>
                                                </div>    
                                                <div class="box-body">
                                                    <div class="form-row">
                                                        <div class="form-group col-md-6">
                                                         <label for="inputState">Type of Delivery:</label>
                                                          <select id="inputState" class="form-control" name="typeofdelivery" required>
                                                            <option selected>Choose...</option>
                                                            <option value="Vaginal Delivery">Vaginal Delivery</option>
                                                            <option value="Natural Delivery">Natural Delivery</option>
                                                            <option value="Vacuum Extraction">Vacuum Assisted Delivery / Vacuum Extraction</option>
                                                            <option value="Forceps Delivery">Forceps Delivery</option>
                                                            <option value="C-Section">Cesarian Section (C-Section)</option>
                                                            <option value="Vaginal Birth After Cesarian">Vaginal Birth After Cesarian</option>
                                                          </select>
                                                        </div>
                                                        <div class="form-group col-md-6">
                                                            <label for="inputState">Blood Type:</label>
                                                            <select id="inputState" class="form-control" name="btype" required>
                                                                <option selected>Choose...</option>
                                                                <option value="Type A">Type A</option>
                                                                <option value="Type B">Type B</option>
                                                                <option value="Type AB">Type AB</option>
                                                                <option value="Type O">Type O</option>
                                                                <option value="Type A+">Type A+</option>
                                                                <option value="Type A-">Type A-</option>
                                                                <option value="Type B+">Type B+</option>
                                                                <option value="Type B-">Type B-</option>
                                                                <option value="Type AB+">Type AB+</option>
                                                                <option value="Type AB-">Type AB-</option>
                                                            </select>
                                                        </div>
                                                        
                                                    </div>
                                                    <div class="form-row">
                                                        <div class="form-group col-md-6">
                                                            <label >Birth Weight:</label>
                                                            <div class="input-group"><input type="number" min=0 step=".01" class="form-control" id="birth_weight" placeholder="Birth Weight" name="bw" required><span class="input-group-addon">kg</span></div>
                                                        </div>
                                                        <div class="form-group col-md-6">
                                                            <label >Birth Length:</label>
                                                            <div class="input-group"><input type="number" min=0 step=".01" class="form-control" id="birth_length" placeholder="Birth Length" name="bl" required><span class="input-group-addon">cm</span></div>
                                                        </div>
                                                        <div class="form-group col-md-4">
                                                            <label >Head Circumference:</label>
                                                            <div class="input-group"><input type="number" min=0 step=".01"  class="form-control" id="head_cire" placeholder="Head Circumference" name="headcirc" required><span class="input-group-addon">cm</span></div>
                                                        </div>
                                                        <div class="form-group col-md-4">
                                                            <label >Chest Circumference:</label>
                                                            <div class="input-group"> <input type="number" min=0 step=".01" class="form-control" id="chestcirc" placeholder="Chest Circumference in" name="chestcirc" required><span class="input-group-addon">cm</span></div>
                                                        </div>
                                                        <div class="form-group col-md-4">
                                                            <label >Abdominal Circumference:</label>
                                                            <div class="input-group"><input type="number" min=0 step=".01" class="form-control" id="abdocirc" placeholder="Abdominal Circumference in" name="abdocirc" required><span class="input-group-addon">cm</span></div>
                                                        </div>
                                                    </div>
                                                    <br>
                                                    <br>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="box-footer">
                                            {{-- <input type="hidden" name="origin" value="{{$origin}}"> --}} 
                                                <button type="reset" class="btn btn-default pull-left" >Reset</button>
                                                <button type="submit" class="btn btn-info pull-right">Add Patient</button>
                                        </div>        
                                                
                                            
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </div>
    </div>
</body>
@include('layouts.footer')
<script src="{{ asset('bower_components/jquery.js')}}"></script> 
    <script src="{{ asset('bower_components/jquery-ui.js')}}"></script> 
    <script>
        $(document).ready(function () {
            var age = "";
            $('#dob').datepicker({
                onSelect: function (value, ui) {
                    var today = new Date();
                    age = today.getFullYear() - ui.selectedYear;
                    $('#age').val(age);
                },
                showOtherMonths: true,
                selectOtherMonths: true,
                changeMonth: true,
                changeYear: true,
                dateFormat: 'yy-mm-dd',
                minDate: '-18Y',
                maxDate: 'D',
            })
        })
    </script>
</html>
