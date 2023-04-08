### 问题

v2ray订阅与clash之间无法直接套用，需要把clash转成订阅，或者把订阅转成clash

### 方法

软件：[subconverter](https://github.com/tindy2013/subconverter/blob/master/README-cn.md#简易用法) 或者在线 [ZJU Rule Converter](https://zjurule.xyz/)

方法：（以ssr-->clash为例）

- 对ssr网址用URLEncode做转换：[URL Encode and Decode - Online (urlencoder.org)](https://www.urlencoder.org/)
- 用subconverter转换：先双击打开该软件，输入：

```
http://127.0.0.1:25500/sub?target=clash&url=https%3A%2F%2Fdler.cloud%2Fsubscribe%2FABCDE%3Fsurge%3Dss
```

关键参数：

- target：要转换的对象
- url：网址：



参考：[subconverter/README-cn.md at master · tindy2013/subconverter (github.com)](https://github.com/tindy2013/subconverter/blob/master/README-cn.md#简易用法)