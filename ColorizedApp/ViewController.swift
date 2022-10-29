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
        setupRedSlider()
        setupGreenSlider()
        setupBlueSlider()
    }

// MARK: - IB Actions
    
    @IBAction func redSliderAction() {
        redValueLable.text = String(format: "%.1f", redSlider.value)
        chengeView()
    }
    
    
    @IBAction func greenSliderAction() {
        greenValueLable.text = String(format: "%.1f", greenSlider.value)
        chengeView()
    }
    
    
    @IBAction func blueSliderAction() {
        blueValueLable.text = String(format: "%.1f", blueSlider.value)
        chengeView()
    }
    
    
// MARK: - Private Metods
    
    private func setupRedSlider() {
        redSlider.minimumValue = 0
        redSlider.maximumValue = 1
    }
    
    private func setupGreenSlider() {
        greenSlider.minimumValue = 0
        greenSlider.maximumValue = 1
    }
    
    private func setupBlueSlider() {
        blueSlider.minimumValue = 0
        blueSlider.maximumValue = 1
    }
    
    private func chengeView() {
        resultColorView.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1
        )
    }
}

