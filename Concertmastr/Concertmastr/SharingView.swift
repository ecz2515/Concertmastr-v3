//
//  SharingView.swift
//  Concertmastr
//
//  Created by Evan Chen on 6/18/25.
//

import SwiftUI

struct SharingView: View {
    let artistName: String
    let venueName: String
    let date: Date
    let time: Date
    let ticketPrice: String
    let posterStyle: String
    
    @State private var showingShareSheet = false
    @State private var showingSaveSuccess = false
    
    var body: some View {
        ScrollView {
            VStack(spacing: 30) {
                // Header
                VStack(spacing: 10) {
                    Image(systemName: "square.and.arrow.up")
                        .font(.system(size: 50))
                        .foregroundColor(.blue)
                    
                    Text("Share Your Poster")
                        .font(.title)
                        .fontWeight(.bold)
                    
                    Text("Share your concert poster with friends and fans")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                        .multilineTextAlignment(.center)
                }
                .padding(.top)
                
                // Poster Summary
                VStack(spacing: 15) {
                    Text("Poster Details")
                        .font(.headline)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    VStack(spacing: 12) {
                        DetailRow(label: "Artist", value: artistName)
                        DetailRow(label: "Venue", value: venueName)
                        DetailRow(label: "Date", value: dateFormatter.string(from: date))
                        DetailRow(label: "Time", value: timeFormatter.string(from: time))
                        if !ticketPrice.isEmpty {
                            DetailRow(label: "Price", value: "$\(ticketPrice)")
                        }
                        DetailRow(label: "Style", value: posterStyle)
                    }
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(12)
                }
                .padding(.horizontal)
                
                // Sharing Options
                VStack(spacing: 20) {
                    Text("Share Options")
                        .font(.headline)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    VStack(spacing: 15) {
                        ShareButton(
                            title: "Share via Social Media",
                            icon: "globe",
                            color: .blue
                        ) {
                            showingShareSheet = true
                        }
                        
                        ShareButton(
                            title: "Save to Photos",
                            icon: "photo",
                            color: .green
                        ) {
                            // Save to photos functionality
                        }
                        
                        ShareButton(
                            title: "Copy Link",
                            icon: "link",
                            color: .orange
                        ) {
                            // Copy link functionality
                        }
                        
                        ShareButton(
                            title: "Email Poster",
                            icon: "envelope",
                            color: .purple
                        ) {
                            // Email functionality
                        }
                    }
                }
                .padding(.horizontal)
                
                // Save to My Concerts
                VStack(spacing: 15) {
                    Button("Save to My Concerts") {
                        showingSaveSuccess = true
                    }
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(12)
                    .padding(.horizontal)
                }
                
                Spacer(minLength: 50)
            }
        }
        .navigationTitle("Share")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("Done") {
                    // Action to go back to root or main view
                }
                .font(.headline)
            }
        }
        .alert("Saved!", isPresented: $showingSaveSuccess) {
            Button("OK") { }
        } message: {
            Text("Your poster has been saved to My Concerts.")
        }
        .sheet(isPresented: $showingShareSheet) {
            ShareSheet(activityItems: [generateShareText()])
        }
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
    
    private func generateShareText() -> String {
        return """
        🎵 \(artistName) Live in Concert! 🎵
        
        📍 \(venueName)
        📅 \(dateFormatter.string(from: date))
        🕐 \(timeFormatter.string(from: time))
        \(ticketPrice.isEmpty ? "" : "💰 Tickets: $\(ticketPrice)")
        
        Created with Concertmastr
        """
    }
}

struct DetailRow: View {
    let label: String
    let value: String
    
    var body: some View {
        HStack {
            Text(label)
                .font(.subheadline)
                .foregroundColor(.secondary)
                .frame(width: 80, alignment: .leading)
            
            Text(value)
                .font(.subheadline)
                .fontWeight(.medium)
            
            Spacer()
        }
    }
}

struct ShareButton: View {
    let title: String
    let icon: String
    let color: Color
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack {
                Image(systemName: icon)
                    .font(.title2)
                    .foregroundColor(color)
                    .frame(width: 30)
                
                Text(title)
                    .font(.headline)
                    .foregroundColor(.primary)
                
                Spacer()
                
                Image(systemName: "chevron.right")
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            .padding()
            .background(Color(.systemGray6))
            .cornerRadius(12)
        }
    }
}

struct ShareSheet: UIViewControllerRepresentable {
    let activityItems: [Any]
    
    func makeUIViewController(context: Context) -> UIActivityViewController {
        let controller = UIActivityViewController(activityItems: activityItems, applicationActivities: nil)
        return controller
    }
    
    func updateUIViewController(_ uiViewController: UIActivityViewController, context: Context) {}
}

#Preview {
    NavigationStack {
        SharingView(
            artistName: "Sample Artist",
            venueName: "The Grand Hall",
            date: Date(),
            time: Date(),
            ticketPrice: "25",
            posterStyle: "Modern"
        )
    }
} 