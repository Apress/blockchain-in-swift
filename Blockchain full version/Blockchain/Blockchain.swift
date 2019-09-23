//
//  Blockchain.swift
//  Blockchain
//
//  Created by Elshad on 14/7/19.
//  Copyright © 2019 Apress. All rights reserved.
//

import UIKit

class Blockchain {
    //logic for the Blockchain here
    var chain = [Block]()
    
    func createInitialBlock(data:String) {
        let initialBlock = Block()
        initialBlock.hash = initialBlock.generateHash()
        initialBlock.data = data
        initialBlock.previousHash = "0000"
        initialBlock.index = 0
        chain.append(initialBlock)
    }
    
    func createBlock(data:String) {
        let newBlock = Block()
        newBlock.hash = newBlock.generateHash()
        newBlock.data = data
        newBlock.previousHash = chain[chain.count - 1].hash
        newBlock.index = chain.count
        chain.append(newBlock)
    }
    
 
    
    
}


