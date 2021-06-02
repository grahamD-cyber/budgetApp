//
//  pickToChangeAmount.swift
//  budgetApp
//
//  Created by Graham Desmond on 11/19/20.
//

import UIKit
var changeCategory:CGFloat = 0.0
var toChange = 0
class pickToChangeAmount: UIViewController {

    let amounts = UserDefaults.standard.object(forKey: "newAmounts") as! [CGFloat]
    @IBOutlet weak var B1: UIButton!
    @IBOutlet weak var B2: UIButton!
    @IBOutlet weak var B3: UIButton!
    @IBOutlet weak var B4: UIButton!
    @IBOutlet weak var B5: UIButton!
    
    override func viewDidLoad() {
        B1.isHidden = true
        B2.isHidden = true
        B3.isHidden = true
        B4.isHidden = true
        B5.isHidden = true
        super.viewDidLoad()
        nameButtons()
        
        // Do any additional setup after loading the view.
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
    @IBAction func backButton(_ sender: Any)
    {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func B1Pressed(_ sender: Any)
    {
        changeCategory = self.amounts[0]
        toChange = 0
    }
    
    @IBAction func B2Pressed(_ sender: Any)
    {
        changeCategory = self.amounts[1]
        print(changeCategory)
        toChange = 1
        print("DONE")
    }
    
    @IBAction func B3Pressed(_ sender: Any)
    {
        changeCategory = self.amounts[2]
        toChange = 2
    }
    
    @IBAction func B4Pressed(_ sender: Any)
    {
        changeCategory = self.amounts[3]
        toChange = 3
    }

    @IBAction func B5Pressed(_ sender: Any)
    {
        changeCategory = self.amounts[4]
        toChange = 4
    }
    

}
