//
//  FetchInfoService.swift
//  ITSTest
//
//  Created by Максим on 18.01.22.
//

import Foundation

//class FetchService {
//    
//    func fetchInfo() {
//        guard let path = Bundle.main.path(forResource: "generated", ofType: "json") else { return }
//        let url = URL(fileURLWithPath: path)
//        do {
//            let data = try Data(contentsOf: url)
//            let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
//            
//            guard let array = json as? [Any] else { return }
//            for user in array {
//                guard let userDict = user as? [String: Any] else { return }
//                guard let name = userDict["name"] as? String else { return }
//                guard let age = userDict["age"] as? Int else { return }
//                guard let gender = userDict["gender"] as? String else { return }
//                guard let about = userDict["about"] as? String else { return }
//                guard let latitude = userDict["latitude"] as? Double else { return }
//                guard let longitude = userDict["longitude"] as? Double else { return }
//
//            }
//        } catch {
//            print(error)
//        }
//    }
//}
