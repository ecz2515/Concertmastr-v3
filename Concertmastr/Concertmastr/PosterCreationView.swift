//
//  PosterCreationView.swift
//  Concertmastr
//
//  Created by Evan Chen on 6/18/25.
//

import SwiftUI

struct PosterCreationView: View {
    @State private var artistName = ""
    @State private var venueName = ""
    @State private var date = Date()
    @State private var time = Date()
    @State private var ticketPrice = ""
    @State private var posterStyle = "Modern"
    
    let posterStyles = ["Modern", "Vintage", "Minimalist", "Rock", "Jazz"]
    
    var body: some View {
        ScrollView {
            VStack(spacing: 25) {
                // Header
                VStack(spacing: 10) {
                    Image(systemName: "paintbrush.fill")
                        .font(.system(size: 40))
                        .foregroundColor(.purple)
                    
                    Text("Create Your Poster")
                        .font(.title)
                        .fontWeight(.bold)
                }
                .padding(.top)
                
                // Form Fields
                VStack(spacing: 20) {
                    // Artist Name
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Artist/Band Name")
                            .font(.headline)
                        TextField("Enter artist name", text: $artistName)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                    }
                    
                    // Venue
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Venue")
                            .font(.headline)
                        TextField("Enter venue name", text: $venueName)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                    }
                    
                    // Date and Time
                    HStack(spacing: 20) {
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Date")
                                .font(.headline)
                            DatePicker("", selection: $date, displayedComponents: .date)
                                .datePickerStyle(CompactDatePickerStyle())
                        }
                        
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Time")
                                .font(.headline)
                            DatePicker("", selection: $time, displayedComponents: .hourAndMinute)
                                .datePickerStyle(CompactDatePickerStyle())
                        }
                    }
                    
                    // Ticket Price
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Ticket Price")
                            .font(.headline)
                        TextField("Enter ticket price", text: $ticketPrice)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .keyboardType(.decimalPad)
                    }
                    
                    // Poster Style
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Poster Style")
                            .font(.headline)
                        Picker("Style", selection: $posterStyle) {
                            ForEach(posterStyles, id: \.self) { style in
                                Text(style).tag(style)
                            }
                        }
                        .pickerStyle(SegmentedPickerStyle())
                    }
                }
                .padding(.horizontal)
                
                // Preview Button
                NavigationLink(destination: PreviewView(
                    artistName: artistName,
                    venueName: venueName,
                    date: date,
                    time: time,
                    ticketPrice: ticketPrice,
                    posterStyle: posterStyle
                )) {
                    HStack {
                        Image(systemName: "eye.fill")
                            .font(.title2)
                        Text("Preview Poster")
                            .font(.headline)
                    }
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.purple)
                    .cornerRadius(12)
                }
                .disabled(artistName.isEmpty || venueName.isEmpty)
                .opacity(artistName.isEmpty || venueName.isEmpty ? 0.6 : 1.0)
                .padding(.horizontal)
                
                Spacer(minLength: 50)
            }
        }
        .navigationTitle("Create Poster")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        PosterCreationView()
    }
} 