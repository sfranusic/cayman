//  Created by Sam Franusic on 3/15/22.

import SwiftUI

struct StopLightView: View {
    @StateObject var stopLight = StopLightModel()
    var body: some View {
        VStack {
            Circle()
                .foregroundColor(stopLight.lights.red)
            Circle()
                .foregroundColor(stopLight.lights.yellow)
            Circle()
                .foregroundColor(stopLight.lights.green)
        }
        .onAppear {
            self.stopLight.runLights(initial: .red)
        }
        .animation(.default, value: stopLight.lights)
        .background(Color.black)

    }
}

struct StopLightView_Previews: PreviewProvider {
    static var previews: some View {
        StopLightView()
    }
}
