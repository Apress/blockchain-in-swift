//
//  ViewController.swift
//  Blockchain
//
//  Created by Elshad on 3/7/19.
//  Copyright © 2019 App Millers. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    @IBOutlet weak var greenAmount: UITextField!
    @IBOutlet weak var redAmount: UITextField!
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var greenLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
       
    }
    
    func transaction(from: String, to: String, amount: Int, type: String) {
       
    }
    
    
    func chainState() {
     
    }
    
    func chainValidity() -> String {
       
        return "String"
    }
    
    
    
    
    
    
    
    @IBAction func redMine(_ sender: Any) {
       
    }
    
    @IBAction func greenMine(_ sender: Any) {
       
    }
    
    @IBAction func redSend(_ sender: Any) {
      
    }
    
    @IBAction func greenSend(_ sender: Any) {
       
    }
    
    
}

extension ViewController {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

