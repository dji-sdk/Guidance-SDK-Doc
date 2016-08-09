---
title: 快速入门
date: 2016-06-24
keywords: [快速入门]
---

Guidance SDK可以让开发者通过Guidance的USB口和串口来获取丰富的传感器数据，以及按照自己的需要来灵活配置Guidance。

## 文档

- [开发者指南](../application-development-guides/index.html)
　
- [例程](../quick-start/run-examples.html)

- [创建一个视觉跟踪工程](../tutorials/index.html)

- [API文档](../introduction/index.html)
 
## 结构

-	**demo**: 用Guidance SDK实现的示例应用
-	**doc**: 文档
-	**examples**: USB和串口的简单示例程序
-	**include**: Guidance SDK头文件 
-	**lib**: Windows下的库文件
	- 2010/x64: 使用 Visual Studio 2010 64 bit 编译
	- 2010/x86: 使用 Visual Studio 2010 32 bit 编译
	- 2013/x64: 使用 Visual Studio 2013 64 bit 编译
	- 2013/x86: 使用 Visual Studio 2013 32 bit 编译
-	**so**: Linux下的库文件	
	- x64: 在64位Linux系统上用 `g++` 编译
	- x86: 在32位Linux系统上用 `g++` 编译
	- XU3: 在XU3上用 `g++` 编译 
	- arm: 使用最新的 `arm-linux-gnueabi-g++` 编译，供嵌入式ARM系统使用。使用时，请先安装交叉编译工具链：`sudo apt-get install gcc-arm-linux-gnueabi g++-arm-linux-gnueabi`

请注意，为了便于ROS用户的快速下载，我们还维护了一个独立的ROS包。它不包含任何文档和Windows下的库文件，因此具有更小的体积：<a href="https://github.com/dji-sdk/Guidance-SDK-ROS" target="_blank">Guidance-SDK-ROS</a>.

## 如何使用

### Windows 

USB和串口的示例代码可以在 *examples/usb\_example* 和 *examples/uart\_example*中找到，其中包含了可直接编译运行的Visual Studio工程。需要将对应的dll文件复制到exe所在目录或Windows系统目录。

### Linux

USB和串口的示例代码可以在同样的目录（*examples/usb\_example* 和 *examples/uart\_example*）中找到，其中包含了可直接编译的Makefile文件。

注意，在Linux下读写Guidance的USB口需要root权限。为了省去每次运行Guidance SDK程序都要输入`sudo`的麻烦，建议在 `/etc/udev/rules.d` 下添加一个规则文件，即 **doc/51-guidance.rules**. 或者也可以从终端输入下面的这行：

	sudo sh -c 'echo "SUBSYSTEM==\"usb\", ATTR{idVendor}==\"fff0\", ATTR{idProduct}==\"d009\", MODE=\"0666\"" > /etc/udev/rules.d/51-guidance.rules'