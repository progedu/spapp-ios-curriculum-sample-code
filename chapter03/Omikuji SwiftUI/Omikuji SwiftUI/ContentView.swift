//
//  ContentView.swift
//  Omikuji SwiftUI
//
//  Created by admin on 20XX/XX/XX.
//

import SwiftUI

struct ContentView: View {
    @State var btnText = "占う"
    @State var imageName = "omikuji"
    @State var rotation: Double = 0
    @State var isButtonEnabled = true
    
    var body: some View {
        VStack(
            spacing: 80
        ) {
            Text("今日の運勢を占いましょう")
                .font(.system(size: 22))
            
            Image(imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 160)
                .rotationEffect(.degrees(rotation))
            
            Button {
                imageName = "omikuji"
                isButtonEnabled = false
                
                withAnimation(.easeIn(duration: 1.0)) {
                    // アニメーション開始
                    rotation = 180
                } completion: {
                    // アニメーション完了
                    rotation = 0
                    imageName = getResultImage(score: generateRandomNumber(max: 100))
                    btnText = "もう一度"
                    isButtonEnabled = true
                }
            } label: {
                Text(btnText)
                    .frame(width: 150, height: 50)
                    .background(isButtonEnabled ? .blue : .gray.opacity(0.3))
                    .foregroundStyle(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }
            .disabled(!isButtonEnabled)
        }
    }
    
    func generateRandomNumber(min: Int = 0, max: Int) -> Int {
        return Int.random(in: min...max)
    }
    
    func getResultImage(score: Int) -> String {
        return switch score {
        case 91...100: "daikichi"
        case 71...90: "chukichi"
        case 51...70: "shoukichi"
        case 31...50: "kichi"
        case 11...30: "kyou"
        default: "daikyo"
        }
    }
}

#Preview {
    ContentView()
}
