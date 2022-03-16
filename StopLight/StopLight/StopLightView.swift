//  Created by Sam Franusic on 3/15/22.

import SwiftUI

struct StopLightView: View {
    @StateObject var stopLight = StopLight()
    var body: some View {
        VStack {
            Circle()
                .foregroundColor(stopLight.red)
            Circle()
                .foregroundColor(stopLight.yellow)
            Circle()
                .foregroundColor(stopLight.green)
        }
        .foregroundColor(.black)
        .onAppear {
            self.stopLight.runLights(initial: .red)
        }
        .animation(.default)
    }

}

struct StopLightView_Previews: PreviewProvider {
    static var previews: some View {
        StopLightView()
    }
}
