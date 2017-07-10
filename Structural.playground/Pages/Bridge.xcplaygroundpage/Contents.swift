//: [Previous](@previous)

protocol Device {
    func run()
}

class RemoteControl {
    var device: Device
    
    func turnOn() {
        self.device.run()
    }
    
    init(device: Device) {
        self.device = device
    }
}

class TV: Device {
    func run() {
        print("TV is running now")
    }
}

class VacuumCleaner: Device {
    func run() {
        print("Vacuum cleaner is running now")
    }
}

// Demo
let control = RemoteControl(device: VacuumCleaner())
control.turnOn()

//: [Next](@next)
