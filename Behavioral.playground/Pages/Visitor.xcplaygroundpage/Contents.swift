//: [Previous](@previous)

protocol Country {
    func accept(visitor: Visitor)
}

protocol Visitor {
    var age: Int { get }
    func visit(country: Country)
}

class Ukraine: Country {
    func accept(visitor: Visitor) {
        if visitor.age >= 18 {
            visitor.visit(country: self)
        }
    }
}

class USA: Country {
    func accept(visitor: Visitor) {
        if visitor.age >= 16 {
            visitor.visit(country: self)
        }
    }
}

class Student: Visitor {
    var age: Int
    var visitedCountries: [Country] = []
    
    init(age: Int) {
        self.age = age
    }
    
    func visit(country: Country) {
        visitedCountries.append(country)
    }
}

// Demo
let usa = USA()
let ukraine = Ukraine()

let student = Student(age: 17)

ukraine.accept(visitor: student)
usa.accept(visitor: student)

print(student.visitedCountries)

//: [Next](@next)
