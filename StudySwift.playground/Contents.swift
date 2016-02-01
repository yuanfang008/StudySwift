//: Playground - noun: a place where people can play

import UIKit


// MARK: hello playground

var str = "Hello, playground!"
print(str)


// MARK: function

func sayHello(personName: String) -> String {
    return "Hello, " + personName + "!"
}
print(sayHello("Hong Min"))

func sayHelloWithoutParamters() -> String {
    return "hello !"
}
print(sayHelloWithoutParamters())

func sayHelloWithoutReturnValues(personName: String) {
    print("Hello, \(personName) !")
}
sayHelloWithoutReturnValues("Hong Min")

func sayHelloWithoutParamtersAndReturnValues() {
    print("hello !")
}
sayHelloWithoutParamtersAndReturnValues()

func functionWithDefaultParameterValues(parameterWithDefaultValue: Int = 12) {
    print("\(parameterWithDefaultValue)")
}
functionWithDefaultParameterValues()

func functionWithVariadicParameters(var count: Int) {
    print("\(++count)")
}
var count = 10
functionWithVariadicParameters(count)
print("\(count)")

func swapTwoNumbersWithInOutParameters(inout a: Int, inout b: Int) {
    (a, b) = (b, a)
}
var (a, b) = (66, 88)
swapTwoNumbersWithInOutParameters(&a, b: &b)
print("a = \(a), b = \(b)")

func nestedFunctions(judge: Bool, number: Int) {
    func addNumer(var value: Int) {
        print(++value)
    }

    func subNumber(var value: Int) {
        print(--value)
    }

    let funcName = judge ? addNumer : subNumber
    funcName(number)
}
nestedFunctions(false, number: 10)


// MARK: Closures

var sayHelloClosure = {(str: String) -> () in
    print("hello, ");
    print("\(str)")
}
sayHelloClosure("closures")

let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
func backwards(s1: String, s2: String) -> Bool {
    return s1 > s2
}
var reversed = names.sort(backwards)
reversed = names.sort({ (s1: String, s2: String) -> Bool in return s1 > s2 })
reversed = names.sort({ s1, s2 in return s1 > s2 })
reversed = names.sort({ s1, s2 in s1 > s2 })
reversed = names.sort({ $0 > $1 })
reversed = names.sort() { $0 > $1 }
reversed = names.sort { $0 > $1 }


// MARK: Enumerations

enum CompassPoint {
    case North
    case South
    case East
    case West
}
var directionToHead = CompassPoint.West
directionToHead = .East
switch directionToHead {
case .North:
    print("Lots of planets have a north")
case .South:
    print("Watch out for penguins")
case .East:
    print("Where the sun rises")
case .West:
    print("Where the skies are blue")
}

enum Planet: Int {
    case Mercury, Venus = 2, Earth, Mars, Jupiter, Saturn, Uranus, Neptune
}
let somePlanet = Planet.Mars
switch somePlanet {
case .Earth:
    print("Mostly harmless")
default:
    print("Not a safe place for humans")
}

var planetValue = Planet.Mercury.rawValue
planetValue = Planet.Venus.rawValue
planetValue = Planet.Earth.rawValue


// MARK: Classes and Structures

// 结构体和枚举是值类型
struct ResolutionStructures {
    var width = 0
    var height = 0
}
let memberwiseInitializersForStructureTypes = ResolutionStructures(width: 100, height: 99)

// 类是引用类型
class VideoModeClasses {
    var resolution = ResolutionStructures()
    var interlaced = false
    var frameRate = 0.0
    var name: String?
}
let someVideoMode = VideoModeClasses()


// MARK: Properties

class AudiCar {
    var carType: String
    var carColor: String
    lazy var AudiCars: NSArray = { [] }()
    init(carType: String, carColor: String) {
        self.carType = carType
        self.carColor = carColor
    }
}
let audiCar = AudiCar(carType: "A6L", carColor: "black")
print("audiCar.carType = \(audiCar.carType), audiCar.carColor = \(audiCar.carColor)")

class PrettyGirl {
    // Stored Properties
    var name = "Hong Min"

    // Computed Properties
    var description: String {
        get {
            return name + " Pretty"
        }
        set {
            name = newValue
        }
    }

    // Read-Only Computed Properties
    var gender: String {
        return "female"
    }
}
let girl = PrettyGirl()
print("girl.description = \(girl.description)")
girl.description = "Guo Chen Guang"
print("girl.description = \(girl.description)")
print("girl.gender = \(girl.gender)")

class BenzCar {
    var carType = "R350"
    var carNumber: Int = 8888 {
        willSet {
            print("newValue = \(newValue)")
        }
        didSet {
            print("oldValue = \(oldValue)")
        }
    }
}
var benzCar = BenzCar()
benzCar.carNumber = 1234


// MARK: Methods

struct Fruit {
    var fruitPrice: Float = 6.6

    func printFruitPrice() {
        print("fruitPrice = \(fruitPrice)")
    }

    static var fruitName: String = "apple" {
        willSet {
        print("newValue = \(newValue)")
        }
        didSet {
            print("oldValue = \(oldValue)")
        }
    }

    static func printFruitName() {
        print("fruitName = \(fruitName)")
    }
}
let fruit = Fruit()
fruit.printFruitPrice()
Fruit.printFruitName()

class Tree {
    var height: Float = 12.5

    func printTreeHeight() {
        print("treeHeight = \(height)")
    }

    class func printName() {
        print("gingko")
    }
}
let tree = Tree()
tree.printTreeHeight()
Tree.printName()


// MARK: Inheritance

class Vehicle {
    var speed = 0.0
    var description: String {
        return "speed is \(speed)"
    }

    func printVehicle() {
        print("这是父类的方法")
    }
}
class Ferrari: Vehicle {
    var carType: String = "F12berlinetta"

    override func printVehicle() {
        print("Ferrari中的方法")
        super.printVehicle()
    }

    override var description: String {
        return "My ferrari's speed is fast, speed is \(speed)"
    }
}
let ferrariCar = Ferrari()
ferrariCar.speed = 233.6
ferrariCar.printVehicle()
print("ferrariCar.carType = \(ferrariCar.carType)", ferrariCar.description)


// MARK: Initialization

class Food {
    var foodName: String
    var foodType: String
    var foodPrice: Float

    init(foodName: String, foodType: String, foodPrice: Float) {
        self.foodName = foodName;
        self.foodType = foodType;
        self.foodPrice = foodPrice;
    }
}
var food = Food(foodName: "dumplings", foodType: "supper", foodPrice: 15.0)
print("food.foodName = \(food.foodName)")

class Chips: Food {
    var chipType: String!

    override init(foodName: String, foodType: String, foodPrice: Float) {
        super.init(foodName: foodName, foodType: foodType, foodPrice: foodPrice)
        chipType = "KFC"
    }
}
let chips = Chips(foodName: "薯条", foodType: "甜甜的", foodPrice: 12.5)
print(chips.chipType, chips.foodName)


// MARK: ARC

class Apartment {
    var number: Int
    weak var person: Person?

    init (number: Int) {
        self.number = number
    }
    deinit {
        print("房子被炸毁")
    }
}

class Person {
    var name: String
    var apartment:Apartment?

    init (name: String) {
        self.name = name
    }
    deinit {
        print("Go Die")
    }
}

var person: Person? = Person(name: "Xiao Ming")
var apatment: Apartment? = Apartment(number: 1024)
person?.apartment = apatment
apatment?.person = person
person = nil
apatment = nil
