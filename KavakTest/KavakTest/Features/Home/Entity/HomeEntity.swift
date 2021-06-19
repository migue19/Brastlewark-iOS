//
//  HomeEntity.swift
//  KavakTest
//
//  Created by Miguel Mexicano Herrera on 19/06/21.
//
import Foundation
struct BrastlewarkCity: Codable {
    let Brastlewark: [citizensBrastlewark]
}
struct citizensBrastlewark: Codable {
    let id: Int
    let name: String
    let thumbnail: URL
    let age: Int
    let weight: Double
    let height: Double
    let hair_color: String
    let professions: [String]
    let friends: [String]
}



