// Playground - noun: a place where people can play

var str = "Chris"
var str2 = "Hello, \(str)"
str = "Laura"
str2 = "Hello, \(str)"

func sayHello(namez: String) {
  println("Hello \(namez)!")
}

let a = 7, b = 6
let mathResult = "\(a) times \(b) is \(a*b)"
mathResult + "!"

var names = ["Anne", "Laura", "Chris", "Melanie", "Tom", "Lindsay"]
names += "Hailey"
for name in names {
  println("\(name)")
}

var numberOfLegs = ["ant": 6, "snake": 0, "cheetah": 4]
for (animalName, legCount) in numberOfLegs {
  println("\(animalName)s have \(legCount) legs")
}
numberOfLegs["spiders"] = 8
numberOfLegs["aardvark"] = 4


let possibleLegCount: Int? = numberOfLegs["aardvark"]

if possibleLegCount == nil {
  println("Aardvark not found")
} else {
  let legCount = possibleLegCount
  println("An aardvark has \(legCount) legs")
}

if let legCount = possibleLegCount {
  println("Found an aardvark with \(legCount) legs")
  
  switch legCount {
  case 0:
    println("It slithers and slides")
    sayHello("Me")
  case 1...8:
    println("It has a good amount of legs")
  default:
    println("Too many legs to count")
  }
}

sayHello("Me")

class Item {
  let text: String
  var done: Bool
  
  init(text: String) {
    self.text = text
    self.done = false
  }
}

class HasItem {
  var hidden: Bool
  var item: Item {
  get {
    return self.item
  }
  set {
    newValue
    hidden = newValue.done
  }
  }
  init() {
    self.hidden = true
  }
}

let a2 = HasItem()
let item = Item(text: "now")
a2.item = item
println(item.text)