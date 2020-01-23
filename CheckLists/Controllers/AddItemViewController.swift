//
//  ViewController.swift
//  CheckLists
//
//  Created by lpiem on 23/01/2020.
//  Copyright © 2020 lpiem. All rights reserved.
//

import UIKit

class AddItemViewController: UITableViewController {

    @IBOutlet weak var btnDone: UIBarButtonItem!
    @IBOutlet weak var tfNewItem: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func textFieldEdtingChanged(_ sender: Any) {
        //btnDone.isEnabled = !tfNewItem.text!.isEmpty
    }
    
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    @IBAction func done(_ sender: Any) {
        dismiss(animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tfNewItem.becomeFirstResponder()
        btnDone.isEnabled = false
    }
    
}

//MARK: - Text field delegate
extension AddItemViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let oldString = textField.text!
        
        let newString = oldString.replacingCharacters(in: Range(range, in: oldString)!, with: string)
 
        btnDone.isEnabled = !newString.isEmpty
        
        return true
    }
}

