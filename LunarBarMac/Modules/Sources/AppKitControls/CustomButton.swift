//
//  CustomButton.swift
//
//  Created by cyan on 12/25/23.
//

import AppKit

/**
 Like UIButton in UIKit, supports custom highlight states.

 It has a configurable `hitTestInsets` to make the hitTest rect larger.
 */
public class CustomButton: NSButton {
  public var hitTestInsets: CGPoint = .zero
  public var onMouseHover: ((_ isHovered: Bool) -> Void)?
  public var onDoubleClick: (() -> Void)?  // 新增双击回调属性

  private var trackingArea: NSTrackingArea?
  private var clickCount = 0  // 点击计数器
  private var clickTimer: Timer?  // 双击间隔计时器

  override public var isHighlighted: Bool {
    didSet {
      alphaValue = isHighlighted ? 0.6 : 1.0
    }
  }

  public init() {
    super.init(frame: .zero)
    title = ""
    imagePosition = .imageOnly
    isBordered = false
  }

  @available(*, unavailable)
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override public func updateTrackingAreas() {
    super.updateTrackingAreas()

    if let trackingArea {
      removeTrackingArea(trackingArea)
    }

    trackingArea = {
      let trackingArea = NSTrackingArea(
        // The rect is slightly smaller to prevent two adjacent views from being hovered simultaneously
        rect: bounds.insetBy(dx: 0.5, dy: 0.5),
        options: [.activeAlways, .mouseEnteredAndExited],
        owner: self
      )

      addTrackingArea(trackingArea)
      return trackingArea
    }()
  }

  override public func mouseDown(with event: NSEvent) {
    isHighlighted = true
  }

  override public func mouseUp(with event: NSEvent) {
    isHighlighted = false

    if isMouseWithinBounds(event: event) {
        clickCount += 1

        if clickCount == 1 {
            // 第一次点击，启动计时器
            clickTimer = Timer.scheduledTimer(withTimeInterval: 0.3, repeats: false) { [weak self] _ in
                DispatchQueue.main.async {
                    if self?.clickCount == 1 {
                        // 单机事件
                        _ = self?.sendAction(self?.action, to: self?.target)
                    }
                    self?.clickCount = 0
                }
            }
        } else if clickCount == 2 {
            // 双击事件
            clickTimer?.invalidate()
            clickTimer = nil
            clickCount = 0
            onDoubleClick?()
        }
    } else {
        onMouseHover?(false)
    }
}

  // 新增双击事件设置方法
  public func addDoubleClickAction(_ handler: @escaping () -> Void) {
    onDoubleClick = handler
  }

  override public func mouseDragged(with event: NSEvent) {
    isHighlighted = isMouseWithinBounds(event: event)
  }

  override public func mouseEntered(with event: NSEvent) {
    super.mouseEntered(with: event)
    onMouseHover?(true)
  }

  override public func mouseExited(with event: NSEvent) {
    super.mouseExited(with: event)
    onMouseHover?(false)
  }

  override public func hitTest(_ point: CGPoint) -> NSView? {
    hitTestRect.contains(point) ? self : super.hitTest(point)
  }
}

// MARK: - Private

private extension CustomButton {
  var hitTestRect: CGRect {
    frame.insetBy(dx: hitTestInsets.x, dy: hitTestInsets.y)
  }

  func isMouseWithinBounds(event: NSEvent) -> Bool {
    let point = convert(event.locationInWindow, from: nil)
    let bounds = CGRect(origin: hitTestInsets, size: hitTestRect.size)
    return isMousePoint(point, in: bounds)
  }
}
