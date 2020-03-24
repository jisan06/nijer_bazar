<?php

//admin panel start here

Auth::routes();

Route::prefix('admin')->group(function()
{
	Route::middleware('auth:admin')->group(function(){
	Route::group(['middleware'=>'menuPermission'],function(){
		Route::get('/','HomeController@index')->name('admin.index');

		/*Dashboard Link*/
		Route::get('/running-product', 'Admin\ProductController@runningProduct')->name('product.running');
		Route::get('/monthly-sales/{id}', 'Admin\OrderController@monthlySales');

		//route for pending, complete, processing, shipping orders
		Route::get('/customer-item-request','Admin\OrderController@CustomerRequestItemList')->name('customer.itemRequest');
		Route::get('/customer-item-request-details/{id}','Admin\OrderController@CustomerRequestItemDetails')->name('customer.itemRequestDetails');
		Route::post('/customer-item-request-delete', 'Admin\OrderController@CustomerRequestItemDelete')->name('customer.itemRequestDelete');

		Route::get('/new-order','Admin\OrderController@neworderList')->name('order.new');
		Route::get('/processing-order', 'Admin\OrderController@processingOrder')->name('order.processing');
		Route::get('/shipping-order', 'Admin\OrderController@shippingOrder')->name('order.shipping');
		Route::get('/complete-orderlist', 'Admin\OrderController@completeorderList')->name('orderlist.complete');
		Route::post('/order-delete', 'Admin\OrderController@deleteOrder')->name('order.delete');

		//route for order list of each order
		Route::get('/list-product/{id}', 'Admin\OrderController@listProduct')->name('list.product');
		Route::get('/ordersQuantity/{rowId}/update/{quantity}', 'Admin\OrderController@updateQuantity')->name('orders.updateQuantity');
		Route::get('/ordersPrice/{rowId}/update/{price}', 'Admin\OrderController@updatePrice')->name('orders.updatePrice');
		
		//View Invoice Section
		Route::get('/invoices/{id}', 'Admin\OrderController@invoices')->name('view.invoices');
		Route::get('/download-invoices/{checkoutId}', 'Admin\OrderController@downloadInvoices')->name('download.invoices');
		Route::get('/view-pdf/{checkoutId}', 'Admin\OrderController@viewPdf')->name('view.pdf');

		Route::get('/add-to-invoice/{orderId}', 'Admin\InvoiceController@addtoInvoice');
		Route::get('/remove-from-invoice/{orderId}', 'Admin\InvoiceController@deletefromInvoice');
		Route::get('/view-invoice/{invoiceId}', 'Admin\InvoiceController@viewInvoice');
		Route::get('/view-invoice-pdf/{invoiceId}', 'Admin\InvoiceController@manualInvoicePdf')->name('manualInvoice.pdf');
		
		//Start Category Section
		Route::resource('categories', 'Admin\CategoryController');
		Route::get('/category-add', 'Admin\CategoryController@addcategory')->name('categoryadd.page');

		Route::post('/category-save', 'Admin\CategoryController@savecategory')->name('category.save');

		Route::get('/categories/status/{id}', 'Admin\CategoryController@changecategoryStatus')->name('categories.changecategoryStatus');

		Route::get('/category-edit/{id}', 'Admin\CategoryController@editCategory')->name('category.edit');

		Route::post('/category-update', 'Admin\CategoryController@updateCategory')->name('category.update');

		Route::get('/category-delete/{id}', 'Admin\CategoryController@deleteCategory')->name('category.delete');

		//End Category Section

		//Start Shipping charge configuration

		Route::resource('shippingCharges', 'Admin\ShippingChargeController');
		Route::get('/shipping-charge-add', 'Admin\ShippingChargeController@addcharge')->name('chargeadd.page');
		Route::post('/shipping-charge-save', 'Admin\ShippingChargeController@savecharge')->name('shippingCharge.save');

		Route::get('/shipping-charge/status/{id}', 'Admin\ShippingChargeController@shippingChargeStatus')->name('shippingCharge.shippingChargeStatus');

		Route::get('/shipping-charge-edit/{id}', 'Admin\ShippingChargeController@editCharge')->name('shippingCharge.edit');

		Route::post('/shipping-charge-update', 'Admin\ShippingChargeController@updateCharge')->name('shippingCharge.update');

		Route::get('/shipping-charge-delete/{id}', 'Admin\ShippingChargeController@deleteCharge')->name('shippingCharge.delete');
		Route::post('/shipping-charge-delete', 'Admin\ShippingChargeController@destroy')->name('shippingCharges.deletes');

		//End Shipping charge configuration

		//Start Customer Group Section
		Route::resource('customerGroups', 'Admin\CustomerGroupController');
		Route::get('/customer-group-add', 'Admin\CustomerGroupController@addCustomerGroup')->name('customerGroup.add');
		Route::post('/save-customer-group', 'Admin\CustomerGroupController@saveCustomerGroup');
		Route::get('/customer-groups/status/{id}', 'Admin\CustomerGroupController@status')->name('customerGroup.status');

		Route::get('/edit-customer-group/{id}', 'Admin\CustomerGroupController@edit')->name('customerGroup.edit');

		Route::post('/update-customer-group', 'Admin\CustomerGroupController@updateCustomerGroup');

		Route::get('/shipping-charge-delete/{id}', 'Admin\CustomerGroupController@deleteCustomerGroup')->name('customerGroup.delete');
		Route::post('/customer-group-delete', 'Admin\CustomerGroupController@destroy')->name('customerGroup.deletes');

		//End Customer Group Section

		//Start Product Section
		Route::resource('products', 'Admin\ProductController');

		Route::get('/product-add', 'Admin\ProductController@addproduct')->name('productadd.page');

		Route::get('/products/status/{id}', 'Admin\ProductController@changeStatus')->name('products.changeStatus');	

		Route::post('/product-save', 'Admin\ProductController@saveProduct')->name('productSetupBasicInfo.save');

		Route::post('/advanceproduct-save', 'Admin\ProductController@advnceProduct')->name('productadvance.save');

		Route::post('/productseo-save', 'Admin\ProductController@productSeo')->name('productseo.save');

		Route::post('/productprice-save', 'Admin\ProductController@productPrcie')->name('productPrice.save');

		Route::post('/productothers-save', 'Admin\ProductController@productOthers')->name('productOthers.save');

		Route::get('/product-edit/{id}', 'Admin\ProductController@editProduct')->name('product.edit');

		Route::post('/product-update', 'Admin\ProductController@updateProduct')->name('productSetupBasicInfo.update');

		Route::post('/single-product-destroy', 'Admin\ProductController@destroy')->name('single-product-destroy');

		Route::get('/product-quick-update', 'Admin\ProductController@ProductQuickUpdateList')->name('product.quickUpdateList');
		Route::post('/product-quick-update', 'Admin\ProductController@ProductQuickUpdate')->name('product.quickUpdate');

		//route for flash sell
		Route::get('/flash-sell', 'Admin\ProductController@FlashSell')->name('flashSell');
		Route::post('/flash-sell-update', 'Admin\ProductController@FlashSellUpdate')->name('flashSell.update');

		//image upload from ajax request
		Route::post('/upload-image', 'Admin\ProductController@saveProductImage')->name('productImage.save');
		Route::post('/remove-image', 'Admin\ProductController@deleteProductImage')->name('productImage.delete');

		Route::post('/productadvance-update', 'Admin\ProductController@updateProductAdvanceInfo')->name('productSetupAdvanceInfo.update');

		Route::post('/productseo-update', 'Admin\ProductController@updateProductSeoInfo')->name('productSetupSeoInfo.update');
		Route::post('/productothers-update', 'Admin\ProductController@updateProductOthers')->name('productOthers.update');

		Route::get('/product-delete/{id}', 'Admin\ProductController@deleteProduct')->name('product.delete');

		//end Product Section

		//Checkout section

		Route::resource('checkouts', 'Admin\CheckoutController');
		Route::get('/checkouts/{id}/status', 'Admin\CheckoutController@status')->name('checkouts.status');

		
		//end Checkout section

		//Customer Section
		Route::resource('customers', 'Admin\CustomerController');
		// Route::get('/customer-add', 'Admin\CustomerController@customerAdd')->name('customer.customerAdd');
		// Route::post('/customer-save', 'Admin\CustomerController@customerSave')->name('customer.customerSave');
		// Route::get('/customer-edit/{id}', 'Admin\CustomerController@customerEdit')->name('customer.customerEdit');
		// Route::post('/customer-update', 'Admin\CustomerController@customerUpdate')->name('customer.customerUpdate');
		Route::post('/customer-delete', 'Admin\CustomerController@customerDelete')->name('customer.customerDestroy');

		Route::get('/customer-details/{id}', 'Admin\CustomerController@customerDetails')->name('customer.customerDetails');
		Route::post('/update-clientGroup', 'Admin\CustomerController@updateClientGroup')->name('update.clientGroup');

		//end customer section


		/*
			All Setings start here
		*/

		//Start Menu Section
		Route::resource('menu', 'Admin\MenuController');
		Route::get('/menu-add', 'Admin\MenuController@addmenu')->name('menuadd.page');
		Route::post('/menu-save', 'Admin\MenuController@savemenu')->name('menu.save');
		Route::get('/menu/status/{id}', 'Admin\MenuController@changeStatus')->name('menu.changeStatus');
		Route::get('/menu-edit/{id}', 'Admin\MenuController@editmenu')->name('menu.edit');
		Route::post('/menu-update', 'Admin\MenuController@updatemenu')->name('menu.update');
		Route::get('/menu-delete/{id}', 'Admin\MenuController@deleteMenu')->name('menu.delete');


		//Sliders Section
		Route::resource('sliders', 'Admin\SliderController');
		Route::get('/slider-add', 'Admin\SliderController@addslider')->name('slideradd.page');
		Route::post('/slider-save', 'Admin\SliderController@saveslider')->name('slider.save');

		Route::get('/sliders/status/{id}', 'Admin\SliderController@changeStatus')->name('sliders.changeStatus');

		Route::get('/slider-status/{id}', 'Admin\SliderController@sliderStatus')->name('slider.status');

		Route::get('/slider-edit/{id}', 'Admin\SliderController@editSlider')->name('slider.edit');
		Route::post('/slider-update', 'Admin\SliderController@updateSlider')->name('slider.update');
		Route::get('/slider-delete/{id}', 'Admin\SliderController@deleteSlider')->name('slider.delete');
		
		/*Route::resource('featuredSliders', 'FeaturedSliderController');
		Route::resource('featuredImages', 'FeaturedImageController');*/

		//Site Information section

		Route::get('/website-information', 'Admin\SettingsController@information')->name('site.info');
		Route::post('/update-information', 'Admin\SettingsController@updatSettings')->name('settings.update');
		Route::get('/admin-logo', 'Admin\SettingsController@adminLogo')->name('admin.logo');
		Route::post('/adminLogo-update', 'Admin\SettingsController@updatadminLogo')->name('adminLogo.update');

		// policies section such as : money back, free shipping, online support

		Route::resource('policies', 'Admin\PoliciesController');
		Route::get('/policies-add', 'Admin\PoliciesController@addpolicies')->name('policyadd.page');

		Route::post('/policy-save', 'Admin\PoliciesController@savepolicy')->name('policy.save');

		Route::get('/policies/status/{id}', 'Admin\PoliciesController@changepolicyStatus')->name('policies.changepolicyStatus');

		Route::get('/policy-edit/{id}', 'Admin\PoliciesController@editPolicy')->name('policy.edit');

		Route::post('/policy-upate', 'Admin\PoliciesController@updatePolicy')->name('policy.update');
		Route::get('/policy-delete/{id}', 'Admin\PoliciesController@deletePolicy')->name('policy.delete');

		// Banner advertize section

		Route::resource('banners', 'Admin\BannersController');
		Route::get('/banners-add', 'Admin\BannersController@addbanner')->name('banneradd.page');

		Route::post('/banner-save', 'Admin\BannersController@savebanner')->name('banner.save');

		Route::get('/banners/status/{id}', 'Admin\BannersController@changebannerStatus')->name('banners.changebannerStatus');

		Route::get('/banner-edit/{id}', 'Admin\BannersController@editBanner')->name('banner.edit');

		Route::post('/banner-upate', 'Admin\BannersController@updateBanner')->name('banner.update');
		Route::get('/banner-delete/{id}', 'Admin\BannersController@deleteBanner')->name('banner.delete');

		//Social Link section

		Route::get('/social-information', 'Admin\SocialController@information')->name('social.info');
		Route::post('/update-social', 'Admin\SocialController@updatSocials')->name('socials.update');

		//Contact Information
		
		Route::resource('contacts', 'Admin\ContactController');
		Route::get('/contact-details/{id}', 'Admin\ContactController@contactDetails')->name('contact.contactDetails');

		//Customer Review Here

		Route::resource('reviews', 'Admin\ReviewController');
		Route::get('/review-details/{id}', 'Admin\ReviewController@reviewDetails')->name('review.reviewDetails');
		Route::get('/review/status/{id}', 'Admin\ReviewController@changereviewStatus')->name('reviews.changereviewStatus');

		//About Us section

		Route::get('/about-us', 'Admin\AboutController@aboutUs')->name('about.us');
		Route::post('/about-update', 'Admin\AboutController@updatAbout')->name('about.update');

		//Faq Manage here

		Route::resource('faqs', 'Admin\FaqController');
		Route::get('/faq-add', 'Admin\FaqController@addfaq')->name('faqadd.page');
		Route::post('/faq-save', 'Admin\FaqController@savefaq')->name('faq.save');
		Route::get('/faq/status/{id}', 'Admin\FaqController@changeStatus')->name('faqs.changeStatus');
		Route::get('/faq-edit/{id}', 'Admin\FaqController@editfaq')->name('faq.edit');
		Route::post('/faq-update', 'Admin\FaqController@updatefaq')->name('faq.update');
		Route::get('/faq-delete/{id}', 'Admin\FaqController@deletefaq')->name('faq.delete');

		//Delivery Policy section manage

		Route::get('/delivey-policy', 'Admin\DeliveryPolicyController@deliveryPolicy')->name('delivery.policy');
		Route::post('/deliveryPolicy-update', 'Admin\DeliveryPolicyController@updatdeliveryPolicy')->name('deliveryPolicy.update');

		//Payment Policy section manage

		Route::get('/payment-policy', 'Admin\PaymentPolicyController@paymentPolicy')->name('payment.policy');
		Route::post('/paymentPolicy-update', 'Admin\PaymentPolicyController@updatpaymentPolicy')->name('paymentPolicy.update');

		//Refund Policy section manage

		Route::get('/refund-policy', 'Admin\RefundsController@refundPolicy')->name('refund.policy');
		Route::post('/refundPolicy-update', 'Admin\RefundsController@updatrefundPolicy')->name('refundPolicy.update');

		//Help Center section manage

		Route::get('/help-center', 'Admin\HelpCenterController@helpCenter')->name('help.center');
		Route::post('/helpCenter-update', 'Admin\HelpCenterController@updatelpCenter')->name('helpCenter.update');

		//Start Blog Section

		Route::resource('blogs', 'Admin\BlogController');
		Route::get('/blog-add', 'Admin\BlogController@addblog')->name('blogadd.page');

		Route::post('/blog-save', 'Admin\BlogController@saveblog')->name('blog.save');

		Route::get('/blogs/status/{id}', 'Admin\BlogController@changeblogStatus')->name('blogs.changeblogStatus');

		Route::get('/blog-edit/{id}', 'Admin\BlogController@editBlog')->name('blog.edit');

		Route::post('/blog-update', 'Admin\BlogController@updateBlog')->name('blog.update');

		Route::get('/blog-delete/{id}', 'Admin\BlogController@deleteBlog')->name('blog.delete');

		//End Blog Section

		//News letter subscribe section here

		Route::resource('subscribers', 'Admin\NewsletterController');

		//Terms and Condition Manage

		Route::get('/terms-condition', 'Admin\TermsController@termsCondition')->name('terms.condition');
		Route::post('/termsCondition-update', 'Admin\TermsController@updatetermsCondition')->name('termsCondition.update');

		//User Menu 
		Route::get('/user-menu', 'Admin\UserMenuController@index')->name('usermenu.index');
		Route::get('/user-menu/add', 'Admin\UserMenuController@add')->name('usermenu.add');
		Route::post('/user-menu/save', 'Admin\UserMenuController@save')->name('usermenu.save');
		Route::get('/user-menu/edit/{id}', 'Admin\UserMenuController@edit')->name('usermenu.edit');
		Route::post('/user-menu/update', 'Admin\UserMenuController@update')->name('usermenu.update');
		Route::get('/user-menu/status', 'Admin\UserMenuController@status')->name('usermenu.status');
		Route::post('/usermenu-delete', 'Admin\UserMenuController@destroy')->name('usermenu-delete');

		//End User Menu

		//User Menu link action
		Route::get('/user-menu-link/{id}', 'Admin\UserMenuController@usermenuLink')->name('usermenuLink.index');
		Route::get('/user-menu-link-add/{menuId}', 'Admin\UserMenuController@usermenuLinkAdd')->name('userMenu.ActionLinkAdd');
		Route::post('/user-menu-link-save/{parentMenuId}', 'Admin\UserMenuController@usermenuLinkSave')->name('userMenu.ActionLinkSave');
		Route::get('/user-menu-link-edit/{menuId}/{id}', 'Admin\UserMenuController@usermenuLinkEdit')->name('userMenu.ActionLinkEdit');
		Route::post('/user-menu-link-update/{parentMenuId}', 'Admin\UserMenuController@usermenuLinkUpdate')->name('userMenu.ActionLinkUpdate');
		Route::get('/user-menu-action/status', 'Admin\UserMenuController@actionStatus')->name('usermenuAction.status');
		Route::post('/user-menu-action/delete', 'Admin\UserMenuController@actionDestroy')->name('usermenuAction.delete');

		//User Manage

		Route::resource('users', 'Admin\AdminController');
		Route::get('/user-add', 'Admin\AdminController@adduser')->name('useradd.page');

		Route::post('/user-save', 'Admin\AdminController@saveuser')->name('user.save');

		Route::get('/user/status/{id}', 'Admin\AdminController@changeuserStatus')->name('user.changeuserStatus');

		Route::get('/user-edit/{id}', 'Admin\AdminController@edituser')->name('user.edit');

		Route::post('/user-upate', 'Admin\AdminController@updateuser')->name('user.update');
		Route::get('/user-password/{id}', 'Admin\AdminController@password')->name('user.password');

		Route::get('/user-profile/{id}', 'Admin\AdminController@userProfile')->name('user.profile');

		Route::post('/user-changePassword', 'Admin\AdminController@passwordChange')->name('user.changePassword');

		//User Roll Manage

		Route::resource('user-roles', 'Admin\UserRoleController');
		Route::get('/user-role-add', 'Admin\UserRoleController@adduserRole')->name('userRoleAdd.page');

		Route::post('/user-role-save', 'Admin\UserRoleController@saveuserRole')->name('userRole.save');

		Route::get('/userRole/status/{id}', 'Admin\UserRoleController@changeuserRoleStatus')->name('userRole.changeuserRoleStatus');

		Route::get('/user-role-edit/{id}', 'Admin\UserRoleController@edituserRole')->name('userRole.edit');

		Route::post('/user-role-upate', 'Admin\UserRoleController@updateuserRole')->name('userRole.update');
		Route::get('/user-role-permission/{id}', 'Admin\UserRoleController@permission')->name('userRole.permission');
		Route::post('/user-role-permission-update', 'Admin\UserRoleController@permissionUpdate')->name('userRole.permissionUpdate');

		//vendor setup
		Route::get('/vendors', 'Admin\VendorController@index')->name('vendor.index');
		Route::get('/vendor-add', 'Admin\VendorController@add')->name('vendor.add');
		Route::post('/vendor-save', 'Admin\VendorController@save')->name('vendor.save');
		Route::get('/vendor-edit/{id}', 'Admin\VendorController@edit')->name('vendor.edit');
		Route::post('/vendor-update', 'Admin\VendorController@update')->name('vendor.update');
		Route::get('/vendor/status', 'Admin\VendorController@status')->name('vendor.status');
		Route::post('/vendor-delete', 'Admin\VendorController@destroy')->name('vendor-delete');

		//Cash Purchase setup
		Route::get('/cash-purchase', 'Admin\CashPurchaseController@index')->name('cashPurchase.index');
		Route::get('/cash-purchase/add', 'Admin\CashPurchaseController@add')->name('cashPurchase.add');
		Route::post('/cash-purchase/save', 'Admin\CashPurchaseController@save')->name('cashPurchase.save');
		Route::get('/cash-purchase/edit/{id}', 'Admin\CashPurchaseController@edit')->name('cashPurchase.edit');
		Route::post('/cash-purchase/update', 'Admin\CashPurchaseController@update')->name('cashPurchase.update');
		Route::post('/cash-purchase/destroy', 'Admin\CashPurchaseController@destroy')->name('cashPurchase.destroy');

		//Credit Purchase Setup
		Route::get('/credit-purchase', 'Admin\CreditPurchaseController@index')->name('creditPurchase.index');
		Route::get('/credit-purchase/add', 'Admin\CreditPurchaseController@add')->name('creditPurchase.add');
		Route::post('/credit-purchase/save', 'Admin\CreditPurchaseController@save')->name('creditPurchase.save');
		Route::get('/credit-purchase/edit/{id}', 'Admin\CreditPurchaseController@edit')->name('creditPurchase.edit');
		Route::post('/credit-purchase/update', 'Admin\CreditPurchaseController@update')->name('creditPurchase.update');
		Route::post('/credit-purchase/destroy', 'Admin\CreditPurchaseController@destroy')->name('creditPurchase.destroy');

		//Purchase Order
		Route::get('/purchase-order', 'Admin\PurchaseOrderController@index')->name('purchaseOrder.index');
		Route::get('/purchase-order/add', 'Admin\PurchaseOrderController@add')->name('purchaseOrder.add');
		Route::post('/purchase-order/save', 'Admin\PurchaseOrderController@save')->name('purchaseOrder.save');
		Route::get('/purchase-order/edit/{id}', 'Admin\PurchaseOrderController@edit')->name('purchaseOrder.edit');
		Route::post('/purchase-order/update', 'Admin\PurchaseOrderController@update')->name('purchaseOrder.update');
		Route::get('/purchase-order/view/{id}', 'Admin\PurchaseOrderController@view')->name('purchaseOrder.view');
		Route::post('/purchase-order/destroy', 'Admin\PurchaseOrderController@destroy')->name('purchaseOrder.destroy');

		//Purchase Order Receive
		Route::get('/purchase-order-receive', 'Admin\PurchaseOrderReceiveController@index')->name('purchaseOrderReceive.index');
		Route::get('/purchase-order-receive/add', 'Admin\PurchaseOrderReceiveController@add')->name('purchaseOrderReceive.add');
		Route::post('/purchase-order-receive/save', 'Admin\PurchaseOrderReceiveController@save')->name('purchaseOrderReceive.save');
		Route::get('/purchase-order-receive/edit/{id}', 'Admin\PurchaseOrderReceiveController@edit')->name('purchaseOrderReceive.edit');
		Route::post('/purchase-order-receive/update', 'Admin\PurchaseOrderReceiveController@update')->name('purchaseOrderReceive.update');
		Route::post('/purchase-order-receive/destroy', 'Admin\PurchaseOrderReceiveController@destroy')->name('purchaseOrderReceive.destroy');
		Route::post('/get-purchase-order', 'Admin\PurchaseOrderReceiveController@getPurchaseOrderItem')->name('getPurchaseOrderItem');

		//Chase Sales setup
		Route::get('/cash-sale', 'Admin\CashSaleController@index')->name('cashSale.index');
		Route::get('/cash-sale/add', 'Admin\CashSaleController@add')->name('cashSale.add');
		Route::post('/cash-sale/save', 'Admin\CashSaleController@save')->name('cashSale.save');
		Route::get('/cash-sale/edit/{id}', 'Admin\CashSaleController@edit')->name('cashSale.edit');
		Route::post('/cash-sale/update', 'Admin\CashSaleController@update')->name('cashSale.update');
		Route::post('/cash-sale/destroy', 'Admin\CashSaleController@destroy')->name('cashSale.destroy');

		//Credit Sales setup
		Route::get('/credit-sale', 'Admin\CreditSaleController@index')->name('creditSale.index');
		Route::get('/credit-sale/add', 'Admin\CreditSaleController@add')->name('creditSale.add');
		Route::post('/credit-sale/save', 'Admin\CreditSaleController@save')->name('creditSale.save');
		Route::get('/credit-sale/edit/{id}', 'Admin\CreditSaleController@edit')->name('creditSale.edit');
		Route::post('/credit-sale/update', 'Admin\CreditSaleController@update')->name('creditSale.update');
		Route::post('/credit-sale/destroy', 'Admin\CreditSaleController@destroy')->name('creditSale.destroy');

		//Credit Collection setup
		Route::get('/credit-collection', 'Admin\CreditCollectionController@index')->name('creditCollection.index');
		Route::get('/credit-collection/add', 'Admin\CreditCollectionController@add')->name('creditCollection.add');
		Route::post('/credit-collection/save', 'Admin\CreditCollectionController@save')->name('creditCollection.save');
		Route::get('/credit-collection/edit/{id}', 'Admin\CreditCollectionController@edit')->name('creditCollection.edit');
		Route::post('/credit-collection/update', 'Admin\CreditCollectionController@update')->name('creditCollection.update');
		Route::post('/credit-collection/destroy', 'Admin\CreditCollectionController@destroy')->name('creditCollection.destroy');
		Route::post('/get-client-info', 'Admin\CreditCollectionController@getClientInfo')->name('getClientInfo');

		//Client Entry setup
		Route::get('/client-entry', 'Admin\ClientEntryController@index')->name('clientEntry.index');
		Route::get('/client-entry/add', 'Admin\ClientEntryController@add')->name('clientEntry.add');
		Route::post('/client-entry/save', 'Admin\ClientEntryController@save')->name('clientEntry.save');
		Route::get('/client-entry/edit/{id}', 'Admin\ClientEntryController@edit')->name('clientEntry.edit');
		Route::post('/client-entry/update', 'Admin\ClientEntryController@update')->name('clientEntry.update');
		Route::get('/client-entry/view/{id}', 'Admin\ClientEntryController@view')->name('clientEntry.view');
		Route::post('/client-entry/destroy', 'Admin\ClientEntryController@destroy')->name('clientEntry.destroy');

		//Supplier Payment
		Route::get('/supplier-payment', 'Admin\SupplierPaymentController@index')->name('supplierPayment.index');
		Route::get('/supplier-payment/add', 'Admin\SupplierPaymentController@add')->name('supplierPayment.add');
		Route::post('/supplier-payment/save', 'Admin\SupplierPaymentController@save')->name('supplierPayment.save');
		Route::get('/supplier-payment/edit/{id}', 'Admin\SupplierPaymentController@edit')->name('supplierPayment.edit');
		Route::post('/supplier-payment/update', 'Admin\SupplierPaymentController@update')->name('supplierPayment.update');
		Route::post('/supplier-payment/destroy', 'Admin\SupplierPaymentController@destroy')->name('supplierPayment.delete');
		Route::post('/get-supplier-info', 'Admin\SupplierPaymentController@getSupplierInfo')->name('getSupplierInfo');

		//Purchase Return
		Route::get('/purchase-return', 'Admin\PurchaseReturnController@index')->name('purchaseReturn.index');
		Route::get('/purchase-return/add', 'Admin\PurchaseReturnController@add')->name('purchaseReturn.add');
		Route::post('/purchase-return/save', 'Admin\PurchaseReturnController@save')->name('purchaseReturn.save');
		Route::get('/purchase-return/edit/{id}', 'Admin\PurchaseReturnController@edit')->name('purchaseReturn.edit');
		Route::post('/purchase-return/update', 'Admin\PurchaseReturnController@update')->name('purchaseReturn.update');
		Route::post('/purchase-return/destroy', 'Admin\PurchaseReturnController@destroy')->name('purchaseReturn.destroy');
		// Route::post('/get-purchase-order', 'Admin\PurchaseReturnController@getPurchaseOrderItem')->name('getPurchaseOrderItem');

// Report Section Start
		//Purchase  Log
		Route::get('/purchase-log', 'Admin\PurchaseLogController@index')->name('purchaseLog.index');
		Route::post('/purchase-log', 'Admin\PurchaseLogController@index')->name('purchaseLog.index');
		Route::get('/purchase-log/print', 'Admin\PurchaseLogController@print')->name('purchaseLog.print');

		//Product List
		Route::get('/product-list', 'Admin\ProductListController@index')->name('productList.index');
		Route::post('/product-list', 'Admin\ProductListController@index')->name('productList.index');
		Route::post('/product-list/print', 'Admin\ProductListController@print')->name('productList.print');

		// Payment Log
		Route::get('/payment-log', 'Admin\PaymentLogController@index')->name('paymentLog.index');
		Route::post('/payment-log', 'Admin\PaymentLogController@index')->name('paymentLog.index');
		Route::post('/payment-log/print', 'Admin\PaymentLogController@print')->name('paymentLog.print');

		//Supplier Statement
		Route::get('/supplier-statement','Admin\SupplierStatementController@index')->name('supplierStatement.index');
		Route::post('/supplier-statement','Admin\SupplierStatementController@index')->name('supplierStatement.index');
		Route::post('/supplier-statement/print', 'Admin\SupplierStatementController@print')->name('supplierStatement.print');

		//Client Statement
		Route::get('/client-statement','Admin\ClientStatementController@index')->name('clientStatement.index');
		Route::post('/client-statement','Admin\ClientStatementController@index')->name('clientStatement.index');
		Route::post('/client-statement/print','Admin\ClientStatementController@print')->name('clientStatement.print');

		//Sales Contribution
		Route::get('/sales-contribution','Admin\SalesContributionController@index')->name('salesContribution.index');
		Route::post('/sales-contribution','Admin\SalesContributionController@index')->name('salesContribution.index');
		Route::post('/sales-contribution/print','Admin\SalesContributionController@print')->name('salesContribution.print');

		//Supply & payment Summery
		Route::get('/supply-payment-summery','Admin\SupplyPaymentSummeryController@index')->name('supplyPaymentSummery.index');
		Route::post('/supply-payment-summery','Admin\SupplyPaymentSummeryController@index')->name('supplyPaymentSummery.index');
		Route::post('/supply-payment-summery/print', 'Admin\SupplyPaymentSummeryController@print')->name('supplyPaymentSummery.print');

		//Stock Status Report
		Route::get('/stock-status-report','Admin\StockStatusReportController@index')->name('stockStatusReport.index');
		Route::post('/stock-status-report','Admin\StockStatusReportController@index')->name('stockStatusReport.index');
		Route::post('/stock-status-report/print','Admin\StockStatusReportController@print')->name('stockStatusReport.print');
		Route::post('/stock-status-report/product-list','Admin\StockStatusReportController@getAllProductByCategory')->name('stockStatusReport.getAllProductByCategory');

		//Out Of Stock Report
		Route::get('/out-of-stock-report','Admin\OutOfStockReportController@index')->name('outOfStockReport.index');
		Route::post('/out-of-stock-report','Admin\OutOfStockReportController@index')->name('outOfStockReport.index');
		Route::post('/out-of-stock-report/print','Admin\OutOfStockReportController@print')->name('outOfStockReport.print');
		Route::post('/out-of-stock-report/product-list','Admin\OutOfStockReportController@getAllProductByCategory')->name('outOfStockReport.getAllProductByCategory');

		//Stock Valuation Report
		Route::get('/stock-valuation-report','Admin\StockValuationReportController@index')->name('stockValuationReport.index');
		Route::post('/stock-valuation-report','Admin\StockValuationReportController@index')->name('stockValuationReport.index');
		Route::post('/stock-valuation-report/print','Admin\StockValuationReportController@print')->name('stockValuationReport.print');
		Route::post('/stock-valuation-report/product-list','Admin\StockStatusReportController@getAllProductByCategory')->name('stockValuationReport.getAllProductByCategory');

		//Sales & collection Outstanding
		Route::get('/sales-collection-outstanding','Admin\SalesCollectionOutstandingController@index')->name('salesCollectionOutstanding.index');
		Route::post('/sales-collection-outstanding','Admin\SalesCollectionOutstandingController@index')->name('salesCollectionOutstanding.index');
		Route::post('/sales-collection-outstanding/print','Admin\SalesCollectionOutstandingController@print')->name('salesCollectionOutstanding.print');

		//Purchase History
		Route::get('/purchase-history','Admin\PurchaseHistoryController@index')->name('purchaseHistory.index');
		Route::post('/purchase-history','Admin\PurchaseHistoryController@index')->name('purchaseHistory.index');
		Route::post('/purchase-history/print','Admin\PurchaseHistoryController@print')->name('purchaseHistory.print');

		//Collection History
		Route::get('/collection-history','Admin\CollectionHistoryController@index')->name('collectionHistory.index');
		Route::post('/collection-history','Admin\CollectionHistoryController@index')->name('collectionHistory.index');
		Route::post('/collection-history/print','Admin\CollectionHistoryController@print')->name('collectionHistory.print');
 
		//Purchase Order Status
		Route::get('/purchase-order-status','Admin\PurchaseOrderStatusController@index')->name('purchaseOrderStatus.index');
		Route::post('/purchase-order-status','Admin\PurchaseOrderStatusController@index')->name('purchaseOrderStatus.index');
		Route::post('/purchase-order-status/print','Admin\PurchaseOrderStatusController@print')->name('purchaseOrderStatus.print');

		//Purchase Return History
		Route::get('/purchase-return-history','Admin\PurchaseReturnHistoryController@index')->name('purchaseReturnHistory.index');
		Route::post('/purchase-return-history','Admin\PurchaseReturnHistoryController@index')->name('purchaseReturnHistory.index');
		Route::post('/purchase-return-history/print','Admin\PurchaseReturnHistoryController@print')->name('purchaseReturnHistory.print');

		//Sales History
		Route::get('/sales-history','Admin\SalesHistoryController@index')->name('salesHistory.index');
		Route::post('/sales-history','Admin\SalesHistoryController@index')->name('salesHistory.index');
		Route::post('/sales-history/print','Admin\SalesHistoryController@print')->name('salesHistory.print');

		//Product Wise Sales History
		Route::get('/product-wise-sales','Admin\ProductWiseSalesController@index')->name('productWiseSales.index');
		Route::post('/product-wise-sales','Admin\ProductWiseSalesController@index')->name('productWiseSales.index');
		Route::post('/product-wise-sales/print','Admin\ProductWiseSalesController@print')->name('productWiseSales.print');

		//Product Wise Profit
		Route::get('/product-wise-profit','Admin\ProductWiseProfitController@index')->name('productWiseProfit.index');
		Route::post('/product-wise-profit','Admin\ProductWiseProfitController@index')->name('productWiseProfit.index');
		Route::post('/product-wise-profit/print','Admin\ProductWiseProfitController@print')->name('productWiseProfit.print');

		//Client Wise Sales History
		Route::get('/client-wise-sales','Admin\ClientWiseSalesController@index')->name('clientWiseSales.index');
		Route::post('/client-wise-sales','Admin\ClientWiseSalesController@index')->name('clientWiseSales.index');
		Route::post('/client-wise-sales/print','Admin\ClientWiseSalesController@print')->name('clientWiseSales.print');

		// Start Account Management
			// COA Setup
			Route::get('/coa-setup','Admin\CoaSetupController@index')->name('coaSetup.index');
			Route::get('/coa-setup-add','Admin\CoaSetupController@add')->name('coaSetup.add');
			Route::post('/coa-setup-action','Admin\CoaSetupController@action')->name('coaSetup.action');
			Route::get('/coa-setup-edit/{id}','Admin\CoaSetupController@edit')->name('coaSetup.edit');
			Route::post('/coa-setup-update','Admin\CoaSetupController@update')->name('coaSetup.update');
			Route::post('/coa-setup-delete','Admin\CoaSetupController@delete')->name('coaSetup.delete');
			Route::post('/coa-setup-tree','Admin\CoaSetupController@makeTree')->name('coaSetup.makeTree');
			Route::post('/coa-setup-new-coa-data','Admin\CoaSetupController@newCoaData')->name('coaSetup.newCoaData');
			Route::post('/coa-setup-load-coa-data','Admin\CoaSetupController@loadCoaData')->name('coaSetup.loadCoaData');

			// Debit Voucher Entry
			Route::get('/debit-entry','Admin\DebitEntryController@index')->name('debitEntry.index');
			Route::post('/debit-entry','Admin\DebitEntryController@index')->name('debitEntry.index');
			Route::post('/debit-entry-print','Admin\DebitEntryController@print')->name('debitEntry.print');
			Route::get('/debit-entry-add','Admin\DebitEntryController@add')->name('debitEntry.add');
			Route::post('/debit-entry-save','Admin\DebitEntryController@save')->name('debitEntry.save');
			Route::get('/debit-entry-view/{id}','Admin\DebitEntryController@view')->name('debitEntry.view');
			Route::get('/debit-entry-print/{id}','Admin\DebitEntryController@printDebitVoucher')->name('journalEntry.printDebitVoucher');
			Route::get('/debit-entry-edit/{id}','Admin\DebitEntryController@edit')->name('debitEntry.edit');
			Route::post('/debit-entry-update','Admin\DebitEntryController@update')->name('debitEntry.update');
			Route::post('/debit-entry-delete','Admin\DebitEntryController@delete')->name('debitEntry.delete');
			Route::post('/debit-entry-publish','Admin\DebitEntryController@changePublish')->name('debitEntry.publish');
			Route::post('/debit-entry-get-coa','Admin\DebitEntryController@getCoa')->name('debitEntry.getCoa');
			Route::post('/debit-entry-vouchar-no','Admin\DebitEntryController@getVoucharNo')->name('debitEntry.getVoucharNo');

			// Credit Voucher Entry
			Route::get('/credit-entry','Admin\CreditEntryController@index')->name('creditEntry.index');
			Route::post('/credit-entry','Admin\CreditEntryController@index')->name('creditEntry.index');
			Route::post('/credit-entry-print','Admin\CreditEntryController@print')->name('creditEntry.print');
			Route::get('/credit-entry-add','Admin\CreditEntryController@add')->name('creditEntry.add');
			Route::post('/credit-entry-save','Admin\CreditEntryController@save')->name('creditEntry.save');
			Route::get('/credit-entry-view/{id}','Admin\CreditEntryController@view')->name('creditEntry.view');
			Route::get('/credit-entry-print/{id}','Admin\CreditEntryController@printCreditVoucher')->name('journalEntry.printCreditVoucher');
			Route::get('/credit-entry-edit/{id}','Admin\CreditEntryController@edit')->name('creditEntry.edit');
			Route::post('/credit-entry-update','Admin\CreditEntryController@update')->name('creditEntry.update');
			Route::post('/credit-entry-delete','Admin\CreditEntryController@delete')->name('creditEntry.delete');
			Route::post('/credit-entry-publish','Admin\CreditEntryController@changePublish')->name('creditEntry.publish');
			Route::post('/credit-entry-get-coa','Admin\CreditEntryController@getCoa')->name('creditEntry.getCoa');
			Route::post('/credit-entry-vouchar-no','Admin\CreditEntryController@getVoucharNo')->name('creditEntry.getVoucharNo');

			// Journal Voucher Entry
			Route::get('/journal-entry','Admin\JournalEntryController@index')->name('journalEntry.index');
			Route::post('/journal-entry','Admin\JournalEntryController@index')->name('journalEntry.index');
			Route::post('/journal-entry-print','Admin\JournalEntryController@print')->name('journalEntry.print');
			Route::get('/journal-entry-add','Admin\JournalEntryController@add')->name('journalEntry.add');
			Route::post('/journal-entry-save','Admin\JournalEntryController@save')->name('journalEntry.save');
			Route::get('/journal-entry-view/{id}','Admin\JournalEntryController@view')->name('journalEntry.view');
			Route::get('/journal-entry-print/{id}','Admin\JournalEntryController@printJournalVoucher')->name('journalEntry.printJournalVoucher');
			Route::get('/journal-entry-edit/{id}','Admin\JournalEntryController@edit')->name('journalEntry.edit');
			Route::post('/journal-entry-update','Admin\JournalEntryController@update')->name('journalEntry.update');
			Route::post('/journal-entry-delete','Admin\JournalEntryController@delete')->name('journalEntry.delete');
			Route::post('/journal-entry-publish','Admin\JournalEntryController@changePublish')->name('journalEntry.publish');
			Route::post('/journal-entry-get-coa','Admin\JournalEntryController@getCoa')->name('journalEntry.getCoa');
			Route::post('/journal-entry-vouchar-no','Admin\JournalEntryController@getVoucharNo')->name('journalEntry.getVoucharNo');

			// Openning Balance Entry
			Route::get('/opening-balance-entry','Admin\OpeningBalanceController@index')->name('openingBalanceEntry.index');
			Route::post('/opening-balance-entry','Admin\OpeningBalanceController@index')->name('openingBalanceEntry.index');
			Route::post('/opening-balance-entry-print','Admin\OpeningBalanceController@print')->name('openingBalanceEntry.print');
			Route::get('/opening-balance-entry-add','Admin\OpeningBalanceController@add')->name('openingBalanceEntry.add');
			Route::post('/opening-balance-entry-save','Admin\OpeningBalanceController@save')->name('openingBalanceEntry.save');
			Route::get('/opening-balance-entry-view/{id}','Admin\OpeningBalanceController@view')->name('openingBalanceEntry.view');
			Route::get('/opening-balance-entry-print/{id}','Admin\OpeningBalanceController@printOpeningBalanceVoucher')->name('openingBalanceEntry.printOpeningBalanceVoucher');
			Route::post('/opening-balance-entry-delete','Admin\OpeningBalanceController@delete')->name('openingBalanceEntry.delete');
			Route::post('/opening-balance-entry-publish','Admin\OpeningBalanceController@changePublish')->name('openingBalanceEntry.publish');
			Route::post('/opening-balance-entry-get-coa','Admin\OpeningBalanceController@getCoa')->name('openingBalanceEntry.getCoa');
			Route::post('/opening-balance-entry-vouchar-no','Admin\OpeningBalanceController@getVoucharNo')->name('openingBalanceEntry.getVoucharNo');

			// Voucher Approve
			Route::get('/voucher-approve','Admin\VoucherApproveController@index')->name('voucherApprove.index');
			Route::post('/voucher-approve','Admin\VoucherApproveController@index')->name('voucherApprove.index');
			Route::get('/voucher-approve-view/{id}','Admin\VoucherApproveController@view')->name('voucherApprove.view');
			Route::post('/voucher-approve','Admin\VoucherApproveController@approve')->name('voucherApprove.approve');
		// End Account Management

		// Start Account Report
			// COA List
			Route::get('/coa-list','Admin\CoaListController@index')->name('coaList.index');
			Route::get('/coa-list-print','Admin\CoaListController@print')->name('coaList.print');

			//Voucher List
			Route::get('/voucher-list','Admin\VoucherListController@index')->name('voucherList.index');
			Route::post('/voucher-list','Admin\VoucherListController@index')->name('voucherList.index');
			Route::post('/voucher-list-print','Admin\VoucherListController@print')->name('voucherList.print');

			//General Ledger List
			Route::get('/general-ledger','Admin\GeneralLedgerController@index')->name('generalLedger.index');
			Route::post('/general-ledger','Admin\GeneralLedgerController@index')->name('generalLedger.index');
			Route::post('/general-ledger-print','Admin\GeneralLedgerController@print')->name('generalLedger.print');

			//Trasaction Ledger List
			Route::get('/transaction-ledger','Admin\TransactionLedgerController@index')->name('transactionLedger.index');
			Route::post('/transaction-ledger','Admin\TransactionLedgerController@index')->name('transactionLedger.index');
			Route::post('/transaction-ledger-print','Admin\TransactionLedgerController@print')->name('transactionLedger.print');

			//Cash Book
			Route::get('/cash-book','Admin\CashBookController@index')->name('cashBook.index');
			Route::post('/cash-book','Admin\CashBookController@index')->name('cashBook.index');
			Route::post('/cash-book-print','Admin\CashBookController@print')->name('cashBook.print');

			//Bank Book
			Route::get('/bank-book','Admin\bankBookController@index')->name('bankBook.index');
			Route::post('/bank-book','Admin\bankBookController@index')->name('bankBook.index');
			Route::post('/bank-book-print','Admin\bankBookController@print')->name('bankBook.print');

			//Trial Balance
			Route::get('/trial-balance','Admin\TrialBalanceController@index')->name('trialBalance.index');
			Route::post('/trial-balance','Admin\TrialBalanceController@index')->name('trialBalance.index');
			Route::post('/trial-balance-print','Admin\TrialBalanceController@print')->name('trialBalance.print');

			//Balance Sheets
			Route::get('/balance-sheet','Admin\BalanceSheetController@index')->name('balanceSheet.index');
			Route::post('/balance-sheet','Admin\BalanceSheetController@index')->name('balanceSheet.index');
			Route::post('/balance-sheet-print','Admin\BalanceSheetController@print')->name('balanceSheet.print');

			//Income statement
			Route::get('/income-statement','Admin\IncomeStatementController@index')->name('incomeStatement.index');
			Route::post('/income-statement','Admin\IncomeStatementController@index')->name('incomeStatement.index');
			Route::post('/income-statement-print','Admin\IncomeStatementController@print')->name('incomeStatement.print');

			//Receive And Payment statement
			Route::get('/receive-payment-statement','Admin\ReceivePaymentStatementController@index')->name('receivePaymentStatement.index');
			Route::post('/receive-payment-statement','Admin\ReceivePaymentStatementController@index')->name('receivePaymentStatement.index');
			Route::post('/receive-payment-statement-print','Admin\ReceivePaymentStatementController@print')->name('receivePaymentStatement.print');
		// End Account Report
		});
	});

	//Admin Login Url
	Route::get('/login', 'Auth\AdminLoginController@showLoginForm')->name('admin.login');
	Route::post('/login', 'Auth\AdminLoginController@login');
    Route::post('/logout', 'Auth\AdminLoginController@adminLogout')->name('admin.logout');

    // Password Reset Routes...
     Route::get('/password/reset', 'Auth\AdminForgotPasswordController@passwordForget')->name('admin.password.forget');
     Route::post('/password/email', 'Auth\AdminForgotPasswordController@passwordEmail')->name('admin.password.email');
     Route::get('/new-password/{email}', 'Auth\AdminForgotPasswordController@newPassword')->name('admin.password.newPassword');
     Route::post('/password/save', 'Auth\AdminForgotPasswordController@changePasswordSave')->name('admin.password.save');

});

//Admin part end

//frontend url start from here
Route::get('/', 'FrontendController@index')->name('home.index');
Route::get('/search', 'FrontendController@searchProduct')->name('product.search');

//upload item list
Route::get('/upload-itemlist', 'FrontendController@UploadItem')->name('upload.itemList');
Route::post('/upload-itemlist', 'FrontendController@UploadItem')->name('upload.itemList');

//view product
/*Route::get('/product/{id}', 'FrontendController@singleProduct')->name('product.single');*/
Route::get('/product/{id}/{name}', 'FrontendController@singleProduct')->name('product.singles');
Route::get('/categories/{id}/{name}', 'FrontendController@productByCategory');
/*Route::get('/subcategories/{id}/{name}', 'FrontendController@productByCategory');*/
Route::get('/subcategories/{categoryId}/sort/{sortId}', 'FrontendController@productSort');
/*Route::get('/categories/{id}', 'FrontendController@productByCategory')->name('category.single');*/

//Cart Section
Route::post('/product/cart', 'CartController@addCart')->name('cart.add');
Route::get('/show-cart', 'CartController@index')->name('cart.index');
Route::POST('/carts/update', 'CartController@update')->name('carts.update');
Route::get('/cart/item', 'CartController@cartItem');
Route::get('/cart/addItem/{id}', 'CartController@addItem');
Route::get('/cart/addItemFromSingleProduct/{productID}/{quantity}', 'CartController@addItemFromSingleProduct');
Route::get('/cart/minicartProduct', 'CartController@minicartProduct');
Route::get('/cart/mainCartProduct', 'CartController@MainCartProduct');
Route::get('/cart/minicartSubtotal', 'CartController@minicartSubtotal');
Route::get('/carts/{rowId}/remove', 'CartController@remove');
Route::post('/product/buy', 'CartController@buyProduct')->name('product.buy');//product buy direct from single product

Route::get('/all-product', 'FrontendController@ViewAllProduct')->name('viewAll.product');


//Checkout Section
Route::get('/checkout', 'Admin\CheckoutController@checkoutPage')->name('cart.checkout');
Route::post('/complete-order', 'Admin\CheckoutController@orderSave')->name('order.save');

//Customer Authentication Section

Route::group(['middleware'=>'CheckCustomer'],function(){
	Route::prefix('customer')->group(function()
		{
			Route::get('/profile/{id}', 'Admin\CustomerController@profile')->name('customer.profile');
			Route::post('/update', 'Admin\CustomerController@updateProfile')->name('customer.update');

			Route::get('/order', 'Admin\CustomerController@orderList')->name('customer.order');
			Route::get('/order-details/{id}', 'Admin\CustomerController@orderDetails')->name('order.details');

			Route::get('/logout', 'Admin\CustomerController@logout')->name('customer.logout');
		});

	});

	Route::get('/shipping-email', 'Admin\CustomerController@shippingEmail');
	Route::post('/view-order', 'Admin\CustomerController@viewOrder');


	Route::prefix('customer')->group(function()
	{
		Route::get('/login', 'Admin\CustomerController@showLoginForm')->name('customer.login');
		Route::post('/do-login', 'Admin\CustomerController@login')->name('customer.dologin');
		Route::get('/registration', 'Admin\CustomerController@showRegistrationForm')->name('customer.registration');
		Route::post('/register', 'Admin\CustomerController@customerRegister')->name('customer.register');
		Route::get('/confirm-link/{verifyCode}', 'Admin\CustomerController@registerSave')->name('custmomer.save');

		//Reset password
		Route::get('/password-forget', 'Admin\CustomerController@passwordForget')->name('password.forget');
		Route::post('/password-mail', 'Admin\CustomerController@passwordMail')->name('password.mail');
		Route::get('/new-password/{email}', 'Admin\CustomerController@newPassword')->name('password.reset');

		Route::post('/password-save', 'Admin\CustomerController@changePasswordSave')->name('password.save');
	});


	//Contact Message here
	Route::get('/contact-us', 'FrontendController@contactUs')->name('contactpage');
	Route::post('/contact-save', 'Admin\ContactController@contacts')->name('contact.save');

	//Customer Review here
	Route::post('/customer-review', 'Admin\ReviewController@customerReview')->name('customerReview.save');

	// About us section here

	Route::get('/about-us', 'FrontendController@aboutUs')->name('aboutpage');

	//FAQ here
	Route::get('/faq', 'FrontendController@faq')->name('faq');

	//Delivery policy
	Route::get('/delivery-policy', 'FrontendController@deliveryPolicy');

	//Payment policy
	Route::get('/payment-policy', 'FrontendController@paymentPolicy');

	//Refund policy
	Route::get('/refund-policy', 'FrontendController@refundPolicy');

	//Help Ceter
	Route::get('/help-center', 'FrontendController@helpCenter');

	//Blog Here
	Route::get('/blog', 'FrontendController@blog');

	Route::get('/blog-details/{id}', 'FrontendController@blogDetails');

	//Terms & Condition
	Route::get('/terms-condition', 'FrontendController@termsCondition');

	//News letter subscribe section here
	Route::post('/subscriber-newsletter', 'Admin\NewsletterController@saveSubscribe')->name('subscribe.save');
