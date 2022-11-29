//
//  ContentView.swift
//  Travelapp
//
//  Created by Pratama Pangestu on 29/11/22.
//

import SwiftUI

struct ContentView: View {
    @State private var isAlert = false
    @State private var isModal = false
    // MARK: - Properties
    var body: some View {
        ZStack {
            Image("go-to-beach")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .overlay {
                    Color .black
                        .opacity(0.4)
                }
                .ignoresSafeArea()
            
            VStack(alignment: .leading) {
                header
                Spacer()
                title
                    .padding(.bottom, 250)
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
extension ContentView {
    private var header: some View {
        HStack(alignment: .center, spacing: 100) {
            Button {
                isAlert.toggle()
            } label: {
                Image(systemName: "cloud.sun.fill")
                    .renderingMode(.original)
                    .font(.system(size: 24))
                    .background {
                        Circle()
                            .frame(width: 40, height: 40)
                            .foregroundColor(.black)
                            .opacity(0.4)
                    }
            }.alert(isPresented: $isAlert) {
                Alert(title: Text("Not yet available"), message: Text("Currently on active development"), dismissButton: .default(Text("OK")))
            }
            
            Text("Travel")
                .font(.system(.title, design: .rounded))
                .foregroundColor(.white)
                .padding(.vertical, 22)
            
            Button {
                isModal.toggle()
            } label: {
                Image(systemName: "cart.badge.plus")
                    .renderingMode(.original)
                    .font(.system(size: 24))
                    .foregroundColor(.white)
                    .background{
                        Circle()
                            .frame(width: 40, height: 40)
                            .foregroundColor(.black)
                            .opacity(0.4)
                    }
            }.sheet(isPresented: $isModal) {
                HStack {
                    Text("Pink Beach, Flores")
                        .font(.system(size: 20, weight: .heavy, design: .rounded))
                        .foregroundColor(.black)
                    Spacer()
                    
                    Image(systemName: "star.fill")
                        .renderingMode(.original)
                        .foregroundColor(.yellow)
                        .padding(.trailing, 0)
                    
                    Text("4.6")
                        .font(.system(size: 18, weight: .semibold, design: .rounded))
                        .foregroundColor(.black)
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 20)
                .padding(.top, 20)
                
                HStack {
                    DetilModal(title: "Walk", symbol: "figure.walk.motion", symbolColor: .green)
                    DetilModal(title: "Food", symbol: "fork.knife.circle.fill", symbolColor: .orange)
                    DetilModal(title: "Stays", symbol: "house.fill", symbolColor: .blue)
                    DetilModal(title: "Ride", symbol: "sailboat.fill", symbolColor: .purple)
                }
                .padding(.bottom, 30)
                .padding(.horizontal, 20)
                
                VStack(alignment: .leading, spacing: 10) {
                    Text("About Destination")
                        .font(.system(size: 20, weight: .semibold, design: .rounded))
                        .foregroundColor(.black)
                        .padding(.bottom, 10)
                    
                    Text("Pink Beach, or Pantai Merah, as it aptly named, is one of seven pink beaches on the planet. This was awesome")
                        .font(.system(size: 20, weight: .medium, design: .rounded))
                        .foregroundColor(.black)
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 40)
                
                
                HStack {
                    Text("$81,39")
                        .font(.system(size: 20, weight: .heavy))
                        .foregroundColor(.blue)
                    Spacer()
                    
                    Link(destination: URL(string: "https://www.notion.so/p7atama/Pratama-Pangestu-5a51aaae67dd46428db32bb07f227a9f")! ) {
                        
                        HStack(alignment: .center) {
                            Image(systemName: "bag")
                                .font(.system(size: 20))
                                .foregroundColor(.white)
                            
                            Text("Join Tour")
                                .font(.system(size: 20, weight: .medium, design: .rounded))
                                .foregroundColor(.white)
                        }
                        .padding(.vertical, 10)
                        .padding(.horizontal, 20)
                        .background{
                            LinearGradient(colors: [.indigo, .purple], startPoint: .topLeading, endPoint: .bottomTrailing)
                        }
                        .cornerRadius(30)
                    }
                }
                .padding(.horizontal, 20)
                .presentationDetents([.medium, .fraction(0.6)])
            }
        }
    }
}

extension ContentView {
    private var title: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Start your\nAdventure\nand\nGo\nTravel Now")
                .font(.system(size: 50, weight: .heavy, design: .rounded))
                .foregroundColor(.white)
            Text("Discover local destinations beauty with\nBlue sky and travel with pride.")
                .font(.system(size: 20, weight: .medium, design: .rounded))
                .foregroundColor(.white)
        }
    }
}

struct DetilModal: View {
    var title: String
    var symbol: String
    var symbolColor: Color
    
    var body: some View {
        VStack {
            Image(systemName: symbol)
                .font(.largeTitle)
                .foregroundColor(symbolColor)
            
            Text(title)
                .font(.system(size: 15, weight: .regular, design: .rounded))
                .foregroundColor(.black)
                .padding(.top, 8)
        }
        .frame(minWidth: 10, maxWidth: .infinity, maxHeight: 50)
        .padding(.vertical, 25)
        .background(.cyan .opacity(0.1))
    }
}
