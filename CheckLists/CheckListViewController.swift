//
//  ViewController.swift
//  CheckLists
//
//  Created by lpiem on 23/01/2020.
//  Copyright © 2020 lpiem. All rights reserved.
//

import UIKit

class CheckListViewController: UITableViewController {

    var tabItem: [CheckListItem] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        tabItem.append(CheckListItem("Finir le cours d'iOS"))
        tabItem.append(CheckListItem("Mettre à jour XCode"))
        tabItem.append(CheckListItem("Faire l'ordre de mission", true))
        tabItem.append(CheckListItem("Trouver de l'inspiration", true))
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return tabItem.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChecklistItem", for: indexPath) as! CheckListItemCell
        
        let item = tabItem[indexPath.row]
        configureText(for: cell, withItem: item)
        configureCheckmark(for: cell, withItem: item)

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChecklistItem", for: indexPath) as! CheckListItemCell
        let item = tabItem[indexPath.row]
        item.toggleChecked()
        configureCheckmark(for: cell, withItem: item)
        tableView.reloadRows(at:[indexPath], with: UITableView.RowAnimation.fade)
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        tabItem.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .right)
    }
    
    func configureText(for cell: CheckListItemCell, withItem item: CheckListItem)  {
        cell.lblItem?.text = item.text
    }
    
    func configureCheckmark(for cell: CheckListItemCell, withItem item: CheckListItem) {
        cell.lblChecked.isHidden = !item.checked
    }
    
    /*@IBAction func addDummyoDo(_ sender: UIBarButtonItem) {
        tabItem.append(CheckListItem("Dummy"))
        let indexPath:IndexPath = IndexPath(row:tabItem.count-1, section:0)
        tableView.insertRows(at: [indexPath], with: .left)
    }*/
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      let navVC = segue.destination as! UINavigationController
      let destVC = navVC.topViewController as! AddItemViewController
      destVC.delegate = self
      if segue.identifier == "editItem" {
        destVC.itemToEdit = tabItem[tableView.indexPath(for: (sender as! CheckListItemCell))!.row]
      }
    }
    
    func addItem(item: CheckListItem) {
        tabItem.append(item)
        let indexPath:IndexPath = IndexPath(row:tabItem.count-1, section:0)
        tableView.insertRows(at: [indexPath], with: .left)
    }
}

extension CheckListViewController : AddItemViewControllerDelegate {
    
    func addItemViewControllerDidCancel(_ controller: AddItemViewController) {
        controller.dismiss(animated: true)
    }
    
    func addItemViewController(_ controller: AddItemViewController, didFinishAddingItem item: CheckListItem) {
        controller.dismiss(animated: true)
        addItem(item: item)
    }
}

