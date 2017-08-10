import Foundation


class TravelFacade {
    
    private var hotelBooker = HotelBooker()
    private var flightBooker = FlightBooker()
    
    private func bookTickets(startDate: Date, endDate: Date){
        let firstTicket = flightBooker.searchForCheapestTicket(date: startDate)
        flightBooker.bookTicket(ticket: firstTicket)
        let secondTicket = flightBooker.searchForCheapestTicket(date: endDate)
        flightBooker.bookTicket(ticket: secondTicket)
    }
    
    private func bookAppartment(startDate: Date, endDate: Date) {
        let appartment = hotelBooker.searchForCheapestAppartment(
            startDate: startDate,
            endDate: endDate)
        hotelBooker.bookAppartment(appartment: appartment)
    }
    
    func prepareTrip(startDate: Date, endDate: Date) {
        bookTickets(startDate: startDate, endDate: endDate)
        bookAppartment(startDate: startDate, endDate: endDate)
    }
}


// Demo
let facade = TravelFacade()

let startDate = Date()
let endDate = startDate.addingTimeInterval(1000000)

facade.prepareTrip(startDate: startDate, endDate: endDate)
