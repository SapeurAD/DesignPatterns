
// Interface
protocol Transport {
    func deliver()
}


class OurShip: Transport {
    private var captain: String
    
    init(captain: String) {
        self.captain = captain
    }
    
    func deliver() { print("Delivery cargo by sea") }
}


class LeasedPlane: Transport {
    private var contract: String
    
    init(contract: String) {
        self.contract = contract
    }
    
    func deliver() { print("Delivery cargo by air") }
}

enum TransportType {
    case ship
    case airplane
}

// Single factory produces many products
class TransportFactory {
    static func createTransport(type: TransportType) -> Transport {
        switch type {
            
        case .ship:
            let ship = OurShip(captain: "Jack Sparrow")
            //the rest of initialisation operations here
            return ship
            
        case .airplane:
            let airplane = LeasedPlane(contract: "A903539489284")
            //the rest of initialisation operations here
            return airplane
        }
    }
}


// Demo
let ourShip = TransportFactory.createTransport(type: .ship)

let leasedPlane = TransportFactory.createTransport(type: .airplane)


var transportList: [Transport] = []
transportList.append(ourShip)
transportList.append(leasedPlane)


for transport in transportList {
    transport.deliver()
}
