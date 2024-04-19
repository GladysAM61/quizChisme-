//
//  ContentView.swift
//  quiz
//
//  Created by StudentAM on 4/11/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            ZStack {
//                making the background a pic i named fresas
                Image("fresas")
                    .resizable()
                    .ignoresSafeArea()
                    .frame(width:.infinity)
                VStack{
                    Text("Quiz Time!!")
                        .font(.system(size:50))
                    Spacer()
                        .frame(height: 280)
                    
//                    navigation link to take you to the quiz
//                    i hid the back button using .navigationBarBackButtonHidden(true)
                    NavigationLink(destination: detailView().navigationBarBackButtonHidden(true), label: {
                        Text("Start")
                            .frame(width: 100, height: 80)
                            .background(Color.pink.opacity(0.25))
                            .foregroundColor(.white)
                            .font(.system(size:30))
                            .cornerRadius(10)
                    })
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
