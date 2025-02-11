# Playing gglua is so low-level? That was before using RLGG

RLGG is a modifier optimized based on [GameGuardian.101.0](https://gameguardian.net/). Its extremely secure encryption, extremely easy-to-use API, rich built-in functions, and ultra-small size have made it a favorite among countless GG authors and has been continuously spread by word of mouth.



[TOC]



[Download the latest version](https://gitee.com/rlyun/rlgg/releases/latest)

[View historical versions](https://gitee.com/rlyun/rlgg/releases)

[Built-in integration/encryption-screen recording tutorial](https://lanzoux.com/igrKE0t7sssb)

[Instructions](#Instructions)

[Frequently Asked Questions](#Frequently Asked Questionsfqa)

[Contact me](https://qm.qq.com/cgi-bin/qm/qr?k=ACzLUSy9JXJkRRKRe6tZ5zvvLXGLcIJC&noverify=0&personal_qrcode_source=3)



# Friendly Links

- **[RL Cloud Verification][]**
- **[RL network disk][]**



# Main Features

- Run lua script

- Read and write app memory

- [Accessible click screen](https://gitee.com/rlyun/rlgg/blob/master/RLGG%E5%87%BD%E6%95%B0%E5%BA%93%E6%96%87%E6%A1%A3.md#app)

- [Execute shell commands (terminal emulator)](https://gitee.com/rlyun/rlgg/blob/master/RLGG%E5%87%BD%E6%95%B0%E5%BA%93%E6%96%87%E6%A1%A3.md#newshell)

- lua encryption

- [Floating window drawing](https://gitee.com/rlyun/rlgg/blob/master/RLGG%E5%87%BD%E6%95%B0%E5%BA%93%E6%96%87%E6%A1%A3.md#draw)

- [luajava](https://gitee.com/rlyun/rlgg/blob/master/RLGG%E5%87%BD%E6%95%B0%E5%BA%93%E6%96%87%E6%A1%A3.md#luajava)

- [Load external dex, jar files](https://gitee.com/rlyun/rlgg/blob/master/RLGG%E5%87%BD%E6%95%B0%E5%BA%93%E6%96%87%E6%A1%A3.md#dex)

- Load dynamic lua layout

- [Network Verification] [RL Cloud Verification], free registration, zero threshold connection

  

# Firewall

#### classes.dex verification

> RLGG comes with

Attackers cannot tamper with the Java layer content from the installation package



#### classes.dex obfuscation

> RLGG comes with

Attackers cannot use general third-party hooks to attack RLGG because the luaj class name is obfuscated into other class names.

For example, if there is a popular hook software on the market that can kill the official GG, then it is very likely that it will not be effective against RLGG.



#### classes.dex reinforcement

> RLGG comes with

Convert some Java to binary to interfere with attackers’ analysis of sensitive information and reduce the risk of being attacked



#### Application Verification

> RLGG comes with

Attackers cannot inject into RLGG, for example, bypass SIGN signature verification



#### apk file anti-disguise

> RLGG comes with

Fight against attackers bypassing [installation package MD5 checksum](#installation package md5 checksum)



#### Installation package MD5 verification

> Paid encryption comes with it, or manually configured

Attackers cannot tamper with any content from the installation package



#### RLGG's SIGN signature verification

> Paid encryption comes with it, or manually configured

Further improve security and better protect the installation package from being tampered with

For example, if the MD5 checksum of the installation package is bypassed by the attacker, then the SIGN checkpoint is likely to block him. The combination of the two is perfect.



#### Anti-rewriting of Lua layer functions

> RLGG comes with

Attackers cannot hook or log in the Lua layer.



#### Running environment detection

>RLGG comes with

When RLGG is running, it will first determine whether there are known threat behaviors in the running environment. If so, it will not be allowed to run.



#### Network packet capture detection

> RLGG comes with

When the script accesses the network, RLGG automatically detects the packet capture behavior



#### Anti-logging mechanism A

>RLGG comes with

Rewrite the original writing of gg

For example, if you execute gg.editAll, RLGG will use other equivalent techniques (gg.setValues) to implement it for you.

For example, if you execute gg.setValues, RLGG can also use other equivalent techniques to achieve

Of course, more than the functions listed above, most gg functions are protected



#### Anti-logging mechanism A-2

>RLGG comes with

RLGG uses encrypted channels and java to transfer data

Data transmission process RLGG>MITM>JAVA

MITM refers to Man in the Middle (attacker)

When MITM intercepts the data transmitted by RLGG and Java, all that is obtained is invalid ciphertext, which has no meaning and cannot be used in normal GG.



#### Anti-logging mechanism A-3

>RLGG comes with

When RLGG and Java pass data, a large amount of data is injected to interfere with the log

For example, if the original string "1" is passed, RLGG will append 1G of data. If the attacker prints this G of data to the log, it will freeze.



#### Anti-logging mechanism B

>RLGG comes with

Eliminate one-size-fits-all hooks



#### Anti-offline protection

> Paid version comes with

The attacker cannot repair the encrypted file so that it can be run on a normal GG



#### Anti-hijacking protection

> Paid version comes with it, only the new version of encryption (>=1.0.3) is supported. It is recommended to use the new version of encryption, otherwise it is unsafe (detection bypassed)

Attackers cannot bypass most of the above detection/mechanisms



#### Detect xposed environment

> Paid version available

Significantly improve anti-hook capabilities



#### Detection framework environment

> Paid version available

Not allowed to run in the framework, cooperate to kill other GGs



#### Detect other GGs

> Paid version available

Extreme protection, 99.999999% protection from being blurred by other GGs



#### Detect ROOT environment

> Paid version available

Only allowed to run in ROOT environment, better with [Detection Framework Environment](#Detection Framework Environment)



#### QQ Blacklist

> Paid version available

You can blacklist a specific QQ. RLGG will not run if it detects the blacklist.



#### Kill other GGs

> Paid version available

It is not allowed to run other GGs at the same time. If you need a stronger detection, please use [Detect other GGs](#Detect other GGs)




#### Anti-xposed-hook mechanism

> Paid version comes with

This function is very powerful and eliminates 99.999 hooks. It will be implemented on 2023/1/29





> As you can see, RLGG has a lot of protection mechanisms, and it is constantly being updated and developed. We hope you will support us!
>
> There are some detection mechanisms that are not introduced. The paid version must be safer!






# Introduction to Encryption

[**Click to jump**](https://gitee.com/rlyun/rlgg/blob/master/RLGG%E5%8A%A0%E5%AF%86%E5%A5%97%E9%A4%90%E4%BB%8B%E7%BB%8D.md)



# Function documentation

[**Click to jump**](https://gitee.com/rlyun/rlgg/blob/master/RLGG%E5%87%BD%E6%95%B0%E5%BA%93%E6%96%87%E6%A1%A3.md)



# download

https://gitee.com/rlyun/rlgg/releases



| Version name | Available | Hardening | apk coexistence | X86 architecture | Framework | [X8 Sandbox](https://zh.x8sb.com/) | [Raiden Simulator](https://www.ldmnq.com/) | [NetEase Simulator](https://mumu.163.com/) | Description |
| ----------------------------------------------------------- | ------ | ---------- | ------- | ------- | ---- | ----------------------------------- | ----------------------------------- | ----------------------------------- | ---- |
| [1.8.8](https://lanzoux.com/iYfdt08a62kh) | Deprecated| | ✔️ | ✔️ | ✔️ | ✔️ | ✔️ | ✔️ | |
| [1.8.9](https://gitee.com/rlyun/rlgg/releases/tag/v1.89) | Deprecated| 360 | ❌ | ❌ | ❌ | ✔️ | ✔️ | ✔️ | |
| [2.0.1](https://gitee.com/rlyun/rlgg/releases/tag/v2.0.1) | Deprecated | Tencent Royal Security | ✔️ | | ✔️ | ❌ | 9.0<= | ❌ | |
| [2.0.2](https://gitee.com/rlyun/rlgg/releases/tag/v2.0.2) | Deprecated| 360 | ❌ | ✔️ | ❌ | ✔️ | ✔️ | ✔️ | |
| [2.0.3](https://gitee.com/rlyun/rlgg/releases/tag/v2.0.3) | Deprecated | DEX protection | ✔️ | ✔️ | ✔️ | ❌ | ✔️ | ❌ | |
| [2.0.4](https://gitee.com/rlyun/rlgg/releases/tag/v2.0.4) | Deprecated | DEX protection | ✔️ | ✔️ | ✔️ | ❌ | ✔️ | ✔️ | |
| [2.0.5](https://gitee.com/rlyun/rlgg/releases/tag/v2.0.5) | Deprecated| DEX protection| ✔️ | ✔️ | ✔️ | ✔️ | ✔️ | ✔️ | |
| [2.0.6](https://gitee.com/rlyun/rlgg/releases/tag/v2.0.6) | ✔️ | DEX Protection | ✔️ | ✔️ | ✔️ | ✔️ | ✔️ | ✔️ | |
| [2.0.9](https://gitee.com/rlyun/rlgg/releases/latest) | ✔️ | DEX protection| ✔️ | ✔️ | ✔️ | ❌ | ✔️ | ✔️ | Stable |



- The data is for reference only and may not be accurate

- Versions not in this list are not recommended.

  > Deprecated description

  Why does deprecation occur?

  Because the old domain name is blocked by China Mobile's node, most mobile users cannot access RLGG's services.

  Telecom, Unicom are normal

  


# Installation Guide

## ROOT permission has been obtained

1. [Download](https://gitee.com/rlyun/rlgg/blob/master/README.md#%E4%B8%8B%E8%BD%BD) and install rlgg
2. Go to rlgg's **Permission Management** through **Application Details** and allow **Display Floating Window**
3. Open rlgg and allow root permissions



## No ROOT permission is obtained

### Through the framework

1. [Download](https://gitee.com/rlyun/rlgg/blob/master/README.md#%E4%B8%8B%E8%BD%BD) and install rlgg
2. Install a framework, such as [Dual Open Assistant](https://www.multiopen.cn/)
3. Go to the framework's **Permission Management** through **Application Details** and allow **Display Floating Window**
4. Open the framework and add rlgg to the framework
5. Open rlgg in the frame



### Through the virtual machine

Not recommended, poor performance, will be more laggy





# Usage Instructions



## Built-in/Cloud Update/Video Tutorial

[RL network disk](https://gitee.com/rlyun/rlgg/tree/master/RL%E7%BD%91%E7%9B%98)

[RL network disk/encryption usage-screen recording tutorial](https://lanzoux.com/igrKE0t7sssb)





## Function description

[Click to jump to **Function library documentation**](https://gitee.com/rlyun/rlgg/blob/master/RLGG%E5%87%BD%E6%95%B0%E5%BA%93%E6%96%87%E6%A1%A3.md)



## Built-in Tutorial

Set the built-in code to the corresponding resource ID.



## Encryption Instructions

1. You need to make the following preparations
   - [Latest version of RLGG](https://gitee.com/rlyun/rlgg/releases)
   - [RLGG after coexistence](https://lanzoux.com/b0858bzfi)
   - [RLGG Toolbox](https://lanzoux.com/if7VR0b52wxe)
   - Network disk tool, usually you can see it after running **RLGG Toolbox**
   - Encryption tool, usually you can see it after running **RLGG Toolbox**
   - [Video Tutorial](https://lanzoux.com/iTfNe0b52ooh)
2. You must read the **Encryption Tutorial** first
3. Use **RLGG** to open **Network Disk Tool**, log in to the account, create a project (**No need to upload**), get the built-in code, and build it in. After the installation is complete, RLGG
   - Usually built into the RLGG after **coexistence**
4. Use RLGG to open the "Encryption Tool" and set the configuration
   - After encryption, RLGG cannot be changed arbitrarily, otherwise it will trigger Article 8
   - MD5 verification must be enabled, enter the coexisting package name (must be installed in the same environment as encryption), or enter the built-in file path
   - Global obfuscation and JMP obfuscation, depending on the situation, if your encryption supports it, then turn it on, if it does not support it, then you do not need to turn it on (if it does not support it, it will not be effective if you turn it on)
   - For other questions, please refer to the situation. If you don't understand, don't open it.
5. After the settings are configured, select the file you want to encrypt, click Start Encryption and wait for completion
6. Use RLGG to run the "Network Disk Tool", select your application, click Upload Update, and upload the encrypted file
7. For future cloud updates, you only need to re-encrypt and upload the update
8. If the RLGG changes will cause the MD5 verification to fail, you need to update it again (4-6 items for cloud update)



> Setting the configuration effect

1. Global obfuscation (only supported at moderate intensity and above)

   - Source code obfuscation, very reliable, very difficult to restore
2. JMP confusion (extremely high security)

   - Bytecode obfuscation, no solution
3. MD5 verification (must be enabled)

   - Protect your modifier from being tampered with. For example, if someone wants to change the name of your RLGG software after you publish it, the modified software will not be able to run your script. Any changes to the modifier will cause the MD5 check to fail.
4. SIGN verification

   - Protect the consistency of apk signature. Usually, apk needs to be signed before installation after modification. If a third party modifies your RLGG, they need to sign it if they want to install it. The signature will overwrite the original signature of the apk (the original signature is when you released it)
   - SIGN verification will not be triggered if the signatures are the same. For example, if you use the signature that comes with the MT manager when you publish, and the third party also uses the signature that comes with the MT manager, then even if the third party changes your modifier, SIGN verification will not be triggered. Therefore, if you want to open SIGN, you must use your own unique signature.

> The others are not very important and can be deployed according to your needs





## Notes

- The RLGG version used for encryption should be the same as the RLGG version used for built-in, otherwise it may be incompatible. For example, if the built-in version is 1.80, then the encryption version cannot be greater than 1.80

- It must be encrypted after it is built in. If it is encrypted and then built in again, the verification will definitely fail

- The built-in RLGG is usually coexisted



# Frequently Asked Questions (FQA)

#### How to get the MD5 of RLGG

> - Enter MT Manager> Long press the installation package file> Properties> Verify> to see MD5
>
> - Open RLGG and run any Lua script (can be an empty file). After the end, the console will output the MD5 of the current RLGG



#### How to use your own SIGN for signing

> In the MT Manager, click on the APK that needs to be signed, select "Function", select "APK Signature", select "More", select "Import Signature", select "Generate Key", and then follow the prompts of MT to operate



#### How to obtain RLGG's SIGN signature information

> In MT Manager, click on the apk that needs to be signed, select "the gray font on the right of the signature status", and cancel "add colon" in the format. RLGG verification uses MD5



#### Is the MD5 used for RLGG verification uppercase or lowercase?

> The MD5 used for RLGG verification is case-insensitive and universal. The MD5 must be 32 bits.



#### How to coexist with RLGG (change package name)

> Enter MT Manager>Click on the coexisting apk file>Function>APK Coexistence>Enter the package name>Confirm
>
> You must select **Use the old plan**



#### How to solve the problem of RLGG not being able to open after coexistence

> If RLGG crashes and displays a white screen after coexistence is turned on, it means that the old version solution was not selected during coexistence, resulting in changes to the classes.dex file, which cannot pass the verification and therefore cannot run normally, or the version does not support coexistence



#### How to solve the problem of "MD5 verification failed" after RLGG encryption

> After the built-in encryption, re-encrypt it. In the MD5 verification configuration of the encryption toolbox, enter the built-in MD5. Refer to **FAQ>[How to obtain RLGG's MD5](#How to obtain rlgg's md5)**
>
> It must be encrypted after being built-in, otherwise the MD5 will be changed after encryption, which will cause the MD5 verification to fail.



#### Why is encryption so slow (more than 3 minutes)?

> This situation usually means that you are using RLGG in a virtual machine, so it will be very stuck. Please use a framework or a real machine for encryption.



#### How to modify the apk icon

> In [NP Manager](https://www.baidu.com/s?ie=UTF-8&wd=NP%E7%AE%A1%E7%90%86%E5%99%A8), click the apk file, select **Function**, select **General Edit**, select **App Icon**



#### How to modify the background of RLGG homepage

> Can't do that, because RLGG doesn't have a homepage



#### How to change the RLGG software name

#### How to cancel RLGG automatic script running

> Please check at [resource ID](#resource id)









# Resource ID

> 0/1 means 0 or 1, when it is 1, it means it is on

| Resource Name | Type | ID | Default | Description |
| ------------ | ------ | ---------- | --------------- | ----------------------- |
| RLGG name | string | 0x7F070357 | RLGG{-version} | app name |
| Exclusive built-in code | string | 0x7F070354 | | Enable built-in script for auxiliary execution |
| External link built-in code | string | 0x7F070355 | | Enable the script to assist in executing external links |
| Popup to select process | 0/1 | 0x7F0D0008 | 0 | Manually select process |
| Autorun | 0/1 | 0x7F0D0009 | 1 | Automatically run built-in when opening app |



## How to set the value corresponding to the resource ID

1. Use MT Manager to open app/resources.arsc

   > Open with **Arsc editor**

2. Select **ID location resource**

3. After entering the ID, click **Confirm** to locate the corresponding resource

4. Click on a resource to edit its **content**

5. After editing, select **OK**, and then return to **Save and Exit**.

   > Anyway, just keep clicking OK until it is completed



# Offline Resources

## [raw](https://lanzoux.com/ioe9J0b4c4jg)

| Offline Type | Required Version | Resource Directory | Resource File Name | Description |
| ------------------- | -------- | ------------- | ---------- | ------------------------------- |
| Built into apk installation package (excellent) | >=1.8.9 | apk/res/raw/ | ydwraw | Automatically release resources after opening rlgg |
| Built into apk installation package (poor) | All | apk/assets/ | raw | Release resources after running the script and restart the software |
| Manual download | All | /sdcard/rlgg/ | raw | |
| Auto download | All | /sdcard/rlgg/ | raw | |

> If the downloaded raw file has a .zip suffix, you need to delete the suffix manually. It must be consistent with the **resource file name** corresponding to the above list



### Built into apk installation package

> After MT Manager has deobfuscated RLGG resources, add the raw file to apk/res/raw/ydwraw

- Advantages: No need to download separately
- Disadvantages: The installation package takes up a lot of memory



### Manual Download

> Add raw to /sdcard/rlgg/raw

- Advantages: Small installation package file
- Disadvantages: Not user-friendly



### Automatic download (default)

> After opening RLGG, it will automatically download

- Advantages: Fool-style, no operation required
- Disadvantages: Download speed may be slow at times







# Contact me

<img src="https://mail.qq.com/zh_CN/htmledition/images/favicon/qqmail_favicon_96h.png" style="zoom:25%;" />	 507522729@qq.com



[![](https://qzonestyle.gtimg.cn/qzone/qzact/act/external/tiqq/logo.png)Add me as a QQ friend](https://qm.qq.com/cgi-bin/qm/qr?k=M7zYPfDrxp3_Yom63mrGq8-ukUc62Qho&noverify=0&personal_qrcode_source=4)



<a target="_blank" href="https://qm.qq.com/cgi-bin/qm/qr?k=8kGw-2B6BW_q0D37MoZfQdZz2mYGeXcp&jump_from=w ebapi&authKey=EKu0gtO431E3a1jLZ0d6vT1y+MRlkYWvd/PSEBwZwcaAREj9CbNvxNAPungrALqW"><img border="0" src="//pub.idqqimg.com/wpa/images/group.png" alt="RLGG Exchange Group" title="RLGG Exchange Group"></a>

> If the website cannot be opened, you can try to copy the link and send it to any QQ friend, then click the link in QQ





[RL network disk]: https://gitee.com/rlyun/rlgg/tree/master/RL%E7%BD%91%E7%9B%98 ""RL network disk document"
[RL Cloud Verification]: http://46.3.112.55:804/README.html

