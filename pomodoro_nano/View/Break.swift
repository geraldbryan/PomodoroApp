//
//  Break.swift
//  pomodoro_nano
//
//  Created by Gerald Bryan on 25/07/22.
//

import SwiftUI

struct Break: View {
    var body: some View {
        VStack{
            Text("Pomodoro Timer")
                .font(.title2.bold())
            GeometryReader{proxy in
                VStack( spacing: 15){
                    // Timer Ring
                    ZStack{
                        Circle()
                            .stroke(Color("green_inner").opacity(0.9), lineWidth:50
                            )
                        
                        Circle()
                            .trim(from: 0, to: 0.5)
                            .stroke(Color("Green").opacity(0.9), lineWidth:50
                            )
                            .rotationEffect(.init(degrees: -90))
                        VStack{
                            Text("05:00")
                                .font(Font.system(size:40, design: .rounded).bold())
                                .padding(5)
                                
                            Text("Break Section")
                                .foregroundColor(.black.opacity(0.5))
                        }
                        .frame(alignment: .center)
                    }
                    .padding(50)
                    .frame(height: proxy.size.width)
                    
                    
                    Text("Put all of your work! Do not dare to touch it. Strecth your body and take a rest")
                        .multilineTextAlignment(.center)
                    
                        .padding(10)
                    
                    HStack{
                        Image(systemName: "pause.circle.fill")
                            .foregroundColor(Color("Green"))
                            .font(Font.system(size:50).bold())
                    }
                    .frame(alignment: .center)
                
                    Image("break")
                        .resizable()
                        .scaledToFill()
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                
            }
        }
        .padding()
    }
}

struct Break_Previews: PreviewProvider {
    static var previews: some View {
        Break()
    }
}
