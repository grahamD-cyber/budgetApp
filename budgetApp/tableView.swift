//
//  tableView.swift
//  budgetApp
//
//  Created by Graham Desmond on 11/10/20.
//

import UIKit
import SwiftUI

class tableView: UIViewController, UITableViewDelegate, UITableViewDataSource, UIGestureRecognizerDelegate {
    
    var dollar = UserDefaults.standard.object(forKey: "dollarAmounts") as! [CGFloat]
    var total = UserDefaults.standard.object(forKey: "totalAmounts") as! [CGFloat]
    var names = UserDefaults.standard.object(forKey: "labels") as! [String]
    var new = UserDefaults.standard.object(forKey: "newAmounts") as! [CGFloat]


    
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var weeklyMonthly: UISegmentedControl!
    @IBOutlet weak var addCategory: UIButton!
    @IBOutlet weak var editButton: UIButton!
    @IBOutlet weak var DoneButton: UIButton!
    @IBOutlet weak var table: UITableView!
    @IBOutlet weak var editCategories: UIBarButtonItem!
    override func viewDidLoad() {
        backButton.isHidden = true
        let titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
        UISegmentedControl.appearance().setTitleTextAttributes(titleTextAttributes, for: .selected)
        let span = UserDefaults.standard.object(forKey: "budgetSpan") as! String
        if span == "weekly"
        {
            weeklyMonthly.selectedSegmentIndex = 0
        }
        else
        {
            weeklyMonthly.selectedSegmentIndex = 1
        }
        self.navigationController?.interactivePopGestureRecognizer?.delegate = self;
        navigationController?.setNavigationBarHidden(true, animated: false)
        let categories = UserDefaults.standard.object(forKey: "numCategories") as! Int
        if (categories < 5)
        {
            addCategory.isHidden = false
        }
        else
        {
            addCategory.isHidden = true
        }
        editButton.isHidden = true
        DoneButton.isHidden = false
        self.table.isEditing = false
        super.viewDidLoad()
        self.editButton.isHidden = false
        self.DoneButton.isHidden = true
        self.tabBarController?.tabBar.isHidden = true
        //UITableView.appearance().backgroundColor = UIColor.white

        //table.tintColor = .white

        // Do any additional setup after loading the view.
    }
    override var prefersStatusBarHidden: Bool {
        return false
    }


    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldBeRequiredToFailBy otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
    
    @IBSegueAction func goToChart(_ coder: NSCoder) -> UIViewController? {
        return UIHostingController(coder: coder, rootView: ContentView(values: dollar, array: defineHeader()))
    }
    @IBAction func backButton(_ sender: Any)
    {
        navigationController?.popViewController(animated: true)
    }

    
    @IBAction func editCategories(_ sender: Any) {
        self.table.isEditing = true
        self.editButton.isHidden = true
        self.DoneButton.isHidden = false

    }

    @IBAction func weeklyMonthlytoggle(_ sender: Any)
    {
        if weeklyMonthly.selectedSegmentIndex == 0
        {
            UserDefaults.standard.set("weekly", forKey: "budgetSpan")
        }
        else
        {
            UserDefaults.standard.set("monthly", forKey: "budgetSpan")
        }
        let span = UserDefaults.standard.object(forKey: "budgetSpan") as! String
        print(span)
    }
    @IBAction func doneEditing(_ sender: Any)
    {
        self.table.isEditing = false
        self.editButton.isHidden = false
        self.DoneButton.isHidden = true
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let movedObj = names[sourceIndexPath.item]
        let movedDollar = dollar[sourceIndexPath.item]
        let moveNew = new[sourceIndexPath.item]
        let moveTotals = total[sourceIndexPath.item]
        names.remove(at: sourceIndexPath.item)
        names.insert(movedObj, at: destinationIndexPath.item)
        dollar.remove(at: sourceIndexPath.item)
        dollar.insert(movedDollar, at: destinationIndexPath.item)
        new.remove(at: sourceIndexPath.item)
        new.insert(moveNew, at: destinationIndexPath.item)
        total.remove(at: sourceIndexPath.item)
        total.insert(moveTotals, at: destinationIndexPath.item)
        UserDefaults.standard.set(names, forKey: "labels")
        UserDefaults.standard.set(new, forKey: "newAmounts")
        UserDefaults.standard.set(total, forKey: "totalAmounts")
        UserDefaults.standard.set(dollar, forKey: "dollarAmounts")

    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == .delete )
        {
            let categories = UserDefaults.standard.object(forKey: "numCategories") as! Int
            print(total)
            dollar.remove(at: indexPath.item)
            dollar.append(0)
            total.remove(at: indexPath.item)
            total.append(0)
            new.remove(at: indexPath.item)
            new.append(0)
            names.remove(at: indexPath.item)
            names.append("")
            UserDefaults.standard.set(categories - 1, forKey: "numCategories")
            
            print(total)
            table.deleteRows(at: [indexPath], with: .automatic)
            UserDefaults.standard.set(names, forKey: "labels")
            UserDefaults.standard.set(new, forKey: "newAmounts")
            UserDefaults.standard.set(total, forKey: "totalAmounts")
            UserDefaults.standard.set(dollar, forKey: "dollarAmounts")
            let newCategories = UserDefaults.standard.object(forKey: "numCategories") as! Int
            if (newCategories < 5)
            {
                addCategory.isHidden = false
            }
            else
            {
                addCategory.isHidden = true
            }
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let categories = UserDefaults.standard.object(forKey: "numCategories") as! Int
        return categories
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "categoryCell", for: indexPath)
            cell.textLabel?.text = names[indexPath.item]
            

        return cell
    }
    
    @IBAction func addButton(_ sender: Any)
    {
        let categories = UserDefaults.standard.object(forKey: "numCategories") as! Int
        if (categories < 5)
        {
            UserDefaults.standard.set(categories + 1, forKey: "numCategories")
        }
    }
    @IBAction func editBudget(_ sender: Any) {
    }
    
}
