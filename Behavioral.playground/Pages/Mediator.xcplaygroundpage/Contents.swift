//: [Previous](@previous)

protocol Country {
    var mediator: UnitedNations { get set }
}

//Interface
protocol UnitedNations {
    func declare(_ message: String, _ colleague: Country)
}


class Ukraine: Country {
    var mediator: UnitedNations
    
    init(_ mediator: UnitedNations) {
        self.mediator = mediator
    }
    
    func declare(_ message: String) {
        mediator.declare(message, self)
    }
    
    func getMessage(_ message: String) {
        print("Ukraine：\(message)")
    }
}


class Russia: Country {
    var mediator: UnitedNations
    
    init(_ mediator: UnitedNations) {
        self.mediator = mediator
    }
    
    func declare(_ message: String) {
        mediator.declare(message, self)
    }
    
    func getMessage(_ message: String) {
        print("Russia：\(message)")
    }
}

//Mediator
class UnitedNationsSecurityCouncil: UnitedNations {
    var ukr: Ukraine!
    var rus: Russia!
    
    func declare(_ message: String, _ sender: Country) {
        if type(of: sender) == Russia.self {
            rus.getMessage(message)
        } else {
            ukr.getMessage(message)
        }
    }
}

// Demo
var unitedNations = UnitedNationsSecurityCouncil()

let ukraine = Ukraine(unitedNations)
let russia = Russia(unitedNations)

unitedNations.ukr = ukraine
unitedNations.rus = russia

ukraine.declare("Welcome to Ukraine")
russia.declare("Welcome to Russia")

//: [Next](@next)
