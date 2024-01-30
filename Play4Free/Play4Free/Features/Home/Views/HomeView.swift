//
//  HomeView.swift
//  Play4Free
//
//  Created by Selcuk Özkara on 30.01.24.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var gameViewModel = GamesViewModel()
    
    var body: some View {
        NavigationStack{
            ScrollView {
                ForEach(gameViewModel.games, id: \.id){ game in
                    GameCardView(game: game)
                }
            }
            .padding(.top, -30)
            .background(.bgGray)
            .toolbar{
                
                ToolbarItem(placement: .principal){
                    HStack{
                        Image("logo")
                          .resizable()
                          .frame(width: 30, height: 40, alignment: .center)
                          
                        Text("Play4Free")
                            .font(.title)
                            .textCase(.uppercase)
                            .bold()
                            .foregroundStyle(.white)
                    }
                }
                
            }
            .toolbarBackground(Color.bgGray, for: .navigationBar)
        }
        .ignoresSafeArea(.all)
    }
}

#Preview {
    HomeView()
}
