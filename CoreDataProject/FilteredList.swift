//
//  FilteredList.swift
//  CoreDataProject
//
//  Created by Prakhar Trivedi on 24/8/23.
//

import SwiftUI
import CoreData

struct FilteredList<T: NSManagedObject, Content: View>: View {
    @FetchRequest var fetchRequest: FetchedResults<T>
    let content: (T) -> Content
    
    var body: some View {
        List(fetchRequest, id: \.self) { item in
            self.content(item)
        }
    }
    
    init(filterKey: String, filterValue: String, predicateType: NSPredicate.PredicateType, @ViewBuilder content:
@escaping (T) -> Content) {
        _fetchRequest = FetchRequest<T>(sortDescriptors: [], predicate: NSPredicate(format: "%K \(NSPredicate.getStringPredicate(for: predicateType)) %@", filterKey, filterValue))
        self.content = content
    }
}

extension NSPredicate {
    enum PredicateType {
        case beginsWith
        case beginsWithCaseInsensitive
        
        case contains
        case containsCaseInsensitive
        
        case equalTo
        case notEqualTo
        
        case greaterThan
        case lowerThan
        
        case lower
        case greater
        
        case inCollection
        
        case between
        
        case custom(String)
    }
    
    static func getStringPredicate(for predicateType: PredicateType) -> String {
        switch predicateType {
        case .beginsWith:
            return "BEGINSWITH"
        case .beginsWithCaseInsensitive:
            return "BEGINSWITH[c]"
        case .contains:
            return "CONTAINS"
        case .containsCaseInsensitive:
            return "CONTAINS[c]"
        case .equalTo:
            return "=="
        case .notEqualTo:
            return "<>"
        case .lowerThan:
            return "<="
        case .greaterThan:
            return ">="
        case .lower:
            return "<"
        case .greater:
            return ">"
        case .inCollection:
            return "IN"
        case .between:
            return "BETWEEN"
        case .custom(let customString):
            return customString
        }
    }
}
