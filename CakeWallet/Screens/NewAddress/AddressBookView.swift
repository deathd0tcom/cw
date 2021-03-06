import UIKit
import FlexLayout

final class AddressBookView: BaseFlexView {
    let table: UITableView
    
    required init() {
        table = UITableView()
    
        super.init()
    }
    
    override func configureView() {
        super.configureView()
        
        table.tableFooterView = UIView()
        table.backgroundColor = .clear
        table.separatorStyle = .none
        backgroundColor = UserInterfaceTheme.current.background
    }
    
    override func configureConstraints() {
        rootFlexContainer.flex
            .paddingTop(10)
            .backgroundColor(UserInterfaceTheme.current.background)
            .define { flex in
                flex.addItem(table).height(100%).width(100%)
        }
    }
}
