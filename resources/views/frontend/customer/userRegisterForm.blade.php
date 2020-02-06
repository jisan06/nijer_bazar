@extends('frontend.master')

@section('body')

<div class="checkout_area ">
    <div class="section_heading">
        <h1> Checkout </h1>         
        <div class="section-icon">
            <i class="fa fa-dot-circle-o" aria-hidden="true"></i>
        </div>
        <h2 class="text-center text-success">{{ Session::get('message') }}</h2>
    </div>      
</div>
<div class="checkout_content section_padding">
    <div class="container">
        <div class="row">
            <div class="checkout_inner">
                <form action="{{ route('user.register') }}" method="Post" name="checkout">
                    {{ csrf_field() }}
                    <input type="hidden" id="payment_type" value=""/>   

                        
                    <input  type="hidden"  name="user_type" value="new">            
                        <div class="col-md-12 checkout_form">
                        <!-- <form action="#"> -->
                            <p class="checkout-coupon top log a-an">
                                <label class="l-contact">
                                    Name <span class="text-danger">(required *)</span> : 
                                </label>                                  
                                <input type="text" name="name" id="name" required value="{{old('name')}}" />
                            </p>
                            <p class="checkout-coupon top-down log a-an">
                                <label class="l-contact">
                                    Phone <span class="text-danger">(required *)</span> : 
                                </label>
                                <input type="text" name="phone" id="phone" required value="{{ old('phone') }}">
                            </p>

                            <p class="checkout-coupon top-down log a-an">
                                <label class="l-contact">
                                    Address <span class="text-danger">(required *)</span> : 
                                </label>
                                <textarea cols="" placeholder="Write Your Address" rows="" name="address" id="address" required>{{ old('address') }}</textarea>
                            </p>

                            <p class="checkout-coupon top-down log a-an">
                                <label class="l-contact">
                                    User Name : 
                                </label>
                                <input type="text" name="user_name" id="user_name" value="{{ old('user_name') }}">
                            </p>

                            <p class="checkout-coupon top-down log a-an">
                                <label class="l-contact">
                                    Password : 
                                </label>
                                <input type="password" name="password" id="password" >
                            </p>

                            <p class="checkout-coupon top-down log a-an">
                                <label class="l-contact">
                                    Confirm Password : 
                                </label>
                                <input id="password-confirm" type="password" name="password_confirmation" >
                            </p>

                            <p>
                                @if(count($errors))
                                <div class="form-group">
                                    <div class="alert alert-danger">
                                        <ul>
                                            @foreach($errors->all() as $error)
                                            <li>{{ $error }}</li>
                                            @endforeach
                                        </ul>
                                    </div>
                                </div>
                                @endif
                            </p>
                            <!-- </form>     -->
                        </div>
                        <a href="javascript:submit(0);" class="btn btn-success orderBtn" id="place_order">Register <i class="glyphicon glyphicon-menu-right"></i></a>
                    </div>          
                </div>
            </div>


        </div>      
    </div>


    @endsection

    @section('script')
    <script type='text/javascript'>
        function submit(id)
        {
            document.forms["checkout"].submit();
        }
    </script>
    @endsection