//
//  ViewController.swift
//  budgetApp
// https://www.iowncode.com/ios-13-vision-text-recognition-and-document-scanning/
//  Created by Graham Desmond on 11/5/20.
//

import UIKit
import CoreML
import Vision
import VisionKit
import SwiftUI

var lastDate = ""
var headerPast1 = [String]()
var start1 = ""
var end1 = ""
var dollarAmounts1: [CGFloat] = [0, 0, 0, 0, 0]

var headerPast2 = [String]()
var start2 = ""
var end2 = ""
var dollarAmounts2: [CGFloat] = [0, 0, 0, 0, 0]

var headerPast3 = [String]()
var start3 = ""
var end3 = ""
var dollarAmounts3: [CGFloat] = [0, 0, 0, 0, 0]



var totalNum = 0.0
var customerName = ""
var numCategories = 0
var labels: [String] = ["","","","",""]
var totalAmounts: [CGFloat] = [0, 0, 0, 0, 0]
var newAmounts: [CGFloat] = [0, 0, 0, 0, 0]
var dollarAmounts: [CGFloat] = [0, 0, 0, 0, 0]
var headerLabel = [String]()
var todaysDate = ""


func defineVariables()
{
    if ((UserDefaults.standard.object(forKey: "labels") == nil)) {
        UserDefaults.standard.set(labels, forKey: "labels")
    }
    if ((UserDefaults.standard.object(forKey: "numCategories") == nil)) {
        UserDefaults.standard.set(numCategories, forKey: "numCategories")
    }
    if ((UserDefaults.standard.object(forKey: "totalAmounts") == nil)) {
        UserDefaults.standard.set(totalAmounts, forKey: "totalAmounts")
    }
    if ((UserDefaults.standard.object(forKey: "newAmounts") == nil)) {
        UserDefaults.standard.set(newAmounts, forKey: "newAmounts")
    }
    if ((UserDefaults.standard.object(forKey: "dollarAmounts") == nil)) {
        UserDefaults.standard.set(dollarAmounts, forKey: "dollarAmounts")
    }
    if ((UserDefaults.standard.object(forKey: "customerName") == nil)) {
        UserDefaults.standard.set(customerName, forKey: "customerName")
    }
    let span = "weekly"
    if ((UserDefaults.standard.object(forKey: "budgetSpan") == nil)) {
        UserDefaults.standard.set(span, forKey: "budgetSpan")
    }
    if ((UserDefaults.standard.object(forKey: "headerPast1") == nil)) {
        UserDefaults.standard.set(headerPast1, forKey: "headerPast1")
    }
    if ((UserDefaults.standard.object(forKey: "start1") == nil)) {
        UserDefaults.standard.set(start1, forKey: "start1")
    }
    if ((UserDefaults.standard.object(forKey: "end1") == nil)) {
        UserDefaults.standard.set(end1, forKey: "end1")
    }
    if ((UserDefaults.standard.object(forKey: "dollarAmounts1") == nil)) {
        UserDefaults.standard.set(dollarAmounts1, forKey: "dollarAmounts1")
    }
    
    if ((UserDefaults.standard.object(forKey: "headerPast2") == nil)) {
        UserDefaults.standard.set(headerPast2, forKey: "headerPast2")
    }
    if ((UserDefaults.standard.object(forKey: "start2") == nil)) {
        UserDefaults.standard.set(start2, forKey: "start2")
    }
    if ((UserDefaults.standard.object(forKey: "end2") == nil)) {
        UserDefaults.standard.set(end2, forKey: "end2")
    }
    if ((UserDefaults.standard.object(forKey: "dollarAmounts2") == nil)) {
        UserDefaults.standard.set(dollarAmounts2, forKey: "dollarAmounts2")
    }
    
    if ((UserDefaults.standard.object(forKey: "headerPast3") == nil)) {
        UserDefaults.standard.set(headerPast3, forKey: "headerPast3")
    }
    if ((UserDefaults.standard.object(forKey: "start3") == nil)) {
        UserDefaults.standard.set(start3, forKey: "start3")
    }
    if ((UserDefaults.standard.object(forKey: "end3") == nil)) {
        UserDefaults.standard.set(end3, forKey: "end3")
    }
    if ((UserDefaults.standard.object(forKey: "dollarAmounts3") == nil)) {
        UserDefaults.standard.set(dollarAmounts3, forKey: "dollarAmounts3")
    }
    if ((UserDefaults.standard.object(forKey: "lastDate") == nil)) {
        UserDefaults.standard.set(todaysDate, forKey: "lastDate")
    }
    
    if ((UserDefaults.standard.object(forKey: "counter") == nil)) {
        UserDefaults.standard.set(0, forKey: "counter")
    }

}
func definePast(dollar: [CGFloat], categories: Int, names: [String], new: [CGFloat], total: [CGFloat]) -> [String]
{

    headerLabel = [String]()

    for i in 0..<categories
    {

        let a = String(names[i])
        let b = String(format: "%.2f", Double(new[i]))
        let c = String(format: "%.2f", Double(total[i]))
        let headerString = a + " ($" + b + "/" + c + ")"
        headerLabel.append(headerString)
    }
    return headerLabel
}

func defineHeader() -> [String]
{
    
    let dollar = UserDefaults.standard.object(forKey: "dollarAmounts") as! [CGFloat]
    print(dollar)
    headerLabel = [String]()

    let categories = UserDefaults.standard.object(forKey: "numCategories") as! Int

    for i in 0..<categories
    {
        
        let names = UserDefaults.standard.object(forKey: "labels") as! [String]
        let new = UserDefaults.standard.object(forKey: "newAmounts") as! [CGFloat]
        let total = UserDefaults.standard.object(forKey: "totalAmounts") as! [CGFloat]

        let a = String(names[i])
        let b = String(format: "%.2f", Double(new[i]))
        let c = String(format: "%.2f", Double(total[i]))
        let headerString = a + " ($" + b + "/" + c + ")"
        headerLabel.append(headerString)
        
        
    
    }
    return headerLabel
}



class ViewController:UIViewController, VNDocumentCameraViewControllerDelegate, UIPickerViewDelegate, UIPickerViewDataSource {

    

    @IBOutlet weak var budgetSpanText: UILabel!
    @IBOutlet weak var monthly: UIButton!
    @IBOutlet weak var weekly: UIButton!
    @IBOutlet weak var backButton2: UIButton!
    @IBOutlet weak var nextButton2: UIButton!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var textBox: UITextField!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var startLabel: UILabel!
    @IBOutlet weak var logo: UIImageView!
    @IBOutlet weak var pickCategories: UIPickerView!
    @IBOutlet weak var OcrTextView: UITextView!
    @IBOutlet weak var startContinue: UIButton!

    var OcrText = ""
    var budgetCategories = [] as [Double]
    
   
    var pickerData = ["1","2","3","4","5"]
    
    
    
    override func viewDidLoad() {
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM d"
        todaysDate = dateFormatter.string(from: date)
        print(todaysDate)
        defineVariables()

        let span = UserDefaults.standard.object(forKey: "budgetSpan") as! String
        if span == "weekly"
        {
            weeklyReset()
        }
        else
        {
            monthlyReset()
        }
        /*
        let count = UserDefaults.standard.object(forKey: "counter") as! Int
        if count > 0 && count <= 3
        {
            resetData()
        }
        UserDefaults.standard.set(count + 1, forKey: "counter")
         */
        
        let checkFirstTime = UserDefaults.standard.object(forKey: "customerName") as! String
        if (checkFirstTime != "")
        {
            view.removeFromSuperview()
            let vc = self.storyboard!.instantiateViewController(withIdentifier: "scanViewController") as! scanViewController
            navigationController!.pushViewController(vc, animated: true)
            print(Int((navigationController?.viewControllers.count)!))

        }
        else
        {
            navigationController?.setNavigationBarHidden(true, animated: false)
            textBox.attributedPlaceholder = NSAttributedString(string: "Enter Name..." ,attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
            budgetSpanText.textColor = .black
            textBox.autocorrectionType = .no
            nameLabel.isHidden = false
            textBox.isHidden = false
            backButton.isHidden = true
            OcrTextView.isHidden = true
            startContinue.isHidden = true
            budgetSpanText.isHidden = true
            monthly.isHidden = true
            weekly.isHidden = true
            backButton2.isHidden = true
            nextButton2.isHidden = true
            
            startLabel.isHidden = true
            logo.isHidden = false
            pickCategories.isHidden = true
            nextButton.isHidden = false
            
            budgetSpanText.isHidden = true
            monthly.isHidden = true
            weekly.isHidden = true
            backButton2.isHidden = true
            nextButton2.isHidden = true
            nameLabel.textColor = .black
            super.viewDidLoad()
            
            self.tabBarController?.tabBar.isHidden = true
            self.pickCategories.delegate = self
            self.pickCategories.dataSource = self
            startLabel.textColor = UIColor.black
            OcrTextView.textColor = UIColor.black
            let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
            view.addGestureRecognizer(tap)
            
        }
     }
    
    override func viewDidAppear(_ animated: Bool) {
            super.viewDidAppear(animated)
            print("lkhjadslkjsdf")
        }

    
    override var prefersStatusBarHidden: Bool {
        return false
    }
    func resetData()
    {
        let dollar = UserDefaults.standard.object(forKey: "dollarAmounts") as! [CGFloat]
        let categories = UserDefaults.standard.object(forKey: "numCategories") as! Int
        let total = UserDefaults.standard.object(forKey: "totalAmounts") as! [CGFloat]
        let new = UserDefaults.standard.object(forKey: "newAmounts") as! [CGFloat]
        let names = UserDefaults.standard.object(forKey: "labels") as! [String]
        let pastDate = UserDefaults.standard.object(forKey: "lastDate") as! String
        
        let newHeader = definePast(dollar: dollar, categories: categories, names: names, new: new, total: total)


        let header2 = UserDefaults.standard.object(forKey: "headerPast2") as! [String]
        let s2 = UserDefaults.standard.object(forKey: "start2") as! String
        let e2 = UserDefaults.standard.object(forKey: "end2") as! String
        let dollar2 = UserDefaults.standard.object(forKey: "dollarAmounts2") as! [CGFloat]
        
        UserDefaults.standard.set(header2, forKey: "headerPast3")
        UserDefaults.standard.set(s2, forKey: "start3")
        UserDefaults.standard.set(e2, forKey: "end3")
        UserDefaults.standard.set(dollar2, forKey: "dollarAmounts3")
        
        let header1 = UserDefaults.standard.object(forKey: "headerPast1") as! [String]
        let s1 = UserDefaults.standard.object(forKey: "start1") as! String
        let e1 = UserDefaults.standard.object(forKey: "end1") as! String
        let dollar1 = UserDefaults.standard.object(forKey: "dollarAmounts1") as! [CGFloat]
        
        UserDefaults.standard.set(header1, forKey: "headerPast2")
        UserDefaults.standard.set(s1, forKey: "start2")
        UserDefaults.standard.set(e1, forKey: "end2")
        UserDefaults.standard.set(dollar1, forKey: "dollarAmounts2")

        UserDefaults.standard.set(newHeader, forKey: "headerPast1")
        UserDefaults.standard.set(pastDate, forKey: "start1")
        UserDefaults.standard.set(todaysDate, forKey: "end1")
        UserDefaults.standard.set(dollar, forKey: "dollarAmounts1")
        print(UserDefaults.standard.object(forKey: "end1") as! String)

        UserDefaults.standard.set(todaysDate, forKey: "lastDate")
        let tmpAmounts: [CGFloat] = [0, 0, 0, 0, 0]
        let tmpDollar: [CGFloat] = [0, 0, 0, 0, 0]
        UserDefaults.standard.set(tmpAmounts, forKey: "newAmounts")
        UserDefaults.standard.set(tmpDollar, forKey: "dollarAmounts")
    }
        

    func getOcrTextView() -> UITextView
    {
        return OcrTextView
    }
    
    func monthlyReset()
    {
        let curr = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "LLLL"
        let nameOfMonth = dateFormatter.string(from: curr)
        if UserDefaults.standard.object(forKey: "monthName") == nil
        {
            UserDefaults.standard.set(nameOfMonth, forKey: "monthName")
        }
        let monthName = UserDefaults.standard.object(forKey: "monthName") as! String
        if nameOfMonth != monthName
        {
            resetData()
        }
        UserDefaults.standard.set(nameOfMonth, forKey: "monthName")
        print(UserDefaults.standard.object(forKey: "monthName") as! String)
        
    }
    func weeklyReset()
    {
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        let dayOfTheWeekString = dateFormatter.string(from: date)
        if dayOfTheWeekString == "Sunday"
        {
            let firstReset = UserDefaults.standard.bool(forKey: "firstReset")
            if firstReset != true
            {
                resetData()
                UserDefaults.standard.set(true, forKey: "firstReset")
            }
            
        }
        if dayOfTheWeekString == "Monday"
        {
            UserDefaults.standard.set(false, forKey: "firstReset")
        }
    }

    
    
    func setOcrText(number: String)
    {
        OcrTextView.text = number
    }
    func getOcrText() -> String
    {
        return OcrText
    }

    func setOcrText(newText: String)
    {
        OcrText = newText
    }
    
    @IBAction func weeklyPressed(_ sender: Any)
    {
        let span = "weekly"
        UserDefaults.standard.set(span, forKey: "budgetSpan")

    }
    
    @IBAction func monthlyPressed(_ sender: Any)
    {
        let span = "monthly"
        UserDefaults.standard.set(span, forKey: "budgetSpan")
    }
    
    
    @IBAction func backButton2Pressed(_ sender: Any)
    {
        nameLabel.isHidden = true
        textBox.isHidden = true
        backButton.isHidden = false
        OcrTextView.isHidden = true
        startContinue.isHidden = true
        budgetSpanText.isHidden = true
        monthly.isHidden = true
        weekly.isHidden = true
        backButton2.isHidden = true
        nextButton2.isHidden = false
        
        startLabel.isHidden = false
        logo.isHidden = false
        pickCategories.isHidden = false
        nextButton.isHidden = true
 
    
    }
    @IBAction func nextButton2Pressed(_ sender: Any)
    {
        nameLabel.isHidden = true
        textBox.isHidden = true
        backButton.isHidden = true
        OcrTextView.isHidden = true
        startContinue.isHidden = false
        budgetSpanText.isHidden = false
        monthly.isHidden = false
        weekly.isHidden = false
        backButton2.isHidden = false
        nextButton2.isHidden = true
        
        startLabel.isHidden = true
        logo.isHidden = false
        pickCategories.isHidden = true
        nextButton.isHidden = true
    }
    @IBAction func backPressed(_ sender: Any) {
        nameLabel.isHidden = false
        textBox.isHidden = false
        backButton.isHidden = true
        OcrTextView.isHidden = true
        startContinue.isHidden = true
        budgetSpanText.isHidden = true
        monthly.isHidden = true
        weekly.isHidden = true
        backButton2.isHidden = true
        nextButton2.isHidden = true
        
        startLabel.isHidden = true
        logo.isHidden = false
        pickCategories.isHidden = true
        nextButton.isHidden = false
    }
    @IBAction func nextPressed(_ sender: Any) {
        dismissKeyboard()
        nameLabel.isHidden = true
        textBox.isHidden = true
        backButton.isHidden = false
        OcrTextView.isHidden = true
        startContinue.isHidden = true
        budgetSpanText.isHidden = true
        monthly.isHidden = true
        weekly.isHidden = true
        backButton2.isHidden = true
        nextButton2.isHidden = false
        
        startLabel.isHidden = false
        logo.isHidden = false
        pickCategories.isHidden = false
        nextButton.isHidden = true
    }
    
    
    @IBAction func insertName(_ sender: Any)
    {
        textBox.autocorrectionType = .no

        dismissKeyboard()
        customerName = String(textBox.text!)
        UserDefaults.standard.set(customerName, forKey: "customerName")
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        let categories = pickerData[pickCategories.selectedRow(inComponent:0)]
        UserDefaults.standard.set(Int(categories), forKey: "numCategories")
 
        return NSAttributedString(string: pickerData[row], attributes: [NSAttributedString.Key.foregroundColor: UIColor.black])
    }
    
    

    @IBSegueAction func showChart(_ coder: NSCoder) -> UIViewController? {
        let dollar = UserDefaults.standard.object(forKey: "dollarAmounts") as! [CGFloat]
        return UIHostingController(coder: coder, rootView: ContentView(values: dollar, array: defineHeader()))
    }
    
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
}

    

