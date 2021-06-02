//
//  enterViewController.swift
//  budgetApp
//
//  Created by Graham Desmond on 11/10/20.
//

import UIKit
import SwiftUI

class enterViewController: UIViewController, UIGestureRecognizerDelegate {

    @IBOutlet weak var enterTextAmount: UITextField!
    @IBOutlet weak var backButton: UIButton!
        
   
    override func viewDidLoad() {
        self.navigationController?.interactivePopGestureRecognizer?.delegate = self;

        navigationController?.setNavigationBarHidden(true, animated: false)
        enterTextAmount.attributedPlaceholder = NSAttributedString(string: "Enter Amount...", attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray, .font: UIFont.systemFont(ofSize: 15)])
        super.viewDidLoad()

        self.tabBarController?.tabBar.isHidden = true
        self.enterTextAmount.keyboardType = UIKeyboardType.decimalPad
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)


        // Do any additional setup after loading the view.
    }
    override var prefersStatusBarHidden: Bool {
        return false
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldBeRequiredToFailBy otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
    
    @IBAction func backButton(_ sender: Any)
    {
        navigationController?.popViewController(animated: true)
    }
    
    
    @IBSegueAction func goToChart(_ coder: NSCoder) -> UIViewController? {
        let dollar = UserDefaults.standard.object(forKey: "dollarAmounts") as! [CGFloat]
        return UIHostingController(coder: coder, rootView: ContentView(values: dollar, array: defineHeader()))
    }
    
    @IBAction func enterAmount(_ sender: Any)
    {
        totalNum = 0
        dismissKeyboard()
       
        let num = Double(self.enterTextAmount.text!)
        if num != nil
        {
            totalNum = num!
        }
        else
        {
            enterTextAmount.attributedPlaceholder = NSAttributedString(string: "Try Again...", attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray, .font: UIFont.systemFont(ofSize: 15)])
        }
        print(totalNum)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }

}
