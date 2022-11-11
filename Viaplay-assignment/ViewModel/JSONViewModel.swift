//
//  JSONViewModel.swift
//  Viaplay-assignment
//
//  Created by Jonas Bergström on 2022-11-11.
//

import SwiftUI

class JSONViewModel: ObservableObject {
    
    @Published var response : ViaplayResponse = ViaplayResponse(_links: ViaplayLinks(viaplaySections: []))
    
    // To access the "ViaplayResponse"
    
    func fetchData() {
        let url = "https://content.viaplay.com/ios-se"
        
        let request = URLRequest(url: URL(string: url)!)
        let session = URLSession(configuration: .default)
        
        session.dataTask(with: request) { (data, res, _) in
            guard let jsonData = data else {return}
            
            // Sets the url and makes the request for it
            
            let response = res as! HTTPURLResponse
            
            // To get the statusCode 200
            if response.statusCode == 200 {
                do {
                    let response = try JSONDecoder().decode(ViaplayResponse.self, from: jsonData)
                    DispatchQueue.main.async {
                        self.response = response
                    }
                }
                catch {
                    print(error.localizedDescription)
                }
            } else {
                print("error with API")
            }
        }
        .resume()
    }
}

