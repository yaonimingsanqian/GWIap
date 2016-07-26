//
//  IAPShare.h
//  GWIap
//
//  Created by shawn on 7/26/16.
//  Copyright © 2016 shawn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IAPHelper.h"
@interface IAPShare : NSObject
@property (nonatomic,strong) IAPHelper *iap;

+ (IAPShare *) sharedHelper;

+(id)toJSON:(NSString*)json;
@end
