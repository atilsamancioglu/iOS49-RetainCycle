//
//  WeakSelfClosures.swift
//  RetainCycleExplained
//
//  Created by Atil Samancioglu on 18.02.2023.
//

import Foundation


struct LaunchedCourse {
    let title: String
    var isLaunched: Bool = false

    init(title: String) { self.title = title }
}

class WeakCourse2 {
    let name: String
    let url: URL
    weak var instructor: WeakInstructor2?
    
    var launchedCourses: [LaunchedCourse] = []

    init(name: String, url: URL) { self.name = name; self.url = url }
    /*
    //if you do not add weak self, it will show 1 course
    func launch(launchedCourse: LaunchedCourse) {
        //async after to simulate network request
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.launchedCourses.append(launchedCourse)
                print("Launched course count is now: \(self.launchedCourses.count)")
            }
        }
     */
    
    //if you update the function with [weak self] it will be nil
    
    func launch2(launchedCourse: LaunchedCourse)  {
        //async after to simulate network request
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [weak self] in
                self?.launchedCourses.append(launchedCourse)
                print("Launched course count is now: \(self?.launchedCourses.count)")
            }
        }
    
    deinit {
        print("WeakCourse2 \(name) deinitialized")
    }
}

class WeakInstructor2 {
    let name: String
    var course: WeakCourse2?

    init(name: String) { self.name = name }

    deinit {
        print("WeakInstructor2 \(name) deinitialized")
    }
}
