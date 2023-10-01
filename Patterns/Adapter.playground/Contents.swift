// adaptee
class SimpleCar {
    
    func sound() -> String {
        return "tr-tr-tr-tr"
    }
}

// target
protocol SupercarProtocol {
    
    func makeNoice() -> String
}

class Supercar: SupercarProtocol {
    
    func makeNoice() -> String {
        return "wroom-wroom"
    }
}

// adapter
class SupercarAdapter: SupercarProtocol {
    
    var simpleCar: SimpleCar
    
    init(simpleCar: SimpleCar) {
        self.simpleCar = simpleCar
    }
    
    func makeNoice() -> String {
        return simpleCar.sound()
    }
}
