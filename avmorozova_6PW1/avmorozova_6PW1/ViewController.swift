// ViewController.swift
//  avmorozova_6PW1
//
//  Created by Anastasia on 12.09.2021.
//


import UIKit

class ViewController: UIViewController {
    @IBOutlet var views: [UIView]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fillColorSet()
        roundCornersSetColor()
    }
    
    
    var colorSet = Set<UIColor>()
    
    @IBAction func changeColorButtonPressed(_ sender: Any) {
        fillColorSet()
        roundCornersSetColor()
        
        let button = sender as? UIButton
        button?.isEnabled = false
        
        fillColorSet()
        UIView.animate(withDuration: 2, animations: {
            self.roundCornersSetColor()
        }) { completion in
            button?.isEnabled = true
        }
    }
    
    func fillColorSet()
    {
        while colorSet.count < views.count {
            colorSet.insert(
                UIColor(
                    red: .random(in: 0...1),
                    green: .random(in: 0...1),
                    blue: .random(in: 0...1),
                    alpha: 1
                )
            )
        }
    }
    
    func roundCornersSetColor()
    {
        for view in self.views {
            view.layer.cornerRadius = 10
            view.backgroundColor = self.colorSet.popFirst()
        }
    }
    
}

