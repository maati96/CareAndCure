//
//  encodable.swift
//  CareAndCure
//
//  Created by Mohamed M3aty on 6/28/20.
//  Copyright © 2020 Mohamed M3aty. All rights reserved.
//


import Foundation

extension Encodable {
    func asDictionary() throws -> [String: Any] {
        let data = try JSONEncoder().encode(self)
        guard let dictionary = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any] else {
            throw NSError()
        }
        return dictionary
    }
}
