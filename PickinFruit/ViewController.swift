//
//  ViewController.swift
//  PickinFruit
//
//  Created by Flatiron School on 7/17/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var fruitPicker: UIPickerView!
    @IBOutlet weak var spinButton: UIButton!
    @IBOutlet weak var resultLabel: UILabel!
    
    var fruitsArray = ["🍎", "🍊", "🍌", "🍐", "🍇", "🍉", "🍓", "🍒", "🍍"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.spinButton.accessibilityLabel = Constants.SPIN_BUTTON
        fruitPicker.delegate = self
        fruitPicker.dataSource = self
    }
    
    @IBAction func spinButtonTapped(sender: UIButton) {
        
//        fruitPicker.selectRow(fruitsArray.count, inComponent: 3, animated: true)
        var newNum = self.fruitsArray.count
        var randomNum1 = Int(arc4random_uniform(UInt32(newNum)))
        var randomNum2 = Int(arc4random_uniform(UInt32(newNum)))
        var randomNum3 = Int(arc4random_uniform(UInt32(newNum)))
        
        self.fruitPicker.selectRow(randomNum1, inComponent: 0, animated: true)
        self.fruitPicker.selectRow(randomNum2, inComponent: 1, animated: true)
        self.fruitPicker.selectRow(randomNum3, inComponent: 2, animated: true)
        
        let firstRow = self.fruitPicker.selectedRowInComponent(0)
        let secondRow = self.fruitPicker.selectedRowInComponent(1)
        let thirdRow = self.fruitPicker.selectedRowInComponent(2)
        
        if firstRow == secondRow && firstRow == thirdRow
        {
            self.resultLabel.text = "WINNER!"
        }
        else
        {
            self.resultLabel.text = "TRY AGAIN"
        }
        
    }
    
}

// MARK: Set Up
extension ViewController {
    
    override func viewDidLayoutSubviews() {
        if self.spinButton.layer.cornerRadius == 0.0 {
            configureButton()
        }
    }
    
    func configureButton()
    {
        self.spinButton.layer.cornerRadius = 0.5 * self.spinButton.bounds.size.width
        self.spinButton.layer.borderColor = UIColor.whiteColor().CGColor
        self.spinButton.layer.borderWidth = 4.0
        self.spinButton.clipsToBounds = true
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return fruitsArray[row]
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return fruitsArray.count
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 3
    }
    
}



