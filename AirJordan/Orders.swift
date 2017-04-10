//
//  Orders.swift
//  AirJordan
//
//  Created by Arkadijs Makarenko on 22/09/2016.
//  Copyright © 2016 ArchieApps. All rights reserved.
//

import Foundation

class Orders: NSObject, NSCoding {
    var orders: [Order]?
    
    required init?(coder aDecoder: NSCoder) {
        self.orders = aDecoder.decodeObject(forKey: "orders") as! [Order]?
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode (self.orders, forKey: "orders")
    }
    
    class func archiveFilePath() -> String{
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        return documentsDirectory.appendingPathComponent("cart.archive").path
    }
    
    class func readOrdersFromArchive() -> [Order]? {
        return NSKeyedUnarchiver.unarchiveObject(withFile: archiveFilePath()) as? [Order]
    }
    
    class func saveOrdersToArchive(orders: [Order]) -> Bool {
        return NSKeyedArchiver.archiveRootObject(orders, toFile: archiveFilePath())
    }
}
