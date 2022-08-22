//
//  ViewController.swift
//  WeatherApp
//
//  Created by Артём Коротков on 21.08.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var locationLabel: UILabel!
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var pressureLabel: UILabel!
    @IBOutlet var humidityLabel: UILabel!
    @IBOutlet var temperatureLabel: UILabel!
    @IBOutlet var appearentTemperatureLabel: UILabel!
    @IBOutlet var refreshButton: UIButton!
    
    @IBAction func refreshButtonTapped(_ sender: UIButton) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let icon = WeatherIconManager.Rain.image
        let currentWeather = CurrentWeather(temperature: 10, appearentTemperature: 1, humidity: 20, pressure: 11, icon: icon)
        updateUIWith(currentWeather: currentWeather)
    }
//        let url = "https://api.forecast.io/forecast/2a6d8e376a69c1ae07d4a52dd0c2dfdc/37.8267,-122.423"
//        let baseURL = URL(string: "https://api.forecast.io/forecast/2a6d8e376a69c1ae07d4a52dd0c2dfdc/")
//        let fullURL = URL(string: "37.8267,-122.423", relativeTo: baseURL)
//
//        let sessionConfiguration = URLSessionConfiguration.default
//        let session = URLSession(configuration: sessionConfiguration)
//
//        let request = URLRequest(url: fullURL!)
//        let dataTask = session.dataTask(with: fullURL) { data, response, error in
//
//        }
//        dataTask.resume()
//    }
    
    func updateUIWith(currentWeather: CurrentWeather) {
        
        self.imageView.image = currentWeather.icon
        self.temperatureLabel.text = currentWeather.temperatureString
        self.appearentTemperatureLabel.text = currentWeather.appearentTemperatureString
        self.humidityLabel.text = currentWeather.humidityString
        self.pressureLabel.text = currentWeather.pressureString
        
    }
}


