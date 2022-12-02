//
//  WeatherModel.swift
//  Giggle
//
//  Created by Abhishek on 25/11/22.
//https://api.chucknorris.io/jokes/random


import Foundation

struct GiggleModel {
    let joke: String
}

/*
 parse the data to codable.
 */

struct GiggleData: Codable {
    var value: String?
}
