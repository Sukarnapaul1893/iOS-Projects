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
            VStack {
                TextField("Total number of people", text: $numOfPeople)
                    .keyboardType(.numberPad)
                    .onReceive(Just(numOfPeople)) { newValue in
                        let filtered = newValue.filter { "0123456789".contains($0) }
                        if filtered != newValue {
                            self.numOfPeople = filtered
                        }
                    }
                    .frame(height: 40)
                    .background(.white)
                TextField("Total number of people", text: $numOfPeople)
                    .keyboardType(.numberPad)
                    .onReceive(Just(numOfPeople)) { newValue in
                        let filtered = newValue.filter { "0123456789".contains($0) }
                        if filtered != newValue {
                            self.numOfPeople = filtered
                        }
                    }
                    .frame(height: 40)
                    .background(.white)
                    
                Button(action: {
                    savedText = numOfPeople
                }, label: {
                    Text("Save".uppercased())
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(10)
                })
                Text(savedText).multilineTextAlignment(.trailing)
                Spacer()
                
            }
            .padding()
            .background(Color.green)
            .navigationTitle("Calculator App")
         }
    }
}

#Preview {
    ContentView()
}
