//
//  CBUUIDs.swift
//  BlackBox
//
//  Created by Jacob  Loranger on 12/7/22.
//

import Foundation
import CoreBluetooth


//Stores unique indentifiers for the central device
struct CBUUIDs {

    static let kBLEService_UUID = "825B7501-2280-E5CA-C71B-49010282FFC4"
//    static let kBLE_Characteristic_uuid_Tx = "825B7503-2280-E5CA-C71B-49010282FFC4"
    static let kBLE_Characteristic_uuid_Rx = "825B7502-2280-E5CA-C71B-49010282FFC4"
    static let kBLE_Characteristic_uuid_Tx = "AE16BCEC-C712-65A2-F0C6-3EDD867FB437"
    

    static let BLEService_UUID = CBUUID(string: kBLEService_UUID)
    static let BLE_Characteristic_uuid_Tx = CBUUID(string: kBLE_Characteristic_uuid_Tx)//(Property = Write without response)
    static let BLE_Characteristic_uuid_Rx = CBUUID(string: kBLE_Characteristic_uuid_Rx)// (Property = Read/Notify)

}
