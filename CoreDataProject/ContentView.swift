//
//  ContentView.swift
//  CoreDataProject
//
//  Created by Prakhar Trivedi on 23/8/23.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    
    @State var filteringValue = "S"
    
    var body: some View {
        VStack {
            FilteredList(
                filterKey: "lastName",
                filterValue: filteringValue,
                predicateType: .beginsWith
            ) { (singer: Singer) in
                Text("\(singer.wrappedFirstName) \(singer.wrappedLastName)")
            }
            
            Button("Add Examples") {
                let taylor = Singer(context: moc)
                taylor.firstName = "Taylor"
                taylor.lastName = "Swift"
                
                let ed = Singer(context: moc)
                ed.firstName = "Ed"
                ed.lastName = "Sheeran"
                
                let adele = Singer(context: moc)
                adele.firstName = "Adele"
                adele.lastName = "Adkins"
                
                try? moc.save()
            }
            .padding()
            
            Button("Toggle Filter") {
                if filteringValue == "S" {
                    filteringValue = "A"
                } else {
                    filteringValue = "S"
                }
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
