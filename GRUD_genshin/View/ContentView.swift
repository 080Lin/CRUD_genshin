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
    @FetchRequest(sortDescriptors: [SortDescriptor(\.name)], animation: .default)
    var characters: FetchedResults<GenshinCharacter>
    
    var body: some View {
        NavigationView {
            VStack {
                List(characters) { char in
                    HStack {
                        Text(char.wrappedName)
                            .frame(width: 100)
                        Spacer()
                        VStack {
                            Text(char.wrappedRegion)
                                .font(.headline.bold())
                                .foregroundStyle(.secondary)
                            Text("\(char.patch.preciseTo(1)) version")
                                .font(.caption)
                                .foregroundStyle(.secondary)
                        }
                        Spacer()
                        Text(char.wrappedElement)
                            .frame(width: 70)
                    }.swipeActions(edge: .leading, allowsFullSwipe: true) {
                        if char.isFavorite {
                            Button {
                                char.isFavorite.toggle()
                                try? model.viewContext.save()
                            } label: {
                                Label("Person", systemImage: "star.fill")
                                    .foregroundColor(.yellow)
                            }
                        } else {
                            Button {
                                char.isFavorite.toggle()
                                try? model.viewContext.save()
                            } label: {
                                Label("Person", systemImage: "star")
                                    .foregroundColor(.gray)
                            }
                        }
                        
                    }
                }
                
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        model.showAddView.toggle()
                    } label: {
                        Label("New", systemImage: "plus.circle")
                    }.sheet(isPresented: $model.showAddView) {
                        NavigationView {
                            AddView()
                                .navigationBarTitle("add view")
                        }
                    }
                }
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.shared.container.viewContext)
    }
}
