//
//  GiggleViewModel.swift
//  Giggle
//
//  Created by Abhishek on 25/11/22.
//

import Foundation

struct GiggleViewModel {
    func getViewModel(completion: @escaping (GiggleModel?) -> Void) {
        GiggleDataManager().getGiggleDataManager { jokes in
            completion(jokes)
        }
    }
}
