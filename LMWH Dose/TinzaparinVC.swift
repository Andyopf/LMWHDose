//
//  ViewController.swift
//  LMWH Dose
//
//  Created by Anan Lappikulthong on 1/25/18.
//  Copyright © 2018 Anan Lappikulthong. All rights reserved.
//

import UIKit

class TinzaparinVC: UIViewController, UITextFieldDelegate {
    
    var kiloW = 0
    var mlWeight = 0.00
    var mlForPatient = 0.00
    
    @IBOutlet weak var kiligramTxt: UITextField!
    @IBOutlet weak var okBtn: UIButton!
    @IBOutlet weak var unitDose: UILabel!
    @IBOutlet weak var mlDose: UILabel!
    
    @IBAction func backBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func resetBtnPress(_ sender: Any) {
        resetDose()
    }
    
    @IBAction func okBtnPress(_ sender: UIButton) {
        
        self.view.endEditing(true)
        doseCalculation()
        
    }
    
    func doseCalculation() {
        
        if kiligramTxt.text == "" {
            resetDose()
        } else {
            kiloW = Int(kiligramTxt.text!)!
            kiloW = kiloW * 175
            unitDose.text = "\(kiloW)"
            mlWeight = Double(kiloW) / 20000
            mlForPatient = mlWeight
            
            if mlWeight <= 0.315 {
                mlForPatient = 0.3
            } else if mlWeight <= 0.3675 {
                mlForPatient = 0.35
            } else if mlWeight <= 0.42 {
                mlForPatient = 0.4
            } else if mlWeight <= 0.46375 {
                mlForPatient = 0.45
            } else if mlWeight <= 0.51625 {
                mlForPatient = 0.5
            } else if mlWeight <= 0.56875 {
                mlForPatient = 0.55
            } else if mlWeight <= 0.6125 {
                mlForPatient = 0.6
            } else if mlWeight <= 0.665 {
                mlForPatient = 0.65
            } else if mlWeight <= 0.7175 {
                mlForPatient = 0.7
            } else if mlWeight > 0.7175 {
                mlForPatient = mlWeight
            }
            mlDose.text = "\(mlForPatient)"
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
    
    // press return to remove keyboard
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        kiligramTxt.resignFirstResponder()
        return true
    }
    
    // remove the keyboard when touch outside the keyboard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
    // if want to allow to rotate //
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        let appDelegate = UIApplication.shared.delegate as! AppDelegate
//        appDelegate.enableAllOrientation = true
//    }
//
//    override func viewWillDisappear(_ animated: Bool) {
//        super.viewWillDisappear(animated)
//
//        let appDelegate = UIApplication.shared.delegate as! AppDelegate
//        appDelegate.enableAllOrientation = false
//
//        let value = UIInterfaceOrientation.portrait.rawValue
//        UIDevice.current.setValue(value, forKey: "orientation")
//    }
    
}
