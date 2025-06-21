//
//  HomeView.swift
//  Concertmastr
//
//  Created by Evan Chen on 6/21/25.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 40) {
                    // Header Section
                    VStack(spacing: 20) {
                        Image(systemName: "music.note")
                            .font(.system(size: 80))
                            .foregroundColor(.blue)
                        
                        VStack(spacing: 8) {
                            Text("Welcome to Concertmastr")
                                .font(.largeTitle)
                                .fontWeight(.bold)
                                .multilineTextAlignment(.center)
                            
                            Text("Create stunning concert posters in minutes")
                                .font(.title3)
                                .foregroundColor(.secondary)
                                .multilineTextAlignment(.center)
                        }
                    }
                    .padding(.top, 20)
                    
                    // Quick Actions
                    VStack(spacing: 20) {
                        Text("Quick Actions")
                            .font(.headline)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        VStack(spacing: 15) {
                            NavigationLink(destination: PosterCreationView()) {
                                QuickActionCard(
                                    title: "Create New Poster",
                                    subtitle: "Design your concert poster",
                                    icon: "plus.circle.fill",
                                    color: .blue
                                )
                            }
                            
                            Button(action: {
                                // Action for viewing recent posters
                            }) {
                                QuickActionCard(
                                    title: "Recent Posters",
                                    subtitle: "View your latest creations",
                                    icon: "clock.fill",
                                    color: .green
                                )
                            }
                            
                            Button(action: {
                                // Action for templates
                            }) {
                                QuickActionCard(
                                    title: "Browse Templates",
                                    subtitle: "Start with a template",
                                    icon: "rectangle.stack.fill",
                                    color: .purple
                                )
                            }
                        }
                    }
                    .padding(.horizontal)
                    
                    // Features Section
                    VStack(spacing: 20) {
                        Text("Features")
                            .font(.headline)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        VStack(spacing: 15) {
                            FeatureRow(
                                icon: "paintbrush.fill",
                                title: "Custom Design",
                                description: "Multiple poster styles and customization options"
                            )
                            
                            FeatureRow(
                                icon: "eye.fill",
                                title: "Live Preview",
                                description: "See your poster come to life as you create it"
                            )
                            
                            FeatureRow(
                                icon: "square.and.arrow.up",
                                title: "Easy Sharing",
                                description: "Share to social media, save to photos, or email"
                            )
                        }
                    }
                    .padding(.horizontal)
                    
                    Spacer(minLength: 50)
                }
            }
            .navigationTitle("Home")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

struct QuickActionCard: View {
    let title: String
    let subtitle: String
    let icon: String
    let color: Color
    
    var body: some View {
        HStack(spacing: 15) {
            Image(systemName: icon)
                .font(.system(size: 30))
                .foregroundColor(color)
                .frame(width: 50)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.headline)
                    .foregroundColor(.primary)
                
                Text(subtitle)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            
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

struct FeatureRow: View {
    let icon: String
    let title: String
    let description: String
    
    var body: some View {
        HStack(spacing: 15) {
            Image(systemName: icon)
                .font(.title2)
                .foregroundColor(.blue)
                .frame(width: 30)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.subheadline)
                    .fontWeight(.medium)
                
                Text(description)
                    .font(.caption)
                    .foregroundColor(.secondary)
                    .fixedSize(horizontal: false, vertical: true)
            }
            
            Spacer()
        }
    }
}

#Preview {
    HomeView()
}