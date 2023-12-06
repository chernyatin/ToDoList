//
//  ContentView.swift
//  ToDoList
//
//  Created by Denis Chernyatin on 2023.12.06.
//

import SwiftUI
import SwiftData

struct ToDoListView: View {
    @Environment(\.modelContext) var context
    @State var newItemString = ""
    
    @Query var items: [ToDoListItem]
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("New task", text: $newItemString)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(12)
                
                Button("Add to the list") {
                    guard !newItemString.isEmpty else {
                        return
                    }
                    
                    let newItem = ToDoListItem(title: newItemString, date: Date())
                    
                    context.insert(newItem)
                    
                    newItemString = ""
                }
                
               
                    List {
                        ForEach(items) { item in
                            Text(item.title)
                        }
                        .onDelete { indexSet in
                            indexSet.forEach({ index in
                                context.delete(items[index])
                            })
                        }
                    }
            
                    .overlay {
                        if items.isEmpty {
                            Text("👏🏿 You have nothing to do!🎉")
                        
                    }
                }
            }
            .navigationTitle("ToDoList")
        }
    }
}

#Preview {
    ToDoListView()
}
