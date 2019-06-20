//
//  ViewController.swift
//  SimpleCalc
//
//  Created by Vincent Saluzzo on 29/03/2019.
//  Copyright © 2019 Vincent Saluzzo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // Views
    @IBOutlet weak var textView: UITextView!
    @IBOutlet var numberButtons: [UIButton]!

    //Instance of struct Operations in the model
    var operations = Operations()

    // View Life cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        textView.text = "1+1=2"
        updateText()
    }

    /// The textView display what is in the property of struct Operations numberText
    func updateText() {
        operations.numbersText = textView.text
    }

    /// View actions
    /// When the user tap in a number button, the text view display the button title
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

    /// When the user tap in a operator button, the text view display the operator
    @IBAction func operators(_ sender: UIButton) {
        let sign = sender.tag
        switch sign {
        case 0:
            operations.operatorSign = .add
        case 1:
            operations.operatorSign = .substract
        case 2:
            operations.operatorSign = .multiply
        case 3:
            operations.operatorSign = .divide
        default: print ("error")
        }
        // Check if the previous element is not an operator
        if operations.expressionHaveResult {
            displayAlert("Opération incorrecte, veuillez commencer une nouvelle opération !")
        } else if self.operations.canAddOperator {
            textView.text.append(" " + operations.operatorSign.rawValue + " ")
            updateText()
            // Display an alert if the previous element is already an operator
        } else {
            displayAlert("Un operateur est déja mis !")
        }
    }

    /// When the user tap on the equal button to see the result of the operation
    @IBAction func tappedEqualButton(_ sender: UIButton) {
        // Check if the previous element is'nt an operator and if the array have 3 elements at least

        if self.operations.expressionIsCorrect == false {
            displayAlert("Entrez une expression correcte !")
        } else if self.operations.expressionHaveEnoughElement == false {
            displayAlert("Démarrez un nouveau calcul !")
        } else if self.operations.numbersText.contains("/ 0") {
            displayAlert("Une division par zéro est impossible !")
            textView.text = ""
        } else if self.operations.numbersText.contains("=") {
            displayAlert("Veuillez commencer une nouvelle opération")
        } else {
            textView.text.append(" = \(operations.calculate())")
            updateText()
        }
    }

    /// Display an alert with a customized message
    func displayAlert(_ message: String) {
        let alertVC = UIAlertController(title: "Erreur", message: message, preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        self.present(alertVC, animated: true, completion: nil)
    }
}
