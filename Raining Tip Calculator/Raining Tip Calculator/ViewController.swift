//
//  ViewController.swift
//  Tip Calculator
//
//  Created by June Suh on 12/18/16.
//  Copyright © 2016 Ji Yoon Suh. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    var confettiView : SAConfettiView!
    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var tipPercentageSegmentedControl: UISegmentedControl!
    let tipPercentages = [0.1, 0.2, 0.3]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Create confetti view
        confettiView = SAConfettiView(frame: self.view.bounds)
        
        // Set colors (default colors are red, green and blue)
        confettiView.colors = [UIColor(red:0.95, green:0.40, blue:0.27, alpha:1.0),
                               UIColor(red:1.00, green:0.78, blue:0.36, alpha:1.0),
                               UIColor(red:0.48, green:0.78, blue:0.64, alpha:1.0),
                               UIColor(red:0.30, green:0.76, blue:0.85, alpha:1.0),
                               UIColor(red:0.58, green:0.39, blue:0.55, alpha:1.0)]
        
        // Set intensity (from 0 - 1, default intensity is 0.5)
        confettiView.intensity = 0.5
        
        // Set type
        confettiView.type = .dollar
        
        // Add subview
        view.addSubview(confettiView)
        view.sendSubview(toBack: confettiView)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        billTextField.becomeFirstResponder()
        confettiView.startConfetti()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backgroundTapped(_ sender: UITapGestureRecognizer)
    {
        view.endEditing(true)
    }
    
    @IBAction func billTextFieldChanged(_ sender: UITextField)
    {
        updateUI()
    }
    
    @IBAction func segmentValueChanged(_ sender: UISegmentedControl)
    {
        updateUI()
    }
    
    func updateUI ()
    {
        if let billString = billTextField.text
        {
            let billValue = Double(billString) ?? 0
            let tip = billValue * tipPercentages[tipPercentageSegmentedControl.selectedSegmentIndex];
            let total = billValue + tip
            tipLabel.text = String(format:"$%.2f", tip)
            totalLabel.text = String(format:"$%.2f", total)
        }
    }
    
}

