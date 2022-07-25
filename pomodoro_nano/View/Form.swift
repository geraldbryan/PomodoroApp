//
//  Form.swift
//  pomodoro_nano
//
//  Created by Gerald Bryan on 25/07/22.
//

import SwiftUI

func ??<T>(lhs: Binding<Optional<T>>, rhs: T) -> Binding<T> {
    Binding(
        get: { lhs.wrappedValue ?? rhs },
        set: { lhs.wrappedValue = $0 }
    )
}

struct Form: View {
    
    @State private var name: String?
    @State private var selection = "Article"
    let colors = ["Article", "Coding", "Design", "Other"]
    
    var body: some View {
        VStack{
            Text("Hello \(name ?? "New Task")")
                .padding(10)
            
            VStack{
                TextField("Enter Your Task Name", text: $name ?? "")
                    .textFieldStyle(.roundedBorder)
                    .font(Font.system(size:15))
                    .padding(.init(top: 0, leading: 0, bottom: 10, trailing: 0))
                
                TextField("Enter Your Target Time to Finish Task (In Mins)", text: $name ?? "")
                    .textFieldStyle(.roundedBorder)
                    .font(Font.system(size:15))
                    .padding(.init(top: 0, leading: 0, bottom: 10, trailing: 0))
                VStack(alignment: .leading){
                    Text("Task Type ")
                        .font(Font.system(size:15).bold())
                        .multilineTextAlignment(.leading)
                        .frame(maxWidth: .infinity, alignment: .topLeading)
                    
                    Picker("Select a paint color", selection: $selection) {
                                    ForEach(colors, id: \.self) {
                                        Text($0)
                                    }
                                }
                    .pickerStyle(.segmented)
                }
                .padding()
                .frame(alignment: .topLeading)
                
                Button(action: {
                                // Closure will be called once user taps your button
                                print("abc")
                            }) {
                                Text("Create")
                                    .frame(minWidth: 0, maxWidth: .infinity)
                                    .font(.system(size: 18).bold())
                                                .padding()
                                                .foregroundColor(.black)
                                                .overlay(
                                                    RoundedRectangle(cornerRadius: 25)
                                                        .stroke(Color.white, lineWidth: 2))
                            }
                            .background(Color("Green")) // If you have this
                                .cornerRadius(25)
                            
            }
            .padding(10)
            
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
    }
        
}

struct Form_Previews: PreviewProvider {
    static var previews: some View {
        Form()
    }
}
