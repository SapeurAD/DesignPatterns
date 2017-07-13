//: [Previous](@previous)

//Interface
protocol ResponderInterface {
    func speak(input: String) -> String
}


class Chatbot {
    private var responder: ResponderInterface?
    
    public func setResponder(responder: ResponderInterface) {
        self.responder = responder
    }
    
    public func respond(inputString: String) -> String {
        if let responder = self.responder {
            return responder.speak(input: inputString)
        } else {
            return "Choose responder first"
        }
    }
}


public class EnglishSpeaker: ResponderInterface {
    func speak(input: String) -> String {
        return "You said: " + input
    }
}


public class RussianSpeaker: ResponderInterface {
    func speak(input: String) -> String {
        return "Вы сказали: " + input
    }
}


// Demo
let russianResponder = RussianSpeaker()
let englishResponder = EnglishSpeaker()

var mainBot = Chatbot()
print(mainBot.respond(inputString: "I haven's set responder yet"))

mainBot.setResponder(responder: russianResponder)
print(mainBot.respond(inputString: "Hello Bot"))

mainBot.setResponder(responder: englishResponder)
print(mainBot.respond(inputString: "Hello Bot"))

//: [Next](@next)
