//: [Previous](@previous)

protocol Item {
    func name() -> String
    func price() -> Float
}

class Burger: Item {
    func price() -> Float {
        return 0
    }

    func name() -> String {
        return ""
    }
}

class ColdDrink: Item {
    func price() -> Float {
        return 0
    }

    func name() -> String {
        return ""
    }
}

class VegeterianBurger: Burger {
    override func name() -> String {
        return "Vegeterian Burger"
    }
    
    override func price() -> Float {
        return 100.0
    }
}

class ChickenBurger: Burger {
    override func name() -> String {
        return "Chicken Burger"
    }
    
    override func price() -> Float {
        return 50.5
    }
}

class DietCoke: ColdDrink {
    override func name() -> String {
        return "Diet Coke"
    }
    
    override func price() -> Float {
        return 15.5
    }
}

class Pepsi: ColdDrink {
    override func name() -> String {
        return "Pepsi"
    }
    
    override func price() -> Float {
        return 10.0
    }
}

class Meal {
    private var items = [Item]()
    
    func addItem(item: Item) {
        items.append(item)
    }
    
    func getCost() -> Float {
        var cost: Float = 0.0
        
        for item in items {
            cost += item.price()
        }
        
        return cost
    }
    
    func showItems() {
        for item in items {
            print("Item: " + item.name())
            print("Price: " + String(item.price()))
            print("\n")
        }
    }
}

// Builder
class MealBuilder {
    func prepareVegeterianMeal() -> Meal {
        let meal = Meal()
        meal.addItem(item: VegeterianBurger())
        meal.addItem(item: DietCoke())
        return meal
    }
    
    func prepareChickenMeal() -> Meal {
        let meal = Meal()
        meal.addItem(item: ChickenBurger())
        meal.addItem(item: Pepsi())
        return meal
    }
}

// Demo
let mealBuilder = MealBuilder()

let veganMeal = mealBuilder.prepareVegeterianMeal()
print("Vegeterian Meal")
print("\n")
veganMeal.showItems()
print("Total cost: " + String(veganMeal.getCost()))

print("\n--------------------------------------\n")

let chickenMeal = mealBuilder.prepareChickenMeal()
print("Chicken Meal")
print("\n")
chickenMeal.showItems()
print("Total cost: " + String(chickenMeal.getCost()))

//: [Next](@next)
