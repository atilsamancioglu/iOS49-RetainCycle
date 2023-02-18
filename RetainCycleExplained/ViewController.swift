//
//  ViewController.swift
//  RetainCycleExplained
//
//  Created by Atil Samancioglu on 18.02.2023.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //strong reference can cause retain cycle
        //https://docs.swift.org/swift-book/documentation/the-swift-programming-language/automaticreferencecounting/

        var course: Course? = Course(name: "iOS Course", url: URL(string: "www.atilsamancioglu.com")!)
        var instructor: Instructor? = Instructor(name: "Atil Samancioglu")

        course!.instructor = instructor
        instructor!.course = course

        //nothing prints, because of retain cycle
        course = nil
        instructor = nil


        //weak version

        var weakCourse: WeakCourse? = WeakCourse(name: "iOS Course", url: URL(string: "www.atilsamancioglu.com")!)
        var weakInstructor: WeakInstructor? = WeakInstructor(name: "Atil Samancioglu")

        weakCourse!.instructor = weakInstructor
        weakInstructor!.course = weakCourse

        //now it prints
        weakCourse = nil
        weakInstructor = nil



        //weak self examples

        var weakCourse2: WeakCourse2? = WeakCourse2(name: "iOS Course", url: URL(string: "www.atilsamancioglu.com")!)
        var weakInstructor2: WeakInstructor2? = WeakInstructor2(name: "Atil Samancioglu")

        weakCourse2!.instructor = weakInstructor2
        weakInstructor2!.course = weakCourse2

        //launched course count is now 1 printed
        //weakCourse2!.launch(launchedCourse: LaunchedCourse(title: "iOS"))
        
        //launched course count is now nil printed. now this is not good because weakcourse2 is not deinitialized and we are not going to be able to update launched courses since we are waiting for network to response. so we should use weak self wisely
        weakCourse2!.launch2(launchedCourse: LaunchedCourse(title: "iOS"))

        weakCourse2 = nil
        weakInstructor2 = nil
        
        
        //Weak self right usage examples
        
        var weakCourse3: WeakCourse3? = WeakCourse3(name: "iOS Course", url: URL(string: "www.atilsamancioglu.com")!)
        var weakInstructor3: WeakInstructor3? = WeakInstructor3(name: "Atil Samancioglu")

        weakCourse3!.instructor = weakInstructor3
        weakInstructor3!.course = weakCourse3

        
        weakCourse3!.launch(launchedCourse2: LaunchedCourse2(title: "iOS"))

        weakCourse3 = nil
        weakInstructor3 = nil
 

    }


}

