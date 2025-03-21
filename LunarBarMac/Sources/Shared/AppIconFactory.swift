//
//  AppIconFactory.swift
//  LunarBarMac
//
//  Created by cyan on 1/8/24.
//

import AppKit

@MainActor
enum AppIconFactory {
  static func createCalendarIcon(pointSize: Double = 16) -> NSImage {
    .with(symbolName: Icons.calendar, pointSize: pointSize).asTemplate
  }

  static func createDateIcon() -> NSImage? {
    DateIconView().snapshotImage?.asTemplate
  }
}

// MARK: - Private

private class DateIconView: NSView {
  private enum Constants {
    static let iconSize = CGSize(width: 88, height: 15)  // 增加宽度以适应更多文本
    static let fontSize: Double = 13
    static let cornerRadius: Double = 2.5
  }

  init() {
    super.init(frame: CGRect(origin: .zero, size: Constants.iconSize))

    // 将背景设置为透明
    layerBackgroundColor = .clear

    // 获取当前日期
    let now = Date.now
    // let calendar = Calendar.solar

    // 格式化日期为"03月21日 周五"格式
    let dateFormatter = DateFormatter()
    dateFormatter.locale = Locale(identifier: "zh_CN")
    dateFormatter.dateFormat = "MM月dd日 E"
    let dateString = dateFormatter.string(from: now)

    let labelFont = NSFont.systemFont(ofSize: Constants.fontSize, weight: .semibold)  // 或者使用 .medium

    // 不再使用蒙版，而是直接绘制文字
    let textLayer = CATextLayer()
    textLayer.string = dateString
    textLayer.font = labelFont
    textLayer.fontSize = Constants.fontSize
    textLayer.alignmentMode = .center
    textLayer.foregroundColor = NSColor.white.cgColor

    // 调整文字位置，向上偏移1像素
    var adjustedFrame = bounds
    adjustedFrame.origin.y += 1
    textLayer.frame = adjustedFrame

    textLayer.contentsScale = NSScreen.main?.backingScaleFactor ?? 2.0

    layer?.addSublayer(textLayer)
    layer?.cornerCurve = .continuous
    layer?.cornerRadius = Constants.cornerRadius
  }

  @available(*, unavailable)
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override var isFlipped: Bool {
    // [macOS 15] It seems flipping the coordinate system is no longer needed
    if #available(macOS 15.0, *) {
      return false
    }

    return true
  }
}
