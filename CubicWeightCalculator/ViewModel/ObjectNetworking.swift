//
//  ObjectNetworking.swift
//  CubicWeightCalculator
//
//  Created by Nafisa Rahman on 11/16/19.
//  Copyright © 2019 com.nafisa. All rights reserved.
//

import Foundation

class ObjectNetworking {
    let baseURL = "http://wp8m3he1wt.s3-website-ap-southeast-2.amazonaws.com"
    var pageURL = "/api/products/1"
    var allObjectData = [Object]()
    private let categoryFilterStr = "Air Conditioners"
    
    func getData(completion: @escaping ([Object]) -> Void) {
        let endPoint = baseURL + pageURL
        
        guard let url = URL(string: endPoint) else {
            print("can't create URL")
            return
        }
        
        let urlRequest = URLRequest(url: url)
        let session = URLSession.shared
        
        let task = session.dataTask(with: urlRequest , completionHandler: {[weak self]  (data, response, error) in
            
            if let weakSelf = self {
                guard let _:URLResponse = response  , error == nil else {
                    return
                }
                
                guard let responseData = data else {
                    print("Error: did not receive  data")
                    return
                }
                
                //response status is 200
                let response = response as? HTTPURLResponse
                
                if response?.statusCode == 200 {
                    if let responseData = weakSelf.addData(jsonData: responseData) {
                        
                        weakSelf.allObjectData +=  responseData.objects.filter({ (Object) in
                            Object.category == weakSelf.categoryFilterStr
                        })
                        
                        
                        if let next = responseData.next {
                            weakSelf.pageURL = next
                            weakSelf.getData(completion: completion)
                        } else {
                            completion(weakSelf.allObjectData)
                        }
                    }
                }
                
            } //weak self
        })
        
        task.resume()
        
    }
    
    func addData(jsonData : Data) -> (ObjectModel?) {
        do {
            let responseData = try JSONDecoder().decode(ObjectModel.self, from: jsonData)
            return (responseData)
            
        } catch {
            print("feed JSON parsing error")
        }
        
        return nil
    }
}
