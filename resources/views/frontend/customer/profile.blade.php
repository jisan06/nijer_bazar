@extends('frontend.master')


@section('mainContent')
    
<section id="wrapper">
    <div class="container">     
        <div id="content-wrapper">
    <?php
    $message = Session::get('msg');
      if (isset($message)) {
        echo $message;
    }
    ?>
    <h4 class="checkout-subtitle" style="font-weight: bold;">Profile Deatils</h4>
    <form action="{{route('customer.update')}}" class="register-form outer-top-xs" role="form" method="post">
        {{ csrf_field() }}
        <div class="form-group">
            <label for="exampleInputEmail1" style="font-weight: bold;">Full Name </label>
            <input type="text" name="name" value="{{$customers->name}}" class="form-control unicase-form-control text-input" id="exampleInputEmail1" required>
        </div>
        <input type="hidden" name="customerId" value="{{$customers->id}}">
        <div class="form-group">
            <label class="info-title" for="exampleInputEmail2" style="font-weight: bold;">Email Address </label>
            <input type="email" name="email"  value="{{$customers->email}}" class="form-control unicase-form-control text-input" id="exampleInputEmail2" required>
        </div>        
        <div class="form-group">
            <label class="info-title" for="exampleInputEmail1" style="font-weight: bold;">Phone Number </label>
            <input type="number" name="mobile"  value="{{$customers->mobile}}" class="form-control unicase-form-control text-input" id="exampleInputEmail1" required>
        </div>
        <div class="form-group">
            <label class="info-title" for="exampleInputEmail1" style="font-weight: bold;">Your Address </label>
            <input type="text" name="address"  value="{{$customers->address}}" class="form-control unicase-form-control text-input" id="exampleInputEmail1" required>
        </div> 
        <button type="submit" class="btn-upper btn btn-primary checkout-page-button" style="font-weight: bold;">Update Profile</button>
    </form>
<div id="wrapper">
 @include('frontend.include.others.profileLink')
 </div>
        </div><!-- /.sigin-in-->
 

</div><!-- /.body-content -->

<section class="bottom-section">
<div class="container">

      </div>
            </div>
          </section>

    <div class="container">
        <div class="sign-in-page">
            <div class="row">
 </section> 

<!-- create a new account -->


@endsection

