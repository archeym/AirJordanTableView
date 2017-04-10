//
//  ProductViewController.swift
//  AirJordan
//
//  Created by Arkadijs Makarenko on 16/09/2016.
//  Copyright © 2016 ArchieApps. All rights reserved.
//

import UIKit

class ProductViewController: UIViewController {

    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productImageView: UIImageView!
    
    var product: Product?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let p = product {
            productNameLabel.text = p.name
            if let i = p.productImage {
                productImageView.image = UIImage(named: i)
            }
        }

    }
    @IBAction func addToCartPressed(_ sender: AnyObject) {
        print("You Tapped Me, I'm in Cart")
        
        guard let product = product, let price = product.price else{
            return
        }
        
        let alertController = UIAlertController(title: "Moved to Cart", message: "Saved to Cart, sneakers price $\(price)", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alertController.addAction(action)
        
        let order = Order()
        order.order_id = 1
        order.product = product
        
        var orders = Orders.readOrdersFromArchive()
        orders?.append(order)
        if let orders = orders {
            if (Orders.saveOrdersToArchive(orders: orders)){
        present(alertController, animated: true, completion: nil)
        }
      }
    }
}
