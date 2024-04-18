//
//  SwiftUIExtensions.swift
//  MemeCollector
//
//  Created by Niels Hoek on 27/02/2021.
//

import SwiftUI

// Necessary for animations
extension FetchedResults: Equatable {
    public static func == (lhs: Self, rhs: Self) -> Bool {
        return true
    }
}

extension Color {
    static let primaryColor = Color("Primary")
    static let secondaryColor = Color("Secondary")
    static let lightWhite = Color("LightWhite")
}
