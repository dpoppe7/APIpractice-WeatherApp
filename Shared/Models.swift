//
//  Models.swift
//  APIpractice
//
//  Created by Damaris Poppe on 10/22/22.
//

import Foundation

//From API response JSON: https://openweathermap.org/current
struct WeatherModel: Codable {
    let name: String
    let weather: [WeatherInfo]
    let main: MainInfo
}

struct WeatherInfo: Codable{
    let main: String
    let description: String
}

struct MainInfo: Codable {
    let temp: Float
}
