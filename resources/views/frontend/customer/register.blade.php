@extends('frontend.master')


@section('mainContent')
<section id="wrapper">
    <div class="container">
        <nav data-depth="1" class="breadcrumb hidden-sm-down">
            <ol itemscope itemtype="http://schema.org/BreadcrumbList">              
                <li itemprop="itemListElement" itemscope itemtype="http://schema.org/ListItem">
                    <a itemprop="item" href="index.html">
                      <span itemprop="name">Home</span>
                    </a>
                    <meta itemprop="position" content="1">
                </li>
            </ol>
        </nav>
        <div id="content-wrapper">
            <section id="main">
                <header class="page-header">
                  <h1 class="h1"> Create an account </h1>
                </header>
                <section id="content" class="page-content card card-block">
                    <section class="register-form">
                        <?php
                            $message = Session::get('msg');
                              if (isset($message)) {
                                echo $message;
                            }
                            Session::forget('message')
                        ?>
                        <p>Already have an account? <a href="{{url('/customer/profile')}}">Log in instead!</a></p>
                        <form action="{{route('customer.register')}}" id="customer-form" class="js-customer-form" method="post">
                            {{ csrf_field() }}
                            <section>
                                <input type="hidden" name="id_customer" value="">       
                                <div class="form-group row ">
                                    <label class="col-md-3 form-control-label required"> Full name<span>*</span> </label>
                                    <div class="col-md-6">
                                        <input class="form-control" name="name" type="text" value="{{old('name')}}" required >
                                    </div>
                                    <div class="col-md-3 form-control-comment">  
                                    </div>
                                </div>
                                <div class="form-group row ">
                                    <label class="col-md-3 form-control-label required"> Phone Number<span>*</span> </label>
                                    <div class="col-md-6">
                                        <input class="form-control" name="mobile" value="{{old('mobile')}}" type="text" required >
                                    </div>
                                    <div class="col-md-3 form-control-comment">  
                                    </div>
                                </div>
                                <div class="form-group row ">
                                    <label class="col-md-3 form-control-label required"> Your Address<span>*</span> </label>
                                    <div class="col-md-6">
                                        <input class="form-control" name="address" value="{{old('address')}}" type="text" required >
                                    </div>
                                    <div class="col-md-3 form-control-comment">  
                                    </div>
                                </div>
                                <div class="form-group row ">
                                    <label class="col-md-3 form-control-label required"> Email<span>*</span> </label>
                                    <div class="col-md-6">
                                        <input class="form-control" name="email" value="{{old('email')}}" type="email" required >
                                    </div>
                                    <div class="col-md-3 form-control-comment">        
                                    </div>
                                </div>        
                                <div class="form-group row ">
                                    <label class="col-md-3 form-control-label required"> Password<span>*</span> </label>
                                    <div class="col-md-6">
                                        <div class="input-group js-parent-focus">
                                            <input class="form-control js-child-focus js-visible-password" name="password" type="password" value="" pattern=".{5,}" required >
                                            <span class="input-group-btn">
                                                <button class="btn" type="button" data-action="show-password" data-text-show="Show" data-text-hide="Hide" > Show </button>
                                            </span>
                                          </div>
                                    </div>
                                    <div class="col-md-3 form-control-comment">              
                                    </div>
                                </div>
                                <div class="form-group row ">
                                    <label class="col-md-3 form-control-label required">Confirm Password<span>*</span><span>*</span> </label>
                                    <div class="col-md-6">
                                        <div class="input-group js-parent-focus">
                                            <input class="form-control js-child-focus js-visible-password" name="confirmPassword" type="password" value="" pattern=".{5,}" required >
                                          </div>
                                    </div>
                                    <div class="col-md-3 form-control-comment">              
                                    </div>
                                </div>{{-- 
                                <div class="form-group row ">
                                    <label class="col-md-3 form-control-label"> Birthdate </label>
                                    <div class="col-md-6">
                                        <input class="form-control" name="birthday" type="text" value="" placeholder="MM/DD/YYYY"> <span class="form-control-comment"> (E.g.: 05/31/1970) </span>
                                    </div>
                                    <div class="col-md-3 form-control-comment"> Optional </div>
                                 </div> --}}
                            </section>
                            <footer class="form-footer clearfix">
                              <input type="hidden" name="submitCreate" value="1">  
                                <button class="btn btn-primary form-control-submit float-xs-right" data-link-action="save-customer" type="submit">
                                  Save
                                </button> 
                            </footer>
                        </form>
                    </section>
                </section>
                <footer class="page-footer">
                    <!-- Footer content -->
                </footer>
            </section>
        </div>
    </div>
</section>

@endsection

