# RSAEncryptAndPrivateSign
RSA加密，解密。然后使用私💊进行签名。（哈希函数算法，SHA1，256等等）。

1.生成 RSA 密钥

在 Mac 终端上执行 openssl，再执行以下三句命令，生成 PKCS8 格式的 RSA 公私钥，执行过程中提示输入密码，密码为空（直接回车）就行。

openssl >
genrsa -out rsa_private_key.pem 1024
pkcs8 -topk8 -inform PEM -in rsa_private_key.pem -outform PEM –nocrypt
rsa -in rsa_private_key.pem -pubout -out rsa_public_key.pem
这样在执行的目录下就有了 rsa_private_key.pem 和 rsa_public_key.pem 这两个文件。这里生成了长度为 1024 的私钥，长度可选 1024 / 2048 / 3072 / 4096 ...。

可以通过 RSA配置自动生成 工具生成配置代码，打开 rsa_public_key.pem，复制内容到框里点击 生成配置代码 就可以了。

RSA 私钥，公钥验证工具。 http://www.jspatch.com/Tools/rsa

博客地址：http://blog.cocoachina.com/article/95069
