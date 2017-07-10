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

// Parent creator class (can be replaced by interface if have no shared logic)
class Creator {
    init() {
        somePreparations()
    }
    
    func somePreparations() { print("Preparation of delivery operations") }
    
    func createVehicle() -> Vehicle? { return nil }
}

// Concrete creator 1
class ShipCreator: Creator {
    override func createVehicle() -> Vehicle? {
        let ship = ConcreteShip(captain: "Jack Sparrow", fuel: "Kerosene")
        //the rest of initialisation operations
        return ship
    }
}

// Concrete creator 2
class AirplaneCreator: Creator {
    override func createVehicle() -> Vehicle? {
        let airplane = ConcreteAirplane(pilot: "Zigzag", fuel: "Petrol")
        //the rest of initialisation operations
        return airplane
    }
}

// Demo
let concreteShip = ShipCreator().createVehicle()
let concreteAirplane = AirplaneCreator().createVehicle()

var products: [Vehicle] = []
products.append(concreteShip!)
products.append(concreteAirplane!)

for item in products {
    item.deliver()
}

//: [Next](@next)
