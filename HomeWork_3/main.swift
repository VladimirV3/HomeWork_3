//
//  main.swift
//  HomeWork_3
//
//  Created by Владимир Воронов on 10/26/19.
//  Copyright © 2019 Vladimir Oleinikov. All rights reserved.
//

import Foundation

class Person {
    
    var name: String
    var surname: String
    var patronymic: String
    var age: Int
    weak var passport: Passport?
    
    var fio: String {
        set {
            let newFio = newValue.split(separator: " ")
            guard newFio.count == 3 else {
                print ("wrong data")
                return }
    
            self.surname = String(newFio[0])
            self.name = String(newFio[1])
            self.patronymic = String(newFio[2])
            
            print("Данные по \(self.surname) \(self.name) \(self.patronymic) записаны в динамическую память. ")
        }
        get {
            return "\(self.surname) \(self.name) \(self.patronymic)"
        }
    }
    
    init ( name:String, surname: String, patronymic: String, age: Int) {
        self.name = name
        self.surname = surname
        self.patronymic = patronymic
        self.age = age
    }
    
    deinit {
        print("\(self.fio) удален из динамической памяти.")
    }
}

class Passport {
    
    var series: String
    var serialNumber: Int
    var date: Date
    var person: Person?
    
    init (series: String, serialNumber: Int, date: Date) {
        self.series = series
        self.serialNumber = serialNumber
        self.date = date
    }
    
    deinit {
        guard self.person != nil else { return }
        print("Пасспорт \(String(self.person?.fio ?? "Error 303")) удален из динамической памяти.")
    }
}

var alex: Person?
var pass1:Passport?

let Str_date: String = "2016-05-23"
let Formatter = DateFormatter()
Formatter.dateFormat = "yyyy-mm-dd"
//Formatter.timeStyle = .none
let dateOfReg = Formatter.date(from: Str_date)

alex = Person(name: "Алексей", surname: "Станков", patronymic: "Викторович", age: 20)

if let unwrappedDateOfReg = dateOfReg {
    pass1 = Passport(series: "BH", serialNumber: 123123, date: unwrappedDateOfReg)
}
else {
    print ("Error 304")
}

alex?.passport = pass1
pass1?.person = alex

print(alex?.fio ?? "alex went home")

if pass1 != nil {
    print(Formatter.string(from: pass1!.date))
}

alex = nil
pass1 = nil




