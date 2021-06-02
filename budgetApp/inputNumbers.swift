//
//  inputNumbers.swift
//  budgetApp
//
//  Created by Graham Desmond on 11/12/20.
//

import UIKit

class inputNumbers: UIViewController, UIGestureRecognizerDelegate {

    @IBOutlet weak var num1: UITextField!
    @IBOutlet weak var num2: UITextField!
    @IBOutlet weak var num3: UITextField!
    @IBOutlet weak var num4: UITextField!
    @IBOutlet weak var num5: UITextField!
    @IBOutlet weak var budgetAmounts: UILabel!
    var total = UserDefaults.standard.object(forKey: "totalAmounts") as! [CGFloat]
    override func viewDidLoad() {
        self.navigationController?.interactivePopGestureRecognizer?.delegate = self;
        navigationController?.setNavigationBarHidden(true, animated: false)
        num1.isHidden = true
        num2.isHidden = true
        num3.isHidden = true
        num4.isHidden = true
        num5.isHidden = true
        budgetAmounts.textColor = UIColor.black
        getText()
        super.viewDidLoad()
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)

        // Do any additional setup after loading the view.
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldBeRequiredToFailBy otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
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
    
    func getText()
    {
        let names = UserDefaults.standard.object(forKey: "labels") as! [String]
        let categories = UserDefaults.standard.object(forKey: "numCategories") as! Int
        if categories >= 1
        {
            num1.isHidden = false
            
            if total[0] != 0
            {
                let x = total[0]
                let s = String(format: "$%.2f", Double(x))
                num1.attributedPlaceholder = NSAttributedString(string: s, attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
            }
            else if names.indices.contains(0)
            {
                num1.attributedPlaceholder = NSAttributedString(string: names[0],attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
            }

        }
        if categories >= 2
        {
            num2.isHidden = false
            if total[1] != 0
            {
                let x = total[1]
                let s = String(format: "$%.2f", Double(x))
                num2.attributedPlaceholder = NSAttributedString(string: s, attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
            }
            else if names.indices.contains(1)
            {
                num2.attributedPlaceholder = NSAttributedString(string: names[1],attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
            }
        }
        if categories >= 3
        {
            num3.isHidden = false
            if total[2] != 0
            {
                let x = total[2]
                let s = String(format: "$%.2f", Double(x))
                num3.attributedPlaceholder = NSAttributedString(string: s, attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
            }
            else if names.indices.contains(2)
            {
                num3.attributedPlaceholder = NSAttributedString(string: names[2],attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
            }
        }
        if categories >= 4
        {
            num4.isHidden = false
            if total[3] != 0
            {
                let x = total[3]
                let s = String(format: "$%.2f", Double(x))
                num4.attributedPlaceholder = NSAttributedString(string: s, attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
            }
            else if names.indices.contains(3)
            {
                num4.attributedPlaceholder = NSAttributedString(string: names[3],attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
            }
        }
        if categories == 5
        {
            num5.isHidden = false
            if total[4] != 0
            {
                let x = total[4]
                let s = String(format: "$%.2f", Double(x))
                num5.attributedPlaceholder = NSAttributedString(string: s, attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
            }
            else if names.indices.contains(4)
            {
                num5.attributedPlaceholder = NSAttributedString(string: names[4],attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
            }
        }
    }
    
    @IBAction func num1Input(_ sender: Any)
    {
        dismissKeyboard()
        let str = String(num1.text!)
        let secStr : NSString = str as NSString
        let final : CGFloat = CGFloat(secStr.doubleValue)
        total[0] = final
        UserDefaults.standard.set(total, forKey: "totalAmounts")
    }
    @IBAction func num2Input(_ sender: Any)
    {
        dismissKeyboard()
        let str = String(num2.text!)
        let secStr : NSString = str as NSString
        let final : CGFloat = CGFloat(secStr.doubleValue)
        total[1] = final
        UserDefaults.standard.set(total, forKey: "totalAmounts")
        let new = UserDefaults.standard.object(forKey: "newAmounts") as! [CGFloat]
        let total = UserDefaults.standard.object(forKey: "totalAmounts") as! [CGFloat]
        var dollar = UserDefaults.standard.object(forKey: "dollarAmounts") as! [CGFloat]
        let proportion = new[1]/total[1]
        dollar[1] = proportion * 300
        UserDefaults.standard.set(dollar, forKey: "dollarAmounts")
    }
    @IBAction func num3Input(_ sender: Any)
    {
        //NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        //NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        dismissKeyboard()
        let str = String(num3.text!)
        let secStr : NSString = str as NSString
        let final : CGFloat = CGFloat(secStr.doubleValue)
        total[2] = final
        UserDefaults.standard.set(total, forKey: "totalAmounts")
        let new = UserDefaults.standard.object(forKey: "newAmounts") as! [CGFloat]
        let total = UserDefaults.standard.object(forKey: "totalAmounts") as! [CGFloat]
        var dollar = UserDefaults.standard.object(forKey: "dollarAmounts") as! [CGFloat]
        let proportion = new[2]/total[2]
        dollar[2] = proportion * 300
        UserDefaults.standard.set(dollar, forKey: "dollarAmounts")
    }
    
    @IBAction func num4Input(_ sender: Any)
    {
        dismissKeyboard()
        let str = String(num4.text!)
        let secStr : NSString = str as NSString
        let final : CGFloat = CGFloat(secStr.doubleValue)
        total[3] = final
        UserDefaults.standard.set(total, forKey: "totalAmounts")
        let new = UserDefaults.standard.object(forKey: "newAmounts") as! [CGFloat]
        let total = UserDefaults.standard.object(forKey: "totalAmounts") as! [CGFloat]
        var dollar = UserDefaults.standard.object(forKey: "dollarAmounts") as! [CGFloat]
        let proportion = new[3]/total[3]
        dollar[3] = proportion * 300
        UserDefaults.standard.set(dollar, forKey: "dollarAmounts")
    }
    @IBAction func num5Input(_ sender: Any)
    {
        dismissKeyboard()
        let str = String(num5.text!)
        let secStr : NSString = str as NSString
        let final : CGFloat = CGFloat(secStr.doubleValue)
        total[4] = final
        UserDefaults.standard.set(total, forKey: "totalAmounts")
        let new = UserDefaults.standard.object(forKey: "newAmounts") as! [CGFloat]
        let total = UserDefaults.standard.object(forKey: "totalAmounts") as! [CGFloat]
        var dollar = UserDefaults.standard.object(forKey: "dollarAmounts") as! [CGFloat]
        let proportion = new[4]/total[4]
        dollar[4] = proportion * 300
        UserDefaults.standard.set(dollar, forKey: "dollarAmounts")
    }
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
