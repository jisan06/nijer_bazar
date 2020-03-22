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

    public function remove($rowId, Request $request)
    {  
        if($request->ajax())
        {
            Cart::remove($rowId);
            print_r(1);       
            return;
        }
       
    }

    public function update(Request $request)
    {   
        if($request->ajax())
        {
            Cart::update($request->rowId, $request->qty);
            print_r(1);       
            return;
        }
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

        $cart =  Cart::add(['id' => $products->id, 
            'name' => $products->name, 
            'qty' => 1, 
            'price' => $price, 
            'options' => ['image' => $image->images, 
            /*'old_price' => $product->price*/]]);
            $subtotal = Cart::subtotal();
            $total = str_replace(',', '', $subtotal);

        if(file_exists(@$image->images))
        {
            $image = asset('/'.@$image->images);
        }
        else
        {
            $image = asset('/public/frontend/no-image-icon.png');
        }
        $product = "";
        $product .= '<div class="row">';
        $product .= '<div class="col-md-5">';
        $product .= '<img class="product-image" src="'.@$image.'" alt="" title="" itemprop="image" style="height: 170px;width: 170px;">';
        $product .= '</div>';
        $product .= '<div class="col-md-7">';
        $product .= '<h6 class="h6 product-name">'.$products->name.'</h6>';
        $product .= '<span>Quantity:&nbsp;<strong>'.$cart->qty.'</strong></span>';
        $product .= '<p class="product-price">৳ '.$cart->price.'</p>';
        $product .= '</div>';
        $product .= '</div>';
            
        return response()->json([
            'product'=>$product,
            'total'=>$total,
            'cartCount'=>Cart::count(),
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

        $cart =  Cart::add(['id' => $products->id, 
            'name' => $products->name, 
            'qty' => $quantity, 
            'price' => $price, 
            'options' => ['image' => $image->images, 
            /*'old_price' => $product->price*/]]);
            $subtotal = Cart::subtotal();
            $total = str_replace(',', '', $subtotal); 

        if(file_exists(@$image->images))
        {
            $image = asset('/'.@$image->images);
        }
        else
        {
            $image = asset('/public/frontend/no-image-icon.png');
        }
        $product = "";
        $product .= '<div class="row">';
        $product .= '<div class="col-md-5">';
        $product .= '<img class="product-image" src="'.@$image.'" alt="" title="" itemprop="image" style="height: 170px;width: 170px;">';
        $product .= '</div>';
        $product .= '<div class="col-md-7">';
        $product .= '<h6 class="h6 product-name">'.$products->name.'</h6>';
        $product .= '<span>Quantity:&nbsp;<strong>'.$cart->qty.'</strong></span>';
        $product .= '<p class="product-price">৳ '.$cart->price.'</p>';
        $product .= '</div>';
        $product .= '</div>';
            
        return response()->json([
            'product'=>$product,
            'total'=>$total,
            'cartCount'=>Cart::count(),
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

    //Show each product in mini cart
    public function minicartProduct(Request $request){
        $data = "";
        $total = 0;
        if(Cart::count() > 0){
            $data .='<ul class="minicartProduct">';
            foreach(Cart::content() as $carts)
            {
                $name = str_replace(' ', '-', $carts->name);
                if(file_exists($carts->options->image))
                {
                    $image = asset('/'.@$carts->options->image);
                }
                else
                {
                    $image = asset('/public/frontend/no-image-icon.png');
                }

                $data .='<li class="parentRow_'.$carts->rowId.'">';
                $data .='<input type="hidden" name="rowId" class="rowId_'.$carts->rowId.'" value="'.$carts->rowId.'">';
                $data .='<div class="minicart-left">';
                $data .='<a href="'.url('product/'.@$carts->id.'/'.@$name).'"><img src="'.$image.'" ></a>';
                $data .='</div>';
                $data .='<div class="minicart-right">';
                $data .='<p class="product-title">';
                $data .='<a href="'.url('product/'.@$carts->id.'/'.@$name).'">'.$carts->name.'</a>';
                $data .='</p>';
                $data .='<p class="product-price ">৳ ';
                $data .='<span class="miniSubTotalPrice miniCartSubtotal_'.$carts->rowId.'">'.$carts->subtotal.'</span>';
                $data .='</p>';
                $data .='<p>Quantity: ';
                $data .='<span class="miniCartQty_'.$carts->rowId.'">'.$carts->qty.'</span> ';
                $data .='<a href="javascript:void(0)" class="remove-from-cart" style="float:right;cursor: pointer;" rel="nofollow" onclick="removeCartRow('."'".$carts->rowId."'".')" title="remove from cart">';
                $data .='<i class="material-icons">delete</i>';
                $data .='</a>';
                $data .='</p>';
                $data .='</div>';
                $data .='</li>';

                $total += $carts->subtotal;
            }

            $total = str_replace(',', '', $total);
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

            $grandTotal = $total + $shippingCharge;

            $data .='</ul>';
            $data .='<div class="cart-totals table table-bordered">';

            $data .='<div class="products">';
            $data .='<span class="label text-left">SubTotal</span>';
            $data .='<span class="value items_carts total-value miniTotal">৳ '.@$total.'</span>';
            $data .='</div>';

            $data .='<div class="products">';
            $data .='<span class="label text-left">Shipping Charge</span>';
            $data .='<span class="value items_carts total-value miniTotal">৳ '.@$shippingCharge.'</span>';
            $data .='</div>';

            $data .='<div class="total totalTop">';
            $data .='</div>';
            $data .='<div class="products">';
            $data .='<span class="label text-left">Total</span>';
            $data .='<span class="value items_carts total-value miniTotal">৳ '.@$grandTotal.'</span>';
            $data .='</div>';
            $data .='</div>';
            $data .='<div class="cart-action">';
            $data .='<a href="'.route('cart.index').'" class="btn btn-primary">Shopping Cart</a>';
            $data .='</div>';
        }else{
            $data .='<span class="no-items">There are no more items in your cart</span>';
        }

        echo $data;

    }

     //Show each product in main cart page
    public function MainCartProduct(Request $request){
        $data = "";
        $totalSummary = "";
        $total = 0;
        if(Cart::count() < 1){
            $disabled = "disabled";
        }else{
            $disabled = "";
        }
            if(Cart::count() > 0){
                $data .='<ul class="cart-items">';
                foreach(Cart::content() as $cart)
                {
                    $name = str_replace(' ', '-', $cart->name);
                    $products = Product::where('id',$cart->id)->first();
                    if(file_exists($cart->options->image))
                    {
                        $image = asset('/'.@$cart->options->image);
                    }
                    else
                    {
                        $image = asset('/public/frontend/no-image-icon.png');
                    }

                    $data .='<li class="cart-item parentRow_'.$cart->rowId.'">';
                    $data .='<div class="product-line-grid">';
                    $data .='<input type="hidden" name="rowId" class="rowId_'.$cart->rowId.'" value="'.$cart->rowId.'">';
                    $data .='<div class="product-line-grid-left col-md-2 col-xs-4">';
                    $data .='<span class="product-image media-middle">';
                    $data .='<img src="'.$image.'" style="height:100px;width:100px;">';
                    $data .='</span>';
                    $data .='</div>';
                    $data .='<div class="product-line-grid-body col-md-5 col-xs-8">';
                    $data .='<div class="product-line-info product-title">';
                    $data .='<a class="label" href="'.url('product/'.@$cart->id.'/'.@$name).'" data-id_customization="0">'.$cart->name.'</a>';
                    $data .='</div>';
                    $data .='<div class="product-line-info product-attributes">';
                    $data .='<span class="label">Code:</span>';
                    $data .='<span class="value">'.$products->deal_code.'</span>';
                    $data .='</div>';
                    $data .='<div class="product-line-info product-attributes">';
                    $data .='<span class="label">Quantity:</span>';
                    $data .='<span class="value">'.$cart->qty.'</span>';
                    $data .='</div>';
                    $data .='<div class="product-line-info product-price has-discount">';
                    $data .='<div class="current-price">';
                    $data .='<span class="product-price">৳ '.$cart->price.'</span>';
                    $data .='</div>';
                    $data .='</div>';
                    $data .='</div>';
                    $data .='<div class="product-line-grid-right product-line-actions col-md-5 col-xs-12">';
                    $data .='<div class="row">';
                    $data .='<div class="col-xs-4 hidden-md-up"></div>';
                    $data .='<div class="col-md-10 col-xs-6">';
                    $data .='<div class="row">';
                    $data .='<div class="col-md-6 col-xs-6 qty">';
                    $data .='<div class="input-group bootstrap-touchspin">';
                    $data .='<input id="inputQty_'.$cart->rowId.'" type="number" min="1" name="quantity" value="'.$cart->qty.'" oninput="UpdateShoppingCart('."'".$cart->rowId."'".')" style="width: 80px;" />';
                    $data .='</div>';
                    $data .='</div>';
                    $data .='<div class="col-md-6 col-xs-2 price">';
                    $data .='<span class="product-price">';
                    $data .='<strong>৳ '.$cart->subtotal.'</strong>';
                    $data .='</span>';
                    $data .='</div>';
                    $data .='</div>';
                    $data .='</div>';
                    $data .='<div class="col-md-2 col-xs-2 text-xs-right">';
                    $data .='<div class="cart-line-product-actions">';
                    $data .='<a href="javascript:void(0)" class="remove-from-cart" rel="nofollow" href="" onclick="removeCartRow('."'".$cart->rowId ."'".')">';
                    $data .='<i class="material-icons float-xs-left">delete</i>';
                    $data .='</a>';
                    $data .='</div>';
                    $data .='</div>';
                    $data .='</div>';
                    $data .='</div>';
                    $data .='<div class="clearfix"></div>';
                    $data .='</div>';
                    $data .='</li>';

                    $total += $cart->subtotal;
                }
                $data .='</ul>';

                $total = str_replace(',', '', $total);
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

                $grandTotal = $total + $shippingCharge;
                
            }else{
                $data .='<span class="no-items">There are no more items in your cart</span>';
            }

            $totalSummary .= '<div class="cart-detailed-totals">';
            $totalSummary .= '<div class="card-block">';
            $totalSummary .= '<div class="cart-summary-line" id="cart-subtotal-products">';
            $totalSummary .= '<span class="label js-subtotal">';
            $totalSummary .= Cart::count().' items';
            $totalSummary .= '</span>';
            $totalSummary .= '<span class="value">';
            $totalSummary .= '৳ '.Cart::subtotal();
            $totalSummary .= '</span>';
            $totalSummary .= '</div>';
            $totalSummary .= '</div>';
            $totalSummary .= '<div class="card-block cart-summary-totals">';

            $totalSummary .= '<div class="cart-summary-line">';
            $totalSummary .= '<span class="label">Sub Total&nbsp;</span>';
            $totalSummary .= '<span class="value"> ৳ '.$total.'</span>';
            $totalSummary .= '</div>';

            $totalSummary .= '<div class="cart-summary-line">';
            $totalSummary .= '<span class="label">Shipping Charge&nbsp;</span>';
            $totalSummary .= '<span class="value"> ৳ '.$shippingCharge.'</span>';
            $totalSummary .= '</div>';

            $totalSummary .= '<div class="totalTop"></div>';

            $totalSummary .= '<div class="cart-summary-line">';
            $totalSummary .= '<span class="label">Total&nbsp;</span>';
            $totalSummary .= '<span class="value"> ৳ '.$grandTotal.'</span>';
            $totalSummary .= '</div>';

            $totalSummary .= '</div>';
            $totalSummary .= '</div>';
            $totalSummary .= '<div class="checkout cart-detailed-actions card-block">';
            $totalSummary .= '<div class="text-sm-center">';
            $totalSummary .= '<a href="'.route('cart.checkout').'" class="btn btn-primary '.$disabled.'">Proceed to checkout</a>';
            $totalSummary .= '</div>';
            $totalSummary .= '</div>';

        return response()->json([
                'cartProduct'=>$data,
                'cartSummary'=>$totalSummary
            ]);
    }
        
}
