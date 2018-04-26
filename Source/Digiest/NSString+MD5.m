//
//  NSString+MD5.m
//  SLTools
//
//  Created by kentjia on 2018/4/26.
//  Copyright © 2018 jkstyle. All rights reserved.
//

#import "NSString+MD5.h"
#import <CommonCrypto/CommonCrypto.h>

@implementation NSString (MD5)

- (NSString *)MD5String {
    NSData *MD5Data = [self MD5Data];
    const UInt8 *bytes = (const UInt8 *)[MD5Data bytes];
    NSMutableString* outputString = [NSMutableString stringWithCapacity:MD5Data.length*2];
    for(NSInteger i = 0; i < MD5Data.length; ++i) {
        [outputString appendFormat:@"%02x", bytes[i]];
    }
    return [[outputString lowercaseString] copy];
}

- (NSData *)MD5Data {
    const char* cstr = [self UTF8String];
    unsigned char digist[CC_MD5_DIGEST_LENGTH] = {0};
    CC_MD5(cstr, (CC_LONG)strlen(cstr), digist);
    return [[NSData alloc] initWithBytes:digist length:CC_MD5_DIGEST_LENGTH];
}

@end
