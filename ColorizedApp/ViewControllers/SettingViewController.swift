//
//  SettingViewController.swift
//  ColorizedApp
//
//  Created by Ярослав Кочкин on 22.09.2023.
//

import UIKit

class SettingViewController: UIViewController {
    
    @IBOutlet var viewColor: UIView!
    
    @IBOutlet var valueRedLable: UILabel!
    @IBOutlet var valueGreenLable: UILabel!
    @IBOutlet var valueBlueLable: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    @IBOutlet weak var redTextField: UITextField!
    @IBOutlet weak var greenTextField: UITextField!
    @IBOutlet weak var blueTextField: UITextField!
    
    
    var color: UIColor!
    var colorRGB: CIColor = .black
    var delegate: SettingViewControllerDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        redTextField.delegate = self
        greenTextField.delegate = self
        blueTextField.delegate = self
        
        settingViewStart()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    //MARK: IBAction
    @IBAction func chengeActionSlider(_ sender: UISlider) {
        switch sender {
        case redSlider:
            updateValueLable(valueRedLable, redSlider)
            updateTextField(redTextField, redSlider)
        case greenSlider:
            updateValueLable(valueGreenLable, greenSlider)
            updateTextField(greenTextField, greenSlider)
        default:
            updateValueLable(valueBlueLable, blueSlider)
            updateTextField(blueTextField, blueSlider)

        }
        updateSettings()
    }
    
    @IBAction func saveAction() {
        delegate.setNewColor(for: colorRGB)
        dismiss(animated: true)
    }
}


extension SettingViewController: UITextFieldDelegate {
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        print("textFieldShouldBeginEditing")
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("1234567")
    }
}



//MARK: - Private Metods
private extension SettingViewController {
    func settingViewStart() {
        viewColor.layer.shadowOpacity = 0.5
        viewColor.layer.shadowOffset = CGSize(width: 0.0, height: 10.0)
        viewColor.layer.shadowRadius = 10
        viewColor.backgroundColor = color
        
        colorRGB = CIColor(color: color)

        updateFullSlider()
        updateFullTF()
        updateValueLables()
    }
    
    func updateSettings() {
        colorRGB = CIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1.0
        )
        viewColor.backgroundColor = getUI(color: colorRGB)
    }
    
    func updateValueLable(_ lable: UILabel, _ slider: UISlider) {
        lable.text = String(format: "%.2f", slider.value)
    }
    
    func updateSlider(_ slider: UISlider, value: CGFloat) {
        slider.value = Float(value)
    }
    
    func updateTextField(_ textField: UITextField, _ slider: UISlider) {
        textField.text = String(format: "%.2f", slider.value)
    }
    
    func updateFullSlider() {
        updateSlider(redSlider, value: colorRGB.red)
        updateSlider(greenSlider, value: colorRGB.green)
        updateSlider(blueSlider, value: colorRGB.blue)
    }
    
    func updateFullTF() {
        updateTextField(redTextField, redSlider)
        updateTextField(greenTextField, greenSlider)
        updateTextField(blueTextField, blueSlider)
    }
    
    func updateValueLables() {
        updateValueLable(valueRedLable, redSlider)
        updateValueLable(valueBlueLable, blueSlider)
        updateValueLable(valueGreenLable, greenSlider)
    }
    
    func getUI(color: CIColor) -> UIColor {
        UIColor(red: color.red, green: color.green, blue: color.blue, alpha: color.alpha)
    }
}


