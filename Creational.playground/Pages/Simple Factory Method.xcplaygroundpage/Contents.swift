//: [Previous](@previous)

// Interface
protocol Vehicle {
    func deliver()
}

// Concrete product 1
class ConcreteShip: Vehicle {
    let captain: String
    let fuel: String
    
    init(captain: String, fuel: String) {
        self.captain = captain
        self.fuel = fuel
    }
    
    func deliver() { print("Delivery cargo by sea") }
}

// Concrete product 2
class ConcreteAirplane: Vehicle {
    let pilot: String
    let fuel: String
    
    init(pilot: String, fuel: String) {
        self.pilot = pilot
        self.fuel = fuel
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
            let ship = ConcreteShip(captain: "Jack Sparrow", fuel: "Kerosene")
            //the rest of initialisation operations here
            return ship
            
        case .airplane:
            let airplane = ConcreteAirplane(pilot: "Zigzag", fuel: "Petrol")
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
