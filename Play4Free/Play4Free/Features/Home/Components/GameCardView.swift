//
//  GameCardView.swift
//  Play4Free
//
//  Created by Selcuk Özkara on 30.01.24.
//

import SwiftUI

struct GameCardView: View {
    
    var game: Game?
    var testImage : URL = URL(string:"https://www.freetogame.com/g/540/thumbnail.jpg")!
    
    var body: some View {
        
        ZStack(alignment: .leading){
            AsyncImage(url: game?.thumbnail ?? testImage){image in
                image
                    .resizable()
                    .overlay{
                        LinearGradient(colors: [.darkgray,.gray.opacity(0)], startPoint: .bottom, endPoint: .top)
                    }
                    .frame(maxWidth: .infinity, maxHeight: 200)
                    .cornerRadius(5)
                    .padding([.leading,.trailing], 8)
                    
            } placeholder: {
                Image(systemName: "trash")
            }
            VStack{
                Spacer()
                VStack(alignment: .leading){
                    Text(game?.title ?? "Titel")
                        .font(.largeTitle)
                        .textCase(.uppercase)
                        .bold()
                        .foregroundStyle(.white)
                    HStack{
                        
                        Text(game?.genre ?? "Genre")
                            .font(.headline)
                            .bold()
                            .foregroundStyle(.white)
                        Spacer()
                        Text(game?.platform ?? "Plattform")
                            .font(.headline)
                            .bold()
                            .foregroundStyle(.white)
                    }
                    .padding(.bottom, 8)
                }
            }
            .padding([.leading,.trailing], 20)
           
        }
        .frame(maxWidth: .infinity, maxHeight: 200)
        
       
        
        
    }
}

#Preview {
    GameCardView()
}
