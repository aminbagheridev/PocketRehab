// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let quote = try? newJSONDecoder().decode(Quote.self, from: jsonData)

import Foundation

// MARK: - QuoteElement
struct QuoteElement: Codable {
    let quote, author, category: String?
}

typealias Quote = [QuoteElement]
    
