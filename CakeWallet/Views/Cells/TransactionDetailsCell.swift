import UIKit

final class TransactionDetailsCell: FlexCell {

    let titleLabel: UILabel
    let valueLabel: UILabel
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        titleLabel = UILabel(fontSize: 14)
        valueLabel = UILabel.withLightText(fontSize: 14)
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    override func configureView() {
        super.configureView()
        contentView.backgroundColor = UserInterfaceTheme.current.background
        selectionStyle = .none
        titleLabel.backgroundColor = .clear
        valueLabel.backgroundColor = .clear
        titleLabel.textColor = UserInterfaceTheme.current.textVariants.highlight
        valueLabel.textColor = UserInterfaceTheme.current.textVariants.main
        titleLabel.numberOfLines = 0
        valueLabel.numberOfLines = 0
    }
    
    override func configureConstraints() {
        contentView.flex.paddingVertical(10).define { flex in
            flex.addItem(titleLabel)
            flex.addItem(valueLabel)
        }
    }
    
    func configure(title: String, value: String) {
        titleLabel.text = title
        valueLabel.text = value
        titleLabel.backgroundColor = .clear
        valueLabel.backgroundColor = .clear
        titleLabel.flex.markDirty()
        valueLabel.flex.markDirty()
        layout()
    }
}
