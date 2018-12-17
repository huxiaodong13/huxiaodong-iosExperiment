import Cocoa

var str = "Hello, playground"
import Foundation

var box = [Int]()           //定义可变数组，用于存放质数
var i = 0
var j = 0
for i in 2...1000 {
    var isOK = true
    for j in 2..<i {
        if i % j == 0 {
            isOK = false
        }
    }
    if isOK {
        box.append(i)
    }
}

print(box)
box.sort()      //升序
print("第一种升序方式排序：")
print(box)

box.sort(by:<)
print("第二种升序方式排序：")
print(box)

box.sort{$0 > $1}
print("第一种降序方式排序：")
print(box)

box.sort(by:>)
print("第二种降序方式排序：")
print(box)

func compare(m:Int, n:Int) -> Bool {
    let a = m>n
    return a
}
box.sort(by:compare)
print("第三种降序方式排序：")
print(box)

box.sort{
    (m,n) -> Bool in
    return m>n
}
print("第四种降序方式排序：")
print(box)

box.sort {
    (m,n) in
    return m>n
}
print("第五种降序方式排序：")
print(box)





