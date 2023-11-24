//
//  ContentView.swift
//  Math
//
//  Created by Abdulloh on 24/11/23.
//

import SwiftUI

struct ContentView: View {
    @State var questionType = "x"
    
    let questionTypes = ["x", "/", "+", "-"]
    let columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    let multiplicationQuestions = [
        "1 x ? = ?",
        "2 x ? = ?",
        "3 x ? = ?",
        "4 x ? = ?",
        "5 x ? = ?",
        "6 x ? = ?",
        "7 x ? = ?",
        "8 x ? = ?",
        "9 x ? = ?",
        "10 x ? = ?"
    ]
    
    let devisionQuestions = [
        "1 / ? = ?",
        "2 / ? = ?",
        "3 / ? = ?",
        "4 / ? = ?",
        "5 / ? = ?",
        "6 / ? = ?",
        "7 / ? = ?",
        "8 / ? = ?",
        "9 / ? = ?",
        "10 / ? = ?"
    ]
    
    let plusQuestions = [
        "1 + ? = ?",
        "2 + ? = ?",
        "3 + ? = ?",
        "4 + ? = ?",
        "5 + ? = ?",
        "6 + ? = ?",
        "7 + ? = ?",
        "8 + ? = ?",
        "9 + ? = ?",
        "10 + ? = ?"
    ]
    
    let minusQuestions = [
        "1 - ? = ?",
        "2 - ? = ?",
        "3 - ? = ?",
        "4 - ? = ?",
        "5 - ? = ?",
        "6 - ? = ?",
        "7 - ? = ?",
        "8 - ? = ?",
        "9 - ? = ?",
        "10 - ? = ?"
    ]
    
    init() {
        UISegmentedControl.appearance().selectedSegmentTintColor = UIColor(Color("green").opacity(0.7))
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)
        UISegmentedControl.appearance().backgroundColor = UIColor(.white.opacity(0.7))
    }
    
    var body: some View {
        ZStack {
            Image("background")
                .resizable()
                .ignoresSafeArea()
            
            VStack {
                Picker("Question type", selection: $questionType) {
                    ForEach(questionTypes, id: \.self) {
                        Text($0)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding(.vertical)
                
                ScrollView(showsIndicators: false) {
                    LazyVGrid(
                        columns: columns,
                        spacing: 10,
                        content: {
                            ForEach(selectedQuestion(questionType), id: \.self) { name in
                                TestCell(name: name)
                            }
                        }
                    )
                    .padding()
                }
                
            }
            .padding(.horizontal)
        }
    }
    
    func selectedQuestion(_ type: String) -> [String] {
        switch type {
        case "x":
            return multiplicationQuestions
        case "/":
            return devisionQuestions
        case "+":
            return plusQuestions
        case "-":
            return minusQuestions
        default:
            return [""]
        }
    }
}

#Preview {
    ContentView()
}

struct TestCell: View {
    let name: String
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .stroke(lineWidth: 5)
                .foregroundColor(.brown)
            
            Text(name)
                .foregroundColor(.white)
                .font(.system(size: 25, weight: .bold))
        }
        .frame(height: 150)
    }
}
