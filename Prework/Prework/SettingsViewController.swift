//
//  SettingsViewController.swift
//  Prework
//
//  Created by Cody Chinothai on 8/7/22.
//

import UIKit
import SwiftUI

class SettingsViewController: UIViewController {

    //Outlets
    @IBOutlet weak var onOffSwitch: UISwitch!
    @IBOutlet weak var tipSwitch: UISwitch!
    @IBOutlet weak var nightModeLabel: UILabel!
    @IBOutlet weak var tip1Field: UITextField!
    @IBOutlet weak var tip2Field: UITextField!
    @IBOutlet weak var tip3Field: UITextField!
    @IBOutlet weak var setDefTipsLabel: UILabel!
    @IBOutlet weak var tip1Label: UILabel!
    @IBOutlet weak var tip2Label: UILabel!
    @IBOutlet weak var tip3Label: UILabel!
    @IBOutlet weak var percent1Label: UILabel!
    @IBOutlet weak var percent2Label: UILabel!
    @IBOutlet weak var percent3Label: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Settings"
        // Do any additional setup after loading the view.
    }
    
    //Action Response Fucntion for Dark Mode Switch
    @IBAction func switchValChanged(_ sender: Any) {
        if onOffSwitch.isOn{
            UserDefaults.standard.set(true, forKey: "is_dark_mode_on")
            //let userdefaulttest = UserDefaults.standard.bool(forKey: "is_dark_mode_on")
            //print(userdefaulttest)
            view.backgroundColor = .black
            nightModeLabel.textColor = .white
            setDefTipsLabel.textColor = .white
            tip1Label.textColor = .white
            tip2Label.textColor = .white
            tip3Label.textColor = .white
            tip1Field.textColor = .black
            tip2Field.textColor = .black
            tip3Field.textColor = .black

            //how to change title color?
            //self.title.textColor = .white
            
            
        }
        else{
            UserDefaults.standard.set(false , forKey: "is_dark_mode_on")
            //let userdefaulttest = UserDefaults.standard.bool(forKey: "is_dark_mode_on")
            //print(userdefaulttest)
            view.backgroundColor = .white
            nightModeLabel.textColor = .black
            setDefTipsLabel.textColor = .black
            tip1Label.textColor = .black
            tip2Label.textColor = .black
            tip3Label.textColor = .black
            tip1Field.textColor = .black
            tip2Field.textColor = .black
            tip3Field.textColor = .black
            //self.title.textcolor = .black
            
        }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    }
    //Action Response Function for Changed Default Tip Switch
    @IBAction func tipSwitchChanged(_ sender: Any) {
        //save default tip percentages to UserDefaults
        if tipSwitch.isOn{
            let tip1 = Double(tip1Field.text!)
            let tip2 = Double(tip2Field.text!)
            let tip3 = Double(tip3Field.text!)
            UserDefaults.standard.set(tip1, forKey:"tip_1")
            UserDefaults.standard.set(tip2, forKey:"tip_2")
            UserDefaults.standard.set(tip3, forKey:"tip_3")
            UserDefaults.standard.set(true, forKey:"def_tip_changed")
        }
        else{
            UserDefaults.standard.set(false, forKey: "def_tip_changed")
            tip1Field.text = "15"
            tip2Field.text = "18"
            tip3Field.text = "20"
        }
        
        
    }
    
    //Allow dark mode to continue displaying in View Controller after turning on in Settings
    //Allow changed default tip values to display in View Controller after editing in Settings
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("settings will appear")
        let dark = UserDefaults.standard.bool(forKey: "is_dark_mode_on")
        if dark == true{
            onOffSwitch.setOn(true, animated: false)
            view.backgroundColor = .black
            nightModeLabel.textColor = .white
            setDefTipsLabel.textColor = .white
            tip1Label.textColor = .white
            tip1Field.textColor = .white
            tip2Label.textColor = .white
            tip2Field.textColor = .white
            tip3Label.textColor = .white
            tip3Field.textColor = .white
        }
        else{
            onOffSwitch.setOn(false, animated: false)
            view.backgroundColor = .white
            nightModeLabel.textColor = .black
            setDefTipsLabel.textColor = .black
            tip1Label.textColor = .black
            tip1Field.textColor = .black
            tip2Label.textColor = .black
            tip2Field.textColor = .black
            tip3Label.textColor = .black
            tip3Field.textColor = .black
            
            

        }
        
        //load default tips previously set
        let tipChange = UserDefaults.standard.bool(forKey: "def_tip_changed")
        if tipChange == true{
            tipSwitch.setOn(true, animated: false)
            tip1Field.text = String(UserDefaults.standard.double(forKey: "tip_1"))
            tip2Field.text = String( UserDefaults.standard.double(forKey: "tip_2"))
            tip3Field.text = String( UserDefaults.standard.double(forKey: "tip_3"))
        }
        else{
            tipSwitch.setOn(false, animated: false)
            tip1Field.text = "15"
            tip2Field.text = "18"
            tip3Field.text = "20"
        }
        
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("settings did appear")
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("settings will disappear")
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("settings did disappear")
    }
}
