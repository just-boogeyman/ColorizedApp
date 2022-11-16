//
//  StartViewController.swift
//  ColorizedApp
//
//  Created by Ярослав Кочкин on 15.11.2022.
//

import UIKit

protocol SettingColorDelegate {
    func updateColor(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat)
}

class StartViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let settingVC = segue.destination as? SettingViewController else { return }
        guard let colorVC = view.backgroundColor else { return }
        settingVC.colorStartVC = colorVC
        settingVC.delegate = self
    }
    
    
// MARK: - IBActions
    @IBAction func SettingTupped(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "goToSetting", sender: nil)
    }
}


// MARK: - SettingColorDelegate
extension StartViewController: SettingColorDelegate {
    func updateColor(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) {
        view.backgroundColor = UIColor(
            red: red,
            green: green,
            blue: blue,
            alpha: alpha
        )
    }
}
