 GWIap 功能
=========================
简化苹果app内购买

使用方式
------------------------
```objc

//pid是产品id,这个id需要你在itunes connect里面新建
 NSSet* dataSet = [[NSSet alloc] initWithObjects:pid, nil];
 if([IAPShare sharedHelper].iap){
    [[SKPaymentQueue defaultQueue] removeTransactionObserver:[IAPShare sharedHelper].iap];
 }
 [IAPShare sharedHelper].iap = [[IAPHelper alloc] initWithProductIdentifiers:dataSet];
 [IAPShare sharedHelper].iap.production = YES;//是真实产品，而不是测试。本lib支持客户端验证是否支付成功，但是将验证过程放在服务器更安全。
 [[IAPShare sharedHelper].iap requestProductsWithCompletion:^(SKProductsRequest* request,SKProductsResponse* response){
      if(response > 0 ) {
          SKProduct* product =[[IAPShare sharedHelper].iap.products objectAtIndex:0];
	  [[IAPShare sharedHelper].iap buyProduct:product onCompletion:^(SKPaymentTransaction* trans){  
	      if(trans.error){
	         NSLog(@"Fail %@",[trans.error localizedDescription]);
              }else if(trans.transactionState == SKPaymentTransactionStatePurchased) {
	         receipt = trans.transactionReceipt;
		 //   服务器验证，将receipt上传到服务器，服务器通过苹果接口进行验证。
	      }else if(trans.transactionState == SKPaymentTransactionStateFailed) {
	          NSLog(@"Fail");
	     ｝
	   }];
      }
 }];

```

安装
------------------------
### 源码安装

1. 直接下载文件，将源文件集成到你的工程

### cocopods安装
1. 未安装cocopods请自行安装.
2. 在terminal中执行pod search GWIap.
3. 编辑Podfile,添加 pod 'GWIap','~> 0.0.1'
4. 执行pod install --verbose --no-repo-update,后面加了参数，目的是快速安装.

