//
//  detailView.swift
//  quiz
//
//  Created by StudentAM on 4/11/24.
//


import SwiftUI

//creating a struct where we will store the questions and answers
struct Question{
    var question: String
    var answer : String
    var options : [String]
}


struct detailView: View {
    
//    creating a variable to store the current index of the array we are on
    @State var currentQuest : Int = 0
//    creating a variable to store the score
    @State var count: Int = 0
//    creating a variable thats an array of structs
    @State private var questions = [
      Question(question: "Where do strawberries grow?", answer: "Bush", options: ["Cherry Blossom Tree", "Palm tree", "With tulips","Bush"]),
      Question(question: "Where do watermelons grow?", answer: "Bush", options: ["Cherry Blossom Tree", "Palm tree", "With tulips","Bush"]),
      Question(question: "What is the most common found fruit?", answer: "Bananas", options: ["Apples", "Bananas","Strawberries","Pears"]),
      Question(question: "Which of the following isn't red?", answer: "Kiwis", options: ["Tomato","Apple","Kiwis","Strawberry"]),
      Question(question: "Which of the following isn’t part of the rose family?", answer: "Bananas", options: ["Bananas","Apples","Peaches","Raspberry"]),
      Question(question: "Are pumpkins a fruit or a vegetable?", answer: "Fruit", options: ["Fruit","Vegetable","Both","Neither"]),
      Question(question: "Which fruit did ancient Egyptians consider to be a sacred fruit?", answer: "Melon", options: ["Apples","Dragonfruit","Mangos","Melon"]),
      Question(question: "Where did apples originate from?", answer: "Kazakhstan", options: ["Kazakhstan","America", "Mexico", "El Salvador"]),
      Question(question: "Which one contains more sugar?", answer: "Lemons", options: ["Strawberries","Lemons", "None contain sugar", "They contain the same amount"]),
      Question(question: "Which one isn’t a raspberry color?", answer: "green", options: ["white", "yellow", "black", "green"])
    ]

    
    var body: some View {
        NavigationView{
            ZStack {
                Image("fruitPic")
                    .frame(width:.infinity)
                VStack{
                    Text("Score: \(count)")
                        
                        .font(.system(size:35))
                    
                    Text(questions[currentQuest].question)
                        .padding()
                        .font(.system(size:25))
                        .frame(width:300, height:180)
                        .background(Color.white)
                        .cornerRadius(9)
                    
                    Spacer()
                        .frame(height:40)
                    VStack{
                        //                    for loop to create a button for each option
                        ForEach(questions[currentQuest].options.indices){opt in
//                            currentQuest is used sort of like the index
//                            we keep on updating by adding one to the variable everytime the button is clicked.
                            Button("\(questions[currentQuest].options[opt])", action: {
//                                function used to check the button clicked  and seeing if its correct.
                                checkAnswer(opt: opt)
                                
                            })
                            .padding()
                            .font(.system(size:20))

                            .frame(width:300, height:80)
                            .background(Color.white)
                            .cornerRadius(9)
                            .foregroundColor(.black)
                            
                            
                        }
                        
                        
                        
                    }
//                    If you are in the last question that display the link to got to the next page
//                    we know we are on the last question when currentQuest is equal to nine since the length of the questions array is nine
                    if currentQuest == 9{
//                        we are storing the count variable into the score variable from the next page
                        NavigationLink(destination: finishPage(score: count),  label: {
                            Text("FInish Game!")
                        })
                            .frame(width: 100, height: 80)
                            .background(Color.orange.opacity(0.4))
                            .foregroundColor(.white)
                            .font(.system(size:30))
                            .cornerRadius(10)
                    }
                }
            }
            .ignoresSafeArea()
                }
            }
//    function to check if the answer is correct
//    Opt is like the index of the array
    func checkAnswer(opt: Int){
//        your checking if the option clicked is the same as the answer
        if questions[currentQuest].options[opt] == questions[currentQuest].answer{
//            if it is add one to the count
            count += 1
        }
//        the array only has 10 questions so the index is 9
//        so only add one to the currentQuest if it is less than 9
        if currentQuest < 9{
            currentQuest += 1
        }
    }
}




#Preview {
    detailView()
}
