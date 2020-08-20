//
//  ViewController.swift
//  Semaphore
//
//  Created by Aleksandr on 19.08.2020.
//  Copyright © 2020 Aleksandr Lukash. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var actionButton: UIButton!
    @IBOutlet weak var signalsStackView: UIStackView!
    @IBOutlet weak var redView: UIView!
    @IBOutlet weak var yellowView: UIView!
    @IBOutlet weak var greenView: UIView!
    
    private let activate: (UIView) -> Void = { $0.alpha = 1 }
    private let deactivate: (UIView) -> Void = { $0.alpha = 0.3 }
    
    private var currentIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        signalsStackView.arrangedSubviews.forEach { signal in
            signal.frame = CGRect(x: 0,y: 0,width: 100,height: 100)
            signal.layer.cornerRadius = signal.frame.size.width / 2
            signal.layer.masksToBounds = true
            deactivate(signal)
        }
    }
    
    @IBAction func action(_ sender: Any) {
        actionButton.setTitle("Next", for: .normal)
        
        let signalsCount = signalsStackView.arrangedSubviews.count;
        let views = signalsStackView.arrangedSubviews
        
        if currentIndex > signalsCount - 1 {
            currentIndex = 0
        }
        
        if currentIndex > 0 {
            activate(views[currentIndex])
            deactivate(views[currentIndex - 1])
            currentIndex += 1
        } else {
            activate(views[currentIndex])
            deactivate(views[signalsCount - 1])
            currentIndex += 1
        }
    }
}

