<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Product;
use App\ProductImage;
use App\ShippingCharges;
use Cart;

class CartController extends Controller
{
    public function index()
    {
        return view('frontend.carts.cart');
    } 

    public function addCart(Request $request){
        $image = ProductImage::where('productId',@$request->productId)->first();
        $products = Product::where('id',@$request->productId)->first();

        if ($products->discount) {
            $price = $products->discount;
        }else{
            $price = $request->productPrice;
        }

        Cart::add(['id' => $request->productId, 
            'name' => $request->productName, 
            'qty' => $request->productQuantity, 
            'price' => $price, 
            'options' => ['image' => $image->images/*, 
            'old_price' => $product->price*/]]);
        return redirect(route('cart.index'));
    }

    public function buyProduct(Request $request){
        $image = ProductImage::where('productId',@$request->productId)->first();
        $products = Product::where('id',@$request->productId)->first();

        if ($products->discount) {
            $price = $products->discount;
        }else{
            $price = $request->productPrice;
        }

        Cart::add(['id' => $request->productId, 
            'name' => $request->productName, 
            'qty' => $request->productQuantity, 
            'price' => $price, 
            'options' => ['image' => $image->images/*, 
            'old_price' => $product->price*/]]);
        return redirect(route('cart.index'));
    }

  
    public function remove($rowId, Request $request)
    {
        if($request->ajax())
        {
            Cart::remove($rowId);
            print_r(1);       
            return;
        }
        
    }

    public function update(Request $request, $rowId, $qty)
    {
        if($request->ajax())
        {
            Cart::update($rowId, $qty);
            print_r(1);       
            return;
        }
        return redirect(route('orders.cart'));
    }

    public function viewCart(Product $product_id, Request $request){
        if($request->ajax())
        {
            $viewproduct = Product::where('id',$product_id) ->first(); 
            print_r(1);     
            return;
        }

        return view('frontend.include.footer-bottom')->with(compact('viewproduct'));
    }

     public function addItem($id){
        $products = Product::where('id',$id)->first(); // get prodcut by id
        $image = ProductImage::where('productId',@$id)->first();

        if (@$products->discount) {
            $price = $products->discount;
        }else{
            $price = $products->price;
        }

        Cart::add(['id' => $products->id, 
            'name' => $products->name, 
            'qty' => 1, 
            'price' => $price, 
            'options' => ['image' => $image->images, 
            /*'old_price' => $product->price*/]]);
            $subtotal = Cart::subtotal();
            $total = str_replace(',', '', $subtotal);
            $shipping_charges = ShippingCharges::where('shippingStatus',1)->get();
            foreach($shipping_charges as $k ){ 
                $diff[abs($k->shippingAmount - $total)] = $k;
                 }

            if (@$k && $total) {
                ksort($diff, SORT_NUMERIC);
                $charge = current($diff);
                if (@$free_shipping) {
                    
                    $shippingCharge = 0;
                }else{
                    $shippingCharge = $charge->shippingCharge;
                }
                
            }else{
                $shippingCharge = 0;
                
            } 
            
        return response()->json([
                    'products'=>$products,
                    'shippingCharge'=>$shippingCharge,
                    'subtotal'=>$total

                ]);
    }

    public function addItemFromSingleProduct($id,$quantity){
        $products = Product::where('id',$id)->first(); // get prodcut by id
        $image = ProductImage::where('productId',@$id)->first();

        if (@$products->discount) {
            $price = $products->discount;
        }else{
            $price = $products->price;
        }

        Cart::add(['id' => $products->id, 
            'name' => $products->name, 
            'qty' => $quantity, 
            'price' => $price, 
            'options' => ['image' => $image->images, 
            /*'old_price' => $product->price*/]]);
            $subtotal = Cart::subtotal();
            $total = str_replace(',', '', $subtotal);
            $shipping_charges = ShippingCharges::where('shippingStatus',1)->get();
            foreach($shipping_charges as $k ){ 
                $diff[abs($k->shippingAmount - $total)] = $k;
                 }
            if (@$k && $total) {
                ksort($diff, SORT_NUMERIC);
                $charge = current($diff);
                if (@$free_shipping) {
                    
                    $shippingCharge = 0;
                }else{
                    $shippingCharge = $charge->shippingCharge;
                }
                
            }else{
                $shippingCharge = 0;
                
            } 

        return response()->json([
                    'products'=>$products,
                    'shippingCharge'=>$shippingCharge,
                    'subtotal'=>$total

                ]);
    }

    //Show Product number in cart
    public function cartItem(Request $request){
        $carts =  Cart::count();
        if($request->ajax())
            {
                return response()->json([
                    'carts'=>$carts
                ]);
            }
    }
    
    //Show Product total cost in cart
     public function minicartSubtotal(Request $request){
        $carts =  Cart::subtotal();
        if($request->ajax())
            {
                return response()->json([
                    'carts'=>$carts
                ]);
            }
    }


     /*public function minicartProduct(Request $request){
            $minicartProduct = [];
            foreach (Cart::content() as $carts) { 
                $name =  str_slug($carts->name);
                $removeId = "'".$carts->rowId."'";
                  $allproduct ='<li class="parentRow_'.$carts->rowId.'
                                  <input type="hidden" name="rowId" class="rowId_'.$carts->rowId.'." value="'.$carts->rowId.'">
                                      <div class="minicart-left">
                                      <a href="'.url('product/'.@$carts->id.'/'.@$name).'"><img src="'.asset('/').$carts->options->image.'">
                                      </a>
                                      </div>
                                      <div class="minicart-right">
                                        <p class="product-title"><a href="'.url('product/'.@$carts->id.'/'.@$name).'">'. $carts->name.'</a></p>
                                        <p class="product-price">৳ <span class="miniSubTotalPrice miniCartSubtotal_'.$carts->rowId.'">'.$carts->subtotal.'</span></p>
                                        <p>Quantity: <span class="miniCartQty_'.$carts->rowId.'">'.$carts->qty.'</span> <a class="remove-from-cart" style="float:right;cursor: pointer;" rel="nofollow" onclick="removeCartRow('.$removeId .')" title="remove from cart"><i class="material-icons">delete</i></a></p>
                                      </div>
                                </li>';
               array_push($minicartProduct, $allproduct);      
            }
            $totalAmount = Cart::subtotal();
            $total = str_replace(',', '', $totalAmount); 
            
        if($request->ajax())
            {
                return response()->json([
                    'minicartProduct'=>$minicartProduct,
                    'subtotal'=>$totalAmount,
                ]);
            } 
    }*/

    //Show each product in mini cart
    public function minicartProduct(Request $request){
              $cartProduct ='
                    <ul class="minicartProduct">'.
                      $total = 0
                      foreach(Cart::content() as $carts){
                      $name =  str_replace(' ', '-', $carts->name);
                      if(file_exists($carts->options->image)){
                            $image = asset('/'.@$carts->options->image);
                        }else{
                            $image = asset('/public/frontend/no-image-icon.png');
                        }
                      .'
                      <li class="parentRow_'.$carts->rowId.'">
                        <input type="hidden" name="rowId" class="rowId_'.$carts->rowId.'" value=".'$carts->rowId.'">
                        <div class="minicart-left">
                          <a href=".'url('product/'.@$carts->id.'/'.@$name).'"><img src="'.$image.'" >
                          </a>
                        </div>
                        <div class="minicart-right">
                          <p class="product-title">
                            <a href="'.url('product/'.@$carts->id.'/'.@$name).'">
                              '.$carts->name.'
                            </a>
                          </p>
                          <p class="product-price ">৳ 
                            <span class="miniSubTotalPrice miniCartSubtotal_'.$carts->rowId.'">
                              '.$carts->subtotal.'
                            </span>
                          </p>
                          <p>Quantity: 
                            <span class="miniCartQty_'.$carts->rowId.'">
                              '.$carts->qty.'
                            </span> 
                            <a class="remove-from-cart" style="float:right;cursor: pointer;" rel="nofollow" onclick="removeCartRow('.$carts->rowId.')" title="remove from cart">
                              <i class="material-icons">delete</i>
                            </a>
                          </p>
                        </div>
                      </li>'.
                      $total += $carts->subtotal;
                      }
                .'
                    </ul>
                    <div class="cart-totals table table-bordered">
                      <div class="products">
                        <span class="label text-left">Subtotal</span>
                        <span class="text-right total-value miniSubtotal">৳ '.$total.'</span>
                      </div>
                      <div class="total">
                        <span class="label">Total</span>
                        <span class="value items_carts total-value miniTotal">৳ '.@$grand_total.'</span>
                      </div>
                    </div>
                    <div class="cart-action">
                      <a href="'.route('cart.index').'" class="btn btn-primary">Shopping Cart</a>
                    </div>
              ';

            dd($cartProduct);
            die();
            
        if($request->ajax())
            {
                return response()->json([
                    'cartProduct'=>$cartProduct
                ]);
            } 
    }

}
