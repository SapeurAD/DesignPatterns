
// Interface
protocol PaymentStrategy {
    func pay(amount: Double)
}

// Strategy 1
class CreditCardStrategy: PaymentStrategy {
    private var name: String
    private var cardNumber: String
    private var cvv: String
    private var dateOfExpiration: String
    
    init(name: String, cardNumber: String, cvv: String, dateOfExpiration: String) {
        self.name = name
        self.cardNumber = cardNumber
        self.cvv = cvv
        self.dateOfExpiration = dateOfExpiration
    }
    
    func pay(amount: Double) {
        print(String(amount * 0.95) + " paid with credit card")
    }
}

// Strategy 2
class PaypalStrategy: PaymentStrategy {
    private var email: String
    private var password: String
    
    init(email: String, password: String) {
        self.email = email
        self.password = password
    }
    
    func pay(amount: Double) {
        print(String(amount * 0.99) + " paid using Paypal")
    }
}


// Cart
class Item {
    private var upcCode: Int
    private var price: Double
    
    init(upcCode: Int, price: Double) {
        self.upcCode = upcCode
        self.price = price
    }
    
    func getPrice() -> Double {
        return self.price
    }
}

class ShopingCart {
    private var strategy: PaymentStrategy!
    
    var items: [Item] = []

    func setStrategy(strategy: PaymentStrategy) {
        self.strategy = strategy
    }
    
    func addItem(item: Item) {
        items.append(item)
    }
    
    func calculateTotalPrice() -> Double {
        var sum: Double = 0
        for item in items {
            sum += item.getPrice()
        }
        return sum
    }
    
    func pay() {
        let amount = calculateTotalPrice()
        strategy.pay(amount: amount)
    }
}


// Demo
let item1 = Item(upcCode: 1111, price: 10)
let item2 = Item(upcCode: 2222, price: 20)

let cart = ShopingCart()
cart.addItem(item: item1)
cart.addItem(item: item2)

let paypalStrategy = CreditCardStrategy(name: "A", cardNumber: "1111", cvv: "212", dateOfExpiration: "02/2018")

let creditCardStrategy = PaypalStrategy(email: "test@test.com", password: "1111")

cart.setStrategy(strategy: paypalStrategy)
cart.pay()

cart.setStrategy(strategy: creditCardStrategy)
cart.pay()
