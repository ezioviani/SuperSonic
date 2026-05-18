import Foundation

final class SyllableEngine {

    static func split(_ word: String) -> [String] {

        let vowels = "aeiouàèéìòùAEIOU"
        var parts: [String] = []
        var current = ""

        for char in word {
            current.append(char)

            if vowels.contains(char) {
                parts.append(current)
                current = ""
            }
        }

        if !current.isEmpty, !parts.isEmpty {
            parts[parts.count - 1] += current
        }

        return parts.isEmpty ? [word] : parts
    }
}