import Vision
import UIKit

final class OCRService {

    func extractText(from image: UIImage, completion: @escaping (String) -> Void) {

        guard let cgImage = image.cgImage else {
            completion("")
            return
        }

        let request = VNRecognizeTextRequest { request, _ in

            let text = request.results?
                .compactMap { $0 as? VNRecognizedTextObservation }
                .compactMap { $0.topCandidates(1).first?.string }
                .joined(separator: " ") ?? ""

            completion(text)
        }

        request.recognitionLanguages = ["it-IT"]
        request.recognitionLevel = .accurate

        let handler = VNImageRequestHandler(cgImage: cgImage)

        try? handler.perform([request])
    }
}