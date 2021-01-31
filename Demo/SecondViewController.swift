//
//  SecondViewController.swift
//  Demo
//
//  Created by Amr Mohamed on 10/31/20.
//

import UIKit

protocol SecondViewControllerDelegate: AnyObject {
    func didAddName(text: String)
}

class SecondViewController: UIViewController {

    @IBOutlet var textField: UITextField!
    
    weak var delegate: SecondViewControllerDelegate?
    
    var name = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.text = name
    }

    @IBAction func addNameButtonTapped(_ sender: UIButton) {
        dismiss(animated: true) {
            self.delegate?.didAddName(text: self.textField.text!)
        }
    }
}
