@extends('admin.layouts.master')

@section('content')
<?php
    use App\Product;
    use App\Customer;
    use App\Checkout;
    use App\Transaction;
    use App\Order;

    $allCustomer = Customer::all();
    $customerCount = $allCustomer->count();

    $topclients = DB::table('customers')
            ->join('transactions', 'customers.id', '=', 'transactions.reference')
            ->select('customers.name',DB::raw('sum(total) as sum'))
            ->groupBy('name')
            ->limit(6)
            ->orderBy('sum','DESC')
            ->get();


    $productCount = Product::where('status',1)->count();

    $newOrderCount = Checkout::where('status','Waiting')->count();
    $completeOrderCount = Checkout::where('status','Complete')->count();

    $orders = DB::table('checkouts')
    ->join('shippings', 'checkouts.shipping_id', '=', 'shippings.id')
    ->join('transactions', 'transactions.checkout_id', '=', 'checkouts.id')
    ->select('shippings.*','checkouts.*','transactions.total')
    ->orderBy('checkouts.id','DESC')
    ->where("deleted_at",NULL)
    ->get('checkouts');

    $pendingAmount = DB::table('checkouts')
    ->join('shippings', 'checkouts.shipping_id', '=', 'shippings.id')

    ->join('transactions', 'checkouts.id', '=', 'transactions.checkout_id')
    ->where('checkouts.status','Waiting')
    ->select('transactions.total')
    ->sum('total');

    $saleByAmount = DB::table('products')
    ->join('orders', 'products.id', '=', 'orders.product_id')
    ->select('products.name',DB::raw('sum(orders.price) as sum'))
    ->groupBy('name')
    ->limit(6)
    ->orderBy('sum','DESC')
    ->get();

    $saleByQuantity = DB::table('products')
    ->join('orders', 'products.id', '=', 'orders.product_id')
    ->select('products.name',DB::raw('sum(orders.qty) as sum'))
    ->groupBy('name')
    ->limit(6)
    ->orderBy('sum','DESC')
    ->get();

    $saleByCategory = DB::table('products')
    ->join('orders', 'products.id', '=', 'orders.product_id')
    ->join('categories', 'products.root_category', '=', 'categories.id')
    ->select('categories.categoryName',DB::raw('sum(orders.price) as sum'))
    ->groupBy('categoryName')
    ->limit(6)
    ->orderBy('sum','DESC')
    ->get();

    $totalsales = Transaction::all();

    $month = date("m");
    $year = date("Y");

    $monthFrom = $year."-".$month."-01";
    $monthTo = $year."-".$month."-31";

    $monthlyIncome =  Transaction::whereBetween('created_at', [$monthFrom, $monthTo])->sum('total');

    $salesbymonth = DB::table('orders')
    ->select('orders.product_id',DB::raw('sum(orders.price*orders.qty) as sum'))
    ->whereBetween('orders.created_at', [$monthFrom, $monthTo])
    ->groupBy('orders.product_id')
    ->orderBy('sum','DESC')
    ->get();
?>

<style type="text/css">
    .serial_no{
      width: 4%
      }
      .mobile{
        width: 15%
    }
    .status{
        width: 10%
    }
    .name{
        width: 23%
    }

    .action{
        width: 10%
    }
    .total{
        width: 5%
    }

    table thead{
        line-height: 4px;
    }

</style>

<div class="container-fluid">
    <div style="margin-top: 25px;" class="card-group">
        <div class="card">
            <div class="card-body">
                <div class="row">
                    <div class="col-md-12">
                        <div class="d-flex no-block align-items-center">
                            <div>
                                <h3><i class="icon-screen-desktop"></i></h3>
                                <p class="text-muted">New Order</p>
                            </div>
                            <div class="ml-auto">
                                <h2 class="counter text-primary"><a href="{{route('order.new')}}">{{$newOrderCount}}</a></h2>
                            </div>
                        </div>
                    </div>
                    <div class="col-12">
                        <div class="progress">
                            <div class="progress-bar bg-primary" role="progressbar" style="width: 85%; height: 6px;" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Column -->

        <!-- Column -->
        <div class="card">
            <div class="card-body">
                <div class="row">
                    <div class="col-md-12">
                        <div class="d-flex no-block align-items-center">
                            <div>
                                <h3><i class="icon-note"></i></h3>
                                <p class="text-muted">Complete Order</p>
                            </div>
                            <div class="ml-auto">
                                <h2 class="counter text-cyan"><a href="{{route('orderlist.complete')}}">{{$completeOrderCount}}</a></h2>
                            </div>
                        </div>
                    </div>
                    <div class="col-12">
                        <div class="progress">
                            <div class="progress-bar bg-cyan" role="progressbar" style="width: 85%; height: 6px;" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Column -->

        <!-- Column -->
        <div class="card">
            <div class="card-body">
                <div class="row">
                    <div class="col-md-12">
                        <div class="d-flex no-block align-items-center">
                            <div>
                                <h3><i class="icon-doc"></i></h3>
                                <p class="text-muted">Registered Client</p>
                            </div>
                            <div class="ml-auto">
                                <h2 class="counter text-purple"><a href="{{route('customers.index')}}">{{$customerCount}}</a> </h2>
                            </div>
                        </div>
                    </div>
                    <div class="col-12">
                        <div class="progress">
                            <div class="progress-bar bg-purple" role="progressbar" style="width: 85%; height: 6px;" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Column -->
        <!-- Column -->
        <div class="card">
            <div class="card-body">
                <div class="row">
                    <div class="col-md-12">
                        <div class="d-flex no-block align-items-center">
                            <div>
                                <h3><i class="icon-bag"></i></h3>
                                <p class="text-muted">Running Product</p>
                            </div>
                            <div class="ml-auto">
                                <h2 class="counter text-success"><a href="{{route('product.running')}}">{{$productCount}}</a></h2>
                            </div>
                        </div>
                    </div>
                    <div class="col-12">
                        <div class="progress">
                            <div class="progress-bar bg-success" role="progressbar" style="width: 85%; height: 6px;" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="row">
        @include('admin.dashboard.element.pending_order') {{-- file for pending order of product --}}

        @include('admin.dashboard.element.top_client') {{-- file for top client of order --}}

        @include('admin.dashboard.element.top_sale_by_amount') {{-- file for top sale by amount --}}

        @include('admin.dashboard.element.top_sale_by_quantity') {{-- file for top sale by quantity --}}

        @include('admin.dashboard.element.top_sale_by_category') {{-- file for top sale by category --}}

    </div>

    <div class="row">
         @include('admin.dashboard.element.sales_overview') {{-- file for sales overview --}}
         @include('admin.dashboard.element.monthly_sales_flow') {{-- file for monthly sales flow --}}
    </div>
</div>
@endsection

@include('admin.dashboard.element.js_code') {{-- file for javascript code --}}
