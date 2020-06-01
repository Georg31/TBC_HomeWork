//
//  ViewController.swift
//  Homework31_ARC
//
//  Created by George Digmelashvili on 6/1/20.
//  Copyright © 2020 George Digmelashvili. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var sandro: Person?
        var developer: Job?
        
        sandro = Person()
        developer = Job()
        
        sandro?.job = developer
        developer?.person = sandro
        //ორივე არაა საჭირო ერთად
        //sandro?.job = nil
        //developer?.person = nil
        
        sandro = nil
        developer = nil
    }
}


//  ჯობ კლასს აქვს პერსონის ობიექტის მიმთითებელი და პირიქით პერსონს ჯობის მიმთითებელი რომლებიც default არიან strong reference
// რის გამოც ARC ვერ ახერხებს გასუფთავებას რადგან ჩვენ ვიუდიდლოადში ვქმნით პერსონის ობიექტს (რეფერენსს) და ჯობის,
// შემდეგ ვანიჭებთ რეფერენსს თვითონ კლასის შიგნით არსებულ ფილდს რის შედეგადაც ჩვენ ვიღებთ 1 ობიექტის 2 რეფერენსს
// და მარტო ვიუდიდლოადში ვანიჭებთ ნილს სანდროს ან დეველოპერის ობიექტს ხოლო მეორე რეფერენსი რომელიც კლასს აქვს ის რჩება და ამიტომ არ ხდება დეინიტი
// კონკრეტულად ამ შემთხვევაში შეგვილია 2 გზით გამოვასწოროთ.
// 1) ჯობ კლასში ან პერსონ კლასში რომელიმე რეფერენსს თუ დავუწერთ keyword weak ამ შემთხვევაში ARC ვეღარ აღიქვამს ამ რეფერენსს
//    და ეგონება მხოლოდ ერთი და როცა იმ ერთს მივანიჭებთ nil მაშინ მეხსიერებიდან წაიშლება ის ობიექტი.
// მაგალითად ჯობ კლასში რომ პერსონ რომ გავხადოთ weak ამ კოდში როგორც არის სანდროს ვანიჭებთ nils ვიუდიდლოად რომ მორჩება გამოიძახება ჯობ კლასისი დეინითი.
// ორი რეფერენსი არის რეალურად მაგრამ ARC მა მხოლოდ ერთი იცის ანუ პერსონას რომ აღარ უყურებს არავინ წაიშლება და მიყვება ჯობიც.
// 2) მეორე ვარიატია weak-ის გარეშე. თვითონ ობიქტში არსებულ რეფერენს მივანიჭოთ nil და მოხდება იგივე რაც weak შემთხვევაში.


class Job {
    weak var person: Person?
    
    deinit {
        print("Deallocating Job")
    }
}

class Person {
    var job: Job?
    
    deinit {
        print("Deallocating Person")
    }
    
    
}

