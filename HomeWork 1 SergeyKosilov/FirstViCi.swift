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

    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet var homeWorkView: UIView!
    
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
   
    @IBAction func hintActionButton(_ sender: UIButton){
        let login = loginTextField.text
        if dict.keys.contains(login!) == true {
        labelNonPassword.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        labelNonPassword.text = "Name of teacher"
        }else{
            labelNonPassword.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            labelNonPassword.text = "Put login"
            
        }
        
        
    }
    
    
    
    @IBAction func textFieldCganged(_ sender: UITextField) {
        
        let login = loginTextField.text
        let password = passwordTextFild.text
        if dict.keys.contains(login!) == true && dict.values.contains(password!) == true{
            btnEnter.setTitleColor(UIColor.black, for: UIControl.State.normal)
            btnEnter.isEnabled = true
            labelNonPassword.textColor = #colorLiteral(red: 0.5186036825, green: 0.8912252784, blue: 0.9079722762, alpha: 1)
            labelNonLog.textColor = #colorLiteral(red: 0.5186036825, green: 0.8912252784, blue: 0.9079722762, alpha: 1)
            
        }
        if dict.keys.contains(login!) == false && dict.values.contains(password!) == true{
            btnEnter.isEnabled = false
            btnEnter.setTitleColor(UIColor.gray, for: UIControl.State.normal)
            labelNonLog.textColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
        }
        if dict.keys.contains(login!) == true && dict.values.contains(password!) == false{
            btnEnter.setTitleColor(UIColor.gray, for: UIControl.State.normal)
            btnEnter.isEnabled = false
            labelNonPassword.textColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
        }
        if dict.keys.contains(login!) == false && dict.values.contains(password!) == false{
            btnEnter.isEnabled = false
            btnEnter.setTitleColor(UIColor.gray, for: UIControl.State.normal)
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
        
        registerForKeyboardNotifications()
    }
    deinit {
        removeKeyboardNotifications()
    }
    
    //MARK:keyboard
    func registerForKeyboardNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(kbWillShow), name: Notification.Name.init("keyboardWillShowNotification") ,object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(kbWillHide), name: NSNotification.Name.init("keyboardWillHideNotification"), object: nil)
    }
    
    func removeKeyboardNotifications() {
        NotificationCenter.default.removeObserver(self, name: Notification.Name.init("keyboardWillShowNotification"),
                                                        object: nil)
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.init("keyboardWillHideNotification"), object: nil)
    }
    
    @objc func kbWillShow(_ notification: Notification) {
        let userInfo = notification.userInfo
        let kbFrameSize = (userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        scrollView.contentOffset = CGPoint(x: 0, y: kbFrameSize.height)
    }
    
    @objc func kbWillHide() {
        scrollView.contentOffset = CGPoint.zero
    }
    
   
}


