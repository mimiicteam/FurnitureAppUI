//
//  Furniture.swift
//  FurnitureAppUI
//
//  Created by NGUYEN MINH DUC on 04/06/2022.
//

import SwiftUI

//MARK: - Furniture Model and Sample Data
struct Furniture: Identifiable {
    var id: String = UUID().uuidString
    var title: String
    var image: String
    var subTitle: String
    var price: String
}

var furnitures: [Furniture] = [
    Furniture(title: "Sofa 1", image: "Furniture1", subTitle: "AAAAAAAAAAAAAAAAAAAAAAAAA", price: "1$"),
    Furniture(title: "Sofa 2", image: "Furniture2", subTitle: "BBBBBBBBBBBBBBBBBBBBBBBBBBBB", price: "2$"),
    Furniture(title: "Sofa 3", image: "Furniture3", subTitle: "CCCCCCCCCCCCCCCCCCCCCCCC", price: "3$"),
    Furniture(title: "Sofa 4", image: "Furniture4", subTitle: "DDDDDDDDDDDDDDDDDDDDDDDDD", price: "4$"),
    Furniture(title: "Sofa 5", image: "Furniture5", subTitle: "EEEEEEEEEEEEEEEEEEEEEEE", price: "5$")
]
