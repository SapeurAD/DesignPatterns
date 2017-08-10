
// Interface
protocol PaymentStrategy {
    func pay(amount: Int)
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
    
    func pay(amount: Int) {
        print(String(amount) + " paid with credit card")
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
    
    func pay(amount: Int) {
        print(String(amount) + " paid using Paypal")
    }
}


// Cart
class Item {
    private var upcCode: Int
    private var price: Int
    
    init(upcCode: Int, price: Int) {
        self.upcCode = upcCode
        self.price = price
    }
    
    func getPrice() -> Int {
        return self.price
    }
}

class ShopingCart {
    var items: [Item] = []
    
    func addItem(item: Item) {
        items.append(item)
    }
    
    func calculateTotalPrice() -> Int {
        var sum = 0
        for item in items {
            sum += item.getPrice()
        }
        return sum
    }
    
    func pay(paymentMethod: PaymentStrategy) {
        let amount = calculateTotalPrice()
        paymentMethod.pay(amount: amount)
    }
}


// Demo
let item1 = Item(upcCode: 1111, price: 10)
let item2 = Item(upcCode: 2222, price: 20)

let cart = ShopingCart()
cart.addItem(item: item1)
cart.addItem(item: item2)

cart.pay(paymentMethod: CreditCardStrategy(name: "A", cardNumber: "1111", cvv: "212", dateOfExpiration: "02/2018"))

cart.pay(paymentMethod: PaypalStrategy(email: "test@test.com", password: "1111"))

// параметр tax discount etc. //setStrategy, applyStrategy