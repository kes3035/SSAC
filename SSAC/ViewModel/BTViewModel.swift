import UIKit
import CoreBluetooth

class BTViewModel: NSObject, CBCentralManagerDelegate, CBPeripheralDelegate {
    //MARK: - Properties
    private var centralManager: CBCentralManager!
    private var peripheral: CBPeripheral?

    
    //MARK: - LifeCycle
    override init() {
        super.init()
        centralManager = CBCentralManager(delegate: self, queue: nil)
    }

    
    
    //MARK: - Helpers
    func startScanningForHM10() {
        centralManager.scanForPeripherals(withServices: nil, options: nil)
    }

    // CBCentralManagerDelegate Methods

    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        switch central.state {
        case .poweredOn:
            startScanningForHM10()
        default:
            print("Bluetooth not available.")
        }
    }

    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
        if peripheral.name == "HM-10" {
            self.peripheral = peripheral
            centralManager.stopScan()
            centralManager.connect(peripheral, options: nil)
        }
    }

    func centralManager(_ central: CBCentralManager, didConnect peripheral: CBPeripheral) {
        peripheral.delegate = self
        peripheral.discoverServices(nil)
    }

    func peripheral(_ peripheral: CBPeripheral, didDiscoverServices error: Error?) {
        if let services = peripheral.services {
            for service in services {
                peripheral.discoverCharacteristics(nil, for: service)
            }
        }
    }

    func peripheral(_ peripheral: CBPeripheral, didDiscoverCharacteristicsFor service: CBService, error: Error?) {
        if let characteristics = service.characteristics {
            for characteristic in characteristics {
                if characteristic.properties.contains(.writeWithoutResponse) {
                    let message = "Your message" // 보낼 메시지
                    if let data = message.data(using: .utf8) {
                        peripheral.writeValue(data, for: characteristic, type: .withoutResponse)
                    }
                }
            }
        }
    }

    func peripheral(_ peripheral: CBPeripheral, didUpdateValueFor characteristic: CBCharacteristic, error: Error?) {
        if let data = characteristic.value {
            let message = String(data: data, encoding: .utf8)
            print("Received message: \(message ?? "No message")")
        }
    }
}
