//
//  FirstVC.swift
//  HomeWork 1 SergeyKosilov
//
//  Created by Сергей Косилов on 21/06/2019.
//  Copyright © 2019 Сергей Косилов. All rights reserved.
//

import UIKit

class FirstViCi: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var btnPodskazka: UIButton!
    
    @IBOutlet weak var loginTextField: UITextField!
    
    @IBOutlet weak var passwordTextFild: UITextField!
    
    @IBOutlet weak var labelNonLog: UILabel!
    
    @IBOutlet weak var labelNonPassword: UILabel!
    
    @IBOutlet weak var btnEnterData: UIButton!
    
    @IBOutlet weak var btnNonLog: UIButton!
    
    @IBOutlet weak var btnNonPass: UIButton!
    
    @IBOutlet weak var btnEnter: UIButton!
    
    
    @IBAction func tapGestureRecognizer(_ sender: UITapGestureRecognizer) {
        self.loginTextField.resignFirstResponder()
        self.passwordTextFild.resignFirstResponder()
    }
    
    
    @IBAction func textFieldCganged(_ sender: UITextField) {
        
        let login = loginTextField.text
        let password = passwordTextFild.text
        if login != "Write Login", login != "", password != "Write Password", password != "" {
            btnEnter.isEnabled = true
            
        }else{
             btnEnter.isEnabled = false
            
        }

        
    }
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        btnEnter.isEnabled = false
        loginTextField.delegate = self
        passwordTextFild.delegate = self
        labelNonPassword.textColor = #colorLiteral(red: 0.5186036825, green: 0.8912252784, blue: 0.9079722762, alpha: 1)
        labelNonLog.textColor = #colorLiteral(red: 0.5186036825, green: 0.8912252784, blue: 0.9079722762, alpha: 1)
    }
    
    
   
    
    override func viewWillAppear(_ animated: Bool) {
      
      
        
    }
    
    
    
    
    
    
    


}
//1.Пытался сделать label.isEnable = false - пропадали textField
