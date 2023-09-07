//
//  AcceptTripView.swift
//  UberSwiftUITutorial
//
//  Created by Kant on 2023/09/07.
//

import SwiftUI
import MapKit

struct AcceptTripView: View {
    
    @State private var region: MKCoordinateRegion
    
    init() {
        let center = CLLocationCoordinate2D(latitude: 37.3346, longitude: -122.0090)
        let span = MKCoordinateSpan(latitudeDelta: 0.025, longitudeDelta: 0.025)
        self.region = MKCoordinateRegion(center: center, span: span)
    }
    
    var body: some View {
        VStack {
            Capsule()
                .foregroundColor(Color(.systemGray5))
                .frame(width: 48, height: 6)
                .padding(.top, 8)
            
            // would you like to pickup view
            VStack {
                HStack {
                    Text("Would you like to pickup this passenger")
                        .font(.headline)
                        .fontWeight(.semibold)
                        .lineLimit(2)
                        .multilineTextAlignment(.leading)
                        .frame(height: 44)
                    
                    Spacer()
                    
                    VStack {
                        Text("10")
                            .bold()
                        Text("min")
                            .bold()
                    }
                    .frame(width: 56, height: 56)
                    .foregroundColor(.white)
                    .background(Color(.systemBlue))
                    .cornerRadius(10)
                }
            }
            .padding()

        }
        
        // user info view
        VStack {
            HStack {
                Image("jaejun")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 80, height: 80)
                    .clipShape(Circle())
                
                VStack(alignment: .leading, spacing: 4) {
                    Text("JAEJUN")
                        .fontWeight(.bold)
                    HStack {
                        Image(systemName: "star.fill")
                            .foregroundColor(Color(.systemYellow))
                            .imageScale(.small)
                        
                        Text("4.8")
                            .font(.footnote)
                            .foregroundColor(.gray)
                    }
                }
                
                Spacer()
                
                VStack(spacing: 6) {
                    Text("Earnings")
                    Text("$22.04")
                        .font(.system(size: 24, weight: .semibold))
                }
            }
            
            Divider()
        }
        .padding()
        
        // pickup location info view
        VStack {
            // trip location info view
            HStack {
                // address info
                VStack(alignment: .leading, spacing: 6) {
                    Text("Apple Campus")
                        .font(.headline)
                    Text("Infinite Loop1, Santa Clara County")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                
                Spacer()
                
                // distance
                VStack {
                    Text("5.2")
                        .font(.headline)
                        .fontWeight(.semibold)
                    Text("mi")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
            }
            .padding(.horizontal)
            
            // map
            Map(coordinateRegion: $region)
                .frame(height: 220)
                .cornerRadius(10)
                .shadow(color: .black.opacity(0.6), radius: 10)
                .padding()
            
            //divider
            Divider()
        }
        
        // action buttons
        HStack {
            Button {
                
            } label: {
                Text("Reject")
                    .font(.headline)
                    .fontWeight(.bold)
                    .padding()
                    .frame(width: (UIScreen.main.bounds.width / 2) - 32, height: 56)
                    .background(Color(.systemRed))
                    .cornerRadius(10)
                    .foregroundColor(.white)
            }
            
            Spacer()
            
            Button {
                
            } label: {
                Text("Accept")
                    .font(.headline)
                    .fontWeight(.bold)
                    .padding()
                    .frame(width: (UIScreen.main.bounds.width / 2) - 32, height: 56)
                    .background(Color(.systemBlue))
                    .cornerRadius(10)
                    .foregroundColor(.white)
            }
        }
        .padding(.top)
        .padding(.horizontal)
    }
}

struct AcceptTripView_Previews: PreviewProvider {
    static var previews: some View {
        AcceptTripView()
    }
}
