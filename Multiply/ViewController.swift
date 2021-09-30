//
//  ViewController.swift
//  Multiply
//
//  Created by Joe Baffoe on 7/4/21.
//

import UIKit
//cornerRadius Inspectables
//on Attributes Inspector from
//stackoverflow.com
@IBDesignable extension UIButton {

    @IBInspectable var borderWidth: CGFloat {
        set {
            layer.borderWidth = newValue
        }
        get {
            return layer.borderWidth
        }
    }

    @IBInspectable var cornerRadius: CGFloat {
        set {
            layer.cornerRadius = newValue
        }
        get {
            return layer.cornerRadius
        }
    }

    @IBInspectable var borderColor: UIColor? {
        set {
            guard let uiColor = newValue else { return }
            layer.borderColor = uiColor.cgColor
        }
        get {
            guard let color = layer.borderColor else { return nil }
            return UIColor(cgColor: color)
        }
    }
}
//ViewController class
class ViewController: UIViewController, UITextFieldDelegate
{
//MARK: MVP Part I
    @IBOutlet weak var numberOne: UITextField!
    @IBOutlet weak var numberTwo: UITextField!
    @IBOutlet weak var productLabel: UILabel!
//MARK: Stretch #2 Part 1
    @IBOutlet weak var bowserImage: UIImageView!
//MARK: Stretch #3 Part 1
    @IBOutlet weak var funnyImage: UIImageView!
    @IBOutlet weak var funnierImage: UIImageView!
//MARK: Stretch #5 Part 1
    @IBOutlet weak var segmentedControl: UISegmentedControl!
//MARK: Stretch #6 Part 1
    @IBOutlet weak var valueOne: UISlider!
    @IBOutlet weak var valueTwo: UISlider!
    
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//MARK: Stretch #2 Part 2
        bowserImage.isHidden = true
        funnyImage.isHidden = true
        funnierImage.isHidden = true
        
    }
    
//MARK: Stretch #5 Part 2
    @IBAction func indexCase(_ sender: Any)
        {
        switch segmentedControl.selectedSegmentIndex{
        case 0:
            productLabel.text = "Product"
        case 1:
            productLabel.text = "Difference"
        case 2:
            productLabel.text = "Sum"
        case 3:
            productLabel.text = "Quotient"
        case 4:
            productLabel.text = "Remainder"
        default:
            break
        
        }
    }
    
//MARK: Stretch #6 Part 2
    @IBAction func sliderOne(_ sender: Any)
    {
        valueOne.minimumValue = 0
        valueOne.maximumValue = 30
        numberOne.text = String(valueOne.value)
    }
    
    
    @IBAction func sliderTwo(_ sender: Any)
    {
        valueTwo.minimumValue = 0
        valueTwo.maximumValue = 30
        numberTwo.text = String(valueTwo.value)
    }
    
//MARK: MVP Part II
    @IBAction func productButton(_ sender: Any)
    {

        bowserImage.isHidden = true
        funnyImage.isHidden = true
        funnierImage.isHidden = true
        
        guard let data = numberOne.text, !data.isEmpty, let firstNum = Float(data) else { return }
        let firstNumber = firstNum
        guard let data2 = numberTwo.text, !data2.isEmpty, let secNum = Float(data2) else { return }
        let secondNumber = secNum
        let productNumber = firstNumber * secondNumber
        let differenceNumber = firstNumber - secondNumber
        let sumNumber = firstNumber + secondNumber
        let quotientNumber = firstNumber / secondNumber
        let numOne:Int = Int(firstNumber)
        let numTwo:Int = Int(secondNumber)
        let modNumber = numOne % numTwo
        let prodNum = numOne * numTwo
        
//MARK: Stretch #1
        numberOne.resignFirstResponder()
        numberTwo.resignFirstResponder()
//MARK: Stretch #5 Part 2
        if segmentedControl.selectedSegmentIndex == 0 {
//MARK: Stretch #2 Part 3
        if productNumber == 64 {
            bowserImage.isHidden = false
            }
        
//MARK: Stretch #3 Part 2
        if (prodNum % 2 == 0)
            {
            funnyImage.isHidden = false
            funnierImage.isHidden = true
            }
        else{
            funnierImage.isHidden = false
            funnyImage.isHidden = true
        }
        productLabel.text = "The product is \(productNumber)"
        }
        if segmentedControl.selectedSegmentIndex == 1 {
            productLabel.text = "The difference is \(differenceNumber)"
            }
        if segmentedControl.selectedSegmentIndex == 2 {
            productLabel.text = "The sum is \(sumNumber)"
            }
        if segmentedControl.selectedSegmentIndex == 3 {
            productLabel.text = "The quotient is \(quotientNumber)"
            }
        if segmentedControl.selectedSegmentIndex == 4 {
            productLabel.text = "The modulus is \(modNumber)"
            }
        }
//MARK: Stretch #4 Part 2
    @IBAction func pressClear(_ sender: Any)
    {
        numberOne.resignFirstResponder()
        numberTwo.resignFirstResponder()
        productLabel.text = "Product"
        bowserImage.isHidden = true
        funnyImage.isHidden = true
        funnierImage.isHidden = true
        segmentedControl.selectedSegmentIndex = 0
        valueOne.value = 15
        valueTwo.value = 15
        numberOne.text = ""
        numberTwo.text = ""
    }
    
    
}
    



