//
//  SecurityController.m
//  TWLOCKit
//
//  Created by 唐万龙 on 2020/5/15.
//  Copyright © 2020 唐万龙. All rights reserved.
//

#import "SecurityController.h"
#import "TWLOCKit.h"

@interface SecurityController ()

@end

@implementation SecurityController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    NSString *string = @"哈哈哈哈哈哈";
    
    NSString *aesKey = @"J3xB8kyTE1aN5IPY";
    NSLog(@"aesKey: %@", aesKey);
    NSString *aesIV = @"qb5IroWAjF4LoboP";
    NSLog(@"aesIV: %@", aesIV);
    NSString *enAes = [TWLSecurity aesCBCEncryptString:string key:aesKey iv:aesIV];
//    NSString *enAes = @"r3pIgak/fzjHzsZhx7zbHg==";
    
    NSLog(@"enAes: %@", enAes);
    NSString *deAes = [TWLSecurity aesCBCDecryptBase64String:enAes key:aesKey iv:aesIV];
    NSLog(@"deAes: %@", deAes);
    
    
    NSString *publicKey = @"MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA50qyGwCWxMmukfbQwMCg\
    7KQvtFJChP6i8zahQkinPuLGqL05cnTmSWrRivK9HCGnw26xK5jt1ZdPGBN9cqZI\
    9NXQ9fnqfsmRX9kB/eXQLHTPTPRFsWSxStiYaOp7cgjTw0l/DT4XnqefP9h18iuN\
    4XeQ3PPdSX/iLHP/XwUDuTX3C+Qr0q6OLNo5GekgOnTtluNgxwnnZ+nFvskEv8ht\
    C7rNyLGXOL9UJ9KlJTqnthMo1vZ88jwYoe4jX7P9p1fRAxirMvUQ2dtEyN672udU\
    sm0im0/XTtwT3tmwOMjaSmdQJCmJYS4d5An4N69dPeetf7mbc2RR0JXNXRukSeJN\
    ZQIDAQAB";\
    
    NSString *privateKey = @"MIIEvwIBADANBgkqhkiG9w0BAQEFAASCBKkwggSlAgEAAoIBAQDnSrIbAJbEya6R\
    9tDAwKDspC+0UkKE/qLzNqFCSKc+4saovTlydOZJatGK8r0cIafDbrErmO3Vl08Y\
    E31ypkj01dD1+ep+yZFf2QH95dAsdM9M9EWxZLFK2Jho6ntyCNPDSX8NPheep58/\
    2HXyK43hd5Dc891Jf+Isc/9fBQO5NfcL5CvSro4s2jkZ6SA6dO2W42DHCedn6cW+\
    yQS/yG0Lus3IsZc4v1Qn0qUlOqe2EyjW9nzyPBih7iNfs/2nV9EDGKsy9RDZ20TI\
    3rva51SybSKbT9dO3BPe2bA4yNpKZ1AkKYlhLh3kCfg3r109561/uZtzZFHQlc1d\
    G6RJ4k1lAgMBAAECggEBALQPBpDW6IjSqcCgcOteCumu+CRdVcPLqHfHM8syXGEs\
    kpOSnEJql0zYh8CwMGDSIpSWe/8A00bQwJZxtduncGyKeF7F7LQ/n5kKi+5pFqNF\
    XI0ALbFoPk2SSTSENw4TqSgC85IPoLu2qtc9YLTjC1VXi8M3ZjJuCFmrBEeo07k+\
    ur0zbv0iIJqcqPtDWHmSD1mCyr1rWGMAZt46rPbhh4JVHAkw7v2jidozcxJTmBk6\
    e7N378A4rtqtVXxmHOFQOw547uCw2zBiwN2uthGGpxmpTzVmIUslP+xjdNTxKKYq\
    Pbd3EPV49YawlalkftfX66eACXnVFvlTHZ9HhzheQ5ECgYEA+3/AXkKKX3IRu/uf\
    tJWPpcQBUrOK97oQYK2P4lIQ3vM+F7pXQp4dByT4fgTbdCnCSTmzT6x+Wx2jo07S\
    KN+nEoFHvrXUWmTeAnf+4E8XeXJ9uHlEm96HcXLLo1cZ3ezSP80bK52qu6+tYQ6E\
    2cmv1L0ggTmHLtxrkevulWDbAM8CgYEA625dQ5hdWtdMDaWUr7gHvLJgx3ynted8\
    5ngTuh0zlEIM2JYBQaT/bkeG7xSeApJiY/MlaoboeaQupDlyX3hyPhom1s3u5fAN\
    XpK1P8HbvC3PN4/IcaSaBedU1UOZCmsYZ/rJrsQLpc3Pg0LOMA8hAkn+4BehcVEz\
    nEVBf2Lek4sCgYEA7bjsoWxuFRficXi/lddFB6AEzCJPuidSsb984KVHsyXizFTj\
    hGGl+InWpG987AlIzyROPIJEkWWrtoKbne0BpDk1EqwWhDcRru2zqly4SKCS+1sN\
    IfQuvGqQ191N4vqmJY5/HzQSHQRKcxJhOucsX39BiURSZlYNC8oiI2qAt/sCgYBw\
    MTzSnIZIZvcAPdr4Tgup2ZuTFQ1a+0CjF6/W7lmJGlzCzeE1ZiqvY/iicEHIWff3\
    R4SaGkYoyZvMeO/PHTfb7lx52tMw0k+ctO8Yvgo3x+DKyoMr3NPlYlMj+j2xIE4W\
    JwX7ecNPNR/hnnFhp6QEUjzaj4hI1vhwTPSkfvowdwKBgQDIB/NHtLkZZZKfQxnY\
    9ox2ZR8PyYP5amNHGqak92wcuGklAiuPmiCwbuXJC+di+e0vrX12qIrXhoI3r8BO\
    HpZrl3RH6gBveaMsXjGtEIyQI4QQRcCLGeLHL8aKa4s4E80lxDDld9C7QcyMQnFs\
    k6lp0lD/zV2QqzDiQQgyVYAlqg==";\
    
    NSString *enRSA = [TWLSecurity rsaEncryptString:string publicKey:publicKey];
    
    NSLog(@"enRSA: %@", enRSA);
    
    
    NSString *deRSA = [TWLSecurity rsaDecryptString:enRSA privateKey:privateKey];
    
    
    NSLog(@"deRSA: %@", deRSA);
    
    
    
    NSLog(@"MD5: %@", string.twl_md5);
    NSLog(@"SHA1: %@", string.twl_sha1);
    NSLog(@"SHA256: %@", string.twl_sha256);
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
