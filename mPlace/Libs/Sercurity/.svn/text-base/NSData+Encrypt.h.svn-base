//
//  NSData+Encrypt.h
//  vinaFilm
//
//  Created by tequilar on 6/3/13.
//  Copyright (c) 2013 tequilar. All rights reserved.
//

#import <Foundation/Foundation.h>
#define IVKey @"CAdvS3cur1ty@IV$"
#define api_id @"mfilm-ios-client"
#define md5_padding @"S3cur!ty@cCr4pt"
@interface NSData (Encryption)
- (NSData *)AES256EncryptWithKey:(NSString *)key andIv:(NSString*) iv;
- (NSData *)AES256DecryptWithKey:(NSString *)key andIv:(NSString*) iv;
- (NSData*) encryptString:(NSString*)plaintext withKey:(NSString*)key andIv:(NSString*) iv;
- (NSString*) decryptData:(NSData*)ciphertext withKey:(NSString*)key andIv:(NSString*) iv;
@end