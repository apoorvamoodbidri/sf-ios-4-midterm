//
//  CalculatorViewController.swift
//  CalculatorApp
//
//  Created by Apoorva Moodbidri on 2/2/16.
//  Copyright © 2016 Apoorva Moodbidri. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    var operand:String = ""
    var number1:Float?
    var number2:Float?
    var result:Float?
    
  
    @IBOutlet weak var displayNumberTextField: UITextField!
    
   
    @IBAction func operatorSelected(sender: AnyObject) {
        inMiddleOfTyping = false // to indicate that its time yo take in another number after this
        number1 = (Float((displayNumberTextField?.text!)!)!)
        print(number1)
         operand = (sender.titleLabel?!.text)!
        
    }
    
    @IBAction func appendSign(sender: AnyObject) {
        let sign = (sender.titleLabel?!.text)!
        if inMiddleOfTyping
        {
            displayNumberTextField.text = "-" + displayNumberTextField.text!
        }
        else
        if inMiddleOfTyping && sign == "_"
        {
            displayNumberTextField.text = "+" + displayNumberTextField.text!
        }
        else {
            displayNumberTextField.text = "-" + displayNumberTextField.text!
        }
    }
    
    @IBAction func numberTapped(sender: AnyObject) {
        let number:String = (sender.titleLabel?!.text)!
        if inMiddleOfTyping {   // to take in more than a digit
            displayNumberTextField.text = displayNumberTextField.text! + number
        }
        else {
        displayNumberTextField.text! = number
            inMiddleOfTyping = true
        }
       // print(number)
    }
    
    @IBAction func calculatePercentageOnTapping(sender: AnyObject) {  // function to calculate percentage
        number1 = (Float((displayNumberTextField?.text!)!)!)
        
        displayNumberTextField.text = String(number1! / 100)
        
        
    }
    
    
    @IBAction func calculateOnTapping(sender: AnyObject) {
        inMiddleOfTyping = false
      number2 = Float((displayNumberTextField!.text)!)!
       
        switch operand {
            case "+":
                result = number1! + number2!
            case "-":
                result = number1! - number2!
            case "*":
                result = number1! * number2!
            case "/":
                result = number1! / number2!
            
        default:
               displayNumberTextField.text = "Error"
            
        }
      
       displayNumberTextField.text = String(result!)
      
    }
    
   
    @IBAction func clearOnTap(sender: AnyObject) {
        
        displayNumberTextField.text = " "
    }

    @IBAction func calculateOnTappung(sender: AnyObject) {
        
//        let opr = (sender.titleLabel?!.text)!
//        
//        var register:Float = Float(displayNumberTextField!.text!)!
//        
//        switch opr {
//            case "MC":
//                 register = 0
//            
//            case "M+":
//                displayNumberTextField.text = String(register +
//        }
//
        
    }
    
    var inMiddleOfTyping:Bool = false
    
    
    @IBAction func addDecimalPoint(sender: AnyObject) {
        let dot = (sender.titleLabel?!.text)!
        if inMiddleOfTyping {   
            displayNumberTextField.text = displayNumberTextField.text! + dot
        }
        else {
            displayNumberTextField.text = dot
            inMiddleOfTyping = false
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
