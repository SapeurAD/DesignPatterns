//: [Previous](@previous)

class Child {
    var name: String
    var age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}

// Interface
protocol TheOneWhoGivesPresents {
    func givePresent()
}

// Service
class Parents: TheOneWhoGivesPresents {
    var child: Child
    
    init(ofChild: Child) {
        self.child = ofChild
    }
    
    func givePresent() {
        print("Give \(child.name) a present")
    }
}

// Proxy
class Santa: TheOneWhoGivesPresents {
    var original: Parents
    
    init(forChild: Child) {
        self.original = Parents(ofChild: forChild)
    }
    
    func givePresent() {
        original.givePresent()
    }
}

// Demo
var girl = Child(name: "Annie", age: 10)

let santa = Santa(forChild: girl)
let daddy = Parents(ofChild: girl)


santa.givePresent()
daddy.givePresent()

//: [Next](@next)
