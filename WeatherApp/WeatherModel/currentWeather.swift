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
extension CurrentWeather: JSONDecodable {
    init?(JSON: [String: AnyObject]) {
        guard let temperature = JSON["temperature"] as? Double,
              let appearentTemperature = JSON["apparentTemperature"] as? Double,
              let humidity = JSON["humidity"] as? Double,
              let pressure = JSON["humidity"] as? Double,
              let iconString = JSON["icon"] as? String else {
            return nil
        }
        let icon = WeatherIconManager(rawValue: iconString)!.image
        
        self.temperature = temperature
        self.appearentTemperature = appearentTemperature
        self.humidity = humidity
        self.pressure = pressure
        self.icon = icon
    }
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
