//
//  changeAmount.swift
//  budgetApp
//
//  Created by Graham Desmond on 11/19/20.
//

import UIKit

class changeAmount: UIViewController {
    var newNum = -1.0
    @IBOutlet weak var continueButton: UIButton!
    @IBOutlet weak var textBox: UITextField!
    override func viewDidLoad() {
        let oldAmount = changeCategory
        let old = "$" + String(format: "%.2f", Double(oldAmount))
        navigationController?.setNavigationBarHidden(true, animated: false)
        textBox.attributedPlaceholder = NSAttributedString(string: old, attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray, .font: UIFont.systemFont(ofSize: 25)])
        super.viewDidLoad()

        self.tabBarController?.tabBar.isHidden = true
        self.textBox.keyboardType = UIKeyboardType.decimalPad
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)

        // Do any additional setup after loading the view.
    }
    
    @IBAction func continueButtonPressed(_ sender: Any)
    {
        if newNum != -1.0
        {
            let myFloat = NSNumber.init(value: newNum).floatValue
            let final = CGFloat(myFloat)
            print(final)
            var dollar = UserDefaults.standard.object(forKey: "dollarAmounts") as! [CGFloat]
            let total = UserDefaults.standard.object(forKey: "totalAmounts") as! [CGFloat]
            var new = UserDefaults.standard.object(forKey: "newAmounts") as! [CGFloat]
            new[toChange] = final
            let proportion = new[toChange] / total[toChange]
            dollar[toChange] = proportion * 300
            
            
            UserDefaults.standard.set(new, forKey: "newAmounts")
                UserDefaults.standard.set(dollar, forKey: "dollarAmounts")
            
        }

    }
    
    
    @IBAction func backButton(_ sender: Any)
    {
        navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func editingText(_ sender: Any)
    {
        dismissKeyboard()
       
        let num = Double(self.textBox.text!)
        if num != nil
        {
            newNum = num!
        }
        else
        {
            textBox.attributedPlaceholder = NSAttributedString(string: "Try Again...", attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray, .font: UIFont.systemFont(ofSize: 15)])
            newNum = -1.0
        }
        print(newNum)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }


}
