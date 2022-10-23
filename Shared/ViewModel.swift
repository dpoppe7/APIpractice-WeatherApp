//
//  ViewModel.swift
//  APIpractice
//
//  Created by Damaris Poppe on 10/22/22.
//

import Foundation
import UIKit

class WeatherViewModel: ObservableObject {
    //Every time this properties are update, any view holding onto
    //an isntance of this model will update the UI

    @Published var name: String = "-"
    @Published var temp : String = "-"
    @Published var descriptionText: String = "-"
    @Published var main: String = "-"
    
    init(){
        fetchWeather()
    }

    func fetchWeather() {
        //API used: https://openweathermap.org/current
        //lat-lon: Searcy AR; exclude: hourle,daily,minutely ; appid: my API key
        guard let url = URL(string:
                                "https://api.openweathermap.org/data/2.5/weather?lat=35.250641&lon=-91.736252&units=imperial&appid=b3887ba3a6284cf5521dd7d0c2293d79") else {
            return
        }

        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
                    
            //convert data to Model
            do {
                let model = try JSONDecoder().decode(WeatherModel.self, from: data)
                
                //Updating @published properties
                DispatchQueue.main.async {
                    self.name = model.name
                    self.temp = "\(model.main.temp)°"
                    self.descriptionText = model.weather.first?.description ?? "No description"
                    self.main = model.weather.first?.main ?? "No main"
                }
            }
            catch{
                 print("failed to decode WeatherModel from data", error)
            }
        }
        task.resume()
    }
}

//source: (Teaches how to implement API call)
//https://www.freecodecamp.org/news/how-to-make-your-first-api-call-in-swift/
