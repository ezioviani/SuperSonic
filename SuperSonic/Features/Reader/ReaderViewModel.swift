import Foundation

final class ReaderViewModel: ObservableObject {

    @Published var currentWord: [String] = ["TA", "VO", "LO"]
    @Published var currentSyllable: Int = 0
    @Published var voiceEnabled = true

    private let speaker = SpeechService()

    func next() {

        if currentSyllable < currentWord.count - 1 {
            currentSyllable += 1
        } else {
            currentSyllable = 0
        }

        if voiceEnabled {
            speaker.speak(currentWord[currentSyllable])
        }
    }

    func toggleVoice() {
        voiceEnabled.toggle()
    }
}