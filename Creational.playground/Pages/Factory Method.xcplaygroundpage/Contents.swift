//: [Previous](@previous)

// Product interface
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

// Creator interface
protocol CreatorInterface {
    static func createVehicle() -> Vehicle
}

// Concrete creator 1
class ShipCreator: CreatorInterface {
    static func createVehicle() -> Vehicle {
        let ship = ConcreteShip(captain: "Jack Sparrow")
        //the rest of initialisation operations
        return ship
    }
}

// Concrete creator 2
class AirplaneCreator: CreatorInterface {
    static func createVehicle() -> Vehicle {
        let airplane = ConcreteAirplane(pilot: "Zigzag")
        //the rest of initialisation operations
        return airplane
    }
}

// Demo
let concreteShip = ShipCreator.createVehicle()
let concreteAirplane = AirplaneCreator.createVehicle()

var products: [Vehicle] = []
products.append(concreteShip)
products.append(concreteAirplane)

for item in products {
    item.deliver()
}

//: [Next](@next)
