//
//  ContentView.swift
//  LateCounter
//
//  Created by Sukarna Paul on 10/4/23.
//

import SwiftUI

struct ContentView: View {
    @State var name = ""
    @State var month = ""
    
    @State var selectedName = UserDefaults.standard.string(forKey: "Selected")
    @State var selectedLateCount =  UserDefaults.standard.string(forKey: "SelectedLateCount")
    @State var selectedLateCountInt = UserDefaults.standard.integer(forKey: "SelectedLateCountInt")
    
    @State var sukarnaName = UserDefaults.standard.string(forKey: "Sukarna")
    @State var sukarnaLateCount =  UserDefaults.standard.string(forKey: "SukarnaLateCount")
    @State var sukarnaLateCountInt = UserDefaults.standard.integer(forKey: "SukarnaLateCountInt")
    
    @State var mahiName = UserDefaults.standard.string(forKey: "Mahi")
    @State var mahiLateCount =  UserDefaults.standard.string(forKey: "MahiLateCount")
    @State var mahiLateCountInt = UserDefaults.standard.integer(forKey: "MahiLateCountInt")
    
    let allNames = [
        "Junaid",
        "Sukarna",
        "Mahi",
        "Tanjim",
        "Nahid",
        "Shovon",
        "Kashem",
        "Samin",
        "Mazed",
        "Sakib",
        "Rafsan"
    ]
    
    var body: some View {
        Form {
            Section {
                Menu("Name") {
                    Button ("Sukarna") {
                        name = "Sukarna"
                        selectedName = "Sukarna"
                        
                        selectedLateCount = selectedLateCountInt.description
                        
                        UserDefaults.standard.set(selectedName, forKey: "Selected")
                        
                        UserDefaults.standard.set(selectedLateCount, forKey: "SelectedLateCount")
                        
                        UserDefaults.standard.set(selectedLateCountInt, forKey: "SelectedLateCountInt")
                    }
                    Button ("Mahi") {
                        name = "Mahi"
                        mahiName = "Mahi"
                        mahiLateCountInt += 1
                        
                        mahiLateCount = mahiLateCountInt.description
                        
                        UserDefaults.standard.set(mahiName, forKey: "Mahi")
                        
                        UserDefaults.standard.set(mahiLateCount, forKey: "MahiLateCount")
                        
                        UserDefaults.standard.set(mahiLateCountInt, forKey: "MahiLateCountInt")
                    }
                }
            }
            Section {
                Menu("Month") {
                    
                    Button("October") {
                        month = "October"
                    }
                    Button("November") {
                        month = "November"
                    }
                }
            }
            
            Section {
                Button("Save") {
                    sukarnaLateCountInt += 1
                    sukarnaLateCount = sukarnaLateCountInt.description
                    UserDefaults.standard.set(sukarnaLateCountInt, forKey: "SukarnaLateCountInt")
                    
                    print("Save Button Tapped")
                }.background(.background, in: .circle, fillStyle: .init())
            }
            
            Section (header: Text(sukarnaName ?? "")){
                TextField("", text: $sukarnaLateCount.toUnwrapped(defaultValue: ""))
            }
            
            Section (header: Text(mahiName ?? "")){
                TextField("", text: $mahiLateCount.toUnwrapped(defaultValue: ""))
                TextField("", text: $mahiLateCount.toUnwrapped(defaultValue: ""))
            }
//            List(allNames, id: \.self) { row in
//                Section (header: Text(row)){
//                    TextField("", text: $sukarnaLateCount.toUnwrapped(defaultValue: ""))
//                }
//            }
            
            
            
        }
        .padding(.top)
    }
}

extension Binding {
    func toUnwrapped<T>(defaultValue: T) -> Binding<T> where Value == Optional<T>  {
        Binding<T>(get: { self.wrappedValue ?? defaultValue }, set: { self.wrappedValue = $0 })
    }
}

#Preview {
    ContentView()
}
