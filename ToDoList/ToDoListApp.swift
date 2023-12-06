//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Denis Chernyatin on 2023.12.06.
//

import SwiftUI
import SwiftData

@main
struct ToDoListApp: App {
    var body: some Scene {
        WindowGroup {
            ToDoListView()
        }
        .modelContainer(for: ToDoListItem.self)
    }
}
