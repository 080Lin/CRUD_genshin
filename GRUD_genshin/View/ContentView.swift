//
//  ContentView.swift
//  GRUD_genshin
//
//  Created by Максим Нуждин on 01.02.2022.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    @StateObject var model = ViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(model.characters) { char in
                    NavigationLink {
                        DetailScreen(character: char)
                    } label: {
                        HStack {
                            Text(char.wrappedName)
                            VStack {
                                Text(char.wrappedRegion)
                                    .font(.caption.bold())
                                    .foregroundColor(.secondary)
                                Text("\(char.patch)")
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                            }
                            Text(char.wrappedElement)
                        }
                    }
                }.onDelete { index in
                    index.forEach { id in
                        let char = model.characters[id]
                        CoreDataManager.shared.deleteCharacter(char)
                        model.getAllCharacters()
                    }
                }
                
            }.onAppear {
                model.getAllCharacters()
            }
            .toolbar {
                Button {
                    model.showAddView.toggle()
                } label: {
                Image(systemName: "plus.circle")
                }
            }
            .sheet(isPresented: $model.showAddView) {
                NavigationView {
                    AddView()
                }
            }
        }
    }
}

