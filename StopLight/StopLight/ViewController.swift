//
//  ViewController.swift
//  StopLight
//
//  Created by Sammy Franusic on 9/30/20.
//  Copyright © 2020 sf. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var redLightView: UIView!
    @IBOutlet weak var yellowLightView: UIView!
    @IBOutlet weak var greenLightView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        greenLightView.backgroundColor = .black
        yellowLightView.backgroundColor = .black

        runLights(light: .red)
    }

    enum Lights {
        case red, yellow, green
    }

    func turnOnlight(light: Lights) {

        UIView.animate(withDuration: 0.25) {
            self.redLightView.backgroundColor = .black
            self.yellowLightView.backgroundColor = .black
            self.greenLightView.backgroundColor = .black
        } completion: { _ in
            UIView.animate(withDuration: 0.5) {
                switch  light {
                case .red:
                    self.redLightView.backgroundColor = UIColor.red
                case .yellow:
                    self.yellowLightView.backgroundColor = UIColor.yellow
                case .green:
                    self.greenLightView.backgroundColor = .green
                }
            }
        }
    }
    func runLights(light: Lights) {
        turnOnlight(light: light)
        switch  light {
        case .red:
            DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                self.runLights(light: .green)
            }
        case .yellow:
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                self.runLights(light: .red)
            }
        case .green:
            DispatchQueue.main.asyncAfter(deadline: .now() + 7) {
                self.runLights(light: .yellow)
            }
        }
    }

}

