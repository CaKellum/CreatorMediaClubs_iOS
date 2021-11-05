import UIKit

extension UIColor {
    static let fontBlack = color(from: "#1C110A")
    static let headerBlue = color(from: "#A3D9FF")
    static let sucessGreen = color(from: "#20BF55")
    static let failingRed = color(from: "#C41E3D")
    static let noteYellow = color(from: "#ECDOA1")

    /// converts hex to UIColor
    /// - Parameter hexStr: a hedecimal number in a string
    /// - Returns: the color that the hex string provides, if invalid hexStr the whites
    static func color(from hexStr: String) -> UIColor {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0

        if hexStr.hasPrefix("#") {
            let start = hexStr.index(hexStr.startIndex, offsetBy: 1)
            let hexColor = String(hexStr[start...])

            if hexColor.count == 8 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0

                if scanner.scanHexInt64(&hexNumber) {
                    red = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                    green = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                    blue = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                }
            }
        }
        return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
    }
}
