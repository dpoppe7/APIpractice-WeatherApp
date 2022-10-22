//
//  ViewModel.swift
//  APIpractice
//
//  Created by Damaris Poppe on 10/22/22.
//

import Foundation

class WeatherViewModel: ObservableObject {
    //Every time this properties are update, any view holding onto
    //an isntance of this model will update the UI
    @Published var title: String = "-"
    @Published var descriptionText: String = "-"
    @Published var temp : String = "-"
    @Published var timezone: String = "-"
    
    init(){
        fetchWeather()
    }

    func fetchWeather() {
        //API used: https://openweathermap.org/api/one-call-3#how
        //lat-lon: Searcy AR; exclude: hourle,daily,minutely ; appid: my API key
        guard let url = URL(string:
                                "https://api.openweathermap.org/data/3.0/onecall?lat=35.2468204&lon=-91.7336846&exclude=hourly,daily,minutely&appid=b3887ba3a6284cf5521dd7d0c2293d79") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data,_, error in
            if let error = error {
                print("Error with fetching weather: \(error)")
                    return
            }
                    
            //convert data to Model
        }
        task.resume()
    }
}

//source: (Teaches how to implement API call)
//https://www.freecodecamp.org/news/how-to-make-your-first-api-call-in-swift/
