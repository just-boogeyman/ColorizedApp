//
//  ViewController.swift
//  ColorizedApp
//
//  Created by Ярослав Кочкин on 28.10.2022.
//

import UIKit

class SettingViewController: UIViewController {

// MARK: - IB Outlets
    
    @IBOutlet weak var resultColorView: UIView!
    
    @IBOutlet weak var redValueLable: UILabel!
    @IBOutlet weak var greenValueLable: UILabel!
    @IBOutlet weak var blueValueLable: UILabel!
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    @IBOutlet weak var redTextField: UITextField!
    @IBOutlet weak var greenTextField: UITextField!
    @IBOutlet weak var blueTextField: UITextField!
    
    private var rgba: CIColor = CIColor(red: 1, green: 1, blue: 1, alpha: 1)
    var colorStartVC: UIColor!
    var delegate: SettingColorDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addDoneButtonOnKeyboard()
        startSettings()
        resultColorView.layer.borderWidth = 3
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    @objc func doneButtonAction(){
        redTextField.resignFirstResponder()
        greenTextField.resignFirstResponder()
        blueTextField.resignFirstResponder()
    }
    
    
// MARK: - IBActions
    @IBAction func sliderActions(_ sender: UISlider) {
        switch sender {
        case redSlider:
            redValueLable.text = String(format: "%.2f", rgba.red)
            redTextField.text = String(format: "%.2f", rgba.red)
        case greenSlider:
            greenValueLable.text = String(format: "%.2f", rgba.green)
            greenTextField.text = String(format: "%.2f", rgba.green)
        default:
            blueValueLable.text = String(format: "%.2f", rgba.blue)
            blueTextField.text = String(format: "%.2f", rgba.blue)
        }
        chengeView()
    }
    
    
    @IBAction func doneActionTapped() {
        delegate.updateColor(color: UIColor(
            red: rgba.red,
            green: rgba.green,
            blue: rgba.blue,
            alpha: 1
        )
        )
        dismiss(animated: true)
    }
    
    
    
// MARK: - Private Metods
    
    private func chengeView() {
        rgba = CIColor(color: UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1
        )
        )
        resultColorView.backgroundColor = UIColor(
            red: rgba.red,
            green: rgba.green,
            blue: rgba.blue,
            alpha: 1
        )
    }
    
    private func startSettings() {
        rgba = CIColor(color: colorStartVC)
        redTextField.delegate = self
        greenTextField.delegate = self
        blueTextField.delegate = self
        settingColorView()
        settingLables()
        settingTextFields()
        settingSliders()
    }
    
    private func settingColorView() {
        resultColorView.layer.cornerRadius = 10
        resultColorView.backgroundColor = colorStartVC
    }
    
    private func settingLables() {
        redValueLable.text = String(format: "%.2f", rgba.red)
        greenValueLable.text = String(format: "%.2f", rgba.green)
        blueValueLable.text = String(format: "%.2f", rgba.blue)
    }
    
    private func settingTextFields() {
        redTextField.text = String(format: "%.2f", rgba.red)
        greenTextField.text = String(format: "%.2f", rgba.green)
        blueTextField.text = String(format: "%.2f", rgba.blue)
    }
    
    private func settingSliders() {
        redSlider.value = Float(rgba.red)
        greenSlider.value = Float(rgba.green)
        blueSlider.value = Float(rgba.blue)
    }
}


// MARK: - UITextFieldDelegate
extension SettingViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let text = textField.text else { return }
        guard let value = Float(text) else { return }
        switch textField {
        case redTextField:
            print(String(format: "%.2f", value))
            redValueLable.text = String(format: "%.2f", value)
            redSlider.setValue(Float(value), animated: true)
        case greenTextField:
            greenValueLable.text = String(format: "%.2f", value)
            greenSlider.setValue(Float(value), animated: true)
        default:
            blueValueLable.text = String(format: "%.2f", value)
            blueSlider.setValue(Float(value), animated: true)
        }
        chengeView()
    }
}




