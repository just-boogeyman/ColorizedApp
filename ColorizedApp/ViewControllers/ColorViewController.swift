//
//  ColorViewController.swift
//  ColorizedApp
//
//  Created by Ярослав Кочкин on 22.09.2023.
//

import UIKit

protocol SettingViewControllerDelegate {
    func setNewColor(for color: CIColor)
}


class ColorViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let settingVC = segue.destination as? SettingViewController else { return }
        settingVC.color = view.backgroundColor
        settingVC.delegate = self
    }
}


extension ColorViewController: SettingViewControllerDelegate {
    func setNewColor(for color: CIColor) {
        view.backgroundColor = UIColor(
            red: color.red,
            green: color.green,
            blue: color.blue,
            alpha: color.alpha
        )
    }
}
