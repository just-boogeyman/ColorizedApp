//
//  ViewController.swift
//  ColorizedApp
//
//  Created by Ярослав Кочкин on 28.10.2022.
//

import UIKit

class ViewController: UIViewController {

// MARK: - IB Outlets
    
    @IBOutlet weak var resultColorView: UIView!
    
    @IBOutlet weak var redValueLable: UILabel!
    @IBOutlet weak var greenValueLable: UILabel!
    @IBOutlet weak var blueValueLable: UILabel!
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultColorView.layer.cornerRadius = 10
        chengeView()
    }

// MARK: - IB Actions
    @IBAction func sliderActions(_ sender: UISlider) {
        switch sender {
        case redSlider:
            redValueLable.text = String(format: "%.1f", sender.value)
        case greenSlider:
            greenValueLable.text = String(format: "%.1f", sender.value)
        default:
            blueValueLable.text = String(format: "%.1f", sender.value)
        }
        chengeView()
    }
    
    
// MARK: - Private Metods
    
    private func chengeView() {
        resultColorView.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1
        )
    }
}

