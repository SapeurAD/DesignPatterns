import Foundation

public class HotelBooker {
    public init() {}
    
    public func searchForCheapestAppartment(startDate: Date, endDate: Date) -> Appartment {
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
    
    public func bookAppartment(appartment: Appartment) {
        //use any 3rd party appartment booking system(s) with best offer to book apparment
        
        enum BookingService: Float {
            case bestDiscountMultiplier = 0.75
            case worstDiscountMultiplier = 0.99
        }
        
        appartment.discountMultiplier = BookingService.bestDiscountMultiplier.rawValue
        
        print("We have booked an appartment from date \(appartment.startDate) to date \(appartment.endDate). Cost per day: \(appartment.costPerDay)$. Total cost with discount: \(appartment.getTotalCost())$")
    }
}
