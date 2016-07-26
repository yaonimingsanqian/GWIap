 GWIap 功能
=========================
简化苹果app内购买

使用方式
-------------------------
-(void)iap:(NSString*)pid
{
    NSSet* dataSet = [[NSSet alloc] initWithObjects:pid, nil];
        if([IAPShare sharedHelper].iap){
	        [[SKPaymentQueue defaultQueue] removeTransactionObserver:[IAPShare sharedHelper].iap];
		    }
		        [IAPShare sharedHelper].iap = [[IAPHelper alloc] initWithProductIdentifiers:dataSet];
			    
			        [IAPShare sharedHelper].iap.production = YES;
				    
				        [[IAPShare sharedHelper].iap requestProductsWithCompletion:^(SKProductsRequest* request,SKProductsResponse* response)
					     {
					              
						               if(response > 0 ) {
							                    SKProduct* product =[[IAPShare sharedHelper].iap.products objectAtIndex:0];
									                 
											              [[IAPShare sharedHelper].iap buyProduct:product
												                                              onCompletion:^(SKPaymentTransaction* trans){
																	                                                  
																							                                              if(trans.error)
																												                                                  {
																																		                                                 
																																								                                                 NSLog(@"Fail %@",[trans.error localizedDescription]);
																																														                                
																																																		                                            }
																																																							                                                else if(trans.transactionState == SKPaymentTransactionStatePurchased) {
																																																													                                                
																																																																			                                                receipt = trans.transactionReceipt;
																																																																									                                             //   服务器验证，将receipt上传到服务器，服务器通过苹果接口进行验证。
																																																																														                                                 }
																																																																																				                                             else if(trans.transactionState == SKPaymentTransactionStateFailed) {
																																																																																									                                                     NSLog(@"Fail");
																																																																																															                                                 }
																																																																																																					                                         }];//end of buy product
																																																																																																										          }
																																																																																																											       }];
																																																																																																											       }
