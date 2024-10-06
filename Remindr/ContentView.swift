//
//  ContentView.swift
//  Remindr
//
//  Created by Anders Bellsund Beil on 02/10/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var dayTimeCheck: Bool = false
    @State private var nightTimeCheck: Bool = false
    var body: some View {
        VStack {
            HStack{
                
                Text("Day 1")
                Spacer()
                Button(action: {dayTimeCheck.toggle()}, label: {dayTimeCheck ? Image(systemName: "sun.max.fill") : Image(systemName: "sun.max")})
                
                Button(action: {nightTimeCheck.toggle()}, label: {nightTimeCheck ? Image(systemName: "moon.fill") : Image(systemName: "moon")})
                
                
            }
        }
        .padding()
    }
}

struct DayBox: View {
    var body: some View {
        /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Hello, world!@*/Text("Hello, world!")/*@END_MENU_TOKEN@*/
    }
}

#Preview {
    ContentView()
}
