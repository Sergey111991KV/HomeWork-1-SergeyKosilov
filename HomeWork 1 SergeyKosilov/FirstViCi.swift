//
//  FirstVC.swift
//  HomeWork 1 SergeyKosilov
//
//  Created by Сергей Косилов on 21/06/2019.
//  Copyright © 2019 Сергей Косилов. All rights reserved.
//

import UIKit



var dict : [String:String] = [:]
//var loginUser = [String](dict.keys)
//var passwordUser = [String](dict.values)

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
    
    
    
    @IBAction func goSecond (_ sender: UIButton){
       performSegue(withIdentifier: "LoginMade", sender: nil)
    }
        
    @IBAction func goThird (_ sender: UIButton){
        performSegue(withIdentifier: "Registration/forgotten", sender: nil)
    }
        

    @IBAction func tapGestureRecognizer(_ sender: UITapGestureRecognizer) {
        self.loginTextField.resignFirstResponder()
        self.passwordTextFild.resignFirstResponder()
    }
   
    
    
    
    
    @IBAction func textFieldCganged(_ sender: UITextField) {
        
        let login = loginTextField.text
        let password = passwordTextFild.text
        if dict.keys.contains(login!) == true && dict.values.contains(password!) == true{
            btnEnter.isEnabled = true
            labelNonPassword.textColor = #colorLiteral(red: 0.5186036825, green: 0.8912252784, blue: 0.9079722762, alpha: 1)
            labelNonLog.textColor = #colorLiteral(red: 0.5186036825, green: 0.8912252784, blue: 0.9079722762, alpha: 1)
            
        }
        if dict.keys.contains(login!) == false && dict.values.contains(password!) == true{
            btnEnter.isEnabled = false
            labelNonLog.textColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
        }
        if dict.keys.contains(login!) == true && dict.values.contains(password!) == false{
            btnEnter.isEnabled = false
            labelNonPassword.textColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
        }
        if dict.keys.contains(login!) == false && dict.values.contains(password!) == false{
            btnEnter.isEnabled = false
            labelNonPassword.textColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
            labelNonPassword.textColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
            
        }else{
            return
        }
            
        }

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        btnEnter.isEnabled = false
        loginTextField.delegate = self
        passwordTextFild.delegate = self
        labelNonPassword.textColor = #colorLiteral(red: 0.5186036825, green: 0.8912252784, blue: 0.9079722762, alpha: 1)
        labelNonLog.textColor = #colorLiteral(red: 0.5186036825, green: 0.8912252784, blue: 0.9079722762, alpha: 1)
        
        dict.updateValue("Denis", forKey: "Denis")
//        print(dict)
//        print(loginUser)
//        print(passwordUser)
//        print(loginTextField.text)
//        print(passwordTextFild.text)
    }
    
    
   
    
    override func viewWillAppear(_ animated: Bool) {
      
      
        
    }
    
    
   
    
    


}
//1.Пытался сделать label.isEnable = false - пропадали textField
//2.Как добавить обновление текстовых полей - получается, что я уже ввел все правильно, но пока не два раза не нажал на вход он не обновился и обратно - когда уже стер поле, кнопка входа до сих пор переходит по сегвею
