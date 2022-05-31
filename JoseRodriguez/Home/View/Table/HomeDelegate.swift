//
//  HomeDelegate.swift
//  JoseRodriguez
//
//  Created by Jose Leoncio Quispe Rodriguez on 30/05/22.
//


import UIKit

protocol HomeDelegateTableActionDelegate: class {
    func selected(index: Int)
}

final class HomeDelegate: NSObject, UITableViewDelegate {

    weak var delegate: HomeDelegateTableActionDelegate?
    
    init(actionDelegate: HomeDelegateTableActionDelegate) {
        super.init()
        self.delegate = actionDelegate
    }

    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.selected(index: indexPath.row)
    }
    
   
}
