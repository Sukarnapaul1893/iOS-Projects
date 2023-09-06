//
//  ContentView.swift
//  CalculatorApp
//
//  Created by Sukarna Paul on 9/6/23.
//

import SwiftUI

struct ContentView: View {
    @State var textEditor: String = ""
    var body: some View {
        NavigationView {
            VStack {
                 TextEditor(text: $textEditor)
            }
        }
    }
}

#Preview {
    ContentView()
}
