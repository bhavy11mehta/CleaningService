//
//  CustomizeViewModel.swift
//  EcommerceDemo
//
//  Created by gwl-42 on 28/11/23.
//

import Foundation


class CustomizeViewModel {
    var arrAppartmentModification = AppartmentModification(parentAppartment: [])
    var arrAppartment = [List]()

    func dataModification() -> AppartmentFeature? {
        let appartmentFeature = parseUsersFromJSONFile()
        arrAppartment = appartmentFeature.map {($0.specifications?[0].list)!}!
        for i in 0..<arrAppartment.count {
            let sectionsSpections = appartmentFeature?.specifications?.filter{ $0.modifierId ==  arrAppartment[i]._id }
            var tempData = arrAppartment[i]
            for j in 0..<(sectionsSpections?.count ?? 0) {
                guard let temp = sectionsSpections?[j] else { return nil }
                tempData.specifications.append(temp)
            }
            appendDataToDestination(source: tempData, destination: &arrAppartmentModification)
        }
        return appartmentFeature
    }
    
    func appendDataToDestination(source: List, destination: inout AppartmentModification) {
        destination.parentAppartment.append(source)
    }

    func parseUsersFromJSONFile() -> AppartmentFeature? {
          if let path = Bundle.main.path(forResource: "item_data", ofType: "json") {
              do {
                  let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                  let appartment = try JSONDecoder().decode(AppartmentFeature.self, from: data)
                  return appartment
              } catch {
                  print("Error parsing JSON: \(error)")
              }
          }
          return nil
      }
}
