import UIKit

var str = "Hello, playground"

struct ResponseData: Hashable {
    var words:[word:String]
}
struct word : Hashable {
    var term: String
}

func readJson(filename: String) -> [String: Any]? {
    do {
        if let file = Bundle.main.url(forResource: filename, withExtension: "json") {
            let data = try Data(contentsOf: file)
            let json = try JSONSerialization.jsonObject(with: data, options: [])
            if let object = json as? [String: Any] {
                // json is a dictionary
                return object
                print("success")
            } else if let object = json as? [Any] {
                // json is an array
                print(object)
            } else {
                print("JSON is invalid")
            }
        } else {
            print("no file")
        }
    } catch {
        print(error.localizedDescription)
    }
    return nil
}

let dict = readJson(filename: "main_dictionary")!

print(dict.count)
print(dict["nature"])
