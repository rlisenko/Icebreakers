//
//  Person.swift
//  ConferenceBuddy
//
//  Created by Rob Lisenko on 3/7/23.
//

import SwiftUI

struct Person: Codable, Comparable, Identifiable  {
    var id = UUID()
    let name: String
    let mastodonUser: String
    let jpegData: Data
    
    var image: Image? {
        let uiImage = UIImage(data: jpegData)
        
        guard let uiImage = uiImage else { return nil }
        
        return Image(uiImage: uiImage)
    }
    
    static func <(lhs: Person, rhs: Person) -> Bool {
        lhs.name < rhs.name
    }

    
}


