//  Created by Sam Franusic on 3/15/22.


import SwiftUI

class StopLight: ObservableObject {
    @Published var red: Color = .red
    @Published var yellow: Color = .yellow
    @Published var green: Color = .green

    enum LightType {
        case red, yellow, green
    }

    func turnLightsOff() {
        red = .clear
        yellow = .clear
        green = .clear
    }

    func runLights(initial: LightType) {
        turnLightsOff()
        switch initial {
        case .red:
            red = .red
            DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                self.runLights(initial: .green)
            }
        case .yellow:
            yellow = .yellow
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                self.runLights(initial: .red)
            }
        case .green:
            green = .green
            DispatchQueue.main.asyncAfter(deadline: .now() + 7) {
                self.runLights(initial: .yellow)
            }
        }
    }
}
