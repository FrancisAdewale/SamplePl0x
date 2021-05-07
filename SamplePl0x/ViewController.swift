//
//  ViewController.swift
//  SamplePl0x
//
//  Created by Francis Adewale on 07/05/2021.
//

import UIKit

 class ViewController: UIViewController {
    
    
    
    
    let setUpSampleField: UITextField = {
        let k = K()

        var textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.backgroundColor = UIColor.gray
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.textColor = k.textColour
        textField.attributedPlaceholder = NSAttributedString(string: "PASTE YOUTUBE LINK", attributes: [NSAttributedString.Key.foregroundColor: k.textColour])
        textField.font = k.p
    
        return textField
        
    }()
    
    let setUpSubView: UIView = {
        let k = K()

        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.1294117647, green: 0.1254901961, blue: 0.6117647059, alpha: 1)
        view.clipsToBounds = true
        view.layer.cornerRadius = 20.0
        view.layer.borderWidth = 5.0
        view.layer.borderColor = k.borderColour.cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
        
    }()
    
    let addH1Ttitle: UILabel = {
        let k = K()

        let title = UILabel()
        title.text = k.appName
        title.textColor = k.textColour
        title.font = UIFont(name: "Roboto-Bold", size: 90)
        title.translatesAutoresizingMaskIntoConstraints = false
        
        return title
        
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        for family: String in UIFont.familyNames
          {
              print(family)
              for names: String in UIFont.fontNames(forFamilyName: family)
              {
                  print("== \(names)")
              }
          }
        
        setUpSubView.addSubview(setUpSampleField)
        view.addSubview(setUpSubView)
        view.addSubview(addH1Ttitle)
        view.backgroundColor = #colorLiteral(red: 0.9450980392, green: 0.9450980392, blue: 0.9450980392, alpha: 1)
        setUpAutoLayout()

        // Do any additional setup after loading the view.
    }
    
    func setUpAutoLayout() {
        
        setUpSubView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30).isActive = true
        setUpSubView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30).isActive = true
        setUpSubView.heightAnchor.constraint(equalToConstant: view.frame.height/3).isActive = true
        setUpSubView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        setUpSampleField.leftAnchor.constraint(equalTo: setUpSubView.leftAnchor, constant: 20).isActive = true
        setUpSampleField.rightAnchor.constraint(equalTo: setUpSubView.rightAnchor, constant:  -20).isActive = true
        setUpSampleField.centerYAnchor.constraint(equalTo: setUpSubView.centerYAnchor).isActive = true
        setUpSampleField.heightAnchor.constraint(equalToConstant: 80).isActive = true
        
        addH1Ttitle.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        
    }


}

