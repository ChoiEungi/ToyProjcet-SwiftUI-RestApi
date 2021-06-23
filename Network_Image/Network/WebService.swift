//
//  WebService.swift
//  Network_Image
//
//  Created by 최은기 on 2021/06/23.
//

import Foundation
import SwiftUI

struct User :Codable, Identifiable{
    var id: String
    var name: String
    var avatar: String
    var createdAt: String
}

class WebService: ObservableObject{
    
    func loadUsers(completion: @escaping ([User]) -> Void){
        
        guard let url = URL(string: "https://60d2d8c8858b410017b2e48e.mockapi.io/user") else { return }
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            guard let hasData = data else {return}
            
            let users = try! JSONDecoder().decode([User].self, from: hasData)
            completion(users)
        }.resume()
    }
}

