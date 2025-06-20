//
//  CreateConcertView.swift
//  Concertmastr
//
//  Created by Evan Chen on 6/18/25.
//

import SwiftUI

struct CreateConcertView: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 30) {
                // Header
                VStack(spacing: 10) {
                    Image(systemName: "plus.circle.fill")
                        .font(.system(size: 60))
                        .foregroundColor(.blue)
                    
                    Text("Create New Concert")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    
                    Text("Design your concert poster")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                
                Spacer()
                
                // Create Poster Button
                NavigationLink(destination: PosterCreationView()) {
                    HStack {
                        Image(systemName: "music.note.list")
                            .font(.title2)
                        Text("Start Creating")
                            .font(.headline)
                    }
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(12)
                }
                .padding(.horizontal, 40)
                
                Spacer()
            }
            .padding()
            .navigationTitle("Create Concert")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

#Preview {
    CreateConcertView()
} 