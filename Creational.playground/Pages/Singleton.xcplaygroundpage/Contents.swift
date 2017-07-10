//: [Previous](@previous)

class Singleton {
    
    static let shared: Singleton = Singleton()
    
    private(set) var data: String?
    
    private init() {
        data = getDataFromNetwork()
    }
    
    private func getDataFromNetwork() -> String? {
         return "Data"
    }
    
}

// Demo
let object = Singleton.shared
print(object.data)

//: [Next](@next)
