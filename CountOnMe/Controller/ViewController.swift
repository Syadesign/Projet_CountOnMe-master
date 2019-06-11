//
//  ViewController.swift
//  SimpleCalc
//
//  Created by Vincent Saluzzo on 29/03/2019.
//  Copyright © 2019 Vincent Saluzzo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var textView: UITextView!
    @IBOutlet var numberButtons: [UIButton]!
    
    var operations = Operations()
    
    // View Life cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        textView.text = "1+1=2"
        updateText()
    }
    
    func updateText() {
        operations.numbersText = textView.text
    }
    // View actions
    
    @IBAction func tappedNumberButton(_ sender: UIButton) {
        guard let numberText = sender.title(for: .normal) else {
            return
        }
        
        if self.operations.expressionHaveResult {
            textView.text = ""
        }
        textView.text.append("" + numberText)
        updateText()
    }
    
    @IBAction func operators(_ sender: UIButton) {
        let sign = sender.tag
        switch sign {
        case 0:
            operations.currentOperator = .add
        case 1:
            operations.currentOperator = .substract
        case 2:
            operations.currentOperator = .multiply
        case 3:
            operations.currentOperator = .divide
        default: print ("error")
        }
        if self.operations.canAddOperator {
            textView.text.append(" " + operations.operatorSign + " ")
            updateText()
        } else {
            displayAlert("Un operateur est déja mis !")
        }
    }
    
    @IBAction func tappedEqualButton(_ sender: UIButton) {
        if self.operations.expressionIsCorrect == false  {
            displayAlert("Entrez une expression correcte !")
        } else if self.operations.expressionHaveEnoughElement == false {
            displayAlert("Démarrez un nouveau calcul !")
        }else {
            textView.text.append(operations.calculate())
            updateText()
        }
    }
    
    func displayAlert(_ message: String){
        let alertVC = UIAlertController(title: "Zéro!", message: message, preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        self.present(alertVC, animated: true, completion: nil)
    }
}

