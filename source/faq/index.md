---
title: DJI Guidance SDK FAQ
date: 2016-06-24
keywords: [FAQ, UART]
---

## Table of Contents

**Getting Started**

* [What information is provided by Guidance SDK?](#what-information-is-provided-by-guidance-sdk)
* [Where are the DJI Guidance SDK Resources?](#where-are-the-dji-guidance-sdk-resources)
* [Where can I apply the Guidance SDK?](#where-can-i-apply-the-guidance-sdk)
* [Are there any tutorials for Guidance SDK?](#are-there-any-tutorials-for-guidance-sdk) 
* [Where can I get the DJI SDK API Reference?](#where-can-i-get-the-dji-sdk-api-reference)
* [If I have questions, where can I get help?](#if-i-have-questions-where-can-i-get-help)
* [How can I build my own project using Guidance SDK?](#how-can-i-build-my-own-project-using-guidance-sdk)

**Product Related**

* [Why can't I see Guidance device in "Device Manager"?](#why-cant-i-see-guidance-device-in-device-manager)

**General SDK**

* [How to use SDK to get data?](#how-to-use-sdk-to-get-data)
* [Why don't demo and example code work?](#why-dont-demo-and-example-code-work)
* [Can I get image data using UART?](#can-i-get-image-data-using-uart)
* [Can I select all grey-scale images and depth images at the same time?](#can-i-select-all-grey-scale-images-and-depth-images-at-the-same-time)
* [Do I have to select grey-scale image too if I only want depth image?](#do-i-have-to-select-grey-scale-image-too-if-i-only-want-depth-image)
* [Can I get the data from USB and UART at the same time?](#can-i-get-the-data-from-usb-and-uart-at-the-same-time)
* [What is the frequency limit of data transfer using USB?](#what-is-the-frequency-limit-of-data-transfer-using-usb)
* [What are the supported baud rates using UART?](#what-are-the-supported-baud-rates-using-uart)
* [Can I get the camera intrinsic parameters using Guidance SDK?](#can-i-get-the-camera-intrinsic-parameters-using-guidance-sdk)

### What information is provided by Guidance SDK? 

Guidance SDK includes :

-	**demo**: a visual tracking project by using Guidance SDK
-	**doc**: API details
-	**examples**: examples for USB, UART and ROS
-	**include**: Header file of Guidance SDK 
-	**lib**: Library files for Windows
-	**so**: Library files for Linux

Guidance API gives the method for users to get `IMU data`, `Velocity`, `Obstacle distance`,  `grey-scale image`, `depth image` and `ultrasonic data` with `USB` and `UART` interface.

### Where are the DJI Guidance SDK Resources?

All <a href="http://developer.dji.com/guidance-sdk/documentation" target="_blank"> documentation </a> can be found on the DJI developer website.

The SDK can be downloaded from the <a href="https://developer.dji.com/guidance-sdk/downloads" target="_blank"> website </a>. 

All sample code referenced in the tutorials is available on <a href="https://github.com/dji-sdk" target="_blank"> Github </a>.

### Where can I apply the Guidance SDK?

One can use Guidance SDK on Guidance Core, which is separated from other hardware platforms. 
Since Guidance SDK provides the Library files for different operating systems, one can develop applications in Linux and Windows platforms, 32 bit and 64 bit versions. Limited support on embedded platforms are also provided, including: NVidia TK1/TX1, Odroid XU3, Raspberry Pi.

### Are there any tutorials for Guidance SDK?

A tutorial rundown for [tracking](../tutorials/index.html) is provided. The sample code on <a href="https://github.com/dji-sdk" target="_blank"> Github </a> is also very useful to get started.

### Where can I get the DJI SDK API Reference?

- <a href="http://developer.dji.com/guidance-sdk/documentation/index.html" target="_blank">API Reference</a>

### If I have questions, where can I get help?

You can use the following methods to get help:

- DJI SDK Forum

  <a href="http://forum.dev.dji.com/forum-92-1.html" target="_blank">http://forum.dev.dji.com/forum-92-1.html</a>

- Github Issues
  
  <a href="https://github.com/dji-sdk/Guidance-SDK/issues" target="_blank">https://github.com/dji-sdk/Guidance-SDK/issues</a>
  
- Send Email

  If you prefer email, please send to <dev@dji.com> for help.

### How can I build my own project using Guidance SDK?

You can build your own project with Guidance SDK by modifying provided demo and example projects, or build a new project following the step-by-step tutorial `How to build a visual tracking project` in **`Developer Guide`**.

### Why can't I see Guidance device in "Device Manager"?

Firstly, make sure Guidance Core is powered on. If you connect Guidance Core to PC by USB, then check if `Guidance Assistant` software has been successfully installed, which installs Guidance driver automatically.

If you connect Guidance Core to PC by UART, then check if `USB_to_RS232` driver has been installed successfully. 

### How to use SDK to get data?

You need to set up your development environment first referring to `Developer Guide` provided, which includes driver installation and project property setting. 
Then connect Guidance Core to PC and power it on, run the demo and examples to see what happens.

### Why don't demo and example code work?

Make sure the USB or UART driver has been installed successfully, you can check it with `Guidance Assistant` software by using USB connected to PC, or check in `Device Manager` if using UART. 

Then set the `DIY` Mode in Guidance Assistant software, and activate `USB` or `UART` interface if it's already activated. 

If errors about OpenCV occur, most likely it is because the environment variable `OPENCVROOT` is not properly added.

### Can I get image data using UART?

No. We don't transfer image data via UART because of the limited bandwidth of UART.

### Can I select all grey-scale images and depth images at the same time? 

No. Due to the bandwidth limit of USB, you cannot select the all image data at the same time.

### Do I have to select grey-scale image too if I only want depth image?

You do not have to select grey-scale image too if you only want depth image. Although the grey-scale image and the depth image are in the same struct, it is OK to select only depth image. Only remember that the pointer to grey-scale image is not valid in this case.

### Can I get the data from USB and UART at the same time?

Yes, you can get data from both of them at the same time, but it is not recommended as USB gives all types of data.



### What is the frequency limit of data transfer using USB?

The upper frequency limit of image data is 20hz, and can be scaled down if you select more image data. The other data such as IMU data, Velocity and so on, are fixed 20Hz.

### What are the supported baud rates using UART?

Currently we only support baud rate **115200** when using UART. 

### Can I get the camera intrinsic parameters using Guidance SDK?

Currently we do not have this function. The next version of Guidance SDK will open the interface to get the camera intrinsic parameters.