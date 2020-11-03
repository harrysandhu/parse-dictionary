import UIKit

if let path = Bundle.main.path(forResource: "assets/test", ofType: "json") {
    do {
        let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped)
        let jsonObj = try JSON(data: data)
        print("jsonData:\(jsonObj)")
    } catch let error {
        print("parse error: \(error.localizedDescription)")
    }
} else {
    print("Invalid filename/path.")
}
