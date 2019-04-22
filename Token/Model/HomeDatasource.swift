//
//  HomeDatasource.swift
//  Token
//
//  Created by P. J. Hernandez on 4/21/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import LBTAComponents

class HomeDatasource: Datasource  {
    let words = ["user1", "user2", "user3", "user4"]
   // let images = ["pj", "jake", "jason", "jerry"]
    
    
    override func headerClasses() -> [DatasourceCell.Type]? {
        return [UserHeader.self]
    }
    
    override func cellClasses() -> [DatasourceCell.Type] {
        return [UserCell.self]
    }
    override func item(_ indexPath: IndexPath) -> Any? {
        return words[indexPath.item]
    }
//    override func item(_ indexPath: IndexPath) -> Any? {
//        return images[indexPath.item]
//    }
    override func numberOfItems(_ section: Int) -> Int {
        return words.count
    }
    
    override func footerClasses() -> [DatasourceCell.Type]? {
        return [UserFooter.self]
    }
    
}
