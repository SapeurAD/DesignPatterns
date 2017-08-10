import Foundation

public class FlightBooker {
    public init() {}
    
    public func searchForCheapestTicket(date: Date) -> Ticket{
        //use any 3rd party flight searching system(s)
        return Ticket(cost: 100, date: date)
    }
    
    public func bookTicket(ticket: Ticket) {
        //use any 3rd party ticket booking system(s)
        print("We have booked a ticket with cost: \(ticket.cost) for date \(ticket.date)")
    }
}
