//
//  ContentView.swift
//  pomodoro_nano
//
//  Created by Gerald Bryan on 25/07/22.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @EnvironmentObject var pomodoroModel: PomodoroModel
    @State var isPresenting = false
    
    var body: some View{
        NavigationView{
            Home()
                .navigationBarTitle("Task")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing){
                        Button(action: {
                            isPresenting = true
                        }) {
                            Image(systemName:"square.and.pencil")
                            NavigationLink(destination: Form(), isActive: $isPresenting) { EmptyView() }
                        }
                        
                        .foregroundColor(Color("Green"))
                        .font(Font.system(size:16).bold())
                    }
                }
        }.accentColor(Color("Green"))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
