//
//  embedViewController.swift
//  budgetApp
//
//  Created by Graham Desmond on 11/16/20.
//

import UIKit
import SwiftUI


class embedViewController: UIViewController, UIGestureRecognizerDelegate {


    @IBOutlet weak var pastSummaries: UIButton!
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var bar3: UIImageView!
    @IBOutlet weak var bar4: UIImageView!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var chart: UIButton!
    @IBOutlet weak var add: UIButton!
    @IBOutlet weak var settings: UIButton!
    override func viewDidLoad() {
        
        let isPast = UserDefaults.standard.object(forKey: "end1") as! String
        print("IS PAST")
        print(isPast)
        if isPast != ""
        {
            pastSummaries.isHidden = false
        }
        else
        {
            pastSummaries.isHidden = true
        }
        
        self.navigationController?.interactivePopGestureRecognizer?.delegate = self;
        let dollar = UserDefaults.standard.object(forKey: "dollarAmounts") as! [CGFloat]
        let contentView = ContentView(values: dollar, array: defineHeader())
        let controller = UIHostingController(rootView: contentView)
        addChild(controller)
        controller.view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(controller.view)
        controller.didMove(toParent: self)

        NSLayoutConstraint.activate([
            controller.view.heightAnchor.constraint(equalTo: view.heightAnchor),
            controller.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            controller.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            controller.view.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        view.bringSubviewToFront(backButton)
        view.bringSubviewToFront(bar3)
        view.bringSubviewToFront(bar4)
        view.bringSubviewToFront(settings)
        view.bringSubviewToFront(chart)
        view.bringSubviewToFront(add)
        view.bringSubviewToFront(textLabel)
        view.bringSubviewToFront(pastSummaries)
        textLabel.textColor = UIColor.black
        
        super.viewDidLoad()


        // Do any additional setup after loading the view.
    }
    @IBAction func goBack(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldBeRequiredToFailBy otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
    
}
