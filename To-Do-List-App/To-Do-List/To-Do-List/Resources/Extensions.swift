//
//  Extensions.swift
//  To-Do-List
//
//  Created by sofia on 27.03.2024.
//

import Foundation

// Encodable is a part of Codable protocol which is responsible for encoding it into data
extension Encodable {
    func asDisctionary() -> [String: Any] {
//        Recieving data from the "current thing that is Codable "
        guard let data = try? JSONEncoder().encode(self) else {
            return [:]
        }
        
//        Converting data into JSON AKA Dictionary once we recieved any data
        do {
//            Cast data into String and return JSON (|| empty Dictionary otherwise)
            let json = try JSONSerialization.jsonObject(with: data) as? [String: Any]
            return json ?? [:]
        } catch {
//            Return an empty dictionary if we catch an error
            return [:]
        }
    }
}
