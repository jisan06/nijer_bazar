@extends('frontend.master')

@section('mainContent')    
    <section id="wrapper">
        <div class="container">
            <section id="content" class="page-content card card-block">
                <section class="login-form">
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
                </section>
            </section>
        </div>
    </section>

@endsection

