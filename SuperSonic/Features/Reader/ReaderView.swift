import SwiftUI

struct ReaderView: View {

    @StateObject private var vm = ReaderViewModel()

    var body: some View {

        VStack(spacing: 30) {

            Spacer()

            Text("Tocca per avanzare")
                .font(.headline)

            HStack(spacing: 10) {
                ForEach(vm.currentWord.indices, id: \.self) { index in

                    Text(vm.currentWord[index])
                        .font(.system(size: 42, weight: .bold))
                        .padding()
                        .background(
                            index == vm.currentSyllable
                            ? Color.yellow
                            : Color.gray.opacity(0.15)
                        )
                        .clipShape(RoundedRectangle(cornerRadius: 18))
                }
            }
            .onTapGesture {
                vm.next()
            }

            Button {
                vm.toggleVoice()
            } label: {
                Label(
                    vm.voiceEnabled ? "Voce ON" : "Voce OFF",
                    systemImage: vm.voiceEnabled ? "speaker.wave.2.fill" : "speaker.slash.fill"
                )
            }

            Spacer()
        }
        .padding()
    }
}