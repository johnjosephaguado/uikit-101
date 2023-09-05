//
//  StackViewController.swift
//  uikit-demo-101
//
//  Created by John Joseph Aguado on 8/31/23.
//

import Foundation
import UIKit

class StackViewController: UIViewController, ViewControllerDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(notify(notification:)), name: Notification.Name(rawValue: "NotifyButtonDidTapNotification"), object: nil)
    }
    
    @objc func notify(notification: Notification) {
        print("Stack View Controller: \(notification)")
    }
    
    func retrieveData(message: String) {
        print(message)
    }
    
    @IBAction func pushView(_ sender: Any) {
        let pushViewController = PushViewController(nibName: "PushViewController", bundle: Bundle.main)
        pushViewController.counter = 1
        navigationController?.pushViewController(pushViewController, animated: true)
    }
    
    @IBAction func openViewController(_ sender: Any) {
        let viewController = ViewController(nibName: "ViewController", bundle: Bundle.main)
        viewController.message = "Hello from Stack View Controller"
        viewController.delegate = self
        
        present(viewController, animated: true)
    }
}
