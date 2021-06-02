//
//  pastSummaries.swift
//  budgetApp
//
//  Created by Graham Desmond on 11/17/20.
//

import UIKit
import SwiftUI
class pastSummaries: UIViewController {

    @IBOutlet weak var background: UIImageView!
    @IBOutlet weak var view2: UIImageView!
    @IBOutlet weak var view1: UIImageView!
    @IBOutlet weak var settings: UIButton!
    @IBOutlet weak var showChart: UIButton!
    @IBOutlet weak var add: UIButton!
    @IBOutlet weak var show1: UIButton!
    @IBOutlet weak var show2: UIButton!
    @IBOutlet weak var show3: UIButton!
    @IBOutlet weak var backToSelector: UIButton!
    @IBOutlet weak var backToMain: UIButton!
    @IBOutlet weak var label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        show1.isHidden = true
        show2.isHidden = true
        show3.isHidden = true
        label.text = "Past Summaries"
        backToSelector.isHidden = true

        let tmpEnd1 = UserDefaults.standard.object(forKey: "end1") as! String
        if tmpEnd1 != ""
        {
            show1.isHidden = false
            let tmpStart1 = UserDefaults.standard.object(forKey: "start1") as! String
            let labelString = tmpEnd1 + " - " + tmpStart1
            show1.setTitle(labelString, for: .normal)
            show1.titleLabel?.textAlignment = .center
            show1.setTitleColor(.black, for: .normal)
            show1.titleLabel?.font =  UIFont.boldSystemFont(ofSize: 20)
        }
        let tmpEnd2 = UserDefaults.standard.object(forKey: "end2") as! String
        if tmpEnd2 != ""
        {
            show2.isHidden = false
            let tmpStart2 = UserDefaults.standard.object(forKey: "start2") as! String
            let labelString = tmpEnd2 + " - " + tmpStart2
            show2.setTitle(labelString, for: .normal)
            show2.titleLabel?.textAlignment = .center
            show2.setTitleColor(.black, for: .normal)
            show2.titleLabel?.font =  UIFont.boldSystemFont(ofSize: 20)
        }
        let tmpEnd3 = UserDefaults.standard.object(forKey: "end3") as! String
        if tmpEnd3 != ""
        {
            show3.isHidden = false
            let tmpStart3 = UserDefaults.standard.object(forKey: "start3") as! String
            let labelString = tmpEnd3 + " - " + tmpStart3
            show3.setTitle(labelString, for: .normal)
            show3.titleLabel?.textAlignment = .center
            show3.setTitleColor(.black, for: .normal)
            show3.titleLabel?.font =  UIFont.boldSystemFont(ofSize: 20)
        }

    }
    
    @IBAction func show1Pressed(_ sender: Any)
    {
        background.isHidden = true
        show1.isHidden = true
        show2.isHidden = true
        show3.isHidden = true
        view2.isHidden = false
        view1.isHidden = false
        settings.isHidden = false
        showChart.isHidden = false
        add.isHidden = false
        backToSelector.isHidden = false
        backToMain.isHidden = true
        label.isHidden = false
        
        let tmpEnd1 = UserDefaults.standard.object(forKey: "end1") as! String
        let tmpStart1 = UserDefaults.standard.object(forKey: "start1") as! String
        let labelString = tmpEnd1 + " - " + tmpStart1
        label.text = labelString
        
        let dollar = UserDefaults.standard.object(forKey: "dollarAmounts1") as! [CGFloat]
        let pastHeader = UserDefaults.standard.object(forKey: "headerPast1") as! [String]
        let contentView = ContentView(values: dollar, array: pastHeader)
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
        view.bringSubviewToFront(backToSelector)
        view.bringSubviewToFront(view1)
        view.bringSubviewToFront(view2)
        view.bringSubviewToFront(showChart)
        view.bringSubviewToFront(settings)
        view.bringSubviewToFront(add)
        view.bringSubviewToFront(label)
    }
    
    @IBAction func show2Pressed(_ sender: Any)
    {
        background.isHidden = true
        show1.isHidden = true
        show2.isHidden = true
        show3.isHidden = true
        view2.isHidden = false
        view1.isHidden = false
        settings.isHidden = false
        showChart.isHidden = false
        add.isHidden = false
        backToSelector.isHidden = false
        backToMain.isHidden = true
        label.isHidden = false
        let tmpEnd2 = UserDefaults.standard.object(forKey: "end2") as! String
        let tmpStart2 = UserDefaults.standard.object(forKey: "start2") as! String
        let labelString = tmpEnd2 + " - " + tmpStart2
        label.text = labelString
        
        let dollar = UserDefaults.standard.object(forKey: "dollarAmounts2") as! [CGFloat]
        let pastHeader = UserDefaults.standard.object(forKey: "headerPast2") as! [String]
        let contentView = ContentView(values: dollar, array: pastHeader)
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
        view.bringSubviewToFront(backToSelector)
        view.bringSubviewToFront(view1)
        view.bringSubviewToFront(view2)
        view.bringSubviewToFront(showChart)
        view.bringSubviewToFront(settings)
        view.bringSubviewToFront(add)
        view.bringSubviewToFront(label)
    }
    
    @IBAction func show3Pressed(_ sender: Any)
    {
        background.isHidden = true
        show1.isHidden = true
        show2.isHidden = true
        show3.isHidden = true
        view2.isHidden = false
        view1.isHidden = false
        settings.isHidden = false
        showChart.isHidden = false
        add.isHidden = false
        backToSelector.isHidden = false
        backToMain.isHidden = true
        label.isHidden = false
        background.isHidden = true
        let tmpEnd3 = UserDefaults.standard.object(forKey: "end3") as! String
        let tmpStart3 = UserDefaults.standard.object(forKey: "start3") as! String
        let labelString = tmpEnd3 + " - " + tmpStart3
        label.text = labelString
        
        let dollar = UserDefaults.standard.object(forKey: "dollarAmounts3") as! [CGFloat]
        let pastHeader = UserDefaults.standard.object(forKey: "headerPast3") as! [String]
        let contentView = ContentView(values: dollar, array: pastHeader)
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
        view.bringSubviewToFront(backToSelector)
        view.bringSubviewToFront(view1)
        view.bringSubviewToFront(view2)
        view.bringSubviewToFront(showChart)
        view.bringSubviewToFront(add)
        view.bringSubviewToFront(settings)
        view.bringSubviewToFront(label)
    }

    @IBAction func backToSelector(_ sender: Any)
    {
        let tmpEnd1 = UserDefaults.standard.object(forKey: "end1") as! String
        if tmpEnd1 != ""
        {
            show1.isHidden = false
            let tmpStart1 = UserDefaults.standard.object(forKey: "start1") as! String
            let labelString = tmpEnd1 + " - " + tmpStart1
            show1.setTitle(labelString, for: .normal)
            show1.titleLabel?.textAlignment = .center
            show1.setTitleColor(.black, for: .normal)
            show1.titleLabel?.font =  UIFont.boldSystemFont(ofSize: 20)
        }
        let tmpEnd2 = UserDefaults.standard.object(forKey: "end2") as! String
        if tmpEnd2 != ""
        {
            show2.isHidden = false
            let tmpStart2 = UserDefaults.standard.object(forKey: "start2") as! String
            let labelString = tmpEnd2 + " - " + tmpStart2
            show2.setTitle(labelString, for: .normal)
            show2.titleLabel?.textAlignment = .center
            show2.setTitleColor(.black, for: .normal)
            show2.titleLabel?.font =  UIFont.boldSystemFont(ofSize: 20)
        }
        let tmpEnd3 = UserDefaults.standard.object(forKey: "end3") as! String
        if tmpEnd3 != ""
        {
            show3.isHidden = false
            let tmpStart3 = UserDefaults.standard.object(forKey: "start3") as! String
            let labelString = tmpEnd3 + " - " + tmpStart3
            show3.setTitle(labelString, for: .normal)
            show3.titleLabel?.textAlignment = .center
            show3.setTitleColor(.black, for: .normal)
            show3.titleLabel?.font =  UIFont.boldSystemFont(ofSize: 20)
        }
        label.text = "Past Summaries"
        background.isHidden = false
        view2.isHidden = false
        view1.isHidden = false
        settings.isHidden = false
        showChart.isHidden = false
        add.isHidden = false
        backToSelector.isHidden = true
        backToMain.isHidden = false
        label.isHidden = false
        view.bringSubviewToFront(background)
        view.bringSubviewToFront(backToSelector)
        view.bringSubviewToFront(view1)
        view.bringSubviewToFront(view2)
        view.bringSubviewToFront(showChart)
        view.bringSubviewToFront(add)
        view.bringSubviewToFront(label)
        view.bringSubviewToFront(settings)
        view.bringSubviewToFront(show1)
        view.bringSubviewToFront(show2)
        view.bringSubviewToFront(show3)
        view.bringSubviewToFront(backToMain)


    }
    
}
