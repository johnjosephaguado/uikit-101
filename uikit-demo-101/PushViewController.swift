//
//  PushViewController.swift
//  uikit-demo-101
//
//  Created by John Joseph Aguado on 9/5/23.
//

import Foundation
import UIKit

class PushViewController: UIViewController {
    var counter = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Push \(counter)"
    }
    
    @IBAction func notifyButtonTapped(_ sender: Any) {
        var notification = Notification(name: Notification.Name(rawValue: "NotifyButtonDidTapNotification"))
        notification.userInfo = ["passed_value": counter]
        NotificationCenter.default.post(notification)
    }
    
    @IBAction func pushView(_ sender: Any) {
        let pushViewController = PushViewController(nibName: "PushViewController", bundle: Bundle.main)
        pushViewController.counter = counter + 1
        navigationController?.pushViewController(pushViewController, animated: true)
    }
    
    @IBAction func popView(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func popToRootView(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
}
