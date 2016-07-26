//
//  IAPShare.m
//  GWIap
//
//  Created by shawn on 7/26/16.
//  Copyright © 2016 shawn. All rights reserved.
//

#import "IAPShare.h"


@implementation IAPShare
@synthesize iap= _iap;
static IAPShare * _sharedHelper;

+ (IAPShare *) sharedHelper {
    
    if (_sharedHelper != nil) {
        return _sharedHelper;
    }
    _sharedHelper = [[IAPShare alloc] init];
    _sharedHelper.iap = nil;
    return _sharedHelper;
}

+(id)toJSON:(NSString *)json
{
    NSError* e = nil;
    id jsonObject = [NSJSONSerialization JSONObjectWithData: [json dataUsingEncoding:NSUTF8StringEncoding]
                                    options: NSJSONReadingMutableContainers
                                      error: &e];
    
    if(e==nil) {
        return jsonObject;
    }
    else {
        NSLog(@"%@",[e localizedDescription]);
        return nil;
    }
    
}

@end
