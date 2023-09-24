//
//  SettingViewController.swift
//  ColorizedApp
//
//  Created by Ярослав Кочкин on 22.09.2023.
//

import UIKit

class SettingViewController: UIViewController {
    
    //MARK: IBOutlets
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
    
    lazy var toolBar: UIToolbar = {
        let tool: UIToolbar = .init(frame : .init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 35))
        tool.barStyle = .default
        tool.isTranslucent = false
        tool.tintColor = .blue
        tool.sizeToFit()
        
        let spaceArea: UIBarButtonItem = .init(systemItem: .flexibleSpace)
        let doneButton: UIBarButtonItem = .init(
            title: "Done",
            style: .done,
            target: self,
            action: #selector(doneButtonPressed(sender:))
        )
        tool.setItems([spaceArea, doneButton], animated: true)
        return tool
    }()
    
    var color: UIColor!
    private var colorRGB: CIColor = .black
    var delegate: SettingViewControllerDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
            valueRedLable.text = setValue(redSlider)
            redTextField.text = setValue(redSlider)
        case greenSlider:
            valueGreenLable.text = setValue(greenSlider)
            greenTextField.text = setValue(greenSlider)
        default:
            valueBlueLable.text = setValue(blueSlider)
            blueTextField.text = setValue(blueSlider)

        }
        updateSettings()
    }
    
    @IBAction func saveAction() {
        delegate.setNewColor(for: viewColor.backgroundColor ?? .white)
        dismiss(animated: true)
    }
}


//MARK: - Private Metods
private extension SettingViewController {
    func settingViewStart() {
        redTextField.delegate = self
        greenTextField.delegate = self
        blueTextField.delegate = self
        
        redTextField.inputAccessoryView = toolBar
        greenTextField.inputAccessoryView = toolBar
        blueTextField.inputAccessoryView = toolBar
        
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
    
    func setValue(_ slider: UISlider) -> String {
        String(format: "%.2f", slider.value)
    }
    
    func updateFullSlider() {
        redSlider.setValue(Float(colorRGB.red), animated: true)
        greenSlider.setValue(Float(colorRGB.green), animated: true)
        blueSlider.setValue(Float(colorRGB.blue), animated: true)
    }
    
    func updateFullTF() {
        redTextField.text = setValue(redSlider)
        greenTextField.text = setValue(greenSlider)
        blueTextField.text = setValue(blueSlider)
    }
    
    func updateValueLables() {
        valueRedLable.text = setValue(redSlider)
        valueGreenLable.text = setValue(greenSlider)
        valueBlueLable.text = setValue(blueSlider)
    }
    
    func getUI(color: CIColor) -> UIColor {
        UIColor(
            red: color.red,
            green: color.green,
            blue: color.blue,
            alpha: color.alpha
        )
    }
    
    @objc func doneButtonPressed(sender: UIBarButtonItem) {
        redTextField.resignFirstResponder()
        greenSlider.resignFirstResponder()
        blueSlider.resignFirstResponder()
    }
}


//MARK: - UITextFieldDelegate
extension SettingViewController: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        let valueTF = Float(textField.text ?? "0") ?? 0
        
        switch textField.tag {
        case 0:
            redSlider.setValue(valueTF, animated: true)
            valueRedLable.text = setValue(redSlider)
            updateSettings()
        case 1:
            greenSlider.setValue(valueTF, animated: true)
            valueGreenLable.text = setValue(greenSlider)
            updateSettings()
        default:
            blueSlider.setValue(valueTF, animated: true)
            valueBlueLable.text = setValue(blueSlider)
            updateSettings()
        }
    }
}

