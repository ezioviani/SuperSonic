import AVFoundation

final class SpeechService {

    private let synthesizer = AVSpeechSynthesizer()

    func speak(_ text: String) {

        let utterance = AVSpeechUtterance(string: text)
        utterance.voice = AVSpeechSynthesisVoice(language: "it-IT")
        utterance.rate = 0.4

        synthesizer.speak(utterance)
    }
}