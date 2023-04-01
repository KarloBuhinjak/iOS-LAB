//
//  File.swift
//  LV1
//
//  Created by Karlo Buhinjak on 16.03.2023..
//

import Foundation

class Student {
    var ime: String
    var prezime: String
    var passed: Bool = false
    var id: String = UUID().uuidString
    
    init(ime: String, prezime: String) {
        self.ime = ime
        self.prezime = prezime
    }
}
