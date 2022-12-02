//
//  GiggleDataManager.swift
//  Giggle
//
//  Created by Abhishek on 25/11/22.
//
/*
 Two functions
 fetchGiggleData
  - Create a network manager object,
  - supply the url to network manager using init.
  - call network manager fetchData
  - Pass the downloaded data to the parseWeatherData function
  - get the Giggle data model from parse function
 parseGiggleData
  - private function
  - accepts downloaded data
  - parses to GiggleModel
  - returns parsed GiggleModel to caller.
 */

import Foundation

private let url = "https://api.chucknorris.io/jokes/random"

struct GiggleDataManager {
    func getGiggleDataManager(completion: @escaping (GiggleModel) -> Void) {
        NetworkManager(url: url).fetchData { data in
            do {
                let giggle = try JSONDecoder().decode(GiggleData.self, from: data)
                if let model = giggle.value {
                    let giggleModel = GiggleModel(joke: "\(model)")
                    completion(giggleModel)
                }

            } catch {
                print(error.localizedDescription)
            }
        }
    }
}
