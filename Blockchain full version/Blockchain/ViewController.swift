//
//  ViewController.swift
//  Blockchain
//
//  Created by Elshad on 3/7/19.
//  Copyright © 2019 App Millers. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let firstAccount = 1010
    let secondAccount = 1011
    let bitcoinChain = Blockchain()
    let reward = 100
    var accounts: [String: Int] = ["0000" : 1000000]
    let invalidAlert = UIAlertController(title: "Invalid Transaction", message: "Please check the details of your transaction", preferredStyle: .alert)
    
    
    
    @IBOutlet weak var greenAmount: UITextField!
    @IBOutlet weak var redAmount: UITextField!
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var greenLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        transaction(from: "0000", to: "\(firstAccount)", amount: 50, type: "genesis")
        transaction(from: "\(firstAccount)", to: "\(secondAccount)", amount: 10, type: "normal")
        chainState()
        self.invalidAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
    }
    
    func transaction(from: String, to: String, amount: Int, type: String) {
        if accounts[from] == nil {
            self.present(invalidAlert, animated: true, completion: nil)
            return
        } else if accounts[from]!-amount < 0 {
            self.present(invalidAlert, animated: true, completion: nil)
            return
        } else {
            accounts.updateValue(accounts[from]!-amount, forKey: from)
        }
        
        // to check 2 account
        if accounts[to] == nil {
            accounts.updateValue(amount, forKey: to)
        } else {
            accounts.updateValue(accounts[to]!+amount, forKey: to)
        }
        
        //
        if type == "genesis" {
            bitcoinChain.createInitialBlock(data: "From: \(from); To: \(to); Amount: \(amount) BTC")
            
        } else if type == "normal" {
            bitcoinChain.createBlock(data: "From: \(from); To: \(to); Amount: \(amount) BTC")
        }
    }
    
    
    func chainState() {
        for i in 0...bitcoinChain.chain.count-1 {
            print("\tBlock: \(bitcoinChain.chain[i].index!)\n\tHash: \(bitcoinChain.chain[i].hash!)\n\tPreviousHash: \(bitcoinChain.chain[i].previousHash!)\n\tData: \(bitcoinChain.chain[i].data!)")
        }
        redLabel.text = "Balance: \(accounts[String(describing: firstAccount)]!) BTC"
        greenLabel.text = "Balance: \(accounts[String(describing: secondAccount)]!) BTC"
        print(accounts)
        print(chainValidity())
    }
    
    func chainValidity() -> String {
        var isChainValid = true
        for i in 1...bitcoinChain.chain.count-1 {
            if bitcoinChain.chain[i].previousHash != bitcoinChain.chain[i-1].hash {
                isChainValid = false
            }
        }
        return "Chain is valid: \(isChainValid)\n"
    }
    
    
    
    
    
    
    
    @IBAction func redMine(_ sender: Any) {
        transaction(from: "0000", to: "\(firstAccount)", amount: 100, type: "normal")
        print("New block mined by: \(firstAccount)")
        chainState()
    }
    
    @IBAction func greenMine(_ sender: Any) {
        transaction(from: "0000", to: "\(secondAccount)", amount: 100, type: "normal")
        print("New block mined by: \(secondAccount)")
        chainState()
    }
    
    @IBAction func redSend(_ sender: Any) {
        if redAmount.text == "" {
            present(invalidAlert, animated: true, completion: nil)
        } else {
            transaction(from: "\(firstAccount)", to: "\(secondAccount)", amount: Int(redAmount.text!)!, type: "normal")
            print("\(redAmount.text!) BTC sent from \(firstAccount) to \(secondAccount)")
            chainState()
            redAmount.text = ""
        }
    }
    
    @IBAction func greenSend(_ sender: Any) {
        if greenAmount.text == "" {
            present(invalidAlert, animated: true, completion: nil)
        } else {
            transaction(from: "\(secondAccount)", to: "\(firstAccount)", amount: Int(greenAmount.text!)!, type: "normal")
            print("\(greenAmount.text!) BTC sent from \(secondAccount) to \(firstAccount)")
            chainState()
            greenAmount.text = ""
        }
    }
    
    
}

extension ViewController {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

