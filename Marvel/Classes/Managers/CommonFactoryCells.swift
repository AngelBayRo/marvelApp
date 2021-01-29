//
//  CommonFactoryCells.swift
//  Marvel
//

import UIKit

class CommonFactoryCells: NSObject {
    
    class func view(for object: Any?, tableView: UITableView, delegate: Any? = nil) -> UIView {
        return self.cell(for: object, tableView: tableView, delegate: delegate).contentView
    }
    
    class func view(for object: Any?, collectionView: UICollectionView, delegate: Any? = nil, indexPath: IndexPath) -> UIView {
        return self.cell(for: object, collectionView: collectionView, delegate: delegate, indexPath: indexPath).contentView
    }
    
    class func cell(for object: Any?, tableView: UITableView, delegate: Any? = nil) -> UITableViewCell {
        switch object {
        case let model as CharacterViewModel:
            return CharacterTableViewCellDrawer.cell(model: model, tableView: tableView, presenter: delegate)
        default:
            break
        }
        
        return UITableViewCell()
    }
    
    class func cell(for object: Any?, collectionView: UICollectionView, delegate: Any? = nil, indexPath: IndexPath) -> UICollectionViewCell {
        switch object {
        default:
            return UICollectionViewCell()
        }
    }
}
