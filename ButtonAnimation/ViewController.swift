//
//  ViewController.swift
//  ButtonAnimation
//
//  Created by Duncan Champney on 3/11/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var buttonA: UIButton!
    @IBOutlet weak var buttonB: UIButton!
    @IBOutlet weak var buttonC: UIButton!
    @IBOutlet weak var buttonD: UIButton!

    //Define an empty array to hold buttons.
    var buttonsArray = [UIButton]()

    override func viewDidLoad() {
        super.viewDidLoad()

        //Put our button outlets into an array so we can reference them by index.
        buttonsArray = [buttonA, buttonB, buttonC, buttonD]

        //Give our buttons a cornerRadius so they look rounded when we add a border and fill color
        for button in buttonsArray {
            button.layer.cornerRadius = 10
        }
    }

    @IBAction func handleAnimateButton(_ sender: UIButton) {
        sender.isEnabled = false

        //Pick a random button
        let button = buttonsArray.randomElement()!

        //Create an auto-reversing animation that fills the button with cyan, and draws a border around it.
        //(Showing the border won't fade in and out, but it doesn't really matter)
        UIView.animate(withDuration: 0.25,
                       delay: 0,
                       options: [.autoreverse, .curveEaseInOut],
                       animations: {
                        button.backgroundColor = .cyan
                        button.layer.borderWidth = 1.0
                       }, completion: {
                        success in
                        button.backgroundColor = .clear
                        sender.isEnabled = true
                        button.layer.borderWidth = 0
                       })
    }
}


