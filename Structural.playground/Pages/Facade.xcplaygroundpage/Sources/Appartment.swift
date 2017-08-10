import Foundation

public class Appartment {
    var costPerDay: Float
    var startDate: Date
    var endDate: Date
    
    var discountMultiplier: Float = 1
    
    public init(costPerDay: Float, startDate: Date, endDate: Date) {
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
