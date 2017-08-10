import Foundation

public class DateHelper {
    public static func daysBetween(startDate: Date, endDate: Date) -> Int {
        return Calendar.current.dateComponents([.day], from: startDate, to: endDate).day ?? 0
    }
}
