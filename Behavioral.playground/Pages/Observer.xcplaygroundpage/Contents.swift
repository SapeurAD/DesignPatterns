
// Observer Interface
protocol AlarmListener {
    func updateAlarmState(state: Bool)
}

// Observer 1
class Lighting: AlarmListener {
    func updateAlarmState(state: Bool) {
        if state == true {
            print("Lights up!")
        } else {
            print("Lights off.")
        }
        
    }
}

// Observer 2
class Gates: AlarmListener {
    func updateAlarmState(state: Bool) {
        if state == true {
            print("Block the gates!")
        } else {
            print("Unblock the gates.")
        }
        
    }
}


// Observable Interface
protocol AlarmGenerator {
    func register(listener: AlarmListener)
    func unregister(listener: AlarmListener)
    func notifyAlarmListeners()
}

// Observable + Observer in the same time
class CentralConsole: AlarmGenerator, AlarmListener {
    var alarmState: Bool = false {
        didSet {
            notifyAlarmListeners()
        }
    }

    private var alarmListeners: [AlarmListener] = []
    
    func register(listener: AlarmListener) {
        alarmListeners.append(listener)
    }
    
    func unregister(listener: AlarmListener) {
        alarmListeners.removeLast()
    }
    
    func notifyAlarmListeners() {
        for listener in alarmListeners {
            listener.updateAlarmState(state: alarmState)
        }
    }
    
    func updateAlarmState(state: Bool) {
        alarmState = state
    }
}

class Sensor: AlarmGenerator {
    var alarmState = false {
        didSet {
            notifyAlarmListeners()
        }
    }
    
    private var alarmListener: AlarmListener?
    
    func register(listener: AlarmListener) {
        alarmListener = listener
    }
    
    func unregister(listener: AlarmListener) {
        alarmListener = nil
    }
    
    func notifyAlarmListeners() {
        alarmListener?.updateAlarmState(state: alarmState)
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

print("Alarm on!")
sensor.alarmState = true

print("\n -=Change of the state=- \n")

print("Alarm off.")
sensor.alarmState = false
