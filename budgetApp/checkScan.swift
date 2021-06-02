//
//  checkScan.swift
//  budgetApp
//
//  Created by Graham Desmond on 11/11/20.
//

import UIKit

class checkScan: UIViewController, UIGestureRecognizerDelegate {

    @IBOutlet weak var yesButton: UIButton!
    
    @IBOutlet weak var noButton: UIButton!
    @IBOutlet weak var DoesThisLookRight: UILabel!
    @IBOutlet weak var amountText: UILabel!
    override func viewDidLoad() {
        self.navigationController?.interactivePopGestureRecognizer?.delegate = self;
        
        noButton.isHidden = false
        yesButton.isHidden = false
        DoesThisLookRight.textColor = UIColor.black
        if totalNum == 0.0
        {
            amountText.text = "Couldn't find total. Please try again"
            amountText.textColor = .black
            amountText.font = UIFont.boldSystemFont(ofSize: 25)
            yesButton.isHidden = true
            noButton.setTitle("Rescan", for: .normal)
            noButton.titleLabel?.textAlignment = .center
            noButton.setTitleColor(.black, for: .normal)
           noButton.titleLabel?.font =  UIFont.boldSystemFont(ofSize: 30)
        }
        else
        {
            let x = Double(totalNum)
            let y = Double(round(100*x)/100)
            amountText.text = String(y)
            amountText.textColor = .black
            amountText.font = UIFont.boldSystemFont(ofSize: 70)
            noButton.setTitle("No", for: .normal)
            noButton.titleLabel?.textAlignment = .center
            noButton.setTitleColor(.black, for: .normal)
           noButton.titleLabel?.font =  UIFont.boldSystemFont(ofSize: 30)
        }
        navigationController?.setNavigationBarHidden(true, animated: false)
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldBeRequiredToFailBy otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }


}
