import UIKit

extension UITableViewCell {
    func isCurrent(_ isCurrent: Bool) {
        let color: UIColor = isCurrent ? UserInterfaceTheme.current.purple.dim : UserInterfaceTheme.current.background
        contentView.backgroundColor = color
        backgroundColor = color
    }
}
