//
//  GridMaking.swift
//  Padious
//
//  Created by Tomas Skypala on 04/03/2020.
//  Copyright © 2020 Tomas Skypala. All rights reserved.
//

import Foundation

struct GridRow<Element> {
    
    let id: UUID = UUID()

    let elements: [Element]

    init(_ elements: [Element]) {
        self.elements = elements
    }

    subscript(_ index: Int) -> Element {
        return elements[index]
    }
}

protocol GridMaking {

    func makeGrid<Element: Any>(from elements: [Element]) -> [GridRow<Element>]
}
