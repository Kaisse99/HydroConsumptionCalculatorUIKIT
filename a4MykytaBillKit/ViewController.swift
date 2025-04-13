//
//  ViewController.swift
//  a4MykytaBillKit
//
//  Created by Mykyta Kaisenberg on 2025-04-12.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var OnPeakField: UITextField!
    
    @IBOutlet weak var OffPeakField: UITextField!
    
    @IBOutlet weak var MidPeakField: UITextField!
    
    @IBOutlet weak var OnPeakChargeField: UILabel!
    
    @IBOutlet weak var OffPeakChargeField: UILabel!
    
    @IBOutlet weak var MidPeakChargeField: UILabel!
    
    @IBOutlet weak var TotalConsumptionChargeField: UILabel!
    
    @IBOutlet weak var HSTChargeField: UILabel!
    
    @IBOutlet weak var RebateField: UILabel!
    
    @IBOutlet weak var TotalRegulatoryChargesField: UILabel!
    
    @IBOutlet weak var NetBillAmountField: UILabel!
    
    var onPeakUse: Double?
    var offPeakUse: Double?
    var midPeakUse: Double?
    
    var onPeakCharge : Double {
        return (onPeakUse ?? 0) * onPeakRate
    }
    var offPeakCharge : Double {
        return (offPeakUse ?? 0) * offPeakRate
    }
    
    var midPeakCharge : Double {
        return (midPeakUse ?? 0) * midPeakRate
    }
    
    var totalConsumptionCharges : Double {
        return onPeakCharge + offPeakCharge + midPeakCharge
    }
    
    var hstCharge : Double {
        return totalConsumptionCharges * hstRate
    }
    
    var rebateDiscount : Double {
        return totalConsumptionCharges * rebateRate
    }
    
    var totalRegulatoryCharges : Double {
        return hstCharge - rebateDiscount
    }
    
    var netBillAmount : Double {
        return totalConsumptionCharges + totalRegulatoryCharges
    }
    
    
    
    final var onPeakRate : Double = 0.132
    final var offPeakRate : Double = 0.065
    final var midPeakRate : Double = 0.094
    final var hstRate : Double = 0.13
    final var rebateRate : Double = 0.08
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func CalculateButton(_ sender: Any) {
        onPeakUse = Double(OnPeakField.text ?? "0")
        offPeakUse = Double(OffPeakField.text ?? "0")
        midPeakUse = Double(MidPeakField.text ?? "0")
        
        
        OnPeakChargeField.text = String(format: "On-Peak Charges $%.2f", onPeakCharge)
        OffPeakChargeField.text = String(format: "Off-Peak Charges: $%.2f", offPeakCharge)
        MidPeakChargeField.text = String(format: "Mid-Peak Charges: $%.2f", midPeakCharge)
        
        TotalConsumptionChargeField.text = String(format: "Total Consumption Charges: $%.2f", totalConsumptionCharges    )
        HSTChargeField.text = String(format: "HST (13%): $%.2f", hstCharge)
        RebateField.text = String(format: "Provincial Rebate (13%)%: $%.2f", rebateDiscount)
        
        TotalRegulatoryChargesField.text = String(format: "Total Regulatory Charges: $%.2f", totalRegulatoryCharges)
        
        NetBillAmountField.text = String(format: "Net Bill Amount: $%.2f", netBillAmount)
    }
    
}

