//
//  APIClient.swift
//  TradeMeTest
//
//  Created by Yuan on 20/01/22.
//

import Foundation
import OAuthSwift

class APIClient {
    static let shared = APIClient()
    
    // create an instance and retain it
    let oauthswift = OAuth1Swift(
        consumerKey:    "A1AC63F0332A131A78FAC304D007E7D1",
        consumerSecret: "EC7F18B17A062962C6930A8AE88B16C7"
    )
    
    let baseUrlStr = "https://api.tmsandbox.co.nz/v1"
    
    private func doRequest<T: Decodable>(path: String, type: T.Type, completion: @escaping (T?, Error?) -> Void) {
        oauthswift.client.get("\(baseUrlStr)/\(path)") { result in
            switch result {
            case .success(let response):
                do {
                    print(response.dataString() ?? "")
                    completion(try JSONDecoder().decode(T.self, from: response.data), nil)
                } catch {
                    completion(nil, APIError("Decoder error"))
                }
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
    
    func latestListings(completion: @escaping (ListingsModel?, Error?) -> Void) {
        doRequest(path: "listings/latest.json", type: ListingsModel.self, completion: completion)
    }
}

class APIError: NSObject, LocalizedError {
    var errorStr: String
    
    init(_ errorStr: String) {
        self.errorStr = errorStr
    }
    
    override var description: String {
        get {
            return errorStr
        }
    }
}
