//: [Previous](@previous)

class HotelBooker {
    func searchForAppartment() {
        //use 3rd party hotel searching system
        print("We have found an appartment")
    }
    
    func bookAppartment() {
        //use 3rd party appartment booking system
        print("We have booked an appartment")
    }
}

class FlightBooker {
    func searchForFlight() {
        //use 3rd party flight searching system
        print("We have found a flight")
    }
    
    func bookTicket() {
        //use 3rd party ticket booking system
        print("We have booked a ticket")
    }
}

class TravelFacade {
    private var hotelBooker = HotelBooker()
    private var flightBooker = FlightBooker()
    
    func bookFlightAndHotel() {
        hotelBooker.searchForAppartment()
        hotelBooker.bookAppartment()
        flightBooker.searchForFlight()
        flightBooker.bookTicket()
    }
}

// Demo
let facade = TravelFacade()
facade.bookFlightAndHotel()

//: [Next](@next)
