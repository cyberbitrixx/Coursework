//
//  User.swift
//  To-Do-List
//
//  Created by sofia on 06.02.2024.
//

import Foundation

/// A data model representing a single User object
/// // The reason we created this model as Codable is to be able to  implement a Encodable extension which will allow us to convert  anything that's Codable into a dictionary with strings and values we will definately be able to put into the database
struct User: Codable {
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
}
