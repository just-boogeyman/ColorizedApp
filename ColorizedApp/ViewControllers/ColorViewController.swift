//
//  ColorViewController.swift
//  ColorizedApp
//
//  Created by Ярослав Кочкин on 22.09.2023.
//

import UIKit

protocol SettingViewControllerDelegate {
    func setNewColor(for color: UIColor)
}


class ColorViewController: UIViewController {

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let settingVC = segue.destination as? SettingViewController else { return }
        settingVC.color = view.backgroundColor
        settingVC.delegate = self
    }
}


extension ColorViewController: SettingViewControllerDelegate {
    func setNewColor(for color: UIColor) {
        view.backgroundColor = color
    }
}
