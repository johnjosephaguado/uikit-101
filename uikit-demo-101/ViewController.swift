//
//  ViewController.swift
//  uikit-demo-101
//
//  Created by John Joseph Aguado on 8/29/23.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var showAlertButton: UIButton!
    var message: String?
    var delegate: ViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        nameTextField.text = "Hello"
        showAlertButton.addTarget(self, action: #selector(showAlert(sender:)), for: .touchUpInside)
        
        guard let message else { return }
        
        print("message passed: \(message)")
    }

    @IBAction func buttonTapped(_ sender: Any) {
        print("button was tapped")
        dismiss(animated: true)
    }
    
    @objc func showAlert(sender: UIButton) {
        let alert = UIAlertController(title: "My Alert",
                                      message: "This is an alert.",
                                      preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: { _ in
            guard let textField = alert.textFields?[0] else { return }
            print(textField.text ?? "")
        })
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        
        let deleteAction = UIAlertAction(title: "Delete", style: .destructive)
        
        alert.addAction(okAction)
        alert.addAction(cancelAction)
        alert.addAction(deleteAction)
        
        alert.addTextField { textField in
            textField.placeholder = "Search"
        }
        
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func passData(_ sender: Any) {
        guard let name = nameTextField.text else { return }
        
        delegate?.retrieveData(message: name)
    }
}

