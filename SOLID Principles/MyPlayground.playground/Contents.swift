import UIKit

protocol Birds {
    func fly()
    func swim()
}

protocol Flyable {
    func fly()
}

protocol Swimable {
    func swim()
}

class Duck: Flyable, Swimable {
    func fly() {
        print("I can fly a lot")
    }
    
    func swim() {
        print("I can swim a lot")
    }
}


let duck1 = Duck()
duck1.fly()
duck1.swim()

class Penguin: Swimable {
    func swim() {
        print("Swim is a life")
    }
}

let someBird = Penguin()
someBird.swim()
