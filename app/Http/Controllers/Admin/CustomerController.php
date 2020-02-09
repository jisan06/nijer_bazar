<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Customer;
use App\Order;
use App\VerifyCustomer;
use App\CustomerGroup;
use App\Product;
use DB;
use Session;

class CustomerController extends Controller
{
    public function __construct()
    {

    }

    public function index()
    {
        $title = "Customer";
        $customers = Customer::orderBy('id','dsc')->get();
        return view('admin.customers.index')->with(compact('title','customers'));
    }

    public function customerAdd()
    {
        $title = 'Customer';
        $customerGroup = CustomerGroup::orderBy('groupName','asc')->get();
        return view('admin.customers.add')->with(compact('title','customerGroup'));
    }

    public function customerSave(Request $request)
    {
        $dob = date('Y-m-d', strtotime($request->dob));
      
        $this->validate(request(), [
            'customer_name' => 'required', 
            'phone_number' => 'required',
            'email' => 'required', 
            'client_group' => 'required', 
        ]);

        // $data = $request->all();
        // echo "<pre>";
        // print_r($data);
        // echo "</pre>";
        // exit();

        $customer = Customer::create( [
            'name' => $request->customer_name,            
            'gender' => $request->gender,            
            'dob' => $dob,            
            'clientGroup' => $request->client_group,            
            'mobile' => $request->phone_number,            
            'email' => $request->email,
            'address' => $request->address,                   
        ]);

        return redirect(route('customers.index'))->with('msg','Customer Successfuly Saved');
    }

    public function customerEdit($id)
    {
        $title = "Customer";
        $customerGroup = CustomerGroup::orderBy('groupName','asc')->get();
        $customer = Customer::where('id',$id)->first();
        return view('admin.customers.edit')->with(compact('title','customerGroup','customer'));
    }

    public function customerUpdate(Request $request)
    {
        $dob = date('Y-m-d', strtotime($request->dob));
      
        $this->validate(request(), [
            'customer_name' => 'required', 
            'phone_number' => 'required',
            'email' => 'required', 
            'client_group' => 'required', 
        ]);

        // $data = $request->all();
        // echo "<pre>";
        // print_r($data);
        // echo "</pre>";
        // exit();

        $customerId = $request->customerId;
        $customer = Customer::find($customerId);

        $customer->update( [
            'name' => $request->customer_name,            
            'gender' => $request->gender,            
            'dob' => $dob,            
            'clientGroup' => $request->client_group,            
            'mobile' => $request->phone_number,            
            'email' => $request->email,
            'address' => $request->address,                   
        ]);

        return redirect(route('customers.index'))->with('msg','Customer Successfuly Updated'); 
    }

    public function customerDelete(Request $request)
    {   
        Customer::where('id',$request->customerId)->delete();
    }

    public function customerDetails($id)
    {
        $customers = Customer::where('id',$id)->first();
        $customer_groups = CustomerGroup::where('groupStatus',1)->get();
        return view('admin.customers.customerDetails')->with(compact('customers','customer_groups'));
    }

    public function updateClientGroup(Request $request)
    {
        $customerId = $request->customerId;
        $customers = Customer::find($customerId);
        $clientGroup = implode(',', $request->clientGroup);
        $customers->update([
            'clientGroup' => $clientGroup,
        ]);
        return redirect(route('customers.index'))->with('msg','Customer Add to Group Successfully');    
    }

    // public function destroy(Customer $customer, Request $request)
    // {
    //     if($request->ajax())
    //     {
    //         $customer->delete();
    //         print_r(1);       
    //         return;
    //     }
    //     $customer->delete();
    //     return redirect(route('categories.index')) -> with( 'message', 'Deleted Successfully');
    // }

    public function showLoginForm()
    {
        $setReview = @$_GET['setReview'];
        return view('frontend.customer.login')->with(compact('setReview'));
    }

    public function login(Request $request)
    {
        $setReview = $request->setReview;
        if ($request) {
            $email = $request->input('custemail');
          $password = $request->input('password');
          $hasPassword = md5($request->input('password'));

          @$getEmail= DB::table('customers')->where(['email'=>$email])->first();

          @$countEmail= DB::table('customers')->where(['email'=>$email])->count();

          @$countPassword = DB::table('customers')->where(['password'=>$hasPassword])->count();

          @$customerId = $getEmail->id;
          @$customername = $getEmail->name;

          if ($email == "" || $password == "") {
          $message = "<h5 style='display:inline-block;width:auto;' class='alert alert-danger'>Field must not be empty</h5>"; 
          Session::put('message',$message); 
          return redirect('/customer/login')->withInput();
          }elseif ($countEmail < 1) {
            $message = "<h5 style='display:inline-block;width:auto;' class='alert alert-danger'>Your Email Address Not Matched</h5>"; 
            Session::put('message',$message); 
            return redirect(route('customer.login', ['setReview'=>@$setReview]))->withInput();
          }elseif($countPassword < 1){
            $message = "<h5 style='display:inline-block;width:auto;' class='alert alert-danger'>Sorry, Password Not Matched</h5>"; 
              Session::put('message',$message); 
              return redirect(route('customer.login',['setReview'=>$setReview]))->withInput();
          }else{
            if ($countEmail > 0) {
              Session::put('customerId',$customerId);
              Session::put('customerName',$customername);

              if(@$setReview){
                $products = Product::where('id',$setReview)->first();
                $name = str_replace(' ', '-', $products->name);
                return redirect(url('product/'.@$products->id.'/'.@$name.'?setReview='.$setReview));
              }else{

              }
              return redirect(route('customer.order'));

            }
          }
        }
    }

    public function passwordForget()
    {
        return view('frontend.customer.passwordforget');
    }

    public function passwordMail(Request $request)
    {
        $email = $request->email;

        $countCustomer = Customer::where('email',$email)->count();
        $customerEmail = Customer::where('email',$email)->first();

        // @$password = $customerEmail->storePassword;

        // $soapClient = new SoapClient("https://api2.onnorokomSMS.com/sendSMS.asmx?wsdl"); 
        // $paramArray = array( 
        //   'userName' => "01832967276", 
        //   'userPassword' => "3e3198", 
        //   'messageText' => "Your Driver Vara Password:".$password, 
        //   'numberList' => $phone, 
        //   'smsType' => "TEXT", 
        //   'maskName' => 'DemoMask', 
        //   'campaignName' => '', );                         

        if ($countCustomer <1)
        {
            $message = "<h4 style='display:inline-block;width:auto;' class='alert alert-danger'>Email Addresss is Not Registered</h4>"; 

            return redirect(route('password.forget'))->with('msg',$message)->withInput();
        }
        else
        {
            $message = "<h4 style='display:inline-block;width:auto;' class='alert alert-success'>Check your email inbox or spam</h4>"; 
            $subject = "Your Password Reset Link";

            $headers = "MIME-Version: 1.0" . "\r\n";
            $headers .= "Content-type:text/html;charset=UTF-8" . "\r\n";

                // More headers
            $headers .= 'From: <piqood@web.com>' . "\r\n";
            $headers .= 'Cc: superbnexus@gmail.com' . "\r\n";

            $link = "Your password reset link ".url('/customer/new-password/'.$email);

            mail($email, $subject, $link);
            return redirect(route('password.forget'))->with('msg',$message)->withInput();
        }
    }

    public function newPassword($email)
    {
        @$customer = Customer::where('email',$email)->first();
        if ($customer)
        {
            return view('frontend.customer.newpassword',['customer'=>$customer]);
        }
        else
        {
            return redirect('/customer/login');
        }
    }

    public function changePasswordSave(Request $request)
    {
        $this->validate($request,[
            'password' => 'required|same:confirmPassword',
            'confirmPassword' => 'required|min:6'
        ]);

        $allCustomer = Customer::where('email',$request->email)->first();
        $customerId = $allCustomer->id;
        $customer = Customer::find($customerId);
        $customer->password = md5($request->password);
        $customer->save();

        Session::put('customerId',$customerId);
        return redirect(route("customer.order"));
    }

    public function showRegistrationForm()
    {
        return view('frontend.customer.register');
    }

    public function customerRegister(Request $request)
    {
        $customers = new VerifyCustomer();
        $name = $request->input('name');
        $email = $request->input('email');
        $mobile = $request->input('mobile');
        $address = $request->input('address');
        $password = $request->input('password');
        $confirmPassword = $request->input('confirmPassword');

        @$getcustomerEmail = Customer::where('email',$email)->count();
        @$getcustomerPhone = Customer::where('mobile',$mobile)->count();

        $verifyCode = rand(100000,999999);

        $subject = "Email Confirmation";

        $headers = "MIME-Version: 1.0" . "\r\n";
        $headers .= "Content-type:text/html;charset=UTF-8" . "\r\n";

        // More headers
        $headers .= 'From: <naksighar@web.com>' . "\r\n";
        $headers .= 'Cc: superbnexus@gmail.com' . "\r\n";

        $message = $name." Confirm your email..Click given link <a href='https:".url('/confirm-link/').$verifyCode."'>Confirm</a>";


        if ($getcustomerEmail > 0)
        {
            $message = "<h5 style='display:inline-block;width:auto;' class='alert alert-danger'>This email address already registered</h5>";
            return redirect(route('customer.registration'))->with('msg',$message)->withInput();
        }
        elseif ($getcustomerPhone > 0)
        {
            $message = "<h5 style='display:inline-block;width:auto;' class='alert alert-danger'>This phone number already registered</h5>";
            return redirect(route('customer.registration'))->with('msg',$message)->withInput();
        }
        elseif ($password != $confirmPassword)
        {
            $message = "<h5 style='display:inline-block;width:auto;' class='alert alert-danger'>Password and Confirm Password Not Matched</h5>"; 
            return redirect(route('customer.registration'))->with('msg',$message)->withInput();
        }
        else
        {
            $customers->name = $name;
            $customers->email = $email;
            $customers->mobile = $mobile;
            $customers->address = $address;
            $customers->password = md5($request->password);
            $customers->confirmPassword = md5($request->confirmPassword);
            $customers->verifyCode = $verifyCode;
            $customers->save();

            mail($email, $subject, $message ,$headers);
            $message = "<h5 style='display:inline-block;width:auto;' class='alert alert-success'>Please check your email for confirmation</h5>"; 
            return redirect(route('customer.registration'))->with('msg',$message)->withInput();
        }   
    }

    public function verficationBox()
    {
        return view('frontend.customer.registerverify');
    }

    public function registerSave($verifyCode)
    {
        $getCustomer = VerifyCustomer::where('verifyCode',$verifyCode)->first();

        $countCustomer = VerifyCustomer::where('verifyCode',$verifyCode)->count();

        if ($countCustomer <1)
        {
            $message = "<h5 style='display:inline-block;width:auto;' class='alert alert-danger'>Wrong Confirmation Code</h5>"; 

        }
        else
        {
            $custmomer = new Customer();

            $custmomer->name = $getCustomer->name;
            $custmomer->email = $getCustomer->email;
            $custmomer->mobile = $getCustomer->mobile;
            $custmomer->address = $getCustomer->address;
            $custmomer->gender = $getCustomer->gender;
            $custmomer->password = $getCustomer->password;
            $custmomer->confirmPassword = $getCustomer->confirmPassword;
            $custmomer->save();

            $customerId = $custmomer->id;

            Session::put('customerId',$customerId);
            Session::put('customerName',$customername);

            $deleteverify = VerifyCustomer::where('verifyCode', $verifyCode);
            $deleteverify->delete();

            // $customerId = Session::get('customerId');
            // $getCustomer = Customer::where('id',$customerId)->first();

            return redirect(route('custmomer.order'));
        }
    }

    public function profile($id)
    {
        $customers = Customer::where('id',$id)->first();
        return view('frontend.customer.profile')->with(compact('customers'));
    }

    public function updateProfile(Request $request)
    {
        $customerId = $request->customerId;

        $customers = Customer::find($customerId);

        $customers->update( [           
            'name' => $request->name,              
            'email' => $request->email, 
            'mobile' => $request->mobile,            
            'address' => $request->address,                         
        ]);

        $message = "<h5 style='display:inline-block;width:auto;' class='alert alert-success'>Profile Updated Successfully</h5>"; 

        return redirect(route('customer.profile',$customerId))->with('msg',$message);    
    }

    public function shippingEmail()
    {
        return view('frontend.order.shippingEmail');
    }

    public function viewOrder(Request $request)
    {
        if ($request)
        {
            $email = $request->input('custemail');
            $getEmail = Customer::where('email',$email)->orWhere('mobile',$email)->first(); 
            @$countEmail= count($getEmail);
            if ($email == "")
            {
                $message = "<h5 style='display:inline-block;width:auto;' class='alert alert-danger'>Field must not be empty</h5>"; 
                Session::put('message',$message); 
                return redirect('/shipping-email')->withInput();
            }
            elseif ($countEmail < 1)
            {
                $message = "<h5 style='display:inline-block;width:auto;' class='alert alert-danger'>Your Email or Phone No Not Matched</h5>"; 
                Session::put('message',$message); 
                return redirect('/shipping-email')->withInput();
            }
            else
            {
                if ($countEmail > 0)
                {
                    Session::put('customerId',$getEmail->id);
                    Session::put('password',$getEmail->password);
                    return redirect(route('customer.order'));
                }
            }
        }
    }

    public function orderList()
    {
        $customerId = Session::get('customerId');
        $orderlist = DB::table('checkouts')
        ->join('transactions', 'checkouts.id', '=', 'transactions.checkout_id')
        ->where('transactions.reference',$customerId)
        ->select('checkouts.*', 'transactions.*')
        ->get();

        return view('frontend.order.orderlist')->with(compact('orderlist'));
    }

    public function orderDetails($id)
    {
        $orderlist = DB::table('orders')
        ->join('products', 'orders.product_id', '=', 'products.id')
        ->where('orders.checkout_id',$id)
        ->select('orders.*', 'products.name','products.deal_code')
        ->get();
        return view('frontend.order.orderDetails')->with(compact('orderlist'));
    }

    public function logout()
    {
        $customerId = Session::get('customerId');
        $customerName = Session::get('customerName');
        Session::forget('customerId');
        Session::forget('customerName');
        return redirect(route('home.index'));
    }
}
