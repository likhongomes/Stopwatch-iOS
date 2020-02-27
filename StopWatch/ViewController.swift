//
//  ViewController.swift
//  StopWatch
//
//  Created by Likhon Gomes on 2/20/20.
//  Copyright © 2020 Likhon Gomes. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let clockLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        clockLabelSetup()
        // Do any additional setup after loading the view.
    }
    
    func clockLabelSetup(){
        view.addSubview(clockLabel)
        clockLabel.translatesAutoresizingMaskIntoConstraints = false
        clockLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40).isActive = true
        clockLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40).isActive = true
        clockLabel.heightAnchor.constraint(equalToConstant: 60).isActive = true
        clockLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 200).isActive = true
        clockLabel.textColor = .white
        clockLabel.text = "00:00.00"
        clockLabel.textAlignment = .center
        clockLabel.font = UIFont.systemFont(ofSize: 70)
    }


}
