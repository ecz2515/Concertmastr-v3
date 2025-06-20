//
//  AccountView.swift
//  Concertmastr
//
//  Created by Evan Chen on 6/18/25.
//

import SwiftUI

struct AccountView: View {
    @State private var notificationsEnabled = true
    @State private var darkModeEnabled = false
    @State private var autoSaveEnabled = true
    
    var body: some View {
        NavigationStack {
            List {
                // Profile Section
                Section {
                    HStack {
                        Image(systemName: "person.circle.fill")
                            .font(.system(size: 60))
                            .foregroundColor(.blue)
                        
                        VStack(alignment: .leading, spacing: 4) {
                            Text("John Doe")
                                .font(.headline)
                            Text("john.doe@example.com")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }
                        
                        Spacer()
                        
                        Button("Edit") {
                            // Edit profile action
                        }
                        .font(.caption)
                        .foregroundColor(.blue)
                    }
                    .padding(.vertical, 8)
                }
                
                // Settings Section
                Section("Preferences") {
                    Toggle("Notifications", isOn: $notificationsEnabled)
                    
                    Toggle("Dark Mode", isOn: $darkModeEnabled)
                    
                    Toggle("Auto Save", isOn: $autoSaveEnabled)
                }
                
                // Account Section
                Section("Account") {
                    NavigationLink(destination: Text("Subscription Settings")) {
                        HStack {
                            Image(systemName: "creditcard")
                                .foregroundColor(.blue)
                            Text("Subscription")
                        }
                    }
                    
                    NavigationLink(destination: Text("Privacy Settings")) {
                        HStack {
                            Image(systemName: "lock")
                                .foregroundColor(.blue)
                            Text("Privacy")
                        }
                    }
                    
                    NavigationLink(destination: Text("Help & Support")) {
                        HStack {
                            Image(systemName: "questionmark.circle")
                                .foregroundColor(.blue)
                            Text("Help & Support")
                        }
                    }
                }
                
                // About Section
                Section("About") {
                    NavigationLink(destination: Text("Terms of Service")) {
                        HStack {
                            Image(systemName: "doc.text")
                                .foregroundColor(.blue)
                            Text("Terms of Service")
                        }
                    }
                    
                    NavigationLink(destination: Text("Privacy Policy")) {
                        HStack {
                            Image(systemName: "hand.raised")
                                .foregroundColor(.blue)
                            Text("Privacy Policy")
                        }
                    }
                    
                    HStack {
                        Image(systemName: "info.circle")
                            .foregroundColor(.blue)
                        Text("Version")
                        Spacer()
                        Text("1.0.0")
                            .foregroundColor(.secondary)
                    }
                }
                
                // Sign Out Section
                Section {
                    Button("Sign Out") {
                        // Sign out action
                    }
                    .foregroundColor(.red)
                }
            }
            .navigationTitle("Account")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

#Preview {
    AccountView()
} 