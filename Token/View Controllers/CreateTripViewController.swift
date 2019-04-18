//
//  CreateTripViewController.swift
//  Token
//
//  Created by P. J. Hernandez on 4/17/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit


class CreateTripViewController: UIViewController {
    
    private var dateFromPicker: UIDatePicker?
    private var dateToPicker: UIDatePicker?
    
    @IBAction func backtoWelcome(_ sender: Any) {
        performSegue(withIdentifier: "backtoWelcome", sender: self)
    }
    
    let inputsContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 5
        view.layer.masksToBounds = true
        return view
    }()
    
    let createTripButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor.white
        button.setTitle("Create a Trip", for: .normal)
        button.setTitleColor(UIColor.init(r: 15, g: 170, b: 190), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 5
        button.layer.masksToBounds = true
        return button
    }()
    
    let tripName: UITextField = {
        let tf = UITextField()
        tf.placeholder =  "Trip Name"
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    let lineSeparator: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.init(r: 220, g: 220, b: 220)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let tripDateFrom: UITextField = {
        let df = UITextField()
        df.placeholder =  "From"
        df.translatesAutoresizingMaskIntoConstraints = false
        return df
    }()
    
    let dateSeparator1: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.init(r: 220, g: 220, b: 220)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let tripDateTo: UITextField = {
        let df = UITextField()
        df.placeholder =  "To"
        df.translatesAutoresizingMaskIntoConstraints = false
        return df
    }()
    
    let dateSeparator2: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.init(r: 220, g: 220, b: 220)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let tokenLogo: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Logo2")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.init(r: 15, g: 170, b: 190)
        
        dateFromPicker = UIDatePicker()
        dateFromPicker?.datePickerMode = .date
        dateFromPicker?.addTarget(self, action: #selector(CreateTripViewController.dateFromChanged(dateFromPicker:)), for: .valueChanged)
        tripDateFrom.inputView = dateFromPicker

        dateToPicker = UIDatePicker()
        dateToPicker?.datePickerMode = .date
        dateToPicker?.addTarget(self, action: #selector(CreateTripViewController.dateToChanged(dateToPicker:)), for: .valueChanged)
        tripDateTo.inputView = dateToPicker
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(CreateTripViewController.viewTapped(gestureRecognizer:)))
        view.addGestureRecognizer(tapGesture)
        
        view.addSubview(inputsContainerView)
        view.addSubview(createTripButton)
        view.addSubview(tokenLogo)
        setupInputsContainer()
        setupCreateTripButton()
        setupLogoView()
      
    }
    
    @objc func viewTapped(gestureRecognizer: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    @objc func dateFromChanged(dateFromPicker: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        tripDateFrom.text = dateFormatter.string(from: dateFromPicker.date)
        view.endEditing(true)
    }
    
    @objc func dateToChanged(dateToPicker: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        tripDateTo.text = dateFormatter.string(from: dateToPicker.date)
        view.endEditing(true)
    }
    
    func setupLogoView() {
        tokenLogo.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        tokenLogo.bottomAnchor.constraint(equalTo: inputsContainerView.topAnchor, constant: 15).isActive = true
        tokenLogo.widthAnchor.constraint(equalToConstant: 250).isActive = true
        tokenLogo.heightAnchor.constraint(equalToConstant: 250).isActive = true
    }

    func setupInputsContainer() {
        inputsContainerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        inputsContainerView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        inputsContainerView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -24).isActive = true
        inputsContainerView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        inputsContainerView.addSubview(tripName)
        inputsContainerView.addSubview(lineSeparator)
        inputsContainerView.addSubview(tripDateFrom)
        inputsContainerView.addSubview(dateSeparator1)
        inputsContainerView.addSubview(tripDateTo)
        inputsContainerView.addSubview(dateSeparator2)
        
        //need constraints for the text field
        tripName.leftAnchor.constraint(equalTo: inputsContainerView.leftAnchor, constant: 12).isActive = true
        tripName.topAnchor.constraint(equalTo: inputsContainerView.topAnchor).isActive = true
        tripName.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
        tripName.heightAnchor.constraint(equalTo: inputsContainerView.heightAnchor, multiplier: 1/3).isActive = true
    
        //need constraints for line separator
        lineSeparator.leftAnchor.constraint(equalTo: inputsContainerView.leftAnchor).isActive = true
        lineSeparator.topAnchor.constraint(equalTo: tripName.bottomAnchor).isActive = true
        lineSeparator.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
        lineSeparator.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        //need constraints for the text field
        tripDateFrom.leftAnchor.constraint(equalTo: inputsContainerView.leftAnchor, constant: 12).isActive = true
        tripDateFrom.topAnchor.constraint(equalTo: tripName.bottomAnchor).isActive = true
        tripDateFrom.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
        tripDateFrom.heightAnchor.constraint(equalTo: inputsContainerView.heightAnchor, multiplier: 1/3).isActive = true
        
        //need constraints for line separator
        dateSeparator1.leftAnchor.constraint(equalTo: inputsContainerView.leftAnchor).isActive = true
        dateSeparator1.topAnchor.constraint(equalTo: tripDateFrom.bottomAnchor).isActive = true
        dateSeparator1.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
        dateSeparator1.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        //need constraints for the text field
        tripDateTo.leftAnchor.constraint(equalTo: inputsContainerView.leftAnchor, constant: 12).isActive = true
        tripDateTo.topAnchor.constraint(equalTo: tripDateFrom.bottomAnchor).isActive = true
        tripDateTo.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
        tripDateTo.heightAnchor.constraint(equalTo: inputsContainerView.heightAnchor, multiplier: 1/3).isActive = true
        
        //need constraints for line separator
        dateSeparator2.leftAnchor.constraint(equalTo: inputsContainerView.leftAnchor).isActive = true
        dateSeparator2.topAnchor.constraint(equalTo: tripDateTo.bottomAnchor).isActive = true
        dateSeparator2.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
        dateSeparator2.heightAnchor.constraint(equalToConstant: 1).isActive = true
    }
    
    func setupCreateTripButton() {
        createTripButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        createTripButton.topAnchor.constraint(equalTo: inputsContainerView.bottomAnchor , constant: 12).isActive = true
        createTripButton.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
        createTripButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }

}
extension UIColor {
    convenience init(r: CGFloat, g: CGFloat, b: CGFloat) {
        self.init(red: r/255, green: g/255, blue: b/255, alpha: 1)
    }
}
