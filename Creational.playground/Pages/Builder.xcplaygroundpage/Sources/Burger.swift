public class Burger {
    var components: BurgerComponents!
    
    public init(components: BurgerComponents){
        self.components = components
    }
    
    public func getTotalPrice() -> String {
        return "Price: combined price of burger components * 2"
    }
    
    public func getListOfComponents() -> String {
        var description = "Burger: "
        
        if let breadDescription = components.bread {
            description += breadDescription
        }

        if let meatDescription = components.meat?.type.rawValue {
            description += " " + meatDescription + "."
        }
        
        for vegetable in components.vegetables {
            description += " \(vegetable)"
        }
        
        for sauce in components.sauceIngredients {
            description += " \(sauce)"
        }

        
        return description
    }
}
