//
//  Collection.swift
//  Onboarding
//
//  Created by Thành Mai on 23/06/2023.
//

import UIKit

open class ReusableTableViewCell: UITableViewCell {
    public class var reuseIdentifier: String {
        return "\(self.self)"
    }
    
    public static func registerWithTable(tableview: UITableView) {
        let bundle = Bundle(for: self)
        let nib = UINib(nibName: self.reuseIdentifier, bundle: bundle)
        tableview.register(nib, forCellReuseIdentifier: self.reuseIdentifier)
    }
}

open class ReusableCollectionViewCell: UICollectionViewCell {
    
    public class var reuseIdentifier: String {
        return "\(self.self)"
    }
    
    public static func registerWithCollectionView(_ collectionView: UICollectionView) {
        let bundle = Bundle(for: self)
        let nib = UINib(nibName: self.reuseIdentifier , bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: self.reuseIdentifier)
    }
}
