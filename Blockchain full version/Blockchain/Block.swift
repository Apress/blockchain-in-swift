//
//  Block.swift
//  Blockchain
//
//  Created by Elshad on 14/7/19.
//  Copyright © 2019 Apress. All rights reserved.
//

import UIKit

class Block {
    // logic for Block here
    var hash: String!
    var data: String!
    var previousHash: String!
    var index: Int!
    
    func generateHash() -> String {
        return NSUUID().uuidString.replacingOccurrences(of: "-", with: "")
    }

}
