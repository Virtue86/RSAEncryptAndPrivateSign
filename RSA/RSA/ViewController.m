//
//  ViewController.m
//  RSA
//
//  Created by Virtue on 2018/4/3.
//  Copyright © 2018年 none. All rights reserved.
//

#import "ViewController.h"
#import "EPRSAEncrypt.h"

#define PublicKey @"-----BEGIN PUBLIC KEY-----\nMIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQC0aKanv5QFClM/k75iJC5liF7G\nV2wC5NHantOKVMfNaQzdNNHTbfDURuXv2tSL0jbD9SH7tESBaez32UCTzFDF4QKk\nVucftnU7eqOhSzQWauCa22og6v2htN55Q37jRodAUgyNrlC8T+DayeF/yG+JsUpK\nR5XAksLjotnCgkZOUQIDAQAB\n-----END PUBLIC KEY-----"

#define PrivateKey @"-----BEGIN RSA PRIVATE KEY-----\nMIICWwIBAAKBgQC0aKanv5QFClM/k75iJC5liF7GV2wC5NHantOKVMfNaQzdNNHT\nbfDURuXv2tSL0jbD9SH7tESBaez32UCTzFDF4QKkVucftnU7eqOhSzQWauCa22og\n6v2htN55Q37jRodAUgyNrlC8T+DayeF/yG+JsUpKR5XAksLjotnCgkZOUQIDAQAB\nAoGAY4S3KiIMTRt9AL1HcGv1DB1F6rOe6ZnACZFDsDNEZJNmfT/931vuVasmfEGC\nrf6wJzi6Hlc60wjTp4U4kk9K3m+/OxI4NUX5iHqiSJir10Yf0CdPColmgzu9UhFY\nEOx3STJkdikPk7D9VZbmvQ9m5C8p+gWDfrh7PPca0UWX1gECQQDlWY5X6XIdi4VH\nzk/iZ6GJWNh9HYt2YYCcWH2lLEuJoc3d4sI4qJf5sIffsnm/dXulUfOvIEHjgO0K\n/L7Nm34ZAkEAyV9AXBmNqOWH1GDvx/BQ836mncClXvZW5aXkZspyiygG67XxNLIU\nIX9Nuss8QxJGik/aiUtfyEhwfJ3KbhLo+QJAKyZAO5X2HEzllG7iZKwunhKTGGb4\nmBscAU48xViiFZDVlItXEyXVAesOhS2k7jqCOsZCXI5rFwxojIqkszYv8QJAaRpc\nHzX/KC5VDNZjkHmv5sct85x/M+djR42kfrofut3zbseR0602sJ0fVuWI2IELbFlt\neMdsgL6+Z2x8IaOhEQJAAriAWYz6Nt6ec465WlwRdsF5VTT5LLSbQT/u8hyZfQa8\nhYNMJc6U7k0q29uQh82L3E1zY04tghOHCmbs6DssRA==\n-----END RSA PRIVATE KEY-----"

@interface ViewController ()

@end

/**
 直接输入你在后台获得的私钥或者公钥，然hou调用方法即可
 */
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 公钥加密
   NSString *encryStr =  [EPRSAEncrypt encryptString:@"Hello Word" publicKey:PublicKey];
   NSLog(@"公钥加密 %@", encryStr);
    // 私钥解密
   NSString *dencryStr = [EPRSAEncrypt decryptString:encryStr privateKey:PrivateKey];
   NSLog(@"私钥解密 %@", dencryStr);

   // 私钥签名
    NSData *orgiData = [@"Hello Word" dataUsingEncoding:NSUTF8StringEncoding];
    NSData *signData = [EPRSAEncrypt signDataWithPrivateKey:PrivateKey data:orgiData];
   
    //验证私钥签名
    BOOL ret =  [EPRSAEncrypt verifyDataWithPublicKey:PublicKey orgiData:orgiData digitalSignature:signData];
    NSLog(@"验证私钥签名 %d", ret);

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
