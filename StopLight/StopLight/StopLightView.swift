//  Created by Sam Franusic on 3/15/22.

import SwiftUI

struct StopLightView: View {
    @StateObject var stopLight = StopLight()
    var body: some View {
        VStack {
            Circle()
                .foregroundColor(stopLight.redLight)
            Circle()
                .foregroundColor(stopLight.yellowLight)
            Circle()
                .foregroundColor(stopLight.greenLight)
        }
        .foregroundColor(.black)
        .onAppear {
            self.stopLight.runLights(initialLight: .red)
        }
    }

}

struct StopLightView_Previews: PreviewProvider {
    static var previews: some View {
        StopLightView()
    }
}
