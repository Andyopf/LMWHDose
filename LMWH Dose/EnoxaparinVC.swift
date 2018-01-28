//
//  EnoxaparinViewController.swift
//  LMWH Dose
//
//  Created by Anan Lappikulthong on 1/27/18.
//  Copyright © 2018 Anan Lappikulthong. All rights reserved.
//

import UIKit

// 20 mg of enoxaparin = 0.2 ml
// 1 mg/kg SC twice a day
// if CrCl < 30 ml adjust dose for OD dose

class EnoxaparinVC: UIViewController, UITextFieldDelegate {
    
    var kiloW = 0
    var mlWeight = 0.00
    var mlForPatient = 0.00
    var creatinineCl = 0.00
    
    @IBOutlet weak var kilogramTxt: UITextField!
    @IBOutlet weak var CrClTxt: UITextField!
    @IBOutlet weak var okBtn: UIButton!
    @IBOutlet weak var unitDoseLbl: UILabel!
    @IBOutlet weak var mlDoseLbl: UILabel!
    @IBOutlet weak var remarkLbl: UILabel!
    
    @IBAction func okBtnPressed() {
        self.view.endEditing(true)
        doseCalculation()
    }
    
    @IBAction func resetBtnPressed() {
        resetDose()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.kilogramTxt.delegate = self
        self.kilogramTxt.becomeFirstResponder()
        
    }
    
    func resetDose() {
        kilogramTxt.text = ""
        unitDoseLbl.text = "00"
        mlDoseLbl.text = "00"
        CrClTxt.text = ""
    }
    
    func doseCalculation() {
        
        if kilogramTxt.text == "" {
            resetDose()
        } else {
            if CrClTxt.text == "" {
                remarkLbl.text = "If creatinine clearance less than 30 mg/dL use once a day dose"
                CrClTxt.text = "0"
            }

            crCalculation()
            
// for weight calculation
            kiloW = Int(kilogramTxt.text!)!
            unitDoseLbl.text = "\(kiloW)"
            mlWeight = Double(kiloW) / 100
            mlDoseLbl.text = "\(mlWeight)"
        }
    }
    
    @IBAction func backBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    // remove the keyboard when touch outside the keyboard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    // press return to remove keyboard
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        kilogramTxt.resignFirstResponder()
        return true
    }
    
    func crCalculation() {
        
        creatinineCl = Double(CrClTxt.text!)!
        
        if creatinineCl >= 30 {
            remarkLbl.text = "Dose for twice a day"
        } else if creatinineCl < 30 {
            remarkLbl.text = "Usage dose for once a day"
        } else {
            remarkLbl.text = "Please insert creatinine clearance value"
        }
    }

}
