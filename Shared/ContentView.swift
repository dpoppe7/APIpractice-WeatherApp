//
//  ContentView.swift
//  Shared
//
//  Created by Damaris Poppe on 10/22/22.
//

import SwiftUI

struct ContentView: View {
    //creating instance of WEatherViewModel
    //When the state object changes, the component re-renders.
    @StateObject var viewModel = WeatherViewModel()
    
    //building UI
    var body: some View {
        NavigationView{
            VStack{
                Text(viewModel.timezone).font(.system(size: 32))
                Text(viewModel.temp).font(.system(size: 44))
                Text(viewModel.title).font(.system(size: 25))
                Text(viewModel.descriptionText).font(.system(size: 25))
            }
        }
        .navigationTitle("Weather App")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark) //Darkmode
    }
}
