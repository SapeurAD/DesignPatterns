
// Observer Interface
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


// Observable Interface
protocol AlarmGenerator {
    func register(listener: AlarmListener)
    func unregister(listener: AlarmListener)
    func raiseAlarm()
}

// Observable + Observer in the same time
class CentralConsole: AlarmGenerator, AlarmListener {
    func alarm() {
        raiseAlarm()
    }

    private var alarmListeners: [AlarmListener] = []
    
    func register(listener: AlarmListener) {
        alarmListeners.append(listener)
    }
    
    func unregister(listener: AlarmListener) {
        alarmListeners.removeLast()
    }
    
    func raiseAlarm() {
        for listener in alarmListeners {
            listener.alarm()
        }
    }
}

class Sensor: AlarmGenerator {
    private var alarmListener: AlarmListener!
    
    func register(listener: AlarmListener) {
        alarmListener = listener
    }
    
    func unregister(listener: AlarmListener) {
        alarmListener = listener
    }
    
    func raiseAlarm() {
        alarmListener.alarm()
    }
}


// Demo
let sensor = Sensor()
let centralConsole = CentralConsole()

let lighting = Lighting()
let gates = Gates()

sensor.register(listener: centralConsole)
centralConsole.register(listener: lighting)
centralConsole.register(listener: gates)

print("Alarm!")
sensor.raiseAlarm()
