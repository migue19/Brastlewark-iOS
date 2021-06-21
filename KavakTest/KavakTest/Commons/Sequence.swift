//
//  Sequence.swift
//  KavakTest
//
//  Created by Miguel Mexicano Herrera on 20/06/21.
//

extension Sequence where Element: Hashable {
    func uniqued() -> [Element] {
        var set = Set<Element>()
        return filter { set.insert($0).inserted }
    }
}
