//
//  ContentView.swift
//  CalculatorApp
//
//  Created by Sukarna Paul on 9/6/23.
//

import Combine
import SwiftUI

struct ContentView: View {
    @State var textEditorText: String = "This is the starting text"
    @State var savedText: String = ""
    @State private var numOfPeople = "0"
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Purchased Price").foregroundColor(.red)) {
                    HStack{
                        TextField("Total number of people", text: $numOfPeople)
                            .keyboardType(.numberPad)
                            .onReceive(Just(numOfPeople)) { newValue in
                                let filtered = newValue.filter { "0123456789".contains($0) }
                                if filtered != newValue {
                                    self.numOfPeople = filtered
                                }
                            }
                            .frame(width: 200, height: 40)
                            .background(.white)
                        Button(action: {
                            savedText = numOfPeople
                        }, label: {
                            Text("Save".uppercased())
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding()
                                .frame(maxWidth: 80, maxHeight: 40)
                                .background(Color.blue)
                                .cornerRadius(10)
                        })
                    }
                    
                }
                Section(header: Text("Amount").foregroundColor(.red)) {
                    HStack{
                        TextField("Total number of people", text: $numOfPeople)
                            .keyboardType(.numberPad)
                            .onReceive(Just(numOfPeople)) { newValue in
                                let filtered = newValue.filter { "0123456789".contains($0) }
                                if filtered != newValue {
                                    self.numOfPeople = filtered
                                }
                            }
                            .frame(width: 200, height: 40)
                            .background(.white)
                        Button(action: {
                            savedText = numOfPeople
                        }, label: {
                            Text("Save".uppercased())
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding()
                                .frame(maxWidth: 80, maxHeight: 40)
                                .background(Color.blue)
                                .cornerRadius(10)
                                .frame(maxHeight: 10)
                        })
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
