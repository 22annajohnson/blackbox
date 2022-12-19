//
//  BluetoothViewModel.swift
//  BlackBox
//
//  Created by Jacob  Loranger on 12/7/22.
//

import Foundation
import CoreBluetooth
import SwiftUI
import CoreData

//    Creates class to connect via BLE to ESP32

class BluetoothViewModel: NSObject, ObservableObject, CBPeripheralDelegate{
    
    private var centralManager: CBCentralManager?
    private var peripherals: [CBPeripheral] = []
    private var espPeripheral: CBPeripheral!
    @Published var peripheralNames: [String] = []
    private var txCharacteristic: CBCharacteristic!
    private var rxCharacteristic: CBCharacteristic!
    @Published var tempData: [String] = []
    
    
    override init(){
        super.init()
        self.centralManager = CBCentralManager(delegate: self, queue: .main)
    }
}

extension BluetoothViewModel: CBCentralManagerDelegate {
    
//    Initiates the scan for peripherals
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        if central.state == .poweredOn {
            self.centralManager?.scanForPeripherals(withServices: nil)
        }
    }
    
//    Connects to specific peripheral
    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
        if !peripherals.contains(peripheral){
            
            self.peripherals.append(peripheral)
            self.peripheralNames.append(peripheral.name ?? "unnamed device")
            
        }
            espPeripheral = peripheral
        
            if String(describing: peripheral.identifier) == String(describing: CBUUIDs.BLE_Characteristic_uuid_Tx){
                
                print(true)
                print(String(describing: peripheral))
                centralManager?.stopScan()
                print(String(describing: espPeripheral))
                centralManager?.connect(espPeripheral!, options: nil)
            }
            else{
                print(false)
            }
        }
    
//    Discovers peripherals services
    func centralManager(_ central: CBCentralManager, didConnect peripheral: CBPeripheral) {
          print("connected")
          espPeripheral.delegate = self
          espPeripheral.discoverServices([CBUUIDs.BLEService_UUID])
    }
    
//    Discovers characteristics
    func peripheral(_ peripheral: CBPeripheral, didDiscoverServices error: Error?) {
        
        print("discovering...")
        
        guard let services = peripheral.services else {
            return
        }
        for service in services {
            print(service)
            peripheral.discoverCharacteristics(nil, for: service)
        }
    }
    
//    Carries out function provided by characteristics
    func peripheral(_ peripheral: CBPeripheral, didDiscoverCharacteristicsFor service: CBService, error: Error?) {
           
               guard let characteristics = service.characteristics else {
              return
          }

          for characteristic in characteristics {

            if characteristic.uuid.isEqual(CBUUIDs.BLE_Characteristic_uuid_Rx)  {

              rxCharacteristic = characteristic

              peripheral.setNotifyValue(true, for: rxCharacteristic!)
              peripheral.readValue(for: characteristic)

              print("RX Characteristic: \(rxCharacteristic.uuid)")
            }

            if characteristic.uuid.isEqual(CBUUIDs.BLE_Characteristic_uuid_Tx){
              
              txCharacteristic = characteristic
              peripheral.setNotifyValue(true, for: txCharacteristic!)
              print("TX Characteristic: \(txCharacteristic.uuid)")
            }
          }
    }
    
//    Updates function provided by characteristic
    func peripheral(_ peripheral: CBPeripheral, didUpdateValueFor characteristic: CBCharacteristic, error: Error?) {
        
        var characteristicASCIIValue = NSString()

        guard characteristic == txCharacteristic,
            
        let characteristicValue = characteristic.value,
        let ASCIIstring = NSString(data: characteristicValue, encoding: String.Encoding.utf8.rawValue) else { return }


        characteristicASCIIValue = ASCIIstring
    
        let tempPoint = String(characteristicASCIIValue).split(separator: ",")[0]
//        let timePoint = String(characteristicASCIIValue).split(separator: ",")[1]

        print(tempPoint)
        
//        Add data to CoreData here
        
        tempData.append(String(tempPoint))
        
    }
    
}
