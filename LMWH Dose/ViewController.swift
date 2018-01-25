//
//  ViewController.swift
//  LMWH Dose
//
//  Created by Anan Lappikulthong on 1/25/18.
//  Copyright © 2018 Anan Lappikulthong. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    var kiloW = 0
    var mlWeight = 0.00
    
    @IBOutlet weak var kiligramTxt: UITextField!
    @IBOutlet weak var okBtn: UIButton!
    @IBOutlet weak var unitDose: UILabel!
    @IBOutlet weak var mlDose: UILabel!
    
    @IBAction func resetBtnPress(_ sender: Any) {
        resetDose()
    }
    @IBAction func okBtnPress(_ sender: UIButton) {
        
        if kiligramTxt.text == "" {
            resetDose()
        } else {
            kiloW = Int(kiligramTxt.text!)!
            kiloW = kiloW * 175
            unitDose.text = "\(kiloW)"
            mlWeight = Double(kiloW) / 20000
            
            if mlWeight <= 0.3 {
                mlWeight = 0.3
            } else if mlWeight <= 0.35 {
                mlWeight = 0.35
            } else if mlWeight <= 0.4 {
                mlWeight = 0.4
            } else if mlWeight <= 0.45 {
                mlWeight = 0.45
            } else if mlWeight <= 0.5 {
                mlWeight = 0.5
            }
            mlDose.text = "\(mlWeight)"
            
        }
        
    }
    
    func resetDose() {
        kiligramTxt.text = ""
        unitDose.text = "00"
        mlDose.text = "00"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.kiligramTxt.becomeFirstResponder()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
}
