//
//  ViewController.swift
//  Calculator
//
//  Created by Sathaporn Sunthornpan on 9/10/2560 BE.
//  Copyright © 2560 Sathaporn Sunthornpan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var laNumberShow: UILabel!
    var newOperation:Bool = true;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

   
    func addNumberToInput(number:String)
    {
        var textNumber = laNumberShow.text!
        
        if newOperation {
            textNumber = ""
            newOperation = false
        }
        
        textNumber = textNumber + number
        laNumberShow.text = textNumber
        countEqual = 0
    }

    
    @IBAction func btnDot(_ sender: Any) {
        let numberL = laNumberShow.text!
        if numberL.first == "0" && !numberL.contains(".") {
            addNumberToInput(number: "0.")
        }
        else if !numberL.contains(".") {
            addNumberToInput(number: ".")
        }
    }
    
    @IBAction func btn0(_ sender: Any) {
        let numberL = laNumberShow.text!
        if numberL.first != "0" || numberL.contains(".") {
           addNumberToInput(number: "0")
        }
    }
    @IBAction func btn1(_ sender: Any) {
        addNumberToInput(number: "1")
    }
    @IBAction func btn2(_ sender: Any) {
        addNumberToInput(number: "2")
    }
    @IBAction func btn3(_ sender: Any) {
        addNumberToInput(number: "3")
    }
    @IBAction func btn4(_ sender: Any) {
        addNumberToInput(number: "4")
    }
    @IBAction func btn5(_ sender: Any) {
        addNumberToInput(number: "5")
    }
    @IBAction func btn6(_ sender: Any) {
        addNumberToInput(number: "6")
    }
    @IBAction func btn7(_ sender: Any) {
        addNumberToInput(number: "7")
    }
    @IBAction func btn8(_ sender: Any) {
        addNumberToInput(number: "8")
    }
    @IBAction func btn9(_ sender: Any) {
        addNumberToInput(number: "9")
    }
    
    var op = ""
    var number1:Double?
    @IBAction func btnAdd(_ sender: Any) {
        op = "+"
        number1 = Double(laNumberShow.text!)
        newOperation = true
        countEqual = 0
    }
    @IBAction func btnSub(_ sender: Any) {
        op = "-"
        number1 = Double(laNumberShow.text!)
        newOperation = true
        countEqual = 0
    }
    @IBAction func btnMul(_ sender: Any) {
        op = "*"
        number1 = Double(laNumberShow.text!)
        newOperation = true
        countEqual = 0
    }
    @IBAction func btnDiv(_ sender: Any) {
        op = "/"
        number1 = Double(laNumberShow.text!)
        newOperation = true
        countEqual = 0
    }
    @IBAction func btnAC(_ sender: Any) {
        laNumberShow.text = "0"
        newOperation = true
        countEqual = 0
    }
    
    @IBAction func btnMinues(_ sender: Any) {
        var textNumber = laNumberShow.text!
        if textNumber.contains("-"){
            textNumber.removeFirst()
        }
        else {
            textNumber = "-" + textNumber
        }
        laNumberShow.text = textNumber
        countEqual = 0
    }
    
    @IBAction func btnPercent(_ sender: Any) {
        var number1 = Double(laNumberShow.text!)
        number1 = number1!/100.0
        laNumberShow.text = String(number1!)
        newOperation = true
        countEqual = 0
    }
    
    var countEqual:Int = 0
    var numberTwo:Double?
    @IBAction func btnEqual(_ sender: Any) {
        var number2 = Double(laNumberShow.text!)
        var results:Double?
        
        if countEqual == 0 {
            numberTwo = number2!
        }
        
        if(countEqual > 0) {
            number1 = number2!
            number2 = numberTwo!
        }
        
        switch op {
        case "+":
            results = number1! + number2!
        case "-":
            results = number1! - number2!
        case "*":
            results = number1! * number2!
        case "/":
            results = number1! / number2!
        default:
            results = number2! + number2!
        }
        
        laNumberShow.text = String(results!)
        newOperation = true
        countEqual = countEqual + 1
    }
    
}

