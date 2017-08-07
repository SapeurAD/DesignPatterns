//: [Previous](@previous)

// Import framework to operate data types
import Foundation

class DateHelper {
    public static func daysBetween(startDate: Date, endDate: Date) -> Int {
        return Calendar.current.dateComponents([.day], from: startDate, to: endDate).day ?? 0
    }
}


class Appartment {
    var costPerDay: Float
    var startDate: Date
    var endDate: Date
    
    var discountMultiplier: Float = 1
    
    init(costPerDay: Float, startDate: Date, endDate: Date) {
        self.costPerDay = costPerDay
        self.startDate = startDate
        self.endDate = endDate
    }
    
    func getTotalCost() -> Float {
        var cost: Float = 0
        let numberOfDays = DateHelper.daysBetween(startDate: startDate, endDate: endDate)
        cost = costPerDay * Float(numberOfDays) * discountMultiplier
        return cost
    }
}

class Ticket {
    var cost: Float
    var date: Date
    
    init(cost: Float, date: Date) {
        self.cost = cost
        self.date = date
    }
}

class HotelBooker {
    
    func searchForCheapestAppartment(startDate: Date, endDate: Date) -> Appartment {
        //use any 3rd party hotel searching system(s) to find the cheapest appartment
        let appartment1 = Appartment(costPerDay: 100.1, startDate: startDate, endDate: endDate)
        let appartment2 = Appartment(costPerDay: 20.2, startDate: startDate, endDate: endDate)
        
        let appartments = [appartment1, appartment2]
        
        var theCheapestAppartment = appartment1
        
        for appartment in appartments {
            if appartment.costPerDay < theCheapestAppartment.costPerDay {
                theCheapestAppartment = appartment
            }
        }
        return theCheapestAppartment
    }
    
    func bookAppartment(appartment: Appartment) {
        //use any 3rd party appartment booking system(s) with best offer to book apparment
        
        enum BookingService: Float {
            case bestDiscountMultiplier = 0.75
            case worstDiscountMultiplier = 0.99
        }
        
        appartment.discountMultiplier = BookingService.bestDiscountMultiplier.rawValue
        
        print("We have booked an appartment from date \(appartment.startDate) to date \(appartment.endDate). Cost per day: \(appartment.costPerDay)$. Total cost with discount: \(appartment.getTotalCost())$")
    }
    
}

class FlightBooker {
    
    func searchForCheapestTicket(date: Date) -> Ticket{
        //use any 3rd party flight searching system(s)
        return Ticket(cost: 100, date: date)
    }
    
    func bookTicket(ticket: Ticket) {
        //use any 3rd party ticket booking system(s)
        print("We have booked a ticket with cost: \(ticket.cost) for date \(ticket.date)")
    }
    
}

class TravelFacade {
    
    private var hotelBooker = HotelBooker()
    private var flightBooker = FlightBooker()
    
    func bookFlightAndHotel(startDate: Date, endDate: Date) {
        
        let appartment = hotelBooker.searchForCheapestAppartment(
            startDate: startDate,
            endDate: endDate
        )
        
        hotelBooker.bookAppartment(appartment: appartment)
        
        let firstTicket = flightBooker.searchForCheapestTicket(date: startDate)
        
        flightBooker.bookTicket(ticket: firstTicket)
        
        let secondTicket = flightBooker.searchForCheapestTicket(date: endDate)
        
        flightBooker.bookTicket(ticket: secondTicket)
    }
    
}


// Demo
let facade = TravelFacade()

let startDate = Date()
let endDate = startDate.addingTimeInterval(1000000)

facade.bookFlightAndHotel(startDate: startDate, endDate: endDate)

//: [Next](@next)
