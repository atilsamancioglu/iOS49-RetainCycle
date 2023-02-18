//
//  WeakInstructor.swift
//  RetainCycleExplained
//
//  Created by Atil Samancioglu on 18.02.2023.
//

import Foundation

class WeakCourse {
    let name: String
    let url: URL
    weak var instructor: WeakInstructor?

    init(name: String, url: URL) { self.name = name; self.url = url }

    deinit {
        print("WeakCourse2 \(name) deinitialized")
    }
}

class WeakInstructor {
    let name: String
    var course: WeakCourse?

    init(name: String) { self.name = name }

    deinit {
        print("WeakInstructor2 \(name) deinitialized")
    }
}
