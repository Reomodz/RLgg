> Network disk package

| Package (month) | Price (RMB) | Download speed limit (KB/s) | Number of projects (items) | Size of a single project | Total capacity (MB) |
| -------- | -------- | -------------- | ------------ | ------------ | ---------- |
| Supported Version | 1 | 64 | 1 | 64KB | 1 |
| Trial Version | 18 | 128 | 2 | 512KB | 2 |
| Entry Edition | 38 | 256 | 10 | 1MB | 5 |
| Personal Edition | 88 | 512 | 25 | 2MB | 10 |
| Professional Edition | 128 | 1024 | 100 | 4MB | 15 |
| Enterprise Edition | 198 | 2048 | 200 | 6MB | 30 |
| Premium Edition | 268 | 3072 | 1000 | 10MB | 50 |



> Encryption Package

| Package (monthly) | Verification and anti-tampering | Runtime environment protection | String encryption A | Standard library obfuscation | Block reinforcement A | Block reinforcement B | Instruction obfuscation A | OP obfuscation |
| -------- | ---------- | ------------ | ----------- | ---------- | --------- | --------- | --------- | ------ |
| Starter Edition | ✔️ | ✔️ | ✔️ | ❌ | ✔️ | ❌ | ❌ | Small Amount |
| Personal Edition | ✔️ | ✔️ | ✔️ | ✔️ | ✔️ | ❌ | ❌ | Large |
| Pro| ✔️ | ✔️ | ✔️ | ✔️ | ✔️ | ✔️ | ❌ | All |
| Enterprise Edition| ✔️ | ✔️ | ✔️ | ✔️ | ✔️ | ✔️ | ✔️ | All |





Network disk address: http://pan.rlyun.asia/ or http://111.173.118.158:802

Purchase address: http://pan.rlyun.asia/buy?tab=1 or http://111.173.118.158:802/buy?tab=1

If you cannot access it, you can purchase it in `RLGG Toolbox`, `Network Disk Tools`



# Introduction to RLGG encryption

> RLGG encryption is divided into two layers, java layer and lua layer





## Encryption at the Java level

- Symmetric encryption of string constants
- Constant customization
- Bytecode customization
- Bytecode symmetric encryption

The bytecode obtained by using `string.dump` is the Java layer encryption

Since the encryption at the Java layer is basically symmetric, the hidden danger is also very large. As long as the encryption algorithm is found, it can be restored to the state before the encryption at the Java layer.

Therefore, encryption at the Java layer is unreliable.



## Encryption at the lua layer



### Entry version

The entry-level Lua layer encryption only encrypts strings



### Other versions

The encryption uses global obfuscation, which makes it difficult to restore the source code, but does not provide protection against decompilation and cracking.



### 198 (Enterprise Edition)

JMP obfuscation disrupts the instructions, thus providing protection against decompilation cracking.



Lua layer encryption is divided into `source code layer` and `bytecode layer`

### Source code layer

The source code layer is the level where developers write code



#### Constants



Example

~~~lua
print('hello world!')
~~~

The example only has one string, which is `'hello world!'`



At the bytecode level, the example is not just one string, but two string constants, `print` and `hello world!`

Because the example is actually

~~~lua
_ENV['print']('hello world!')
~~~



Using regular string encryption, a `print` string is eventually missed

If it is `gg.searchNumber('100')`, `gg` and `searchNumber` will be omitted



It can be seen that the amount of encryption at the source code layer is relatively small



How to solve it?

Just upgrade constant encryption from the source code layer to the bytecode layer. This is constant encryption.

> The above mainly shows that using bytecode layer encryption is more secure and reliable (such as the entry-level package)



#### Library members converted to UP

Upvalue is more complex and more difficult to restore

Fighting against decompilation



> Before encryption

`gg.searchNumber('100')`



> After encryption

`xxxxxxxxx('100')`

> xxxxxxxxx is an upvalue, pointing to gg.searchNumber



#### gg library protection

> Before encryption

`gg.searchNumber('100')`



> After encryption

~~~lua
container.bbbbbbbbbb('100') -- equivalent to gg.searchNumber('100')
~~~

> There is no set operation on the local side, only get, and the key is asymmetric





#### Class library member mapping

> Before encryption

`gg.searchNumber('100')`



> After encryption

~~~lua
container.aaaaaaaaaa = gg.searchNumber
container.bbbbbbbbbb('100') -- equivalent to gg.searchNumber('100')
~~~

> The keys of set and get are asymmetric, but the result of get is the value of set



#### gg library method extraction

> Before encryption

`gg.searchNumber('100')`



> After encryption

~~~lua
xxxxxxxxxx() -- equivalent to gg.searchNumber('100')
~~~

> The difference from library member mapping is that gg library method extraction extracts a behavior as a whole, including static parameters



### Bytecode layer

Bytecode is a binary file compiled from source code.

> Bytecode layer technologies include but are not limited to those described below.



#### Constants

> Supported only after v1.0.5, for the specific time, please see the update log

Constant encryption at the bytecode level compiles the source code into bytecode, and then parses the AST of the bytecode to obtain all the constants of the source code for encryption.

It can resist "decompilation cracking", and the difficulty of decrypting source code is greatly increased.



#### Redirect_ENV

> Supported only after v1.0.5, for the specific time, please see the update log

Redirect bytecode to the _ENV index of all chunks

It is resistant to decompilation



#### Bytecode hardening

> It can be understood as the reinforcement of APK

After all encryption operations are completed, the bytecode is finally reinforced. The strength of the reinforcement depends on the package.

Bytecode hardening can be understood as the outermost firewall. As long as this wall is still there, there is no decryption.





# Changelog



- 1.0.5 2023/03/08

  [Source code layer encryption upgraded to byte code layer encryption](#Byte code layer)
  
  
  
- 1.0.6 2023/03/09

  Add [Class library members transfer UP](#Class library members transfer UP)
  
  
  
- 1.0.7 2023/03/10
  
  Add [gg library protection](#gg library protection)
  
  Add [Class Library Member Mapping](#Class Library Member Mapping)
  
  Open encryption permissions for `support version` and `experience version` (bytecode layer encryption is not supported)
  
  

- 1.0.8 2023/03/13

  Add [gg library method extraction](#gg library method extraction)

  Add `base address function` encryption

  Optimize the compatibility of source code layer encryption

  
  
- 1.0.9 2023/03/19

  Add `gg function reinforcement`

  Add `string extraction`
  
  

- 1.0.10 2023/03/22

  Add `RL cloud verification protection`

  Optimize the encryption speed of the source code layer

  Optimize the encryption speed of overlong strings

  Enhanced string extraction
  
  
  
- 1.0.11 2023/03/24

  Fix unable to search

  
  
- 1.0.12 2023/03/26

  Optimize [gg library method extraction](#gg library method extraction)

  
  
- 1.0.13 2023/03/31

  Fixed the problem that some string parameters cannot be encrypted by default ()

  Strengthen some algorithms
  
  
  
- 1.0.14 2023/04/02

  Optimize large script encryption

  ​ `Reduce file memory` and `Increase loading speed`
  
  
  
- 1.0.15 2023/04/12

  Improve encryption speed

  Adding logic obfuscation

  Add instruction replacement

  Enhanced bytecode hardening



- 1.0.17 2023/04/28

  Optimize source code encryption speed

  

- 1.0.18 2023/05/18

  - Fixed the issue that source code parsing cannot recognize \r line break characters
    - Fixed a bug that caused parsing to fail when the comment end character was \r, causing an exception

  

- 1.0.21 2024/02/28
  - Strengthen bytecode encryption
    - Anti-decompilation

  

- 1.0.22 2024/03/03
  - Strengthen bytecode encryption
    - Strengthen constant encryption

  

- 1.0.23 2024/03/07
  
  - Optimize bytecode encryption performance and compatibility
  
    
  
- 1.0.24 2024/03/30

  - Strengthen bytecode encryption
    - In fact, the decryption software on the market (trial version and above) has been harmonized since version 1.0.22



- 1.0.25 2024/06/15

  - Optimize the registration mechanism, users can register in the toolbox

  - Optimize payment mechanism and add QR code payment

  - Cancel mandatory MD5 verification

  - New registered users can experience the encryption function for free for one month




- 1.0.26 2025/01/22

  - Upgrade encryption to old version encryption

  - Add new encryption

     - svm-new architecture, virtualization technology (public beta version)

     - jmp-high compatibility (stable)

  - What is svm?

     - svm is the abbreviation of Secure Virtual Machine, which means secure virtual machine
     - In compatible situations, svm is the best choice, as it is the most secure
     - Scripts encrypted by svm cannot be analyzed by any reverse engineering tools on the market from now to the next two years




- 1.0.26.2 2025/01/24
  - svm encryption is not compatible with ui scripts (not compatible with **multi-threading**)
  - Added flat block encryption technology, all encryptions use it by default
  - Security ranking: svm new architecture > old version upgrade > high compatibility
  - The so-called one-click open source tools on the market are false propaganda









# Contact me

Email:	 507522729@qq.com

[Click to add me as QQ friend](https://qm.qq.com/cgi-bin/qm/qr?k=M7zYPfDrxp3_Yom63mrGq8-ukUc62Qho&noverify=0&personal_qrcode_source=4)



