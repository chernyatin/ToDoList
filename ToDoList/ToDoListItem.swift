//
//  ToDoListItem.swift
//  ToDoList
//
//  Created by Denis Chernyatin on 2023.12.06.
//

import Foundation
import SwiftData

@Model
class ToDoListItem {
    let title: String
    
    init(title: String, date: Date) {
        self.title = title
    }
}
