//
//  PreviewView.swift
//  Concertmastr
//
//  Created by Evan Chen on 6/18/25.
//

import SwiftUI

struct PreviewView: View {
    let artistName: String
    let venueName: String
    let date: Date
    let time: Date
    let ticketPrice: String
    let posterStyle: String
    
    var body: some View {
        ScrollView {
            VStack(spacing: 30) {
                // Poster Preview
                VStack(spacing: 20) {
                    Text("Poster Preview")
                        .font(.title)
                        .fontWeight(.bold)
                    
                    // Simple poster mockup
                    VStack(spacing: 15) {
                        Text(artistName.isEmpty ? "Artist Name" : artistName)
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .multilineTextAlignment(.center)
                        
                        Text(venueName.isEmpty ? "Venue Name" : venueName)
                            .font(.title2)
                            .foregroundColor(.secondary)
                        
                        VStack(spacing: 8) {
                            Text(dateFormatter.string(from: date))
                                .font(.headline)
                            
                            Text(timeFormatter.string(from: time))
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }
                        
                        if !ticketPrice.isEmpty {
                            Text("Tickets: $\(ticketPrice)")
                                .font(.headline)
                                .foregroundColor(.blue)
                        }
                        
                        Text("Style: \(posterStyle)")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                    .padding(30)
                    .background(
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color(.systemGray6))
                            .shadow(radius: 10)
                    )
                    .padding(.horizontal)
                }
                
                // Action Buttons
                VStack(spacing: 15) {
                    NavigationLink(destination: SharingView(
                        artistName: artistName,
                        venueName: venueName,
                        date: date,
                        time: time,
                        ticketPrice: ticketPrice,
                        posterStyle: posterStyle
                    )) {
                        HStack {
                            Image(systemName: "square.and.arrow.up")
                                .font(.title2)
                            Text("Share Poster")
                                .font(.headline)
                        }
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(12)
                    }
                    .disabled(artistName.isEmpty || venueName.isEmpty)
                    
                    Button("Save to My Concerts") {
                        // Save functionality
                    }
                    .font(.headline)
                    .foregroundColor(.blue)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue.opacity(0.1))
                    .cornerRadius(12)
                    .disabled(artistName.isEmpty || venueName.isEmpty)
                }
                .padding(.horizontal)
                
                Spacer(minLength: 50)
            }
        }
        .navigationTitle("Preview")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    private var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    }
    
    private var timeFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        return formatter
    }
}

#Preview {
    NavigationStack {
        PreviewView(
            artistName: "Sample Artist",
            venueName: "The Grand Hall",
            date: Date(),
            time: Date(),
            ticketPrice: "25",
            posterStyle: "Modern"
        )
    }
} 