//
//  ContentViewModel.swift
//  ConferenceBuddy
//
//  Created by Rob Lisenko on 3/8/23.
//

import Foundation
import Observation

class ViewModel: ObservableObject {
    @Published var people: [Person]
//https://stackoverflow.com/questions/76451272/how-to-use-observable-in-xcode-15-beta
    let savePath = FileManager.documentsDirectory.appendingPathComponent("SavedPersons")
    
    init() {
        // Get data from Doc Dir
        do {
            let data = try Data(contentsOf: savePath)
            people = try JSONDecoder().decode([Person].self, from: data).sorted()
        } catch {
            people = []
        }
    }
    
    func save() {
        // Save data to Doc Dir
        do {
            let data = try JSONEncoder().encode(people)
            try data.write(
                to: savePath,
                options: [.atomic, .completeFileProtection]
            )
        } catch {
            print("Unable to save data.")
        }
    }
    
    func addPerson(_ person: Person) {
        people.append(person)
//        people.reverse()
//        people.sort()
        save()
    }
    
    func removePerson(at offsets: IndexSet) {
        people.remove(atOffsets: offsets)
        save()
    }
}
