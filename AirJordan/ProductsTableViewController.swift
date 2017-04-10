//
//  ProductsTableViewController.swift
//  AirJordan
//
//  Created by Arkadijs Makarenko on 20/09/2016.
//  Copyright © 2016 ArchieApps. All rights reserved.
//

import UIKit

class ProductsTableViewController: UITableViewController {
    
    var products: [Product]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let product1 = Product()
        let product2 = Product()
        let product3 = Product()
        let product4 = Product()
        let product5 = Product()
        
        product1.name = "Jordan XI"
        product1.productImage = "Jordan11-1"
        product1.cellImage = "image-cell"
        product1.price = 195.99
        
        product2.name = "Jordan XII"
        product2.productImage = "JordanXII"
        product2.cellImage = "image-cell2"
        product2.price = 145.99
            
        product3.name = "Jordan XIII"
        product3.productImage = "JordanXIII-1"
        product3.cellImage = "image-cell3"
        product3.price = 215.99
            
        product4.name = "Jordan XVIII"
        product4.productImage = "JordanXVIII"
        product4.cellImage = "image-cell4-1"
        product4.price = 125.99
        
        product5.name = "Jordan XIX"
        product5.productImage = "JordanXIX"
        product5.cellImage = "image-cell5"
        product5.price = 170.00
            
        products = [product1, product2, product3,
                        product4, product5]
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let p = products{
            return p.count
        }
        return 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductCell", for: indexPath)
        
        let product = products? [indexPath.row]
        
        if let p = product {
            cell.textLabel?.text = p.name
            if let i = p.cellImage {
            cell.imageView?.image = UIImage(named: i)
            }
        }
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender:Any?){
        if segue.identifier == "ShowProduct"{
            let productVC = segue.destination as? ProductViewController
            
            guard let cell = sender as? UITableViewCell,
                let indexPath = tableView.indexPath(for: cell) else {
                    return
            }
            
            productVC?.product = products? [indexPath.row]
                
        }
      }
    }

