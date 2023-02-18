//
//  WeakSelfExtra.swift
//  RetainCycleExplained
//
//  Created by Atil Samancioglu on 18.02.2023.
//

import Foundation

//
//  WeakSelfClosures.swift
//  RetainCycleExplained
//
//  Created by Atil Samancioglu on 18.02.2023.
//

import Foundation


struct LaunchedCourse2 {
    let title: String
    var isLaunched: Bool = false

    init(title: String) { self.title = title }
}

class WeakCourse3 {
    let name: String
    let url: URL
    weak var instructor: WeakInstructor3?
    
    var launchedCourses: [LaunchedCourse2] = []
    var onLaunched: ((_ launchedCourse2: LaunchedCourse2) -> Void)?

    init(name: String, url: URL) {
        self.name = name
        self.url = url
        
        //adding onLaunched with weak self does not cause cycle retain
        // if we remove [weak self] you will the 1 but you won't see deinits
        onLaunched = { [weak self] launchedCourse2 in
            self?.launchedCourses.append(launchedCourse2)
            print("Launched course2 count is now: \(self?.launchedCourses.count)")
        }
        
    }
    
    func launch(launchedCourse2: LaunchedCourse2) {
        //async after to simulate network request
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.onLaunched?(launchedCourse2)
                
            }
        }
     
    
    deinit {
        print("WeakCourse3 \(name) deinitialized")
    }
}

class WeakInstructor3 {
    let name: String
    var course: WeakCourse3?

    init(name: String) { self.name = name }

    deinit {
        print("WeakInstructor3 \(name) deinitialized")
    }
}
