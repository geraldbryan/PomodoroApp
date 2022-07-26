//
//  Home.swift
//  pomodoro_nano
//
//  Created by Gerald Bryan on 25/07/22.
//

import SwiftUI

struct Home: View {
    
    var body: some View {
        List{
            Section(header: Text("Current Task")){
                    HStack{
                        Image(systemName: "book.fill")
                            .font(Font.system(size:40).bold())
                            .padding(.init(top: 0, leading: 15, bottom: 0, trailing: 0))
                        
                        VStack(alignment: .leading){
                            Text("Hello World")
                                .font(Font.system(size:20).bold())
                                .padding(.init(top: 0, leading: 0, bottom: 1, trailing: 0))
                            
                            Text("1 of 2 Sections")
                                .font(.subheadline)
                                .foregroundColor(.black.opacity(0.7))
                            
                        }
                        .padding()
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .listRowBackground(Color.clear)
                    .listRowSeparator(.hidden)
                    .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 6, trailing: 0))
                    .background(RoundedRectangle(cornerRadius: 12).stroke(Color("Orange"),lineWidth: 5))
            }.overlay(NavigationLink(destination: TimerView(), label: {
                EmptyView()
            })
                .opacity(0.0))
                
            
            Section(header: Text("Upcoming Task")){
                HStack{
                    Image(systemName: "book.fill")
                        .font(Font.system(size:40).bold())
                        .padding(.init(top: 0, leading: 15, bottom: 0, trailing: 0))
                    
                    VStack(alignment: .leading){
                        Text("Hello World")
                            .font(Font.system(size:20).bold())
                            .padding(.init(top: 0, leading: 0, bottom: 1, trailing: 0))
                        
                        Text("1 of 2 Sections")
                            .font(.subheadline)
                            .foregroundColor(.black.opacity(0.7))
                        
                    }
                    .padding()
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(RoundedRectangle(cornerRadius: 12).stroke(Color("Blue"),lineWidth: 5))
                .listRowBackground(Color.clear)
                .listRowSeparator(.hidden)
                .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 6, trailing: 0))
            }.overlay(NavigationLink(destination: TimerView(), label: {
                EmptyView()
            })
                .opacity(0.0))
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
            .previewInterfaceOrientation(.portrait)
    }
}
