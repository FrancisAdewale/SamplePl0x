//
//  ViewController.swift
//  SamplePl0x
//
//  Created by Francis Adewale on 07/05/2021.
//

import UIKit

 class ViewController: UIViewController {
    
    
    let sampleImage : UIButton = {
        
        let imageButton = UIButton()
        imageButton.setImage(UIImage(named: "SampleImage"), for: .normal)
        imageButton.translatesAutoresizingMaskIntoConstraints = false
        imageButton.adjustsImageWhenHighlighted = false
        imageButton.showsTouchWhenHighlighted = false
        imageButton.contentMode = .scaleAspectFit
        imageButton.addTarget(self, action: #selector(goToSample), for: .touchUpInside)
        return imageButton
        
        
    }()
    
    
    let setUpSampleField: UITextField = {
        let k = K()

        var textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.backgroundColor = UIColor.gray
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.textColor = k.textColour
        textField.attributedPlaceholder = NSAttributedString(string: "PASTE YOUTUBE LINK", attributes: [NSAttributedString.Key.foregroundColor: k.textColour])
    
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
        title.font = k.h1
        title.translatesAutoresizingMaskIntoConstraints = false
        
        return title
        
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpSubView.addSubview(setUpSampleField)
        view.addSubview(setUpSubView)
        view.addSubview(addH1Ttitle)
        view.addSubview(sampleImage)
        view.backgroundColor = #colorLiteral(red: 0.9450980392, green: 0.9450980392, blue: 0.9450980392, alpha: 1)
        navigationController?.navigationBar.isHidden = true
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
        addH1Ttitle.centerYAnchor.constraint(equalTo: view.topAnchor, constant: 50).isActive = true
        
        sampleImage.centerYAnchor.constraint(equalTo: view.bottomAnchor, constant: -120 ).isActive = true
        sampleImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        sampleImage.heightAnchor.constraint(equalToConstant: 200).isActive = true
        sampleImage.widthAnchor.constraint(equalToConstant: 200).isActive = true
        
   
    }
    
    @objc func goToSample() {
        
        let svc = SampleAudioViewController()
        svc.modalPresentationStyle = .fullScreen

        navigationController?.present(svc, animated: true, completion: nil)
    }


}

