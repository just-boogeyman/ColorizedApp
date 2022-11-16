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
    
    var colorStartVC: UIColor!
    var delegate: SettingColorDelegate!
    var alpha: CGFloat = 0.0
    var red: CGFloat = 0.0
    var green: CGFloat = 0.0
    var blue: CGFloat = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultColorView.layer.cornerRadius = 10
        self.addDoneButtonOnKeyboard()
        startSettings()
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
            red = CGFloat(sender.value)
            redValueLable.text = String(format: "%.2f", red)
            redTextField.text = String(format: "%.2f", red)
        case greenSlider:
            green = CGFloat(sender.value)
            greenValueLable.text = String(format: "%.2f", green)
            greenTextField.text = String(format: "%.2f", green)
        default:
            blue = CGFloat(sender.value)
            blueValueLable.text = String(format: "%.2f", blue)
            blueTextField.text = String(format: "%.2f", blue)
        }
        chengeView()
    }
    
    
    @IBAction func doneActionTapped() {
        delegate.updateColor(red: red, green: green, blue: blue, alpha: alpha)
        dismiss(animated: true)
    }
    
    
    
// MARK: - Private Metods
    
    private func chengeView() {
        resultColorView.backgroundColor = UIColor(
            red: red,
            green: green,
            blue: blue,
            alpha: 1
        )
    }
    
    private func startSettings() {
        let ciColor = CIColor(color: colorStartVC)
        redTextField.delegate = self
        greenTextField.delegate = self
        blueTextField.delegate = self
        alpha = ciColor.alpha
        red = ciColor.red
        green = ciColor.green
        blue = ciColor.blue
        resultColorView.backgroundColor = UIColor(red: red, green: green, blue: blue, alpha: alpha)
        redValueLable.text = String(format: "%.2f", red)
        greenValueLable.text = String(format: "%.2f", green)
        blueValueLable.text = String(format: "%.2f", blue)
        redTextField.text = String(format: "%.2f", red)
        greenTextField.text = String(format: "%.2f", green)
        blueTextField.text = String(format: "%.2f", blue)
        redSlider.value = Float(red)
        greenSlider.value = Float(green)
        blueSlider.value = Float(blue)
    }
}


// MARK: - UITextFieldDelegate
extension SettingViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let newValue = textField.text else { return }
        guard let color = Float(newValue) else { return }
        switch textField {
        case redTextField:
            red = CGFloat(color)
            redValueLable.text = String(format: "%.2f", red)
            redSlider.value = Float(red)
        case greenTextField:
            green = CGFloat(color)
            greenValueLable.text = String(format: "%.2f", green)
            greenSlider.value = Float(green)
        default:
            blue = CGFloat(color)
            blueValueLable.text = String(format: "%.2f", blue)
            blueSlider.value = Float(blue)
        }
        chengeView()
    }
}




