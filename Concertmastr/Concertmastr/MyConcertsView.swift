//
//  MyConcertsView.swift
//  Concertmastr
//
//  Created by Evan Chen on 6/18/25.
//

import SwiftUI

struct MyConcertsView: View {
    @State private var selectedSegment = 0
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                // Segment Control
                Picker("Concerts", selection: $selectedSegment) {
                    Text("Upcoming").tag(0)
                    Text("Past").tag(1)
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding(.horizontal)
                
                // Content based on selection
                if selectedSegment == 0 {
                    UpcomingConcertsView()
                } else {
                    PastConcertsView()
                }
            }
            .navigationTitle("My Concerts")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

struct UpcomingConcertsView: View {
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 16) {
                ForEach(0..<3) { index in
                    ConcertCardView(
                        title: "Sample Concert \(index + 1)",
                        date: "Dec \(15 + index), 2024",
                        venue: "The Grand Hall",
                        isUpcoming: true
                    )
                }
            }
            .padding()
        }
    }
}

struct PastConcertsView: View {
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 16) {
                ForEach(0..<5) { index in
                    ConcertCardView(
                        title: "Past Concert \(index + 1)",
                        date: "Nov \(20 + index), 2024",
                        venue: "Music Center",
                        isUpcoming: false
                    )
                }
            }
            .padding()
        }
    }
}

struct ConcertCardView: View {
    let title: String
    let date: String
    let venue: String
    let isUpcoming: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text(title)
                        .font(.headline)
                        .foregroundColor(.primary)
                    
                    Text(venue)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                
                Spacer()
                
                VStack(alignment: .trailing, spacing: 4) {
                    Text(date)
                        .font(.caption)
                        .foregroundColor(.secondary)
                    
                    Text(isUpcoming ? "Upcoming" : "Past")
                        .font(.caption)
                        .foregroundColor(.white)
                        .padding(.horizontal, 8)
                        .padding(.vertical, 4)
                        .background(isUpcoming ? Color.green : Color.gray)
                        .cornerRadius(8)
                }
            }
            
            HStack {
                Button("View Poster") {
                    // Action to view poster
                }
                .font(.caption)
                .foregroundColor(.blue)
                
                Spacer()
                
                Button("Share") {
                    // Action to share
                }
                .font(.caption)
                .foregroundColor(.blue)
            }
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(12)
    }
}

#Preview {
    MyConcertsView()
} 