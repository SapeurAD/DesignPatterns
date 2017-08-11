public class Meat {
    var type: MeatType
    var weightInGrams: Float
    var costPerGram: Float
    
    public init(type: MeatType, weightInGrams: Float, costPerGram: Float) {
        self.type = type
        self.weightInGrams = weightInGrams
        self.costPerGram = costPerGram
    }
    
    public func calculatePrice() -> Float {
        return weightInGrams * costPerGram
    }
}

public enum MeatType: String {
    case chicken
    case porc
    case beef
}
