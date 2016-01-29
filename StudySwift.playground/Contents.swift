//: Playground - noun: a place where people can play

import UIKit


// MARK: hello swift

var str = "Hello, playground"
print(str)


// MARK: function

func sayHello(personName: String) -> String {
    return "Hello, " + personName + "!"
}
print(sayHello("Hong Min"))

func sayHelloWithoutParamters() -> String {
    return "hello !"
}

func sayHelloWithoutReturnValues(personName: String){
    print("Hello, \(personName) !")
}
sayHelloWithoutReturnValues("Hong Min")

func sayHelloWithoutParamtersWithoutReturnValues() {
    print("hello !")
}

func functionWithDefaultParameterValues(parameterWithDefault: Int = 12) {
    print("\(parameterWithDefault)")
}
functionWithDefaultParameterValues()

func functionWithVariadicParameters(var height:Int) {
    height += 1
    print("\(height)")
}
functionWithVariadicParameters(10)

//fuction with In-Out parameters
func swapTwoNumber(inout a:Int, inout b:Int){
    var temp = 0
    temp = a
    a = b
    b = temp
}
var a = 66; var b = 88
swapTwoNumber(&a, b: &b)
print("a = \(a), b = \(b)")

func nestedFunctions(judge:Bool, number:Int){
    func addNumer(var value1:Int){
        print(++value1)
    }

    func subNumber(var value2:Int){
        print(--value2)
    }
    let funcName = judge ? addNumer : subNumber

    funcName(number)
}

nestedFunctions(false, number: 10)

// MARK: Closures(闭包)

//也叫匿名函数, 类似于OC中的block。是引用类型。
var block = {(str:String)->() in
    print(str)
}
block("123444")

let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]

func backwards(s1: String, s2: String) -> Bool {
    return s1 > s2
}
//1. 调用sort方法
var reversed = names.sort(backwards)
//2. 排序闭包函数， 并将其作为sort方法的参数传入
reversed = names.sort({ (s1: String, s2: String) -> Bool in
    return s1 > s2
})
//3. 闭包的函数体部分如此短，可以将其改写成一行代码
reversed = names.sort({ (s1: String, s2: String) -> Bool in return s1 > s2 })
//4. Swift可以推断闭包函数参数和返回值的类型, 返回箭头（->）和围绕在参数周围的括号也可以被省略
reversed = names.sort({ s1, s2 in return s1 > s2 })
//5. 单行表达式闭包可以通过省略return关键字来隐式返回单行表达式的结果
reversed = names.sort({ s1, s2 in s1 > s2 })
//6. Swift自动为内联闭包提供了参数名称缩写功能，您可以直接通过$0，$1，$2来顺序调用闭包的参数，以此类推。
reversed = names.sort({ $0 > $1 })
//7. Swift的String类型定义了关于大于号（>）的字符串实现,因此，可以简单地传递一个大于号，Swift 可以自动推断出您想使用大于号的字符串函数实现
reversed = names.sort(>)


//Trailing Closures(增强函数可读性)
reversed = names.sort() { $0 > $1 }
//如果函数只需要闭包表达式一个参数，当您使用尾随闭包时，您甚至可以把()省略掉:
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

//强制穷举,确保枚举成员不会被意外遗漏
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


enum Planet:Int {
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

//结构体和枚举是值类型
//类是引用类型
struct ResolutionStructures {
    var width = 0
    var height = 0
}

class VideoModeClasses {
    var resolution = ResolutionStructures()
    var interlaced = false
    var frameRate = 0.0
    var name: String?
}


let memberwiseInitializersForStructureTypes = ResolutionStructures(width: 100, height: 99)


// MARK: Properties

struct Animal {
    var typeName:String
    var isFlying:Bool
    lazy var isSpeaking:Bool = true
}

let tiger = Animal(typeName: "cat", isFlying: false, isSpeaking: false)

print("tiger.typeName = \(tiger.typeName), tiger.isFlying = \(tiger.isFlying)")


class AudiCar {
    var carType:String
    var carColor:String
    lazy var carNumber:Int = 8888
    init(carType:String, carColor:String) {
        self.carType = carType
        self.carColor = carColor
    }
}

let audiCar = AudiCar(carType: "A6L", carColor: "black")

print("audiCar.carType = \(audiCar.carType), audiCar.carColor = \(audiCar.carColor)")


class PrettyPerson {
    //存储属性
    var name = "Hong Min"
    //计算属性
    var description:String {
        get{
            return name + " Pretty"
        }set{
            //newValue代表所有将来所赋的新值
            name = newValue
        }
    }
    //只读属性:属于计算属性, 没有set赋值方法,声明只读属性时直接写一个return即可
    var sex:String {
        return "woman"
    }
}

let girl = PrettyPerson()
print("girl.description = \(girl.description)")

girl.description = "Guo Chen Guang"
print("girl.description = \(girl.description)")


//拓展.属性观察器
class BenzCar {
    var carType = "R350"
    var carColor = "Black"
    var carNumber:Int = 8888 {
        //将要变化
        willSet {
            print("newValue = \(newValue)")
        }
        //已经变化
        didSet {
            print("oldValue = \(oldValue)")
        }
    }
}

var benzCar = BenzCar()
//结合属性观察器完成对属性的监听
benzCar.carNumber = 1234

// MARK: Methods

//Type Methods
class Tree {
    class func printName(){
        print("gingko")
    }
}
Tree.printName()

struct Fruit {
    var fruitPrice:Float = 6.6    //属性观察器
    static var fruitName:String = "apple"{
        willSet{
        print("newValue = \(newValue)")
        }didSet{
            print("oldValue = \(oldValue)")
        }
    }
    //结构体方法
    static func printFruitName(){
        print("fruitName = \(fruitName)")
    }
}
Fruit.printFruitName()

// MARK: Inheritance
//在swift中, 没有显示的声明继承于某个类的类, 就是基类(父类, 超类)
//Base class
class Vehicle {
    var speed = 0.0
    var description:String {
        return "speed is \(speed)"
    }
    //实例方法
    func printVehicle(){
        print("这是父类的方法")
    }
}

//Subclass
class Ferrari: Vehicle {
    //新增加属性
    var carType:String = "F12berlinetta"
    //重写父类的方法
    //override 是重写的标识
    override func printVehicle(){
        print("Ferrari中的方法")
        //执行一遍父类中的代码
        super.printVehicle()
    }
    //重写计算属性
    override var description:String {
        return "My ferrari's speed is fast, speed is \(speed)"
    }
}

//创建一个ferrari实例
let ferrariCar = Ferrari()
ferrariCar.speed = 233.6

print("ferrariCar.carType = \(ferrariCar.carType)", ferrariCar.description)

ferrariCar.printVehicle()

/**  Swift中防止继承, 使用final关键字
*
*  final加到类前面, 说明整个类不能被继承
*  final加到方法前面, 说明该方法不能被重写
*  final加到属性前面, 说明该属性不能被重写
*/

// MARK: Initialization
class Food {
    var foodName:String
    var foodType:String
    var foodPrice:Float
    //定制初始化方法
    init(foodName:String, foodType:String, foodPrice:Float) {
        self.foodName = foodName;
        self.foodType = foodType;
        self.foodPrice = foodPrice;
    }
}

var food = Food(foodName: "dumplings", foodType: "supper", foodPrice: 15.0)
print("food.foodName = \(food.foodName)")

class Chips: Food {
    //可选类型
    var chipType:String!
    //重写init方法
    override init(foodName: String, foodType: String, foodPrice: Float) {
        //1. 父类init方法先执行一遍
        super.init(foodName: foodName, foodType: foodType, foodPrice: foodPrice)
        //2. 再完成新增属性的赋值
        chipType = "KFC"
    }
}

let chips = Chips(foodName: "薯条", foodType: "甜甜的", foodPrice: 12.5)
print(chips.chipType, chips.foodName)

//解决相互强引用引起的循环引用问题, 可以使用weak和unowned关键字来解决, 切记weak修饰可选类型, unowned修饰非可选类型


class Apartment {
    //声明存储属性
    var number:Int
    
    //weak用来解决循环引用, 只能修饰可选类型的属性
    weak var person:Person?
    //定制构造方法
    init (number:Int) {
        self.number = number
    }
    //析构方法
    deinit{
        print("房子对象被炸毁")
    }
}

class Person {
    var name:String
    
    var apartment:Apartment?
    init (name:String) {
        self.name = name
    }
    deinit {
        print("Go Die")
    }
}

var person:Person? = Person(name: "Dan Dan")
var apatment:Apartment? = Apartment(number: 1024)
person?.apartment = apatment
apatment?.person = person
person = nil
apatment = nil







