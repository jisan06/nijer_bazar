<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>
var fadeTime = 0;

window.onload = function(){
  minicartProduct();
  MainCartProduct();
}

//add cart
function addCart(productId){
        $.ajax({
        type: 'get',
        url: '<?php echo url('/cart/addItem');?>/'+ productId,
        dataType: "JSON",
        success: function(response) {
          $("#blockcart-modal").modal();
          var product = response.product;
          $('#product').html(product);
          $('#popup_productSubtotal').text("৳ " + response.total);
          $('#pop_cart_count').text(response.cartCount);

          itemcount();
          minicartProduct();
        }
        
      });
    };

  //add cart from single product page
  function addCartFromSingleProduct(productId){
    var quantity =  $('#quantity_wanted').val();
      $.ajax({
      type: 'get',
      url: '<?php echo url('/cart/addItemFromSingleProduct');?>/'+ productId+'/'+quantity,
      dataType: "JSON",
      success: function(response) {
        $("#blockcart-modal").modal();
        var product = response.product;
        $('#product').html(product);
        $('#popup_productSubtotal').text("৳ " + response.total);
        $('#pop_cart_count').text(response.cartCount);
        
        itemcount();
        minicartProduct();
        
      }
    });
  };

  function UpdateShoppingCart(rowId){
    var qty = $('#inputQty_'+rowId).val();
    $.ajaxSetup({
      headers: {
        'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
      }
    });
    $.ajax({
        type: "POST",
        url: "{{ route('carts.update') }}",
        dataType: "JSON",
        data: {
            rowId:rowId,
            qty:qty,
        },
        success: function(response) {
          minicartProduct();
          MainCartProduct();
          itemcount();
        },
    });
  }


 //remove from mini cart
    function removeCartRow(rowsId){
        $.ajax({
            type: "GET",
            url: "{!! url('carts') !!}" + "/" + rowsId+"/remove",
            dataType: "JSON",
            cache:false,
            contentType: false,
            processData: false,
            success: function(response) {
              minicartProduct();
              MainCartProduct();
              itemcount();
              recalculateCart();
            },
            error: function(response) {  
            }
        });
      };

      function recalculateCart()
      {
        var subtotal = 0;
        var miniSubtotal = 0;
        /* Sum up row totals */
        $('.cart-product-subtotal').each(function () {
          subtotal += parseInt($(this).children('.cart-sub-total-price').text());
        });

        $('.miniProductTotal').each(function () {
          miniSubtotal += parseInt($(this).children('.miniSubTotalPrice').text());
           /*console.log(miniSubtotal);*/
        });
        if(subtotal == 0){
          var shippingCharge = 0;
          $('#shippingCharge').text("0");
        }else{
          var shippingCharge = $('#shippingCharge').text();
        }

        if(miniSubtotal == 0){
          var miniShippingCharge = 0;
          $('#miniShippingCharge').text("0");
        }else{
          var miniShippingCharge = $('#miniShippingCharge').text();
        }

        var grand_total = parseInt(subtotal)+parseInt(shippingCharge);
        var miniTotal = parseInt(miniSubtotal)+parseInt(miniShippingCharge);

        /* Update totals display */
        $('.total-value').fadeOut(fadeTime, function() {
          $('.cart-subtotal').text("৳ " + subtotal);
          $('.cart-total-amount').html(grand_total);
          /*$('.miniSubtotal').text("৳ " + miniSubtotal);*/
          $('.miniTotal').html(miniTotal);
          $('.total-value').fadeIn(fadeTime);
          itemcount();
        });

      }
       
      function minicartProduct(){
        $.ajax({
                type: "GET",
                url: '<?php echo url('/cart/minicartProduct');?>',
                data:{},
                success:function(response){
                 $('#minicartProduct').html(response);
                }
            })
        }

      function MainCartProduct(){
        $.ajax({
          type: "GET",
          url: '<?php echo url('/cart/mainCartProduct');?>',
          data:{},
          success:function(response){
           $('#cartProduct').html(response.cartProduct);
           $('#cartSummary').html(response.cartSummary);
          }
        })
      }

    //subtotal for cart item
    function itemcount(){
    $.ajax({
              type: "GET",
              url: '<?php echo url('/cart/item');?>',
              data:{},
              success:function(response){
                var data = response.carts;
              /* $('#cart-item').html(data);*/
               $('.cart_count').html(data);
              }
          })
      }
</script>

