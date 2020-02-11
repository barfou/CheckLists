//
//  ViewController.swift
//  CheckLists
//
//  Created by lpiem on 23/01/2020.
//  Copyright © 2020 lpiem. All rights reserved.
//

import UIKit

class AddItemViewController: UITableViewController {
    
    var delegate :AddItemViewControllerDelegate?
    var itemToEdit: CheckListItem?

    @IBOutlet weak var btnDone: UIBarButtonItem!
    @IBOutlet weak var tfNewItem: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let itemToEdit = itemToEdit {
            tfNewItem.text = itemToEdit.text
        }
    }
    
    @IBAction func textFieldEdtingChanged(_ sender: Any) {
        btnDone.isEnabled = !tfNewItem.text!.isEmpty
    }
    
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        delegate?.addItemViewControllerDidCancel(self)
    }
    
    @IBAction func done(_ sender: Any) {
        delegate?.addItemViewController(self, didFinishAddingItem: CheckListItem(tfNewItem.text!))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tfNewItem.becomeFirstResponder()
        btnDone.isEnabled = false
    }
    
}

//MARK: - Text field delegate
/*extension AddItemViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let oldString = textField.text!
        
        let newString = oldString.replacingCharacters(in: Range(range, in: oldString)!, with: string)
 
        btnDone.isEnabled = !newString.isEmpty
        
        return true
    }
}*/

protocol AddItemViewControllerDelegate : class {
    func addItemViewControllerDidCancel(_ controller: AddItemViewController)
    func addItemViewController(_ controller: AddItemViewController, didFinishAddingItem item: CheckListItem)
}

