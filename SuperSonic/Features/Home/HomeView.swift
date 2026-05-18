import SwiftUI

struct HomeView: View {

    var body: some View {
        NavigationStack {
            VStack(spacing: 32) {

                Spacer()

                Text("SuperSonic")
                    .font(.system(size: 44, weight: .heavy))

                Text("Imparare a leggere
una sillaba alla volta")
                    .multilineTextAlignment(.center)
                    .font(.title3)

                NavigationLink {
                    ReaderView()
                } label: {
                    Label("Inizia", systemImage: "play.fill")
                        .font(.title2.bold())
                        .padding()
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(.borderedProminent)

                Spacer()
            }
            .padding()
        }
    }
}