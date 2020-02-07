<div style="padding: 15px 0px 25px 25px;">
    <h1 class="h1">Profile Link</h1>
    <?php
    use App\Customer;
        $customerId = Session::get('customerId');
        $customers =Customer::where('id',$customerId)->first();
    ?>
    <ul class="nav nav-checkout-progress list-unstyled">
    <?php if($customers->password != ''){ ?>
        <li><a href="{{route('customer.profile',$customerId)}}">Profile</a></li>
    <?php } ?>
        <li><a href="{{route('customer.order')}}">Order</a></li>
        <li><a href="{{route('customer.logout')}}">Logout</a></li>
    </ul>       
</div>