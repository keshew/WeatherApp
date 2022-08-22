//
//  currentWeather.swift
//  WeatherApp
//
//  Created by Артём Коротков on 22.08.2022.
//

import Foundation
import UIKit

struct CurrentWeather {
    let temperature: Double
    let appearentTemperature: Double
    //влажность
    let humidity: Double
    //давление
    let pressure: Double
    let icon: UIImage
    
}

extension CurrentWeather {
    var pressureString: String {
        return "\(Int(pressure)) mm"
    }
    
    var humidityString: String {
        return "\(Int(humidity))%"
    }
    
    var temperatureString: String {
        return "\(Int(temperature))ºC"
    }
    
    var appearentTemperatureString: String {
        return "\(Int(temperature))ºC"
    }
}
