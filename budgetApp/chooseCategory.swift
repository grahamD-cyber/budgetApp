//
//  chooseCategory.swift
//  budgetApp
//
//  Created by Graham Desmond on 11/11/20.
//

import UIKit
import SwiftUI

class chooseCategory: UIViewController, UIGestureRecognizerDelegate {

    @IBOutlet weak var B1: UIButton!
    @IBOutlet weak var B2: UIButton!
    @IBOutlet weak var B3: UIButton!
    @IBOutlet weak var B4: UIButton!
    @IBOutlet weak var B5: UIButton!
    
    override func viewDidLoad() {
        self.navigationController?.interactivePopGestureRecognizer?.delegate = self;
        B1.isHidden = true
        B2.isHidden = true
        B3.isHidden = true
        B4.isHidden = true
        B5.isHidden = true
        
        nameButtons()
        super.viewDidLoad()
       
    }
   
    func nameButtons()
    {
        let names = UserDefaults.standard.object(forKey: "labels") as! [String]
        let buttonArray: [UIButton] = [B1, B2, B3, B4, B5]
        let categories = UserDefaults.standard.object(forKey: "numCategories") as! Int
        for i in 0..<categories
        {
            buttonArray[i].setTitle(String(names[i]), for: .normal)
            buttonArray[i].titleLabel?.textAlignment = .center
            buttonArray[i].setTitleColor(.black, for: .normal)
            buttonArray[i].titleLabel?.font =  UIFont.boldSystemFont(ofSize: 22)
            buttonArray[i].isHidden = false
        }
    }

    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldBeRequiredToFailBy otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
    

    @IBAction func backButton(_ sender: Any)
    {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func B1Pressed(_ sender: Any)
    {
        let total = UserDefaults.standard.object(forKey: "totalAmounts") as! [CGFloat]
        var new = UserDefaults.standard.object(forKey: "newAmounts") as! [CGFloat]
        var dollar = UserDefaults.standard.object(forKey: "dollarAmounts") as! [CGFloat]

        new[0] = new[0] + CGFloat(totalNum)
        UserDefaults.standard.set(new, forKey: "newAmounts")
        if new[0] <= total[0]
        {
            let proportion = new[0] / total[0]
            dollar[0] = proportion * 300
            UserDefaults.standard.set(dollar, forKey: "dollarAmounts")

        }
        else
        {
            
            dollar[0] = 300
            UserDefaults.standard.set(dollar, forKey: "dollarAmounts")

        }
    }
    
    @IBAction func B2Pressed(_ sender: Any) {
        let total = UserDefaults.standard.object(forKey: "totalAmounts") as! [CGFloat]
        var new = UserDefaults.standard.object(forKey: "newAmounts") as! [CGFloat]
        var dollar = UserDefaults.standard.object(forKey: "dollarAmounts") as! [CGFloat]

        new[1] = new[1] + CGFloat(totalNum)
        UserDefaults.standard.set(new, forKey: "newAmounts")
        if new[1] <= total[1]
        {
            let proportion = new[1] / total[1]
            dollar[1] = proportion * 300
            UserDefaults.standard.set(dollar, forKey: "dollarAmounts")

        }
        else
        {
            
            dollar[1] = 300
            UserDefaults.standard.set(dollar, forKey: "dollarAmounts")

        }
    }
    
    @IBAction func B3Pressed(_ sender: Any) {
        let total = UserDefaults.standard.object(forKey: "totalAmounts") as! [CGFloat]
        var new = UserDefaults.standard.object(forKey: "newAmounts") as! [CGFloat]
        var dollar = UserDefaults.standard.object(forKey: "dollarAmounts") as! [CGFloat]

        new[2] = new[2] + CGFloat(totalNum)
        UserDefaults.standard.set(new, forKey: "newAmounts")
        if new[2] <= total[2]
        {
            let proportion = new[2] / total[2]
            dollar[2] = proportion * 300
            UserDefaults.standard.set(dollar, forKey: "dollarAmounts")

        }
        else
        {
            
            dollar[2] = 300
            UserDefaults.standard.set(dollar, forKey: "dollarAmounts")

        }
    }
    
    @IBAction func B4Pressed(_ sender: Any) {
        let total = UserDefaults.standard.object(forKey: "totalAmounts") as! [CGFloat]
        var new = UserDefaults.standard.object(forKey: "newAmounts") as! [CGFloat]
        var dollar = UserDefaults.standard.object(forKey: "dollarAmounts") as! [CGFloat]

        new[3] = new[3] + CGFloat(totalNum)
        UserDefaults.standard.set(new, forKey: "newAmounts")
        if new[3] <= total[3]
        {
            let proportion = new[3] / total[3]
            dollar[3] = proportion * 300
            UserDefaults.standard.set(dollar, forKey: "dollarAmounts")

        }
        else
        {
            
            dollar[3] = 300
            UserDefaults.standard.set(dollar, forKey: "dollarAmounts")

        }
    }
    
    @IBAction func B5Pressed(_ sender: Any) {
        let total = UserDefaults.standard.object(forKey: "totalAmounts") as! [CGFloat]
        var new = UserDefaults.standard.object(forKey: "newAmounts") as! [CGFloat]
        var dollar = UserDefaults.standard.object(forKey: "dollarAmounts") as! [CGFloat]

        new[4] = new[4] + CGFloat(totalNum)
        UserDefaults.standard.set(new, forKey: "newAmounts")
        if new[4] <= total[4]
        {
            let proportion = new[4] / total[4]
            dollar[4] = proportion * 300
            UserDefaults.standard.set(dollar, forKey: "dollarAmounts")

        }
        else
        {
            
            dollar[4] = 300
            UserDefaults.standard.set(dollar, forKey: "dollarAmounts")

        }
    }
    
}
