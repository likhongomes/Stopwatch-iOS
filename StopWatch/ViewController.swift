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
    let resetButton = UIButton()
    let startButton = UIButton()
    var timer = Timer()
    let dateFormatter = DateFormatter()
    let stopwatch = StopWatch()
    let backgroundImageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        backgroundImageViewSetup()
        clockLabelSetup()
        startButtonSetup()
        resetButtonSetup()
        
    }
    
    func resetButtonSetup(){
        view.addSubview(resetButton)
        resetButton.translatesAutoresizingMaskIntoConstraints = false
        resetButton.heightAnchor.constraint(equalToConstant: 80).isActive = true
        resetButton.widthAnchor.constraint(equalToConstant: 80).isActive = true
        resetButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40).isActive = true
        resetButton.topAnchor.constraint(equalTo: clockLabel.bottomAnchor, constant: 200).isActive = true
        resetButton.backgroundColor = .gray
        resetButton.layer.cornerRadius = 40
        resetButton.setTitle("Reset", for: .normal)
        resetButton.clipsToBounds = true
        resetButton.addTarget(self, action: #selector(resetButtonClicked), for: .touchUpInside)
        resetButton.isHidden = true
    }
    
    @objc func resetButtonClicked(){
        clockLabel.text = "00:00.0"
        stopwatch.stop()
        resetButton.isHidden = true
    }
    
    func startButtonSetup(){
        view.addSubview(startButton)
        startButton.translatesAutoresizingMaskIntoConstraints = false
        startButton.heightAnchor.constraint(equalToConstant: 80).isActive = true
        startButton.widthAnchor.constraint(equalToConstant: 80).isActive = true
        startButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40).isActive = true
        startButton.topAnchor.constraint(equalTo: clockLabel.bottomAnchor, constant: 200).isActive = true
        startButton.backgroundColor = #colorLiteral(red: 0.05785719508, green: 0.3493813452, blue: 0.05064194903, alpha: 1)
        startButton.setTitleColor(#colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1), for: .normal)
        startButton.layer.cornerRadius = 40
        startButton.setTitle("Start", for: .normal)
        startButton.clipsToBounds = true
        startButton.addTarget(self, action: #selector(startButtonClicked), for: .touchUpInside)
    }
    
    @objc func startButtonClicked(){
        if(startButton.isSelected){
            startButton.isSelected = false
            startButton.setTitle("Stop", for: .normal)
            startButton.backgroundColor = #colorLiteral(red: 0.3176470697, green: 0.07450980693, blue: 0.02745098062, alpha: 1)
            startButton.setTitleColor(#colorLiteral(red: 0.9928815038, green: 0.1237051785, blue: 0.1051128647, alpha: 1), for: .normal)
            resetButton.isHidden = false
            stopwatch.start()
            timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
            
        } else {
            startButton.isSelected = true
            startButton.setTitle("Start", for: .normal)
            startButton.backgroundColor = #colorLiteral(red: 0.05785719508, green: 0.3493813452, blue: 0.05064194903, alpha: 1)
            startButton.setTitleColor(#colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1), for: .normal)
            
            stopwatch.stop()
            timer.invalidate()
        }
    }
    
    @objc func updateTimer(){
        //print(stopwatch.getTime())
        clockLabel.text = String(stopwatch.getTime())
    }
    
    func clockLabelSetup(){
        view.addSubview(clockLabel)
        clockLabel.translatesAutoresizingMaskIntoConstraints = false
        clockLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40).isActive = true
        clockLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40).isActive = true
        clockLabel.heightAnchor.constraint(equalToConstant: 100).isActive = true
        clockLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 200).isActive = true
        clockLabel.textColor = .white
        clockLabel.font = .systemFont(ofSize: 70, weight: .thin)
        clockLabel.text = "00:00.0"
        clockLabel.textAlignment = .center
        //clockLabel.font = UIFont.systemFont(ofSize: 70)
    }
    
    func backgroundImageViewSetup(){
        view.addSubview(backgroundImageView)
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        backgroundImageView.image = #imageLiteral(resourceName: "back")
    }


}


