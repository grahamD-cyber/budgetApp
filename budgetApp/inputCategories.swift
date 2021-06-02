//
//  inputCategories.swift
//  budgetApp
//
//  Created by Graham Desmond on 11/12/20.
//

import UIKit

class inputCategories: UIViewController, UITextFieldDelegate, UIGestureRecognizerDelegate{

    var placeHolder = "Enter Category..."
    @IBOutlet weak var text1: UITextField!
    @IBOutlet weak var text2: UITextField!
    @IBOutlet weak var text3: UITextField!
    @IBOutlet weak var text4: UITextField!
    @IBOutlet weak var text5: UITextField!
    @IBOutlet weak var nameCategories: UILabel!
    
    override func viewDidLoad() {
        self.navigationController?.interactivePopGestureRecognizer?.delegate = self;
        navigationController?.setNavigationBarHidden(true, animated: false)
        text1.isHidden = true
        text2.isHidden = true
        text3.isHidden = true
        text4.isHidden = true
        text5.isHidden = true
        nameCategories.textColor = UIColor.black
        //print(labels)
        getText()

        super.viewDidLoad()
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)


        // Do any additional setup after loading the view.
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= keyboardSize.height
            }
        }
    }

    @objc func keyboardWillHide(notification: NSNotification) {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }
    
    @IBAction func backButton(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldBeRequiredToFailBy otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
    
    func getText()
    {
        let names = UserDefaults.standard.object(forKey: "labels") as! [String]
        let categories = UserDefaults.standard.object(forKey: "numCategories") as! Int
        if categories >= 1
        {
            text1.isHidden = false
            if names[0] != ""
            {
                text1.attributedPlaceholder = NSAttributedString(string: names[0],attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
            }
            else
            {
                text1.attributedPlaceholder = NSAttributedString(string: "Enter Category...",attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
            }
    
        }
        if categories >= 2
        {
            text2.isHidden = false
            if names[1] != ""
            {
                text2.attributedPlaceholder = NSAttributedString(string: names[1],attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
            }
            else
            {
                text2.attributedPlaceholder = NSAttributedString(string: "Enter Category...",attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
            }
        }
        if categories >= 3
        {
            text3.isHidden = false
            if names[2] != ""
            {
                text3.attributedPlaceholder = NSAttributedString(string: names[2],attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
            }
            else
            {
                text3.attributedPlaceholder = NSAttributedString(string: "Enter Category...",attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
            }
        }
        if categories >= 4
        {
            text4.isHidden = false
            if names[3] != ""
            {
                text4.attributedPlaceholder = NSAttributedString(string: names[3],attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
            }
            else
            {
                text4.attributedPlaceholder = NSAttributedString(string: "Enter Category...",attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
            }
        }
        if categories >= 5
        {
            text5.isHidden = false
            if names[4] != ""
            {
                text5.attributedPlaceholder = NSAttributedString(string: names[4],attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
            }
            else
            {
                text5.attributedPlaceholder = NSAttributedString(string: "Enter Category...",attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
            }
        }
    }
    
    @IBAction func text1Input(_ sender: Any)
    {
        dismissKeyboard()
        var names = UserDefaults.standard.object(forKey: "labels") as! [String]
        names[0] = String(text1.text!)
        UserDefaults.standard.setValue(names, forKey: "labels")
        
        
    }
    @IBAction func text2Input(_ sender: Any)
    {
        dismissKeyboard()
        var names = UserDefaults.standard.object(forKey: "labels") as! [String]
        names[1] = String(text2.text!)
        UserDefaults.standard.setValue(names, forKey: "labels")
    }
    
    @IBAction func text3Input(_ sender: Any)
    {
        //NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        //NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        dismissKeyboard()
        var names = UserDefaults.standard.object(forKey: "labels") as! [String]
        names[2] = String(text3.text!)
        UserDefaults.standard.setValue(names, forKey: "labels")
    }
    
    @IBAction func text4Input(_ sender: Any)
    {

        dismissKeyboard()
        var names = UserDefaults.standard.object(forKey: "labels") as! [String]
        names[3] = String(text4.text!)
        UserDefaults.standard.setValue(names, forKey: "labels")
    }
    @IBAction func text5Input(_ sender: Any)
    {

        dismissKeyboard()
        var names = UserDefaults.standard.object(forKey: "labels") as! [String]
        names[4] = String(text5.text!)
        UserDefaults.standard.setValue(names, forKey: "labels")
    }
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        placeHolder = textField.placeholder ?? ""
        textField.placeholder = ""
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField.placeholder == ""{
        textField.placeholder = placeHolder
        }
    }
}

