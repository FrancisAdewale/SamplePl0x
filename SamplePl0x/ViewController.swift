//
//  ViewController.swift
//  SamplePl0x
//
//  Created by Francis Adewale on 07/05/2021.
//

import UIKit
import MediaPlayer

 class ViewController: UIViewController {
    
    var mpMediapicker: MPMediaPickerController!
    var mediaItems = [MPMediaItem]()
    let currentIndex = 0
       

    
    
    let sampleImage : UIButton = {
        
        
        
        let imageButton = UIButton()
        imageButton.setImage(UIImage(named: "SampleImage"), for: .normal)
        imageButton.translatesAutoresizingMaskIntoConstraints = false
        imageButton.adjustsImageWhenHighlighted = false
        imageButton.showsTouchWhenHighlighted = false
        imageButton.contentMode = .scaleAspectFit
        imageButton.addTarget(self, action: #selector(goToSample), for: .touchUpInside)
        
        let hover = CABasicAnimation(keyPath: "position")
            
        hover.isAdditive = true
        hover.fromValue = NSValue(cgPoint: CGPoint.zero)
        hover.toValue = NSValue(cgPoint: CGPoint(x: 0.0, y:50.0))
        hover.autoreverses = true
        hover.duration = 1
        hover.repeatCount = Float.infinity
            
       imageButton.layer.add(hover, forKey: "myHoverAnimation")
        return imageButton
        
        
    }()
    
    
    let setUpStatusText: UILabel = {
        
        let k = K()

        
        let status = UILabel()
        status.text = "Upload audio to sample"
        status.textColor = k.textColour
        status.font = k.p
        status.translatesAutoresizingMaskIntoConstraints = false
        
        return status
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
        setUpSubView.addSubview(setUpStatusText)
        view.addSubview(setUpSubView)
        view.addSubview(addH1Ttitle)
        view.addSubview(sampleImage)
        view.backgroundColor = #colorLiteral(red: 0.9450980392, green: 0.9450980392, blue: 0.9450980392, alpha: 1)
        navigationController?.navigationBar.isHidden = true
        setUpAutoLayout()
        
        mpMediapicker = MPMediaPickerController.self(mediaTypes:MPMediaType.music)
        mpMediapicker.allowsPickingMultipleItems = false
        mpMediapicker.showsCloudItems = true
        mpMediapicker.delegate = self
        

        // Do any additional setup after loading the view.
    }
    
    func setUpAutoLayout() {
        
        setUpSubView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30).isActive = true
        setUpSubView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30).isActive = true
        setUpSubView.heightAnchor.constraint(equalToConstant: view.frame.height/3).isActive = true
        setUpSubView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        setUpStatusText.centerXAnchor.constraint(equalTo: setUpSubView.centerXAnchor).isActive = true
        setUpStatusText.centerYAnchor.constraint(equalTo: setUpSubView.centerYAnchor).isActive = true
        
//        setUpSampleField.leftAnchor.constraint(equalTo: setUpSubView.leftAnchor, constant: 20).isActive = true
//        setUpSampleField.rightAnchor.constraint(equalTo: setUpSubView.rightAnchor, constant:  -20).isActive = true
//        setUpSampleField.centerYAnchor.constraint(equalTo: setUpSubView.centerYAnchor).isActive = true
//        setUpSampleField.heightAnchor.constraint(equalToConstant: 80).isActive = true
//
        addH1Ttitle.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        addH1Ttitle.centerYAnchor.constraint(equalTo: view.topAnchor, constant: 50).isActive = true
        
        sampleImage.centerYAnchor.constraint(equalTo: view.bottomAnchor, constant: -110 ).isActive = true
        sampleImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        sampleImage.heightAnchor.constraint(equalToConstant: 140).isActive = true
        sampleImage.widthAnchor.constraint(equalToConstant: 140).isActive = true
        
   
    }
    
    @objc func goToSample() {
        

    self.present(mpMediapicker, animated: true, completion: nil)

    
        
        let svc = SampleAudioViewController()
    
        svc.modalPresentationStyle = .fullScreen

        navigationController?.present(svc, animated: true, completion: nil)
    }


}

extension ViewController: MPMediaPickerControllerDelegate {
    
    func mediaPicker(_ mediaPicker: MPMediaPickerController, didPickMediaItems mediaItemCollection: MPMediaItemCollection) {
        mediaItems = mediaItemCollection.items
        


    }
    

    
    
}
