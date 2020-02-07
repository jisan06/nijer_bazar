@extends('frontend.master')
@section('mainContent')
    <div class="cart-grid row">
        <div class="cart-grid-body col-xs-12 col-lg-8">
            <div class="card cart-container">
                <div class="card-block">
                    <h1 class="h1">Order Summary</h1>
                </div>
                <hr class="separator">
                <div class="cart-overview js-cart">
                    <div class="table-responsive" style="padding: 20px;">
                        <table class="table table-bordered table-striped">
                            <thead>
                                <tr>
                                    <th width="60px" class="center" style="font-weight: bold;" >SL</th>
                                    <th class="center" style="font-weight: bold;">Total</th>
                                    <th width="110px" class="center" style="font-weight: bold;">Order Status</th>
                                    <th width="60px" class="center" style="font-weight: bold;">Details</th>
                                </tr>
                            </thead>
                            <tbody id="tbody">
                                <?php
                                    $i = 0;
                                ?>
                                @foreach($orderlist as $list)
                                    <?php
                                    $customerId = Session::get('customerId');
                                    $checkouts =  DB::table('checkouts')->where(['id'=>$list->checkout_id])->first();
                                    $orderlist =  DB::table('orders')->where(['checkout_id'=>$list->checkout_id])->get();
                                    $customers =  DB::table('customers')->where(['id'=>$customerId])->first();
                                    $total = 0;
                                    $subtotal1 = 0;
                                    foreach ($orderlist as $order) {
                                        $customer_group =  DB::table('customer_group_sections')->where(['customerGroupId'=>@$customers->clientGroup])
                                        ->where(['productId'=>$order->product_id])
                                        ->first();

                                        if(@$customer_group->customerGroupPrice){
                                            $price = $customer_group->customerGroupPrice;
                                        }else{
                                            $price = $order->price;
                                        }

                                        $subtotal = $price*$order->qty;
                                        $total +=$subtotal;
                                    }

                                  /* if(@$customer_group->customerGroupId){
                                    $total = $customer_group->customerGroupPrice*$order->qty;
                                    }else{
                                        $total = $list->total;  
                                    }*/

                                    ?>
                                    <tr>
                                        <td class="center">{{++$i}}</td>
                                        <td class="center">৳ {{$total}}</td>
                                        <td class="center">{{$checkouts->status}}</td>
                                        <td class="text-nowrap center">
                                            <a href="{{route('order.details',$list->checkout_id)}}" data-toggle="tooltip" data-original-title="View Details" data-id=""> 
                                                <i class="fa fa-eye text-success m-r-10"></i> 
                                            </a>
                                        </td>
                                    </tr>
                                @endforeach   
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <div class="cart-grid-right col-xs-12 col-lg-4">
            <div class="card cart-summary">
                @include('frontend.include.others.profileLink')
            </div>
        </div>
    </div>
@endsection



  


