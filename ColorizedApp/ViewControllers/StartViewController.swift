//
//  StartViewController.swift
//  ColorizedApp
//
//  Created by Ярослав Кочкин on 15.11.2022.
//

import UIKit

protocol SettingColorDelegate {
    func updateColor(color: UIColor)
}

class StartViewController: UIViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "goToSetting" else { return }
        guard let settingVC = segue.destination as? SettingViewController else { return }
        guard let colorVC = view.backgroundColor else { return }
        settingVC.colorStartVC = colorVC
        settingVC.delegate = self
//        performSegue(withIdentifier: "goToSetting", sender: nil)
    }
}


// MARK: - SettingColorDelegate
extension StartViewController: SettingColorDelegate {
    func updateColor(color: UIColor) {
        view.backgroundColor = color
    }
}
