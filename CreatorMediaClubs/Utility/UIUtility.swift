import UIKit

/// Contains Helper funtions that will create UIElements
enum UIUtility {
    static func createLabel(_ text: String, font: UIFont? = .systemFont(ofSize: UIFont.labelFontSize),
                            color: UIColor? = .black,
                            height: CGFloat? = nil, width: CGFloat? = nil) -> UILabel {
        let label = UILabel()
        label.text = text
        label.textColor = color
        label.frame.size.height = height != nil ? height ?? 0 : label.frame.height
        label.frame.size.width = width != nil ? width ?? 0 : label.frame.width
        return label
    }

    static func createImageView(for image: UIImage,
                                height: CGFloat? = nil,
                                width: CGFloat? = nil) -> UIImageView {
        let imageView = UIImageView(image: image)
        imageView.frame.size.height = height ?? image.size.height
        imageView.frame.size.width = width ?? image.size.width
        return imageView
    }

    static func createButton(_ title: String, target: Selector?, titleColor: UIColor? = .black,
                             backGroundColor: UIColor? = .gray,
                             height: CGFloat? = nil, width: CGFloat? = nil) -> UIButton {
        let btn = UIButton()
        btn.setTitle(title, for: .normal)
        btn.setTitleColor(titleColor, for: .normal)
        btn.backgroundColor = backGroundColor
        btn.frame.size.height = height ?? btn.frame.height
        btn.frame.size.width = width ?? btn.frame.width
        if let target = target {
            btn.target(forAction: target, withSender: btn)
        }
        return btn
    }
}
