//
//  ContentView.swift
//  Concertmastr
//
//  Created by Evan Chen on 6/18/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            CreateConcertView()
                .tabItem {
                    Image(systemName: "plus.circle.fill")
                    Text("Create")
                }
            
            MyConcertsView()
                .tabItem {
                    Image(systemName: "music.note.list")
                    Text("My Concerts")
                }
            
            AccountView()
                .tabItem {
                    Image(systemName: "person.circle.fill")
                    Text("Account")
                }
        }
    }
}

#Preview {
    ContentView()
}
