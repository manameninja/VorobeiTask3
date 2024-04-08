//
//  ViewController.swift
//  VorobeiTask3
//
//  Created by Даниил Павленко on 08.04.2024.
//

import UIKit

class ViewController: UIViewController {
    //MARK: - Properties
    var squareView: UIView!
    var slider: UISlider!
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        squareView = UIView()
        squareView.backgroundColor = .systemBlue
        squareView.layer.cornerRadius = 8
        squareView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(squareView)
        
        squareView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 50).isActive = true
        squareView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor).isActive = true
        squareView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        squareView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        slider = UISlider()
        slider.minimumValue = 0.0
        slider.maximumValue = 1.0
        slider.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(slider)
        
        slider.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor).isActive = true
        slider.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor).isActive = true
        slider.topAnchor.constraint(equalTo: squareView.bottomAnchor, constant: 50).isActive = true
        
        
        slider.addTarget(self, action: #selector(sliderChanged(_:)), for: .valueChanged)
        slider.addTarget(self, action: #selector(sliderReleased(_:)), for: [.touchUpInside, .touchUpOutside])
        print("Start cube size:", squareView.frame.size)
    }
    
    //MARK: - Methods
    @objc func sliderReleased(_ sender: UISlider) {
        sender.setValue(sender.maximumValue, animated: true)
        sliderChanged(sender)
        print("New cube size:", squareView.frame.size)
    }
    
    @objc func sliderChanged(_ sender: UISlider) {
        let sliderValue = CGFloat(sender.value)
        let angle = sliderValue * CGFloat.pi / 2
        let scale = 1.0 + sliderValue / 2
        
        let translationX = (view.frame.width - squareView.layoutMarginsGuide.layoutFrame.origin.x - 100 * 1.5) * sliderValue
        UIView.animate(withDuration: 0.2) {
            self.squareView.transform = CGAffineTransform(translationX: translationX, y: 0)
                .rotated(by: angle)
                .scaledBy(x: scale, y: scale)
        }
    }
}
