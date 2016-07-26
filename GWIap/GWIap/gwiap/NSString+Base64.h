//
//  NSString+Base64.h
//  GWIap
//
//  Created by shawn on 7/26/16.
//  Copyright © 2016 shawn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Base64)

+ (NSString *) base64StringFromData:(NSData *)data length:(long)length;

@end
