
// Builder
class BurgerBuilder {
    private let components = BurgerComponents()
    
    func addBread(bread: String?) {
        components.bread = bread
    }
    
    func addMeat(meat: Meat?) {
        components.meat = meat
    }
    
    func addVegetable(vegetable: String) {
        components.vegetables.append(vegetable)
    }
    
    func addSauceIngredient(ingredient: String) {
        components.sauceIngredients.append(ingredient)
    }
    
    func build() -> Burger {
        return Burger(components: components)
    }
}


// Director
class Vendor {
    public func prepareVeganBurger() -> Burger {
        let burgerBuilder = BurgerBuilder()
        
        burgerBuilder.addBread(bread: "3 pieces bun.")
        burgerBuilder.addVegetable(vegetable: "Mushrooms.")
        burgerBuilder.addVegetable(vegetable: "Nut pasta.")
        burgerBuilder.addSauceIngredient(ingredient: "Vegan mayoneese.")
        burgerBuilder.addSauceIngredient(ingredient: "Olive oil.")
        
        return burgerBuilder.build()
    }
    
    public func prepareChickenBurger() -> Burger {
        let burgerBuilder = BurgerBuilder()
        
        burgerBuilder.addBread(bread: "2 pieces bun.")
        burgerBuilder.addMeat(meat: Meat(type: .chicken, weightInGrams: 100, costPerGram: 10))
        burgerBuilder.addSauceIngredient(ingredient: "Ketchup.")
        burgerBuilder.addSauceIngredient(ingredient: "Mayoneese.")
        
        return burgerBuilder.build()
    }
}


// Demo
let vendor = Vendor()

let veganBurger = vendor.prepareVeganBurger()
let chickenBurger = vendor.prepareChickenBurger()

print(veganBurger.getListOfComponents())
print(chickenBurger.getListOfComponents())
