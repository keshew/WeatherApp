//
//  APIManager.swift
//  WeatherApp
//
//  Created by Артём Коротков on 22.08.2022.
//

import Foundation

typealias JSONTask = URLSessionDataTask
typealias JSONCompletionHandler = ([String: AnyObject]?, HTTPURLResponse?, Error?) -> Void

enum  APIResult<T> {
case Success(T)
case Failure(Error)
}

protocol APIManager {
    var sessionConfiguration: URLSessionConfiguration { get }
    var session: URLSession { get }
    
    func JSONTaskWith(request: URLRequest, completionHandler: JSONCompletionHandler ) -> JSONTask
    
    func fetch<T>(request: URLRequest, parse: ([String:AnyObject]) -> T?, completionHandler: (APIResult<T>) -> Void)
    
    init(sessionConfiguration: URLSessionConfiguration)
}

extension APIManager {
    func JSONTaskWith(request: URLRequest, completionHandler: JSONCompletionHandler ) -> JSONTask {
        
        let dataTask = session.dataTask(with: request) { (data, response, error) in
            guard let HTTPResponse = response as? HTTPURLResponse else {
                
                let userInfo = [
                    NSLocalizedDescriptionKey: NSLocalizedString("Missing HTTP response", comment: "")
                ]
                let error = NSError(domain: KORNetworkingErrorDomain, code: MissingHTTPResponseError, userInfo: userInfo)
                
                completionHandler(nil, nil, error)
                return
            }
        }
    }
    
}
