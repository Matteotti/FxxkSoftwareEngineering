# 软件工程测试报告

<center>3210102485 杨煜卓</center>

## 功能测试

### 登录功能测试

#### 测试用例

| 测试编号 |        测试目的        |           测试内容           | 预期结果 | 实际结果 | 测试结论 |
| :------: | :--------------------: | :--------------------------: | :------: | :------: | :------: |
|    1     | 测试用户名和密码均正确 |    输入正确的用户名和密码    | 登录成功 | 登录成功 |   通过   |
|    2     | 测试用户名正确密码错误 | 输入正确的用户名和错误的密码 | 登录失败 | 登录失败 |   通过   |
|    3     | 测试用户名错误密码正确 | 输入错误的用户名和正确的密码 | 登录失败 | 登录失败 |   通过   |
|    4     | 测试用户名和密码均错误 |    输入错误的用户名和密码    | 登录失败 | 登录失败 |   通过   |

<img src="C:\Users\mrmat\AppData\Roaming\Typora\typora-user-images\image-20240519170621618.png" alt="image-20240519170621618" style="zoom:50%;" />

<img src="C:\Users\mrmat\AppData\Roaming\Typora\typora-user-images\image-20240519170637300.png" alt="image-20240519170637300" style="zoom:50%;" />![image-20240519170650626](C:\Users\mrmat\AppData\Roaming\Typora\typora-user-images\image-20240519170650626.png)

<img src="C:\Users\mrmat\AppData\Roaming\Typora\typora-user-images\image-20240519170637300.png" alt="image-20240519170637300" style="zoom:50%;" />![image-20240519170650626](C:\Users\mrmat\AppData\Roaming\Typora\typora-user-images\image-20240519170650626.png)

#### 测试结果

测试通过，性能完整。

---

### 注册功能测试

#### 测试用例

| 测试编号 |          测试目的          |              测试内容.               | 预期结果 | 实际结果 | 测试结论 |
| :------: | :------------------------: | :----------------------------------: | :------: | :------: | :------: |
|    5     |  测试用户名和密码格式正确  |      输入正确格式的用户名和密码      | 注册成功 | 注册成功 |   通过   |
|    6     |     测试用户名格式错误     | 输入格式错误的用户名和正确格式的密码 | 注册失败 | 注册失败 |   通过   |
|    7     |      测试密码格式错误      | 输入正确格式的用户名和格式错误的密码 | 注册失败 | 注册失败 |   通过   |
|    8     | 测试用户名和密码格式均错误 |      输入格式错误的用户名和密码      | 注册失败 | 注册失败 |   通过   |

<img src="C:\Users\mrmat\AppData\Roaming\Typora\typora-user-images\image-20240519170726378.png" alt="image-20240519170726378" style="zoom:50%;" />

<img src="C:\Users\mrmat\AppData\Roaming\Typora\typora-user-images\image-20240519170750585.png" alt="image-20240519170750585" style="zoom:50%;" />

#### 测试结果

测试通过，性能完整。

### 查询医院信息功能测试

#### 测试用例

| 测试编号 |         测试目的         |          测试内容.           |    预期结果    |    实际结果    | 测试结论 |
| :------: | :----------------------: | :--------------------------: | :------------: | :------------: | :------: |
|    9     |     测试搜索医院信息     |     输入医院名称查询信息     |  显示医院信息  |  显示医院信息  |   通过   |
|    10    | 测试搜索不存在的医院信息 | 输入不存在的医院名称查询信息 | 不显示任何信息 | 不显示任何信息 |   通过   |

<img src="C:\Users\mrmat\AppData\Roaming\Typora\typora-user-images\image-20240519170814912.png" alt="image-20240519170814912" style="zoom:50%;" />

#### 测试结果

测试通过，性能完整。

### 查询医保余额功能测试

#### 测试用例

| 测试编号 |        测试目的        |      测试内容.       |    预期结果    |    实际结果    | 测试结论 |
| :------: | :--------------------: | :------------------: | :------------: | :------------: | :------: |
|    11    |      查询医保余额      |  输入正确的用户信息  |  显示医保余额  |  显示医保余额  |   通过   |
|    12    | 查询不存在用户医保余额 | 输入不存在的用户信息 | 无法查询到信息 | 无法查询到信息 |   通过   |

<img src="C:\Users\mrmat\AppData\Roaming\Typora\typora-user-images\image-20240519170835770.png" alt="image-20240519170835770" style="zoom:50%;" />

<img src="C:\Users\mrmat\AppData\Roaming\Typora\typora-user-images\image-20240519170858686.png" alt="image-20240519170858686" style="zoom:50%;" />

#### 测试结果

测试通过，性能完整。

### 预约功能测试

#### 测试用例

| 测试编号 |       测试目的       |        测试内容.         | 预期结果 | 实际结果 | 测试结论 |
| :------: | :------------------: | :----------------------: | :------: | :------: | :------: |
|    13    |       预约医生       | 输入正确的医生和时间信息 | 预约成功 | 预约成功 |   通过   |
|    14    |   预约不存在的医生   |   输入不存在的医生信息   | 预约失败 | 预约失败 |   通过   |
|    15    | 预约医生在非工作时间 | 输入医生信息和非工作时间 | 预约失败 | 预约失败 |   通过   |

<img src="C:\Users\mrmat\AppData\Roaming\Typora\typora-user-images\image-20240519170921421.png" alt="image-20240519170921421" style="zoom:50%;" />![image-20240519170933275](C:\Users\mrmat\AppData\Roaming\Typora\typora-user-images\image-20240519170933275.png)

<img src="C:\Users\mrmat\AppData\Roaming\Typora\typora-user-images\image-20240519170933275.png" alt="image-20240519170933275" style="zoom:50%;" />

<img src="C:\Users\mrmat\AppData\Roaming\Typora\typora-user-images\image-20240519171003907.png" alt="image-20240519171003907" style="zoom:50%;" />

#### 测试结果

测试通过，性能完整。

### 查询预约记录功能测试

#### 测试用例

| 测试编号 |        测试目的        |      测试内容.       |    预期结果    |    实际结果    | 测试结论 |
| :------: | :--------------------: | :------------------: | :------------: | :------------: | :------: |
|    16    |    查询用户预约记录    |  输入正确的用户信息  |  显示预约记录  |  显示预约记录  |   通过   |
|    17    | 查询不存在用户预约记录 | 输入不存在的用户信息 | 无法查询到信息 | 无法查询到信息 |   通过   |

<img src="C:\Users\mrmat\AppData\Roaming\Typora\typora-user-images\image-20240519171033404.png" alt="image-20240519171033404" style="zoom:50%;" />

#### 测试结果

每项测试实际结果与预期结果都相符，所有的测试都通过了。

---

## 运行时间测试

整个系统的运行时间测试良好，响应迅速，没有发现运行缓慢的情况。

<img src="C:\Users\mrmat\AppData\Roaming\Typora\typora-user-images\image-20240519171249533.png" alt="image-20240519171249533" style="zoom:50%;" />

## 数据库操作与安全测试

对系统进行数据库选拔操作、权限控制等安全测试，系统安全性良好，没有发现安全漏洞。

所有的数据库操作都是程序输入的，不会发生注入攻击风险。

<img src="C:\Users\mrmat\AppData\Roaming\Typora\typora-user-images\image-20240519170921421.png" alt="image-20240519170921421" style="zoom:50%;" />

## 错误测试

对系统进行各种异常输入、操作的错误测试，系统能正确处理错误，不会因错误操作而崩溃。

<img src="C:\Users\mrmat\AppData\Roaming\Typora\typora-user-images\image-20240519171451861.png" alt="image-20240519171451861" style="zoom:50%;" />

## 测试结果分析与建议

通过对软件的功能、运行时间、数据库、以及情况扩展性的测试，我们可以确定软件的性能稳定，基本功能和拓展功能均满足要求。不过，在实际使用过程中可能会有更多不可预见的情况，需要持续的测试和更新，以保证系统的稳定运行和用户的操作体验。
