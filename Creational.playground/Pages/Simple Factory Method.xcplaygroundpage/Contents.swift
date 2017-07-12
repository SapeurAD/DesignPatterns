//: [Previous](@previous)

// Interface
protocol Vehicle {
    func deliver()
}

// Concrete product 1
class ConcreteShip: Vehicle {
    let captain: String
    
    init(captain: String) {
        self.captain = captain
    }
    
    func deliver() { print("Delivery cargo by sea") }
}

// Concrete product 2
class ConcreteAirplane: Vehicle {
    let pilot: String
    
    init(pilot: String) {
        self.pilot = pilot
    }
    
    func deliver() { print("Delivery cargo by air") }
}

enum ProductType {
    case ship
    case airplane
}

// Single factory produces many products
class Factory {
    static func createProduct(type: ProductType) -> Vehicle {
        switch type {
            
        case .ship:
            let ship = ConcreteShip(captain: "Jack Sparrow")
            //the rest of initialisation operations here
            return ship
            
        case .airplane:
            let airplane = ConcreteAirplane(pilot: "Zigzag")
            //the rest of initialisation operations here
            return airplane
        }
    }
}

// Demo
let concreteShip = Factory.createProduct(type: .ship)
let concreteAirplane = Factory.createProduct(type: .airplane)

var products: [Vehicle] = []
products.append(concreteShip)
products.append(concreteAirplane)

for item in products {
    item.deliver()
}

//: [Next](@next)
