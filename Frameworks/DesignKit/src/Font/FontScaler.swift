//
//  FontScaler.swift
//  DesignKit
//
//  Created by guoruize on 2021/7/23.
//

import UIKit

public class FontScaler {
    private var baseFont: UIFont
    private var style: UIFont.TextStyle

    var maximumPointSize: CGFloat?

    init(with baseFont: UIFont,
         following style: UIFont.TextStyle = .body) {
        self.baseFont = baseFont
        self.style = style
    }

    public convenience init(with baseFont: UIFont,
                            following style: UIFont.TextStyle,
                            maximumPointSize: CGFloat) {
        self.init(with: baseFont, following: style)
        self.maximumPointSize = maximumPointSize
    }

    public convenience init(constrained baseFont: UIFont,
                            following style: UIFont.TextStyle = .body,
                            maximumPointSize: CGFloat = 1.5) {
        self.init(with: baseFont, following: style, maximumPointSize: baseFont.pointSize * maximumPointSize)
    }

    public var font: UIFont {
        guard let maximumPointSize = maximumPointSize else {
            return baseFont.scaled(following: style)
        }
        return baseFont.scaled(following: style, maximumPointSize: maximumPointSize)
    }
}

private extension UIFont {
    func scaled(following style: UIFont.TextStyle) -> UIFont {
        let fontMetrics = UIFontMetrics(forTextStyle: style)
        return fontMetrics.scaledFont(for: self)
    }

    func scaled(following style: UIFont.TextStyle, maximumPointSize: CGFloat) -> UIFont {
        let fontMetrics = UIFontMetrics(forTextStyle: style)
        return fontMetrics.scaledFont(for: self, maximumPointSize: maximumPointSize)
    }
}
