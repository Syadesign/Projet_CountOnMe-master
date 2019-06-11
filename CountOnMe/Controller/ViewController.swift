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
        updateTextView()
    }
    
    func updateTextView() {
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
        updateTextView()
    }
    
    @IBAction func tappedAdditionButton(_ sender: UIButton) {
        
        if self.operations.canAddOperator {
            operations.currentOperator = .add
            textView.text.append(" " + operations.operatorSign + " ")
            updateTextView()
        } else {
           displayAlert("Un operateur est déja mis !")
        }
    }
    
    @IBAction func tappedSubstractionButton(_ sender: UIButton) {
        operations.currentOperator = .substract
        if self.operations.canAddOperator {
            textView.text.append(" " + operations.operatorSign + " ")
            updateTextView()
        } else {
           displayAlert("Un operateur est déja mis !")
        }
    }

    @IBAction func tappedMultiplyButton(_ sender: UIButton) {
        operations.currentOperator = .multiply
        if self.operations.canAddOperator {
            textView.text.append(" " + operations.operatorSign + " ")
            updateTextView()
        } else {
            displayAlert("Un operateur est déja mis !")
        }
    }
    
    @IBAction func tappedDivideButton(_ sender: UIButton) {
        operations.currentOperator = .divide
        if self.operations.canAddOperator {
            textView.text.append(" " + operations.operatorSign + " ")
            updateTextView()
        } else {
           displayAlert("Un operateur est déja mis !")
        }
    }
    
    @IBAction func tappedEqualButton(_ sender: UIButton) {
        guard self.operations.expressionIsCorrect else {
            let alertVC = UIAlertController(title: "Zéro!", message: "Entrez une expression correcte !", preferredStyle: .alert)
            alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            return self.present(alertVC, animated: true, completion: nil)
        }
        guard self.operations.expressionHaveEnoughElement else {
            let alertVC = UIAlertController(title: "Zéro!", message: "Démarrez un nouveau calcul !", preferredStyle: .alert)
            alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            return self.present(alertVC, animated: true, completion: nil)
        }
        textView.text.append(operations.calculate())
        updateTextView()
        }
    
    func displayAlert(_ message: String){
        let alertVC = UIAlertController(title: "Zéro!", message: message, preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        self.present(alertVC, animated: true, completion: nil)
    }

}

