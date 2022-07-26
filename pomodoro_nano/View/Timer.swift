//
//  Home.swift
//  pomodoro_nano
//
//  Created by Gerald Bryan on 25/07/22.
//

import SwiftUI

struct Timer: View {
    var body: some View {
            VStack{
                GeometryReader{proxy in
                    VStack( spacing: 15){
                        // Timer Ring
                        ZStack{
                            Circle()
                                .stroke(Color("orange_inner").opacity(0.9), lineWidth:50
                                )
                            
                            Circle()
                                .trim(from: 0, to: 0.5)
                                .stroke(Color("Orange").opacity(0.9), lineWidth:50
                                )
                                .rotationEffect(.init(degrees: -90))
                            VStack{
                                Text("04:00")
                                    .font(Font.system(size:40, design: .rounded).bold())
                                    .padding(5)
                                
                                Text("2 of 4 Sections")
                                    .foregroundColor(.black.opacity(0.5))
                            }
                            .frame(alignment: .center)
                        }
                        .padding(50)
                        .frame(height: proxy.size.width)
                        
                        
                        Text("Let’s stay focus and focus  on your work for this 25 minutes ")
                            .multilineTextAlignment(.center)
                        
                            .padding(10)
                        
                        HStack{
                            Image(systemName: "pause.circle.fill")
                                .foregroundColor(Color("Orange"))
                                .font(Font.system(size:50).bold())
                            Image(systemName: "speaker.circle.fill")
                                .foregroundColor(Color("Orange"))
                                .font(Font.system(size:50).bold())
                        }
                        .frame(alignment: .center)
                        
                        Image("task")
                            .resizable()
                            .scaledToFill()
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                }
            }
            .padding()
            .navigationBarTitle("Pomodoro Timer", displayMode: .inline)
        }
    }

struct Timer_Previews: PreviewProvider {
    static var previews: some View {
        Timer()
    }
}
