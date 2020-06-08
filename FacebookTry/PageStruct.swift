//
//  PageStruct.swift
//  FacebookTry
//
//  Created by denys pashkov on 23/12/2019.
//  Copyright © 2019 denys pashkov. All rights reserved.
//

import Foundation

// MARK: - PageResponse
struct PageResponse : Codable {
    let data: [Dati]
}

// MARK: - Datum
struct Dati : Codable {
    let values: [ValueElement]
}

// MARK: - ValueElement
struct ValueElement : Codable {
    let value: Int
}
