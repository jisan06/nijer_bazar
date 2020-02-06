@extends('frontend.master')


@section('mainContent')
    
    <div class="container" style="background-color: #F0F2F5; border:.5px; border-radius: 50px; text-align: center; height: 350px ">
        <div class="sign-in-page">
            <div class="row"style="margin-top: 50px">
                <div class="col-md-4 col-sm-6">
                    
                </div>
                <!-- Sign-in -->            
                <div class="col-md-5 col-sm-6" id="content">
                    <?php
                    $message = Session::get('message');
                      if (isset($message)) {
                        echo $message;
                      }
                      Session::forget('message');
                    ?>

                    <h1 class=""font-size:20px; font-weight: bold>Email Address / Phone No</h1>
                    <form action="{{url('/view-order')}}" method="post" class="register-form outer-top-xs" role="form">
                        {{ csrf_field() }}
                        <div class="form-group">
                            <input type="text" name="custemail" placeholder="Enter your email or phone no" value="{{old('custemail')}}" class="form-control unicase-form-control text-input" id="exampleInputEmail2" required>
                        </div>

                        <button type="submit" class="btn-upper btn btn-primary checkout-page-button">GO</button>
                    </form>                 
                </div>
                <!-- Sign-in -->

            </div><!-- /.container -->
        </div><!-- /.body-content -->
    </div>

@endsection

