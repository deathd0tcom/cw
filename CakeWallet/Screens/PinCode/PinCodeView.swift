import UIKit
import FlexLayout

final class PinCodeView: BaseFlexView {
    let titleLabel: UILabel
    let pinPasswordKeyboard: PinCodeKeyboard
    let pinCodesView: PinCodeIndicatorsView
    let useSixPin: UIButton
    required init() {
        titleLabel = UILabel.withLightText(fontSize: 24)
        pinPasswordKeyboard = PinCodeKeyboard()
        pinCodesView = PinCodeIndicatorsView()
        useSixPin = UIButton(type: .system)
        useSixPin.isHidden = true
        super.init()
    }
    
    override func configureView() {
        super.configureView()
        titleLabel.text = NSLocalizedString("enter_your_pin", comment: "")
        titleLabel.font = applyFont(ofSize: 18, weight: .regular)
        titleLabel.numberOfLines = 0
        titleLabel.textAlignment = .center
        let attributes = [ NSAttributedStringKey.foregroundColor : UserInterfaceTheme.current.textVariants.main, NSAttributedStringKey.font: UIFont(name: "Lato-Regular", size: 16)]
        useSixPin.setTitleColor(UserInterfaceTheme.current.textVariants.main, for: .normal)
        useSixPin.setAttributedTitle(NSAttributedString(string: NSLocalizedString("use_6_pin", comment: ""), attributes: attributes), for: .normal)
    }
    
    override func configureConstraints() {
        rootFlexContainer.flex.define { flex in
            let pinTopContainer = UIView()
            let pinPasswordKeyboardContainer = UIView()
            
            pinTopContainer.flex.direction(.column).define({ pinTopFlex in
                pinTopFlex.addItem(titleLabel).marginBottom(10).width(50%)
                pinTopFlex.addItem(pinCodesView)
                pinTopFlex.addItem(useSixPin).marginTop(10)
                }).alignItems(.center).justifyContent(.center)
            
            pinPasswordKeyboardContainer.flex.grow(1).direction(.column).define({ pinPassFlex in
                pinPassFlex.addItem(pinPasswordKeyboard).marginLeft(12%).marginRight(12%)
            }).justifyContent(.center)

            flex.addItem(pinTopContainer).maxHeight(45%).minHeight(30%)
            flex.addItem(pinPasswordKeyboardContainer)
        }.justifyContent(.spaceAround)
    }
}
