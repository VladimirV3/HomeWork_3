//
//  main.swift
//  HomeWork_3
//
//  Created by Владимир Воронов on 10/26/19.
//  Copyright © 2019 Vladimir Oleinikov. All rights reserved.
//

import Foundation

class person {
    
    var name: String
    var surname: String
    var patronymic: String
    var age: Int
    weak var passport: passport?
    
    var FIO: String {
        set {
            let new_fio = newValue.split(separator: " ")
            guard new_fio.count == 3 else {
                print ("wrong data")
                return }
    
            self.surname = String(new_fio[0])
            self.name = String(new_fio[1])
            self.patronymic = String(new_fio[2])
            
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
        print("\(self.FIO) удален из динамической памяти.")
    }
}

class passport {
    
    var series: String
    var serial_number: Int
    var date: Date
    var person: person?
    
    init (series: String, serial_number: Int, date: Date) {
        self.series = series
        self.serial_number = serial_number
        self.date = date
    }
    
    deinit {
        guard self.person != nil else { return }
        print("Пасспорт \(String(self.person?.FIO ?? "Error 303")) удален из динамической памяти.")
    }
}

var alex: person?
var pass_1:passport?

let Str_date: String = "2016-05-23"
var Formatter = DateFormatter()
Formatter.dateFormat = "yyyy-mm-dd"
//Formatter.timeStyle = .none
var date_of_registr = Formatter.date(from: Str_date)

alex = person(name: "Алексей", surname: "Станков", patronymic: "Викторович", age: 20)
pass_1 = passport(series: "BH", serial_number: 123123, date: date_of_registr!)

alex?.passport = pass_1
pass_1?.person = alex

print(alex!.FIO)
print(Formatter.string(from: pass_1!.date))

alex = nil
pass_1 = nil




