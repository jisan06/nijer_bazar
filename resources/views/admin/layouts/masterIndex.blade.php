<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <!-- Tell the browser to be responsive to screen width -->
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">
        <meta name="csrf-token" content="{{ csrf_token() }}">
        <!-- Favicon icon -->
        <link rel="icon" type="image/png" sizes="16x16" href="{{asset('/')}}public/uploads/admin_logo/logo_small.png">

        <title>Admin || {{ $title }}</title>

        <link rel="icon" type="image/png" sizes="20x20" href="{{asset('/')}}public/uploads/admin_logo/logo_small.png">

        <style type="text/css">
            .card-pad{
                padding-bottom: 10px;
            }
        </style>
        @yield('custom_css')

        @include('admin.partials.header-assets')
    </head>

    <body class="skin-default fixed-layout">
        <!-- Preloader - style you can find in spinners.css -->
        @include('admin.partials.preloader')

        <!-- Main wrapper - style you can find in pages.scss -->
        <div id="main-wrapper">
            <!-- Topbar header - style you can find in pages.scss -->
            <header class="topbar">
                @include('admin.partials.top-navbar')
            </header>
            <!-- End Topbar header -->

            <!-- Left Sidebar - style you can find in sidebar.scss  -->  
            @include('admin.partials.menu')
            <!-- End Left Sidebar - style you can find in sidebar.scss  -->

            <!-- Page wrapper  -->
            <div class="page-wrapper">
                <!-- Container fluid  -->
                <div class="container-fluid">
    	            <!-- Bread crumb and right sidebar toggle -->
    	            @yield('bread-crumb')
    	            <!-- End Bread crumb and right sidebar toggle -->

    			    <div style="padding-bottom: 10px;"></div>

    			    @php
    			        $message = Session::get('msg');
    			    @endphp

    			    @if (isset($message))
    					<div class="alert alert-success alert-dismissible">
    						<button type="button" class="close" data-dismiss="alert">&times;</button>
    						<strong>Success!</strong> {{ $message }}
    					</div>
    			    @endif

    			    @php
    			        Session::forget('msg');
    			    @endphp

                    <div class="card">            
    			        <div class="card-header">
    			            <div class="row">
    			                <div class="col-md-6"><h4 class="card-title">{{ $title }}</h4></div>
    			                <div class="col-md-6 text-right">
			                        <a style="font-size: 16px;" class="btn btn-outline-info btn-lg" href="{{ route($addNewLink) }}">
			                            <i class="fa fa-plus-circle"></i> Add New
			                        </a>                  
    			                </div>
    			            </div>
    			        </div>

    	                <!-- Card Body Content -->
    	                @yield('card_body')
    	                <!-- End Card Body Content -->
                    </div>

                    <!-- Right sidebar -->
                    @include('admin.partials.right-sidebar')
                    <!-- End Right sidebar -->
                </div>
                <!-- End Container fluid  -->
            </div>
            <!-- End Page wrapper  -->

            <!-- footer -->
            <footer class="footer">
                © {{ date('Y') }} Developed by <a target="_blank" href="http://www.technoparkbd.com/">Techno Park</a>           
            </footer>
            <!-- End footer -->

        </div>
        <!-- End Wrapper -->



        @include('admin.partials.footer-assets')

        <!-- This page plugins -->
        @yield('custom-js')

    </body>
</html>