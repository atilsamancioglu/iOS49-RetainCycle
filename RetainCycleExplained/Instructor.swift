//
//  Instructor.swift
//  RetainCycleExplained
//
//  Created by Atil Samancioglu on 18.02.2023.
//

import Foundation

class Course {
    let name: String
    let url: URL
    var instructor: Instructor?

    init(name: String, url: URL) { self.name = name; self.url = url }

    deinit {
        print("Course \(name) deinitialized")
    }
}

class Instructor {
    let name: String
    var course: Course?

    init(name: String) { self.name = name }

    deinit {
        print("Instructor \(name) deinitialized")
    }
}
