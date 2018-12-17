import Cocoa

/*********第四次作业******************/
import Foundation


func getDate(date:Date, zone: Int = 0) -> String {//获取时间
    
    let time = DateFormatter()
    time.dateFormat = "yyyy年MM月dd日EEEE aa KK:mm" //规定格式
    time.locale = Locale.current //设置当前位置
    if zone >= 0 {  //正数，东半区
        time.timeZone = TimeZone(abbreviation: "UTC+\(zone):00")
    }else {     //负数，西半区
        time.timeZone = TimeZone(abbreviation: "UTC\(zone):00")
    }
    let dateString = time.string(from: now)     //转化为字符串
    return dateString
}

let now = Date()
//print("当前时间：\(now)")
let beijing = getDate(date:now, zone: +8)
print("北京时间：\(beijing)")
let dongjing = getDate(date:now, zone: 9)
print("东京时间：\(dongjing)")
let niuyue = getDate(date:now, zone: -5)
print("纽约时间：\(niuyue)")
let lundun = getDate(date:now)      //时区为0
print("伦敦时间：\(lundun)")


let str = "Swift is a powerful and intuitive programming language for iOS, OS X, tvOS, and watchOS."
print("截取第6到第20个字符")
let str1 = str[str.index(str.startIndex, offsetBy:6)...str.index(str.startIndex, offsetBy:20)]
print(str1)
print("删除所有的OS：")
let str2 = str.replacingOccurrences(of:"OS", with:"")
print(str2)

let dictionary = ["date": ["beijing": beijing, "dongjing": dongjing, "niuyue": niuyue, "lundun": lundun], "string": str] as! AnyObject  //将字典转换为任意类型
let fileManager = FileManager.default  //获取默认工作路径
var url1 = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first!//获取工作路径下的Document文件夹
url1.appendPathComponent("text.txt")            //在文件夹下增加一个text.txt
try? str1.write(to: url1, atomically: true, encoding: String.Encoding)     //写入数据


//获取工作路径下的Document文件夹
// if var path = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first?.path {
//     path.append("text.txt")  //在文件夹下增加一个text.txt
//     print(dictionary.write(toFile: path, atomically: true))  //新建上面指定的文件，并将数据写入(输出: true)
// }

let imageUrl = URL(string:"http://www.weather.com.cn/data/sk/101110101.html")!//通过指定的url获取图片，并转换为二进制数据
let imageData = try? Data(contentsOf: imageUrl)
var url2 = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first!
url2.appendPathComponent("mypic.png")
try? imageData?.write(to: url2)

// let image = try Data(contentsOf: URL(string: "https://ss0.bdstatic.com/5aV1bjqh_Q23odCf/static/superman/img/logo/bd_logo1_31bdc765.png")!) //通过指定的url获取图片，并转换为二进制数据

// if var url = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first {
//     url.appendPathComponent("image.png")
//     try image.write(to: url)  //将转换后的二进制数据存储为png图片
// }


let url = URL(string: "http://www.weather.com.cn/data/sk/101110101.html")!                             //api的路径
let jsondata = try Data(contentsOf: url)  //将json转换为二进制数据
let json = try JSONSerialization.jsonObject(with: jsondata, options: .allowFragments)  //序列化json

//解析json数据
if let dictionary = json as? [String: Any] {
    if let howIsWeather = dictionary["weatherinfo"] as? [String: Any] {
        let city = howIsWeather["city"]!
        let temperature = howIsWeather["temperature"]!
        let wd = howIsWeather["WD"]!
        let ws = howIsWeather["WS"]!
        print("城市: \(city), 温度: \(temperature), 风向: \(wd), 风力: \(ws)")
    }
}
