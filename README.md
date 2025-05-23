<img src="./Icon.png" width="96">

# LunarBar

[![](https://img.shields.io/badge/Platform-macOS_14.0+-blue?color=007bff)](https://github.com/LunarBar-app/LunarBar/releases/latest) [![](https://github.com/LunarBar-app/LunarBar/actions/workflows/build-and-test.yml/badge.svg?branch=main)](https://github.com/LunarBar-app/LunarBar/actions/workflows/build-and-test.yml)

完全免费且开源的 Mac 状态栏极简日历，支持农历、公共假日、系统日历及提醒等功能。

<img src="./Screenshots/01.png" width="320" alt="截图 01"> <img src="./Screenshots/02.png" width="320" alt="截图 02">

# 魔改内容
1. 状态栏原日期图标，如图修改为显示 【日期+星期】

   <img src="./Screenshots/04.png" width="320" alt="截图 04">

2. 日期单击不再打开系统日历，仅作为日历使用

> [!TIP]
> 在 [libremac.github.io](https://libremac.github.io/) 探索我们的其他免费开源应用。

## 安装 LunarBar

从 <a href="https://github.com/LunarBar-app/LunarBar/releases/latest" target="_blank">latest release</a> 获取 `LunarBar.dmg`，打开后将 `LunarBar.app` 拖拽至 `Applications` 即可。

<img src="./Screenshots/03.png" width="540" alt="安装 LunarBar">

LunarBar 会自动检查更新，你也可以在应用内手动检查更新，或者在 [releases](https://github.com/LunarBar-app/LunarBar/releases) 页面浏览历史版本。

如果你偏好使用 [Homebrew](https://brew.sh/) 安装，在终端运行 `brew install lunarbar` 即可。

> 无需担心非 App Store 安装的可靠性，LunarBar 是沙盒应用，且经过签名和 [notarization](https://developer.apple.com/documentation/security/notarizing_macos_software_before_distribution) 认证。

## 使用 LunarBar 的理由

如果你是这类人，欢迎试试：

- 日常使用 Mac  
- 需要查看农历
- 需要查看公共假日
- 喜欢极致的应用
- 喜欢简单的事物

请不要期待过高，LunarBar 的极简设计是经过深思熟虑的结果。当它不能满足你的需求时，不妨试试其他产品。

## 一些可能被问到的问题

本项目没有设立反馈渠道，所以在此解释一些常见问题。

**为什么开发 LunarBar**

我们开发它纯粹是为了满足自己的需求，将它发布也只是以防万一你也需要。

**为什么不开发 iOS 版本**

我们没有这个需求，iOS 没有状态栏，且通知中心小组件已被废弃。

**为什么不开发小组件版本**

基于 SwiftUI 的“新”小组件即便到了 2024 年也不够完善，我们不想做。

**LunarBar 是怎么开发的**

如果你作为开发者对 LunarBar 的开发过程感兴趣，请参考[这篇文章](./DEV.md)。
