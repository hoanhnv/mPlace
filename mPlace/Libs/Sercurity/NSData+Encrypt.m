#import "NSData+Encrypt.h"
#import <CommonCrypto/CommonCryptor.h>

@implementation NSData (Encryption)
- (NSData *)AES256EncryptWithKey:(NSString *)key andIv:(NSString*) iv{
    // 'key' should be 32 bytes for AES256, will be null-padded otherwise
    char keyPtr[kCCKeySizeAES256+1]; // room for terminator (unused)
    bzero(keyPtr, sizeof(keyPtr)); // fill with zeroes (for padding)
    
    // 'ivPtr' should be 32 bytes for AES256, will be null-padded otherwise
    char ivPtr[kCCKeySizeAES256+1]; // room for terminator (unused)
    bzero(ivPtr, sizeof(ivPtr)); // fill with zeroes (for padding)
    
    
    // fetch key data
    [key getCString:keyPtr maxLength:sizeof(keyPtr) encoding:NSUTF8StringEncoding];
    
    // fetch iv data
    [iv getCString:ivPtr maxLength:sizeof(ivPtr) encoding:NSUTF8StringEncoding];

    NSUInteger dataLength = [self length];
    
    //See the doc: For block ciphers, the output size will always be less than or
    //equal to the input size plus the size of one block.
    //That's why we need to add the size of one block here
    size_t bufferSize = dataLength + kCCBlockSizeAES128;
    void *buffer = malloc(bufferSize);
    
    size_t numBytesEncrypted = 0;
    CCCryptorStatus cryptStatus = CCCrypt(kCCEncrypt, kCCAlgorithmAES128, kCCOptionPKCS7Padding,
                                          keyPtr, kCCKeySizeAES256,
                                          ivPtr /* initialization vector (optional) */,
                                          [self bytes], dataLength, /* input */
                                          buffer, bufferSize, /* output */
                                          &numBytesEncrypted);
    if (cryptStatus == kCCSuccess) {
        //the returned NSData takes ownership of the buffer and will free it on deallocation
        return [NSData dataWithBytesNoCopy:buffer length:numBytesEncrypted];
    }
    
    free(buffer); //free the buffer;
    return nil;
}

- (NSData *)AES256DecryptWithKey:(NSString *)key andIv:(NSString*) iv{
    // 'key' should be 32 bytes for AES256, will be null-padded otherwise
    char keyPtr[kCCKeySizeAES256+1]; // room for terminator (unused)
    bzero(keyPtr, sizeof(keyPtr)); // fill with zeroes (for padding)
    
    
    // 'ivPtr' should be 32 bytes for AES256, will be null-padded otherwise
    char ivPtr[kCCKeySizeAES256+1]; // room for terminator (unused)
    bzero(ivPtr, sizeof(ivPtr)); // fill with zeroes (for padding)
    
    
    // fetch key data
    [key getCString:keyPtr maxLength:sizeof(keyPtr) encoding:NSUTF8StringEncoding];
    
    // fetch iv data
    [iv getCString:ivPtr maxLength:sizeof(ivPtr) encoding:NSUTF8StringEncoding];
    
    
    NSUInteger dataLength = [self length];
    
    //See the doc: For block ciphers, the output size will always be less than or
    //equal to the input size plus the size of one block.
    //That's why we need to add the size of one block here
    size_t bufferSize = dataLength + kCCBlockSizeAES128;
    void *buffer = malloc(bufferSize);
    
    size_t numBytesDecrypted = 0;
    CCCryptorStatus cryptStatus = CCCrypt(kCCDecrypt, kCCAlgorithmAES128, kCCOptionPKCS7Padding,
                                          keyPtr, kCCKeySizeAES256,
                                          ivPtr /* initialization vector (optional) */,
                                          [self bytes], dataLength, /* input */
                                          buffer, bufferSize, /* output */
                                          &numBytesDecrypted);
    
    if (cryptStatus == kCCSuccess) {
        //the returned NSData takes ownership of the buffer and will free it on deallocation
        return [NSData dataWithBytesNoCopy:buffer length:numBytesDecrypted];
    }
    
    free(buffer); //free the buffer;
    return nil;
}

- (NSData*) encryptString:(NSString*)plaintext withKey:(NSString*)key andIv:(NSString*) iv{
	return [[plaintext dataUsingEncoding:NSUTF8StringEncoding] AES256EncryptWithKey:key andIv:iv];
}

- (NSString*) decryptData:(NSData*)ciphertext withKey:(NSString*)key andIv:(NSString*) iv{
	return [[NSString alloc] initWithData:[ciphertext AES256DecryptWithKey:key andIv:iv]
	                              encoding:NSUTF8StringEncoding];
}

@end