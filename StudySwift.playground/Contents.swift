//: Playground - noun: a place where people can play

import UIKit


// MARK: hello playground

var str = "Hello, playground!"
print(str)


// MARK: Basic

let constValue: Int = 31

var varableValue: String = "xiaofang"

var 袁方 = "搬砖的"

var red, green, blue: Double

typealias yuanType = Int
var aliasValue: yuanType = 23
print("aliasValue = \(aliasValue)")

var boolValue: Bool = true
if boolValue {
    print("这是真的")
}

var httpCodeTuples1: (Int, String) = (200, "successful")
print(httpCodeTuples1.0)

var httpCodeTuples2 = (codeValue:404, descritpion:"failed")
print(httpCodeTuples2)

//在Swift中，nil不是指针——它是一个确定的值，用来表示值缺失。任何类型的可选状态都可以被设置为nil，不只是对象类型。
var optionalString: String?

var optionalValue: Int? = 404
optionalValue = nil
optionalValue = 200

if optionalValue != nil {
    print("optionalValue has an integer value of \(optionalValue!).")
}

let possibleNumber = "123"
if var actualValue = Int(possibleNumber) {
    print("\'\(possibleNumber)\' has an integer value of \(actualValue)")
    actualValue = 321
} else {
    print("\'\(possibleNumber)\' could not be converted to an integer")
}

let possibleString: String? = "An optional string."
let forcedString: String = possibleString!

let assumedString: String! = "An implicitly unwrapped optional string."
let implicitString: String = assumedString


//MARK: Operators

"hello, " + "world"

for number in 1..<10 {
    print(number)
}

var optionalNumber: Int? = 666
var nilCoalescingNumber = optionalNumber ?? 222
print(nilCoalescingNumber)


//MARK: String

//Strings Are Value Types
var swiftString1 = "goodgood"
var swiftString2 = swiftString1
swiftString1 += "study"
print(swiftString2)

var cutString = "1234567890"
let index = cutString.startIndex.advancedBy(3)
let index2 = cutString.endIndex.advancedBy(-2)
var range = Range(start: index, end: index2)
var string1 = cutString.substringFromIndex(index)
var string2 = cutString.substringToIndex(index2)
var string3 = cutString.substringWithRange(range)

var OCCutStr = NSMutableString(string: "1234567890")
var OCCutString = OCCutStr.substringToIndex(4)


//MARK: Collection Types
//Collection Types Are Value Types
var swiftArray = ["yuan", 5, 6.7]
swiftArray += ["yuanfang"]
swiftArray.insert("biubiu", atIndex: 0)
swiftArray.removeAtIndex(0)
swiftArray[0...1] = ["yuan", 666, 998]
for item in swiftArray {
    print(item)
}
for (index, value) in swiftArray.enumerate() {
    print("index = \(index), value = \(value)")
}

var swiftArray1: [String] = [String](count: 8, repeatedValue: "666")
var swiftArray2: [AnyObject] = [AnyObject]()
swiftArray2 += ["QAQ", 99]
//String是这个数组中唯一允许存在的数据类型。(推荐这种写法)
var swiftArray3: Array<String> = Array()
swiftArray3 += ["良辰", "美景"]

var dictionary = ["boy":"yuanfang", "hometown":"luohe", "age":24]
dictionary["height"] = 180
print(dictionary)
dictionary.removeValueForKey("age")
dictionary["boy"] = "xiaoyuan"
for item in dictionary{
    print(item)
}
for (key, value) in dictionary {
    print("key = \(key), value = \(value)")
}


//MARK: Control Flow
for _ in 1...10 {
    print("123")
}

var i = 0
while i < 10 {
    print(i)
    i++
}


//类似do-while
repeat {
    print("我能行")
} while false

var switchNumber = 2
switch switchNumber {
case 0, 1, 2, 4:
    print("0, 1, 2, 4")
    fallthrough
case 10...30:
    print("宝宝心里苦啊")
    fallthrough
case 31:
    print("吓死宝宝了")
case 58:
    break
default:
    print("others")
}


// MARK: Function

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
