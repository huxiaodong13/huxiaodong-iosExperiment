import Cocoa

import Foundation


enum Gender:Int {            //性别为枚举型
    case male
    case female
    static func >(p1: Gender, p2: Gender) -> Bool {            //重载>
        return p1.rawValue > p2.rawValue
    }
}
class Person{
    var firstName:String
    var lastName:String
    var age:Int
    var gender:Gender
    var fullName:String{
        return firstName+""+lastName
    }
    init(firstName:String,lastName:String,age:Int,gender:Gender){//构造函数
        self.firstName = firstName
        self.lastName = lastName
        self.age = age
        self.gender = gender
    }
    deinit {
        print("This person \(fullName) is released!")
    }
    // convenience init(name:String) {            //便利构造函数
    //     self.firstName = name
    //     self.age = 3
    //     self.gender = Gender.female
    // }
    static func ==(p1:Person, p2:Person) -> Bool {  //用==判断是否为同一人
        return p1.fullName == p2.fullName
    }
    static func !=(p1:Person, p2:Person) -> Bool {  //用！=判断是否同一人
        return p1.fullName != p2.fullName
    }
    convenience init(name:String) {        //便利构造函数
        self.init(firstName: name, lastName: "", age: 3, gender:Gender.female)
        
    }
    var description:String {            //使其直用print输出
        return "Name: \(fullName) Age: \(age) Gender: \(gender)"
    }
}

let p1 = Person(firstName: "li", lastName: "haha", age: 23,
                gender: Gender.male)
let p2 = Person(firstName: "li", lastName: "haha", age: 13,
                gender: Gender.female)
let p3 = Person(firstName: "qiu", lastName: "zong", age: 32,
                gender: Gender.male)
print(p1.description)
print(p2.description)
print(p3.description)
if p1 == p2 {
    print("p1与p2为同一人")
}
if p1 != p3 {
    print("p1与p3不同人")
}

//（2）从Person分别派生Teacher类和Student类：
// a)Teacher类增加属性title，实例可以直接用print输出；
// Student类增加属性stuNo，实例可以直接用print输出；

class Teacher: Person {
    var title:String
    init(title:String, firstName:String, lastName:String, age:Int, gender:Gender) {
        self.title = title
        super.init(firstName:firstName, lastName:lastName, age:age, gender:gender)
    }
    convenience init(name:String) {
        //self.title = title
        self.init(title:"Hello,everybody", firstName: name, lastName: "", age: 24, gender:Gender.female)
    }
    override var description:String {
        return "title: \(title)" + super.description
    }
}

class Student: Person{
    var stuNo:Int
    init(stuNo:Int, firstName:String, lastName:String, age:Int, gender:Gender){
        self.stuNo = stuNo
        super.init(firstName:firstName, lastName:lastName, age:age,
                   gender:gender)
    }
    convenience init(name:String) {
        self.init(stuNo:0001, firstName: name, lastName: "", age: 18, gender:Gender.female)
    }
    override var description:String {
        return "stuNo :\(stuNo)" + super.description
    }
}
let t1 = Teacher(title:"Fighting", firstName:"lao", lastName:"shi", age:24, gender:Gender.female)
print(t1.description)

let s1 = Student(name:"fan")//(firstName:"fan", lastName:"gao", age:1, gender:Gender.male)
print(s1.description)
let s2 = Student(stuNo:0012, firstName:"fan", lastName:"gao", age:12, gender:Gender.male)
print(s2.description)
print("")
print("")
var person = [p1,p2,p3,t1,s1,s2]
// a)分别统计Person、Teacher和Student对象的个数并放入一字典中，统计完后输出字典内容；
var dictionary = ["Person":0, "Teacher":0, "Student":0]

for num in person {
    if num is Teacher {
        dictionary["Teacher"]!+=1
    }else if num is Student {
        dictionary["Student"]!+=1
    }else {
        dictionary["Person"]!+=1
    }
}
print("输出字典内容")
for(key,value) in dictionary {
    print("\(key)： \(value)个")
}
// 对数组按以下要求排序并输出：age、fullName、gender+age
print("按照age排序")
person.sort{$0.age < $1.age}
for p in person {
    print(p.description)
}
print("按照fullName排序")
person.sort{$0.fullName < $1.fullName}
for e in person {
    print(e.description)
}
print("按照gender+age排序")
person.sort{
    return ($0.age > $1.age) && ($0.gender > $1.gender)
}
for r in person {
    print(r.description)
}
