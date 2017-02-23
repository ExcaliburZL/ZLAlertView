//
//  ZLAlertView.swift
//  ZLAlertView
//
//  Created by 赵乐 on 2017/2/21.
//  Copyright © 2017年 zhaole. All rights reserved.
//

import UIKit

class ZLAlertView: UIView {
    /// 默认值
    fileprivate let width:CGFloat = UIScreen.main.bounds.size.width
    fileprivate let viewHeight:CGFloat = 40.0
//    fileprivate let statusBarHeight:CGFloat = UIApplication.shared.statusBarFrame.height
    
    init() {
        super.init(frame: CGRect(x: 0.0, y: -viewHeight, width: width, height: viewHeight))
        let lastWindow = UIApplication.shared.windows.last
        lastWindow?.addSubview(self)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /// 颜色的告警框
    ///
    /// - Parameters:
    ///   - context: 内容
    ///   - style: 告警框风格
    public func push(_ context:String ,_ style: AlertStyle) {
        let color = viewColor(style)
        initCommon(context, color, UIColor.white)
    }
    
   /// 自定义颜色的告警框
   ///
   /// - Parameters:
   ///   - context: 内容
   ///   - backgroundColor: 背景颜色
   ///   - contextColor: 内容字体颜色
   public func push(_ context:String, _ backgroundColor: UIColor, _ contextColor: UIColor) {
    initCommon(context, backgroundColor, contextColor)
    }
}

// MARK: - 初始化 部分
extension ZLAlertView {
    /// 初始化
    ///
    /// - Parameters:
    ///   - text: 文字信息
    ///   - color: 背景颜色
    fileprivate func initCommon(_ context: String,_ backgroundColor: UIColor, _ contextColor: UIColor) {
        self.backgroundColor = backgroundColor
        textLabelInit(context, contextColor)
        viewAnimation();
    }
    
    /// 初始化文字
    ///
    /// - Parameter text: 文字内容
    private func textLabelInit(_ text: String, _ textColor: UIColor) {
        let frame = CGRect(x: bounds.origin.x, y: 16, width: bounds.size.width, height: 16)
        let label = UILabel(frame: frame)
        label.font = UIFont(name:"Helvetica", size: 13)
        label.textAlignment = NSTextAlignment.center
        label.textColor = textColor
        label.text = text
        addSubview(label)
    }
    
    /// 根据AlertStyle类型获取对应颜色
    ///
    /// - Parameter style: AlertStyle enum
    /// - Returns: 颜色
    fileprivate func viewColor(_ style: AlertStyle) -> UIColor {
        if style == .success {
            return UIColor.success()
        }else if style == .normal {
            return UIColor.normal()
        }else if style == .warning {
            return UIColor.warning()
        }else if style == .error {
            return UIColor.error()
        }else{
            return UIColor.normal()
        }
    }
    
    /// 动画执行
    private func viewAnimation() {
        let animation = CAKeyframeAnimation(keyPath: "position")
        
        let p1 = CGPoint(x: width/2, y: 0.0)
        let p2 = CGPoint(x: width/2, y: viewHeight/2)
        let p3 = CGPoint(x: width/2, y: viewHeight/2)
        let p4 = CGPoint(x: width/2, y: 0.0)
        let p5 = CGPoint(x: width/2, y: -viewHeight)
        animation.values = [p1,p2,p3,p4,p5]
        animation.keyTimes = [NSNumber(value: 0.0),NSNumber(value: 0.2),NSNumber(value: 0.4),NSNumber(value: 0.6),NSNumber(value: 0.8),NSNumber(value: 1.0)]
        animation.duration = 2.0
        self.layer.add(animation, forKey: "move")
    }
}

/// 告警框风格
///
/// - success: success
/// - normal: normal
/// - warning: warning
/// - error: error
enum AlertStyle {
    case success
    case normal
    case warning
    case error
}

extension UIColor {
    public class func success() -> UIColor {
        return rgba(r: 19, g: 206, b: 102, a: 1.0)
    }
    
    public class func normal() -> UIColor {
        return rgba(r: 80, g: 191, b: 255, a: 1.0)
    }
    
    public class func warning() -> UIColor {
        return rgba(r: 247, g: 186, b: 42, a: 1.0)
    }
    
    public class func error() -> UIColor {
        return rgba(r: 255, g: 73, b: 73, a: 1.0)
    }
    
    private class func rgba (r:CGFloat, g:CGFloat, b:CGFloat, a:CGFloat) -> UIColor{
        return UIColor (red: r/255.0, green: g/255.0, blue: b/255.0, alpha: a)
    }
}
