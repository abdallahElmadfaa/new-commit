//
//  ViewController.swift
//  Demo
//
//  Created by Amr Mohamed on 10/9/20.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    
    var humans = ["Ibrahim", "Mohamed", "Ahmed"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    @IBAction func cameraButtonTapped() {
        let third = ThirdViewController()
        third.name = ""
        third.delegate = "Delegate"
        present(third, animated: true)
    }
    
    @IBAction func trashButtonTapped() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let second = storyboard.instantiateViewController(identifier: "SecondView") as! SecondViewController
        second.delegate = self
        second.name = "Ahmed"
        present(second, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? SecondViewController {
            destination.delegate = self
            //destination.name = humans.first!
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        humans.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "number", for: indexPath) as! MyTableViewCell
        cell.firstLabel.text = humans[indexPath.row]
        return cell
    }
}

extension ViewController: SecondViewControllerDelegate {
    func didAddName(text: String) {
        humans.append(text)
        tableView.reloadData()
    }
}
