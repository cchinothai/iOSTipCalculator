//
//  ViewController.swift
//  Prework
//
//  Created by Cody Chinothai on 8/5/22.
//

import UIKit

class ViewController: UIViewController {

    //Outlets
    @IBOutlet weak var billAmountLabel: UILabel!
    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var tipSlider: UISlider!
    @IBOutlet weak var totalField: UILabel!
    @IBOutlet weak var tipRateLabel: UILabel!
    @IBOutlet weak var tipRateField: UILabel!
    @IBOutlet weak var totalTipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.title = "Tip Calculator"
        UserDefaults.standard.set(false, forKey: "is_dark_mode_on")
        UserDefaults.standard.set(false, forKey: "def_tip_changed")
        tipSlider.tintColor = .green
       
        
    }
    
    // tip calculations for the segmented control bar
    @IBAction func calculateTip(_ sender: Any){
        // Get bill amount from text field input
        let bill = Double(billAmountTextField.text!) ?? 0
        
        //Get Total tip (multiply tip * tip percentage)
        let tipChange = UserDefaults.standard.bool(forKey: "def_tip_changed")
        var tipPercentages = [15.0,18.0,20.0]
        if tipChange == true{
            let tip_1 = UserDefaults.standard.double(forKey: "tip_1")
            let tip_2 = UserDefaults.standard.double(forKey: "tip_2")
            let tip_3 = UserDefaults.standard.double(forKey: "tip_3")
            tipPercentages = [tip_1,tip_2,tip_3]
        }
        else{
            tipPercentages = [15.0,18.0,20.0]
        }
        let tip = bill * (tipPercentages[tipControl.selectedSegmentIndex]/100)
        let total = bill + tip
        tipSlider.value = Float(tipPercentages[tipControl.selectedSegmentIndex]/100)
        
        //Update Tip Amount/Rate and Total Labels
        tipRateField.text = String(tipPercentages[tipControl.selectedSegmentIndex]) + "%"
        tipAmountLabel.text = "$" + String(format: "%.2f", tip)
        totalField.text = "$" + String(format: "%.2f", total)
    }
    
    //tip calculations for the slider bar
    @IBAction func calculateTip2(_ sender: Any) {
        //Get bill amount from text field input
        let bill = Double(billAmountTextField.text!) ?? 0
        
        //Get Total tip (from the slider now)
        let tipPercentage = Double(tipSlider.value)
        let tip = bill * tipPercentage
        let total = bill + tip
        
        //Update Tip Amount/Rate and Total Label
        let tipRateAmount = tipSlider.value*100
        tipRateField.text = String(format: "%.2f", tipRateAmount) + "%"
        tipAmountLabel.text = "$" + String(format: "%.2f", tip)
        totalField.text = "$" + String(format: "%.2f", total)
    }
    
    //Retrieve changed tip percentages edited in settings
    //Retrieve dark mode boolean to make necessary color changes
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("view controller will appear")
        // This is a good place to retrieve the default tip percentage from UserDefaults and use it to update the tip amount
        let tipChange = UserDefaults.standard.bool(forKey: "def_tip_changed")
        if tipChange == true{
            tipControl.removeAllSegments()
            let newTip1 = UserDefaults.standard.double(forKey:"tip_1")
            let newTip2 = UserDefaults.standard.double(forKey:"tip_2")
            let newTip3 = UserDefaults.standard.double(forKey:"tip_3")
            tipControl.insertSegment(withTitle: "\(newTip1)%", at: 0, animated: true)
            tipControl.insertSegment(withTitle: "\(newTip2)%", at: 1, animated: true)
            tipControl.insertSegment(withTitle: "\(newTip3)%", at: 2, animated: true)
        }
            
        //retreive user defaults to enable dark mode in view controller
        let dark = UserDefaults.standard.bool(forKey: "is_dark_mode_on")
        print("is_dark_mode_on",dark)
        
        if dark == true{
            billAmountLabel.textColor = .white
            billAmountTextField.textColor = .black
            tipRateLabel.textColor = .white
            tipRateField.textColor = .white
            tipAmountLabel.textColor = .white
            totalLabel.textColor = .white
            totalTipLabel.textColor = .white
            totalField.textColor = .white
            
            view.backgroundColor = .darkGray
            
            
        }
        else{
            billAmountLabel.textColor = .black
            billAmountTextField.textColor = .black
            tipRateLabel.textColor = .black
            tipRateField.textColor = .black
            tipAmountLabel.textColor = .black
            totalLabel.textColor = .black
            totalTipLabel.textColor = .black
            totalField.textColor = .black
            
            view.backgroundColor = .white
            
        }
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("view controller did appear")
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("view controller will disappear")
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("view controller did disappear")
    }
    
}

