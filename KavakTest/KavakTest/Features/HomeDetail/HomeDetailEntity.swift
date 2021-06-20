//
//  HomeDetailEntity.swift
//  KavakTest
//
//  Created by Miguel Mexicano Herrera on 20/06/21.
//

import Foundation
struct InformationDataCell {
    var title: String
    var description: String
}
struct InformationData {
    var data: citizensBrastlewark
    func generateDataSource() -> [InformationDataCell] {
        var array: [InformationDataCell] = [InformationDataCell]()
        array.append(InformationDataCell(title: "Color de Pelo:", description: data.hair_color))
        array.append(InformationDataCell(title: "Peso:", description: String(data.weight)))
        array.append(InformationDataCell(title: "Altura:", description: String(data.height)))
        return array
    }
}
