//
//  finishPage.swift
//  quiz
//
//  Created by StudentAM on 4/11/24.
//

import SwiftUI

struct finishPage: View {
//    created a variable thats going tp store the count
    @State var score: Int
    
    var body: some View {
        NavigationView{
            ZStack {
                //      making the background a pic i named fresas
                Image("fresas")
                    .resizable()
                    .ignoresSafeArea()
                VStack{
                    Text("Congratulations you have finished this Quiz!")
                        .font(.system(size:50))
                        .foregroundColor(.pink.opacity(0.4))
                    Spacer()
                        .frame(height:290)
//                    displaying the count by showing the score 
                    Text("You got \(score) out of 10!")
                        .font(.system(size:30))
                        .foregroundColor(.pink.opacity(0.85))
                    NavigationLink(destination: detailView().navigationBarBackButtonHidden(true), label: {
                        Text("Play Again!")
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
    finishPage(score: 9)
}
