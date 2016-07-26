//
//  SFHFKeychainUtils.h
//  GWIap
//
//  Created by shawn on 7/26/16.
//  Copyright © 2016 shawn. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface SFHFKeychainUtils : NSObject {
    
}

+ (NSString *) getPasswordForUsername: (NSString *) username andServiceName: (NSString *) serviceName error: (NSError **) error;
+ (BOOL) storeUsername: (NSString *) username andPassword: (NSString *) password forServiceName: (NSString *) serviceName updateExisting: (BOOL) updateExisting error: (NSError **) error;
+ (BOOL) deleteItemForUsername: (NSString *) username andServiceName: (NSString *) serviceName error: (NSError **) error;

@end