//
//  ContentView.swift
//  CalculatorApp
//
//  Created by Sukarna Paul on 9/6/23.
//

import SwiftUI

struct ContentView: View {
    @State var textEditor: String = "This is the starting text"
    var body: some View {
        NavigationView {
            VStack {
                TextEditor(text: $textEditor)
                    .frame(height: 250)
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Text("Save".uppercased())
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(10)
                })
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
