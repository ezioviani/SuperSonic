import SwiftUI

struct SettingsView: View {

    @AppStorage("voiceEnabled") private var voiceEnabled = true

    var body: some View {

        Form {
            Toggle("Voce attiva", isOn: $voiceEnabled)
        }
        .navigationTitle("Impostazioni")
    }
}