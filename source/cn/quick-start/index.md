---
title: Get Started 
date: 2016-06-24
---

Official Guidance SDK package for accessing the rich categories of output data from Guidance via USB and UART, and configure your Guidance all by your demand.

## Documentation

　[Developer Guide](../application-development-guides/index.html)

　[Run Example](../application-development-guides/run-examples.html)

　[Building a Visual Tracking Project](../tutorials/index.html)

　[Guidance SDK Reference](../introduction/index.html)
 
## Structure

-	**demo**: demo applications using Guidance SDK
-	**doc**: documentations
-	**examples**: examples for USB and UART
-	**include**: Header file of Guidance SDK 
-	**lib**: Library files for Windows
	- 2010/x64: build with Visual Studio 2010 64 bit
	- 2010/x86: build with Visual Studio 2010 32 bit
	- 2013/x64: build with Visual Studio 2013 64 bit
	- 2013/x86: build with Visual Studio 2013 32 bit
-	**so**: Library files for Linux	
	- x64: build with `g++` on 64 bit Linux system
	- x86: build with `g++` on 32 bit Linux system
	- XU3: build with `g++` on XU3
	- arm: build with latest `arm-linux-gnueabi-g++` for embedded ARM systems.Please install the cross-compiling toolchain by `sudo apt-get install gcc-arm-linux-gnueabi g++-arm-linux-gnueabi`

Also notice that, to enable fast download for ROS users, we have a separate ROS repo with much smaller size: <a href="https://github.com/dji-sdk/Guidance-SDK-ROS" target="_blank">Guidance-SDK-ROS</a>.

## Usage

### Windows 

Examples of USB and UART can be found in *examples/usb\_example*, *examples/uart\_example*,	including Visual Studio projects which is ready to compile. Remember to copy the corresponding DJI_guidance.dll file to the same directory where the output binary locates.  

### Linux

Examples of USB and UART can be found in *examples/usb\_example*, *examples/uart\_example*,	including Makefile which is ready to compile. Remember to copy the corresponding libDJI_guidance.so file to the same directory where the output binary locates. 

Notice that, reading and writing Guidance USB port in Linux requires root authority. To save the trouble of typing `sudo` every time running Guidance SDK applications, it is suggested to add a rule to `/etc/udev/rules.d` directory, which can be found in **doc/51-guidance.rules**. Or typing from terminal the following line

	sudo sh -c 'echo "SUBSYSTEM==\"usb\", ATTR{idVendor}==\"fff0\", ATTR{idProduct}==\"d009\", MODE=\"0666\"" > /etc/udev/rules.d/51-guidance.rules'