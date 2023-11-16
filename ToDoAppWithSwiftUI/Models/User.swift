//
//  User.swift
//  ToDoAppWithSwiftUI
//
//  Created by Shafiq  Ullah on 11/15/23.
//

import Foundation

struct User: Codable {
    let id: String
    let name: String
    let email : String
    let joined: TimeInterval
}
