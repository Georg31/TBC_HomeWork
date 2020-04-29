import UIKit

class Company: Info{
    var founders: [String]
    var head: String
    var name: String
    var year: Int
    
    init(founders: [String], head: String, name: String, year: Int) {
        self.founders = founders
        self.head = head
        self.name = name
        self.year = year
    }
    func info(){
        CompanyName()
        Founded()
        Founders()
        Head()
    }

    func Founded() {
        print("Founded in \(self.year)")
    }
    
    func Founders() {
        print("Founders: \(self.founders)")
    }
    
    func CompanyName(){
        print("Company \(self.name)")
    }
    func Head() {
        print("Address: \(self.head)")
    }
}

protocol Info{
    func CompanyName()
    func Founded()
    func Founders()
    func Head()
    func info()
}

class Apple: Company{}
class Google: Company{}
class Facebook: Company{}

var apple = Apple(founders: ["steve", "jack"], head: "NY", name: "Apple", year: 1972)
var google = Google(founders: ["gocha", "xvicha"], head: "India", name: "Google", year: 1999)
var facebook = Facebook(founders: ["mark"], head: "England", name: "Facebook", year: 2007)

apple.info()
google.info()
facebook.info()
