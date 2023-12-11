//
//  Home.swift
//  FlightAppUI
//
//  Created by Kant on 12/11/23.
//

import SwiftUI

struct Home: View {
    var size: CGSize
    var safeArea: EdgeInsets
    
    var body: some View {
        VStack(spacing: 0) {
            headerView()
            paymentCardsView()
        }
        .background(Color.gray)
    }
    
    // MARK: Top Header View
    @ViewBuilder
    func headerView() -> some View {
        VStack {
            Image("Logo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: size.width * 0.4)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            HStack {
                flightDetailsView(place: "Los Angeles",
                                  code: "LAS",
                                  timing: "23 Nov, 03:30")
                
                VStack(spacing: 8) {
                    Image(systemName: "chevron.right")
                        .font(.title2)
                    Text("4h 15m")
                }
                .fontWeight(.semibold)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                
                flightDetailsView(alignment: .trailing , place: "New York",
                                  code: "NYC",
                                  timing: "23 Nov, 07:15")
            }
            .padding(.top, 20)
            
            // MARK: Airplane Image View
            Image("Airplane")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 160)
                .padding(.bottom, -20)
        }
        .padding([.horizontal, .top], 15)
        .padding(.top, safeArea.top)
        .background {
            Rectangle()
                .fill(.linearGradient(colors: [
                    Color("BlueTop"),
                    Color("BlueTop"),
                    Color("BlueBottom")
                ], startPoint: .top, endPoint: .bottom))
        }
    }
    
    // MARK: Credit Cards View
    @ViewBuilder
    func paymentCardsView() -> some View {
        VStack {
            Text()
        }
    }
    
    // MARK: Flight Details
    @ViewBuilder
    func flightDetailsView(alignment: HorizontalAlignment = .leading, place: String, code: String, timing: String) -> some View {
        
        VStack(alignment: alignment, spacing: 6) {
            Text(place)
                .font(.caption)
                .foregroundColor(.white.opacity(0.8))
            Text(code)
                .font(.title)
                .foregroundColor(.white)
            Text(timing)
                .font(.caption)
                .foregroundColor(.white.opacity(0.8))
        }
        .frame(maxWidth: .infinity)
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
