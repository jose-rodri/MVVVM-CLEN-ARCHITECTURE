//
//  DetailModel.swift
//  JoseRodriguez
//
//  Created by Jose Leoncio Quispe Rodriguez on 29/05/22.
//

import Foundation

struct MovieData: Codable {
    let local: Bool
    let posterPath: String
    let pTitle: String
    let voteAverage: Double
    let releaseDate: String
    let overview: String
}
