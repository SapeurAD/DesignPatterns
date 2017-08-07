//: [Previous](@previous)

// Interface
protocol AlarmListener {
    func alarm()
}

// Observer 1
class Lighting: AlarmListener {
    func alarm() {
        print("Lights up!")
    }
}

// Observer 2
class Gates: AlarmListener {
    func alarm() {
        print("Close the gates!")
    }
}



// Observable
class SensorSystem {
    //we can't use a set of observers in the example, so we use an array of observers
    private var alarmListeners = [AlarmListener]()
    
    func register(listener: AlarmListener) {
        alarmListeners.append(listener)
    }
    
    func unregister(listener: AlarmListener) {
        alarmListeners.removeLast()
    }
    
    func soundTheAlarm() {
        for listener in alarmListeners {
            listener.alarm()
        }
    }
    
}

// Demo
let sensorSystem = SensorSystem()

let lighting = Lighting()
let gates = Gates()

sensorSystem.register(listener: lighting)
sensorSystem.register(listener: gates)
sensorSystem.soundTheAlarm()

print("\n")
sensorSystem.unregister(listener: gates)
sensorSystem.soundTheAlarm()

//: [Next](@next)
