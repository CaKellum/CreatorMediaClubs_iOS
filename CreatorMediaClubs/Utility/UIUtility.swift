import UIKit

/// Contains Helper funtions that will create and manage UIElements
enum UIUtility {

    /// creates UILabel from described params
    /// - Parameters:
    ///   - text: the displayed text
    ///   - font: the type of font that the label will display
    ///   - color: the color of the text
    ///   - height: height of label
    ///   - width: width of the label
    /// - Returns: returns label with described atributes
    static func createLabel(_ text: String, font: UIFont? = .systemFont(ofSize: UIFont.labelFontSize),
                            color: UIColor? = .fontBlack,
                            height: CGFloat? = nil, width: CGFloat? = nil) -> UILabel {
        let label = UILabel()
        label.text = text
        label.textColor = color
        label.frame.size.height = height != nil ? height ?? 0 : label.frame.height
        label.frame.size.width = width != nil ? width ?? 0 : label.frame.width
        return label
    }

    /// creates Image view with image in parameter
    /// - Parameters:
    ///   - image: UIImage that is to be held by the
    ///   - height: desiered height of imageView
    ///   - width: desiered width of imageView
    /// - Returns: the ImageView that has the defined parameters
    static func createImageView(for image: UIImage?,
                                height: CGFloat? = nil,
                                width: CGFloat? = nil) -> UIImageView {
        let imageView = UIImageView(image: image)
        imageView.frame.size.height = height ?? (image?.size.height ?? 0)
        imageView.frame.size.width = width ?? (image?.size.width ?? 0)
        return imageView
    }

    /// Creates Button that conforms to defined parameters
    /// - Parameters:
    ///   - title: the text to be displayed on button
    ///   - target: the action the button performs
    ///   - titleColor: color of text on the button
    ///   - backGroundColor: color of button
    ///   - height: height of the button
    ///   - width: width of a button
    /// - Returns: A button that conforms to the defined parameters
    static func createButton(_ title: String, target: Selector?, titleColor: UIColor? = .fontBlack,
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

    /// creates UITableView with specified parameters
    /// - Parameters:
    ///   - delegate: tableView delegate
    ///   - dataSource: tableView dataSource
    ///   - rowHeight: height of the tableViewCell
    ///   - estimatedRowHeight: estimated height o the tableViewCells
    /// - Returns: UITableView conforming to the dfined parameter
    static func createTableView(delegate: UITableViewDelegate,
                                dataSource: UITableViewDataSource,
                                rowHeight: CGFloat? = nil,
                                estimatedRowHeight: CGFloat? = nil) -> UITableView {
        let tableView = UITableView()
        tableView.delegate = delegate
        tableView.dataSource = dataSource
        if let rowHeight = rowHeight {
            tableView.rowHeight = rowHeight
        }
        if let estimatedRowHeight = estimatedRowHeight {
            tableView.estimatedRowHeight = estimatedRowHeight
        }
        return tableView
    }

    /// registers specified cell calss to the defined tableView
    /// - Parameters:
    ///   - tableView: tabelview you wish to register cell with
    ///   - cellClass: the tabeviewcellClass you wish to use
    ///   - cellReuseIdentifier: the cell reuse identifier
    static func registerCells(for tableView: UITableView, cellClass: AnyClass, cellReuseIdentifier: String) {
        tableView.register(cellClass, forCellReuseIdentifier: cellReuseIdentifier)
    }
}
