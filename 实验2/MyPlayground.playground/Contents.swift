import Cocoa

import Foundation




let dictionary = [["name": "开发", "age": "17"], ["name": "指南", "age": "18"]]
let name = dictionary.map( { $0["age"]! } )
print("输出age转换的字符串：\(name)")
print("")
let str = ["a","11","fda","23r","100"]
let str1 = str.filter{ Int($0) != nil }
print("能被转化成Int的字符串：\(str1)")
print("")
var  str2 = str.reduce("", { $0 + "," + $1 })
str2 = str2.remove(at: str2.startIndex)        //删除第一个，
print("以逗号分开后的结果：\(str2)")
print("")

let arry = [21,34,5,12,100]
let arry1 = arry.reduce((max: arry[0], min: arry[0], sum:0), {
    (max: max($0.max, $1), min: min($0.min, $1), $0.sum + $1)
})
print("最大值、最小值、总数分别为：\(arry1)")

print("")
print("输出类型为(Int) -> Int 的函数：")
func fc1(a: Int) -> Int {
    return a        //参数Int返回Int
}
func fc2(a: String) -> Int {
    return Int(a)!  //参数为String返回Int
}
func fc3(a: Int)  {
    //参数Int无返回值
}
func fc4() -> Int {
    return 3        //无参返回Int
}
func fc5(a:Int) -> Int {
    return a+5
}
let funcArry: [Any] = [fc1, fc2, fc3, fc4, fc5]
for (index, value) in funcArry.enumerated() {
    if value is (Int) -> Int {
        print(index)    //输出函数在数组里的下标
    }
}
print("")
print("返回Int型数据的平方根：")
// extension Int {
//     func sqrt(num: Int) -> Double {
//         return Darwin.sqrt(Double(num))
//     }
// }
// print(sqrt(9) )
print("")
print("支持泛型的函数,返回最大值和最小值：")
func getMaxAndMin<T: Comparable>(a: T...) -> (T, T) {
    var max = a[0]
    var min = a[0]
    for temp in a {
        if temp > max {
            max = temp
        }
        if temp < min {
            min = temp
        }
    }
    return (max, min)
}
print(getMaxAndMin( a: 3, 4, 7, 8, 10 ))
print(getMaxAndMin( a: 1.0, 8.0, 1.1, 99.0 ))
print(getMaxAndMin( a: "aa", "ccc", "A", "QWD"))
