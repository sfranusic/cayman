//  Created by Sam Franusic on 3/15/22.


import SwiftUI

enum LightType {
    case red, yellow, green
}

struct Lights: Equatable {
    var red: Color
    var yellow: Color
    var green: Color
}

class StopLightModel: ObservableObject {
    @Published var lights = Lights(red: .clear, yellow: .clear, green: .clear)

    func turnLightsOff() {
        lights = Lights(red: .clear, yellow: .clear, green: .clear)
    }

    func runLights(initial: LightType) {
        turnLightsOff()
        switch initial {
        case .red:
            lights.red = .red
            DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                self.runLights(initial: .green)
            }
        case .yellow:
            lights.yellow = .yellow
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                self.runLights(initial: .red)
            }
        case .green:
            lights.green = .green
            DispatchQueue.main.asyncAfter(deadline: .now() + 7) {
                self.runLights(initial: .yellow)
            }
        }
    }
}
