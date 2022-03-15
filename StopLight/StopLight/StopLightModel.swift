//  Created by Sam Franusic on 3/15/22.


import SwiftUI

class StopLight: ObservableObject {
    @Published var redLight: Color = .black
    @Published var yellowLight: Color = .black
    @Published var greenLight: Color = .black

    enum LightType {
        case red, yellow, green
    }

    func turnLightsOff() {
        redLight = .black
        yellowLight = .black
        greenLight = .black
    }

    func runLights(initialLight: LightType) {
        turnLightsOff()
        switch initialLight {
        case .red:
            redLight = .red
            DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                self.runLights(initialLight: .green)
            }
        case .yellow:
            yellowLight = .yellow
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                self.runLights(initialLight: .red)
            }
        case .green:
            greenLight = .green
            DispatchQueue.main.asyncAfter(deadline: .now() + 7) {
                self.runLights(initialLight: .yellow)
            }
        }
    }
}
