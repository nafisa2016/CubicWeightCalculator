//
//  ObjectViewModel.swift
//  CubicWeightCalculator
//
//  Created by Nafisa Rahman on 11/16/19.
//  Copyright © 2019 com.nafisa. All rights reserved.
//

import Foundation

class ObjectViewModel {
    var objects: [Object]
    var objectNetworking = ObjectNetworking()
    var sum: Double
    
    init(){
        objects = []
        sum = 0.0
    }
}

extension ObjectViewModel {
    func getAvgCubicWeight(completion: @escaping (String) -> Void) {
        
        objectNetworking.getData { (object) in
            DispatchQueue.main.async { [weak self]  in
                if let weakSelf = self {
                    weakSelf.objects = object
                    
                    weakSelf.objects.forEach({(object) in
                        if let width = object.size?.width, let height = object.size?.height, let length = object.size?.length {
                            let cubicWeight = weakSelf.getCubicWeight(width: width, height: height, length: length)
                            let _ =  weakSelf.getSum(cubicWeight: cubicWeight)
                        }
                    })
                    
                    let avgCubicWeight = weakSelf.getAverage(sum: weakSelf.sum, count: weakSelf.objects.count)
                    completion(weakSelf.formatAvgCubicWeight(weight: avgCubicWeight))
                }
            }
        }
    }
    
    func getCubicWeight(width: Double, height: Double, length: Double) -> Double {
        return (width * height * length * 250) / (100 * 100 * 100)
    }
    
    func getSum(cubicWeight: Double) -> Double {
        sum += cubicWeight
        return sum
    }
    
    func getAverage(sum: Double, count: Int) -> Double {
        guard count > 0 else { return 0 }
        
        return sum / Double(count)
    }
    
    func formatAvgCubicWeight(weight: Double) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = 4
        
        return numberFormatter.string(from: NSNumber(value: weight)) ?? "0"
    }
}
