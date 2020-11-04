import UIKit

var str = "Hello, playground"

//struct ResponseData: Hashable {
//    var words:[word:String]
//}
struct Word : Hashable {
    var defn: [String]
    var syn: [String]
    var ant: [String]
    
    init(defn:[String], syn:[String], ant: [String] ) {
        self.defn = defn
        self.syn = syn
        self.ant = ant
    }
}

extension Word {
    init?(json: [String: Any]) {
        guard
            let defn = json["defn"] as? [String],
            let syn = json["syn"] as? [String],
            let ant = json["ant"] as? [String]
        else {do { return nil } }
        
        self.defn = defn
        self.syn = syn
        self.ant = ant
   
}
}

func readJson(filename: String) -> [String: AnyObject]? {
    do {
        if let file = Bundle.main.url(forResource: filename, withExtension: "json") {
            let data = try Data(contentsOf: file)
            let json = try JSONSerialization.jsonObject(with: data, options: [])
            if let object = json as? [String: AnyObject] {
                // json is a dictionary
                return object
                print("success")
            } else if let object = json as? [AnyObject] {
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

let dict = readJson(filename: "db/x")!
print(dict)

//print(dict.count)
//
//let term = "nature"
print(type(of: dict))

let w:Word = Word.init(defn: data["defn"]!, syn: data["syn"]!, ant: data["ant"]!)

print(w.syn)
