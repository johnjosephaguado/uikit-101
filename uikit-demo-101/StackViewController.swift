//
//  StackViewController.swift
//  uikit-demo-101
//
//  Created by John Joseph Aguado on 8/31/23.
//

import Foundation
import UIKit

class StackViewController: UIViewController, ViewControllerDelegate {
    func retrieveData(message: String) {
        print(message)
    }
    
    @IBAction func openViewController(_ sender: Any) {
        let viewController = ViewController(nibName: "ViewController", bundle: Bundle.main)
        viewController.message = "Hello from Stack View Controller"
        viewController.delegate = self
        
        present(viewController, animated: true)
    }
}
