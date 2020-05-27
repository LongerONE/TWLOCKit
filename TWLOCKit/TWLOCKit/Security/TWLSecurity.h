//
//  TWLSecurity.h
//  Pods-TWLOCKit
//
//  Created by 唐万龙 on 2020/5/8.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TWLSecurity : NSObject


#pragma mark - AES - CBC
/// AES CBC 加密字符串 128
/// @param content 内容
/// @param key 密钥 长度：16
/// @param iv 向量 长度：16
+ (NSString *)aesCBCEncryptString:(NSString *)content key:(NSString *)key iv:(NSString *)iv;


/// AES CBC 解密字符串 128
/// @param content 内容
/// @param key  密钥 长度：16
/// @param iv 向量 长度：16
+ (NSString *)aesCBCDecryptBase64String:(NSString *)content key:(NSString *)key iv:(NSString *)iv;



/// AES CBC 加密二进制数据 128
/// @param contentData 内容
/// @param keyData 密钥
/// @param ivData 向量
+ (NSData *)aesCBCEncryptData:(NSData *)contentData key:(NSData *)keyData iv:(NSData *)ivData;


/// AES CBC 解密二进制数据 128
/// @param contentData 内容
/// @param keyData 密钥
/// @param ivData 向量
+ (NSData *)aesCBCDecryptData:(NSData *)contentData key:(NSData *)keyData iv:(NSData *)ivData;



#pragma mark - AES - ECB

/// AES ECB 模式加密字符串
/// @param content 内容
/// @param key 密钥
+ (NSString *)aesECBEncryptString:(NSString *)content key:(NSString *)key;


/// AES ECB 模式解密字符串
/// @param content 内容
/// @param key 密钥
+ (NSString *)aesECBDecryptBase64String:(NSString *)content key:(NSString *)key;


/// AES ECB 模式加密二进制
/// @param contentData 内容
/// @param keyData 密钥
+ (NSData *)aesECBEncryptData:(NSData *)contentData key:(NSData *)keyData;


/// AES ECB 模式解密二进制
/// @param contentData 内容
/// @param keyData 密钥
+ (NSData *)aesECBDecryptData:(NSData *)contentData key:(NSData *)keyData;


#pragma mark - RSA 公钥加密

/// 公钥加密字符串
/// @param str 字符串
/// @param pubKey 公钥
+ (NSString *)rsaEncryptString:(NSString *)str publicKey:(NSString *)pubKey;


/// 私钥解密字符串
/// @param str 字符串
/// @param privKey 私钥
+ (NSString *)rsaDecryptString:(NSString *)str privateKey:(NSString *)privKey;


/// 公钥加密二进制
/// @param data 二进制
/// @param pubKey 公钥
+ (NSData *)rsaEncryptData:(NSData *)data publicKey:(NSString *)pubKey;


/// 私钥解密二进制
/// @param data 二进制
/// @param privKey 私钥
+ (NSData *)rsaDecryptData:(NSData *)data privateKey:(NSString *)privKey;

#pragma mark - RSA Function 私钥加密

/// 私钥加密字符串
/// @param str 字符串
/// @param privKey 私钥
+ (NSString *)rsaEncryptString:(NSString *)str privateKey:(NSString *)privKey;

/// 公钥解密字符串
/// @param str 字符串
/// @param pubKey 公钥
+ (NSString *)rsaDecryptString:(NSString *)str publicKey:(NSString *)pubKey;

/// 私钥加密二进制
/// @param data 二进制
/// @param privKey 私钥
+ (NSData *)rsaEncryptData:(NSData *)data privKey:(NSString *)privKey;

/// 公钥解密二进制
/// @param data 二进制
/// @param pubKey 公钥
+ (NSData *)rsaDecryptData:(NSData *)data publicKey:(NSString *)pubKey;

@end

NS_ASSUME_NONNULL_END
