 <div class="col-md-3">
                    <!-- checkout-progress-sidebar -->
        <div class="checkout-progress-sidebar ">
            <div class="panel-group">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4 class="unicase-checkout-title" style="font-weight: bold;">Your Profile Link</h4>
                    </div>
                    <?php
                    use App\Customer;
                        $customerId = Session::get('customerId');
                        $customers =Customer::where('id',$customerId)->first();
                    ?>
                    <div class="">
                        <ul class="nav nav-checkout-progress list-unstyled">
                        <?php if($customers->password != ''){ ?>
                            <li><a href="{{route('customer.profile',$customerId)}}">Profile</a></li>
                        <?php } ?>
                            <li><a href="{{route('customer.order')}}">Order</a></li>
                            <li><a href="#">Shipping Method</a></li>
                            <li><a href="{{route('customer.logout')}}">Logout</a></li>
                        </ul>       
                    </div>
                </div>
            </div>
        </div> 
        <!-- checkout-progress-sidebar -->              
</div>