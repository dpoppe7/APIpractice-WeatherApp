//
//  Models.swift
//  APIpractice
//
//  Created by Damaris Poppe on 10/22/22.
//

import Foundation

struct WeatherModel: Codable {
    //Got fields from API response JSON: https://openweathermap.org/api/one-call-3#how
    let timezone: String
    let current: CurrentWeather
}

struct CurrentWeather: Codable{
    let temp: Float
    let weather: [WeatherInfo]
}

struct WeatherInfo: Codable{
    let main: String
    let description: String
}
