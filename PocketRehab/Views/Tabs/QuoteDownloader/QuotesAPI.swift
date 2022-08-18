//
//  NewsAPI.swift
//  SwiftUINewsApp
//
//  Created by Amin  Bagheri  on 2022-07-09.
//

import Foundation

//Allows to increase reusability incase we want to use a second api
protocol APIBuilder {
    var urlRequest: URLRequest { get }
    var baseURL: URL { get }
}

enum QuotesAPI { // allows us to have a simple way of calling get news
    case getQuotes
}

extension QuotesAPI: APIBuilder {
    
    var baseURL: URL {
        switch self {
        case .getQuotes:
            return URL(string: "https://api.api-ninjas.com/v1/quotes?category=inspirational")!
        }
    }
    
    var urlRequest: URLRequest {
        return URLRequest(url: self.baseURL)
    }
    
}

class QuoteApi: ObservableObject{
    @Published var quotes = Quote()
    
    func loadData(completion:@escaping (Quote) -> ()) {
        guard let url = URL(string: "https://api.api-ninjas.com/v1/quotes?category=inspirational") else {
            print("Invalid url...")
            return
        }
        var request = URLRequest(url: url)
        request.setValue("37wxTf3T2f6bWDox090oiw==YLFLyfjpeRWDfYGl", forHTTPHeaderField: "X-Api-Key")
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            
            guard let data = data else {
                print("Data doesnt exist")
                return
            }
            
            do {
                let quotes = try JSONDecoder().decode(Quote.self, from: data)
                
                DispatchQueue.main.async {
                    completion(quotes)
                }
            } catch {
                print(error.localizedDescription)
            }
            
        }.resume()
        
    }
}
