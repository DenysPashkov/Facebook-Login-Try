//
//  FBUserPages.swift
//  FacebookTry
//
//  Created by denys pashkov on 23/12/2019.
//  Copyright © 2019 denys pashkov. All rights reserved.
//

import Foundation

// MARK: - FBUserPages
struct FBUserPages: Codable {
    let data: [Pages]?
}

// MARK: - Pages
struct Pages: Codable {
    let access_token: String
    let id: String
    let name:String
}
