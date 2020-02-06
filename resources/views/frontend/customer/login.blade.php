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
                    <h1 class="h1">Log in to your account</h1>
                </header>
                <section id="content" class="page-content card card-block">
                    <section class="login-form">
                        <?php
                            $message = Session::get('message');
                              if (isset($message)) {
                                echo $message;
                              }
                              Session::forget('message')   
                        ?>
                        <form id="login-form" action="{{route('customer.dologin')}}" method="post">
                            {{ csrf_field() }}
                            <section>
                                <input type="hidden" name="back" value="">                                         
                                <div class="form-group row ">
                                    <label class="col-md-3 form-control-label required">Email</label>
                                    <div class="col-md-6">
                                        <input class="form-control" name="custemail" type="email" value="{{old('custemail')}}"" required>
                                    </div>
                                    <div class="col-md-3 form-control-comment">                  
                                    </div>
                                </div>            
                                <div class="form-group row ">
                                    <label class="col-md-3 form-control-label required"> Password </label>
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
                                <div class="forgot-password" style="text-align: center;">
                                    <a href="{{url('/customer/password-forget')}}" rel="nofollow">
                                      Forgot your password?
                                    </a>
                                </div>
                            </section>   
                            <footer class="form-footer text-sm-center clearfix">
                                <input type="hidden" name="submitLogin" value="1">        
                                  <button id="submit-login" style="margin-top: 10px;" class="btn btn-primary" data-link-action="sign-in" type="submit" class="form-control-submit">
                                    Sign in
                                  </button>
                            </footer>
                        </form>
                    </section>
                    <hr/>     
                    <div class="no-account" style="text-align: center;">
                        <a href="{{url('/customer/registration')}}" data-link-action="display-register-form">
                          No account? Create one here
                        </a>
                    </div>
                </section>    
                <footer class="page-footer"> 
                    <!-- Footer content -->
                </footer>
            </section>
        </div>
    </div>
</section>


@endsection

