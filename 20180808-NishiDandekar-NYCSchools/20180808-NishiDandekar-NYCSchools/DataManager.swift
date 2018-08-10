//
//  DataManager.swift
//  20180808-NishiDandekar-NYCSchools
//
//  Created by Nishigandha Dandekar on 8/9/18.
//  Copyright © 2018 Nishigandha Dandekar. All rights reserved.
//

import Foundation

class DataManager {
    func getSATData(completion: @escaping ([School]?) -> Void ) {
        let satDataURL = "https://data.cityofnewyork.us/resource/734v-jeq5.json"
        guard let url = URL(string: satDataURL) else {
            print("Error unwrapping URL")
            return
        }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            guard let data = data else {
                print("Error getting data");
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let schoolData = try decoder.decode([School].self, from: data)
                completion(schoolData)
            } catch {
                completion(nil)
                print("Error getting API data: \(error.localizedDescription)")
            }
        }.resume()
    }
}
