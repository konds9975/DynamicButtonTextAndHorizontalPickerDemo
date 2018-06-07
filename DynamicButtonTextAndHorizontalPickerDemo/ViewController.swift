//
//  ViewController.swift
//  DynamicButtonTextAndHorizontalPickerDemo
//
//  Created by Inkswipe on 6/7/18.
//  Copyright © 2018 Fortune4 Technologies. All rights reserved.
//

//
//  ViewController.swift
//  Fabbit
//
//  Created by Inkswipe on 6/6/18.
//  Copyright © 2018 Fortune4 Technologies. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {
    
    var pickerView: UIPickerView!
    @IBOutlet weak var width2: NSLayoutConstraint!
    @IBOutlet weak var height4: NSLayoutConstraint!
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var bakView: UIView!
    override func viewDidLoad()
    {
        super.viewDidLoad()
        pickerView = UIPickerView(frame:  CGRect(x: 0.0, y: 0.0, width: self.view.frame.size.width, height: self.view.frame.size.height))
        pickerView.delegate = self
        pickerView.dataSource = self
        pickerView.transform = CGAffineTransform(rotationAngle: CGFloat(-90 * (Float.pi / 180)))
        self.pickerView.selectRow(5, inComponent: 0, animated: false)
        self.pickerView.subviews[1].isHidden = true
        self.pickerView.subviews[2].isHidden = true
        self.pickerView.frame = CGRect(x: 0.0, y: 0.0, width: self.bakView.frame.size.width, height: self.bakView.frame.size.height)
        self.bakView.addSubview(pickerView)
        
        self.button.titleLabel?.lineBreakMode = .byWordWrapping
        
        let title = self.button.titleLabel?.text ?? ""
        
        //let stringSize = title.height(constraintedWidth: self.button.frame.size.width, font: UIFont.systemFont(ofSize: 15))
        
        self.height4.constant = (labelSizeWithString(text: title, fontSize: 15, maxWidth: 345, numberOfLines: 0)).size.height + 20
        
        
        
    }
    func labelSizeWithString(text: String,fontSize: CGFloat, maxWidth : CGFloat,numberOfLines: Int) -> CGRect{
        
        let font = UIFont.systemFont(ofSize: fontSize)//(name: "HelveticaNeue", size: fontSize)!
        let label = UILabel(frame: CGRect(x:0, y:0, width:maxWidth, height:CGFloat.greatestFiniteMagnitude))
        label.numberOfLines = numberOfLines
        label.font = font
        label.text = text
        label.sizeToFit()
        return label.frame
    }
    
    
    
    @IBAction func cilck(_ sender: Any) {
        
        print("tufit")
    }
    override func viewDidLayoutSubviews() {
        
        
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 100
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 90
    }
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        return self.bakView.frame.size.height
    }
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        
        if pickerView.selectedRow(inComponent: component) == row
        {
            let label = UILabel()
            label.transform = CGAffineTransform(rotationAngle: CGFloat(90 * (Float.pi / 180)))
            label.text = String(row+1) + " kgs"
            label.textColor = colorButton
            label.textAlignment = .center
            label.font = UIFont.systemFont(ofSize: 25, weight: .bold)
            return label
        }
        else
        {
            
            let label = UILabel()
            label.transform = CGAffineTransform(rotationAngle: CGFloat(90 * (Float.pi / 180)))
            label.text = String(row+1)
            label.textColor = UIColor.lightGray
            label.textAlignment = .center
            label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
            return label
        }
        
        
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        pickerView.reloadAllComponents()
        
    }
    
}
extension String {
    func height(constraintedWidth width: CGFloat, font: UIFont) -> CGRect {
        let label =  UILabel(frame: CGRect(x: 0, y: 0, width: width, height: .greatestFiniteMagnitude))
        label.numberOfLines = 0
        label.text = self
        label.font = font
        label.sizeToFit()
        
        return label.frame
    }
}
