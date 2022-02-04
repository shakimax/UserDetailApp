//
//  NetworkService.swift
//  ITSTest
//
//  Created by Максим on 15.01.22.
//

import UIKit

final class NetworkService {
    
    static func parseJSON() -> [User] {
        guard let path = Bundle.main.path(forResource: "generated", ofType: "json") else { return [] }
        let url = URL(fileURLWithPath: path)
        do {
            let data = try Data(contentsOf: url)
            let result = try JSONDecoder().decode([User].self, from: data)
            return result
        } catch {
            print(error)
            return []
        }
    }
}
