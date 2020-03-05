//
//  GridMaking.swift
//  Padious
//
//  Created by Tomas Skypala on 04/03/2020.
//  Copyright © 2020 Tomas Skypala. All rights reserved.
//

protocol GridMaking {

    func makeGrid<Element: Any>(from elements: [Element]) -> [[Element]]
}
