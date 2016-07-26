//
//  ViewController.m
//  GWIap
//
//  Created by shawn on 7/26/16.
//  Copyright © 2016 shawn. All rights reserved.
//

#import "ViewController.h"
#import "IAPHelper.h"
#import "IAPShare.h"
@interface ViewController ()

@end

@implementation ViewController
{
     NSData *receipt;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//pid 是产品ID,需要在itunes connect上注册，同时需要添加沙盒测试员才能进行测试。
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
@end
