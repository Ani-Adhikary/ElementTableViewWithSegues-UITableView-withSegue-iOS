//
//  ElementViewController.swift
//  ElementTableViewSegue
//
//  Created by Ani Adhikary on 18/11/17.
//  Copyright © 2017 Ani Adhikary. All rights reserved.
//

import UIKit

class ElementViewController: UIViewController {

    @IBOutlet weak var elementTableView: UITableView!
    
    var elements = [Element]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadElements()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowElement" {
            if let destVC = segue.destination as? ElementDetailViewController {
                if let selectedIndexPath = elementTableView.indexPathForSelectedRow {
                    destVC.element = elements[selectedIndexPath.row]
                }
            }
        }
    }
    
    func loadElements() {
        elements = [
            Element(elementName: "Hydrogen", elementSymbol: "H"),
            Element(elementName: "Helium", elementSymbol: "He"),
            Element(elementName: "Lithium", elementSymbol: "Li"),
            Element(elementName: "Beryllium", elementSymbol: "Be"),
            Element(elementName: "Boron", elementSymbol: "B"),
            Element(elementName: "Carbon", elementSymbol: "C"),
            Element(elementName: "Nitrogen", elementSymbol: "N"),
            Element(elementName: "Oxygen", elementSymbol: "O"),
            Element(elementName: "Fluorine", elementSymbol: "F"),
            Element(elementName: "Neon", elementSymbol: "Ne"),
            Element(elementName: "Sodium", elementSymbol: "Na"),
            Element(elementName: "Magnesium", elementSymbol: "Mg"),
            Element(elementName: "Aluminum", elementSymbol: "Al"),
            Element(elementName: "Silicon", elementSymbol: "Si"),
            Element(elementName: "Phosphorus", elementSymbol: "P"),
            Element(elementName: "Sulfur", elementSymbol: "S"),
            Element(elementName: "Chlorine", elementSymbol: "Cl"),
            Element(elementName: "Argon", elementSymbol: "Ar"),
            Element(elementName: "Potassium", elementSymbol: "K"),
            Element(elementName: "Calcium", elementSymbol: "Ca"),
            Element(elementName: "Scandium", elementSymbol: "Sc")
        ]
    }
    
}

extension ElementViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return elements.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let elementCell = tableView.dequeueReusableCell(withIdentifier: "ElementCell", for: indexPath)
        
        let element = elements[indexPath.row]
        elementCell.textLabel?.text = element.elementName
        elementCell.detailTextLabel?.text = element.elementSymbol
        return elementCell
    }
}

extension ElementViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        elementTableView.deselectRow(at: indexPath, animated: true)
    }
}


