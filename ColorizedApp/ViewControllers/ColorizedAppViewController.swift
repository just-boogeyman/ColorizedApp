//
//  ViewController.swift
//  ColorizedApp
//
//  Created by Ярослав Кочкин on 12.09.2023.
//

import UIKit

class ColorizedAppViewController: UIViewController {
    
    //MARK: IBOutlets
    @IBOutlet var viewColor: UIView!
    
    @IBOutlet var valueRedLable: UILabel!
    @IBOutlet var valueGreenLable: UILabel!
    @IBOutlet var valueBlueLable: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        settingViewStart()
        updateSettings()
    }
    
    //MARK: IBAction
    @IBAction func chengeActionSlider(_ sender: UISlider) {
        switch sender {
        case redSlider:
            valueRedLable.text = String(format: "%.2f", redSlider.value)
        case greenSlider:
            valueGreenLable.text = String(format: "%.2f", greenSlider.value)
        default:
            valueBlueLable.text = String(format: "%.2f", blueSlider.value)
        }
        updateSettings()
    }
    
    //MARK: Private Metods
    private func settingViewStart() {
        viewColor.layer.shadowOpacity = 0.5
        viewColor.layer.shadowOffset = CGSize(width: 0.0, height: 10.0)
        viewColor.layer.shadowRadius = 10
    }
    
    private func updateSettings() {
        viewColor.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1.0
        )
        
        valueRedLable.text = String(format: "%.2f", redSlider.value)
        valueGreenLable.text = String(format: "%.2f", greenSlider.value)
        valueBlueLable.text = String(format: "%.2f", blueSlider.value)
    }
}
