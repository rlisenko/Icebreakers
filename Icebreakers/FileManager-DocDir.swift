//
//  FileManager-DocDir.swift
//  ConferenceBuddy
//
//  Created by Rob Lisenko on 3/8/23.
//

import Foundation

extension FileManager {
    static var documentsDirectory: URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}
