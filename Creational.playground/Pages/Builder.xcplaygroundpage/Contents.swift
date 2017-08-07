//: [Previous](@previous)

// Product
class Burger {
    
    var bread: String
    var meat: Meat?
    var vegetables: [String] = []
    var sauceIngredients: [String] = []
    
    init(
        bread: String,
        meat: Meat?,
        vegetables: [String],
        sauceIngredients: [String]
        )
    {
        self.bread = bread
        self.meat = meat
        self.vegetables = vegetables
        self.sauceIngredients = sauceIngredients
    }
    
    func price() -> String {
        return "Price: combined price of burger components * 2"
    }
    
    func getListOfComponents() -> String {
        var list = "Burger consists of: \(bread)"
        
        if meat?.type.rawValue != nil {
            list += " \((meat?.type.rawValue)!)."
        }
        
        for vegetable in vegetables {
            list += " \(vegetable)"
        }
        
        for ingredient in sauceIngredients {
            list += " \(ingredient)"
        }
        
        return list
    }
    
}

class Meat {
    
    var type: MeatType
    var weightInGrams: Float
    var costPerGram: Float
    
    init(type: MeatType, weightInGrams: Float, costPerGram: Float) {
        self.type = type
        self.weightInGrams = weightInGrams
        self.costPerGram = costPerGram
    }
    
    func getTotalPrice() -> Float {
        return weightInGrams * costPerGram
    }
    
}

enum MeatType: String {
    case chicken
    case porc
    case beef
}

// Builder
class BurgerBuilder {
    
    var bread: String?
    var meat: Meat?
    
    var vegetables: [String] = []
    var sauceIngredients: [String] = []
    
    
    func addBread(bread: String?) {
        self.bread = bread
    }
    
    func addMeat(meat: Meat?) {
        self.meat = meat
    }
    
    func addVegetable(vegetable: String) {
        self.vegetables.append(vegetable)
    }
    
    func addSauceIngredient(ingredient: String) {
        self.sauceIngredients.append(ingredient)
    }
    
    
    func build() -> Burger {
        if bread != nil {
            let burger = Burger(
                bread: bread!,
                meat: meat,
                vegetables: vegetables,
                sauceIngredients: sauceIngredients
            )
            
            return burger
        } else {
            fatalError("Bread never shouldn't be nil.")
        }
    }
    
}

// Director
class Vendor {
    
    public func prepareVeganBurger() -> Burger {
        let burgerBuilder = BurgerBuilder()
        
        burgerBuilder.addBread(bread: "2 pieces of bread.")
        burgerBuilder.addVegetable(vegetable: "Mushrooms.")
        burgerBuilder.addVegetable(vegetable: "Nut pasta.")
        burgerBuilder.addSauceIngredient(ingredient: "Vegan mayoneese.")
        burgerBuilder.addSauceIngredient(ingredient: "Olive oil.")
        
        return burgerBuilder.build()
    }
    
    public func prepareChickenBurger() -> Burger {
        let burgerBuilder = BurgerBuilder()
        
        burgerBuilder.addBread(bread: "3 pieces of bread.")
        burgerBuilder.addMeat(meat: Meat(type: .chicken, weightInGrams: 100, costPerGram: 10))
        burgerBuilder.addSauceIngredient(ingredient: "Ketchup.")
        burgerBuilder.addSauceIngredient(ingredient: "Mayoneese.")
        
        return burgerBuilder.build()
    }
}

// Demo
let emma = Vendor()

let burger1 = emma.prepareVeganBurger()
let burger2 = emma.prepareChickenBurger()
let burger3 = emma.prepareVeganBurger()

print(burger1.getListOfComponents())
print(burger2.getListOfComponents())
print(burger3.getListOfComponents())

//: [Next](@next)
