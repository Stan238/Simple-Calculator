    //
    //  ContentView.swift
    //  Simple Calculator
    //
    //  Created by Stan U on 6/4/24.
    //

import SwiftUI

struct ContentView: View {
    @State private var shownValue : String = "0"
    @State private var firstNumber : Double = 0
    @State private var secondNumber : Double = 0
    @State private var mathSign: String = ""
    var body: some View {
        VStack {
            Spacer()
            Text(shownValue)
                .font(.largeTitle)
                .foregroundStyle(.green)
                .padding()
                .frame(maxWidth: 440, alignment: .trailing)
                .background(.black)
            Spacer()
            HStack(alignment: .center, spacing: 20) {
                let arithmSign: [String] = [" ", " ", "+/-", "C"]
                ForEach(arithmSign.indices, id: \.self) { index in
                    Button(arithmSign[index]){
                        shownValue = "0"
                    }
                }
                .buttonStyle(spetialButton())
            }
            .padding()
            HStack(alignment: .center) {
                LazyVGrid(columns:Array(repeating: GridItem(.fixed(90)), count: 3) ){
                    let zero = "0"
                    let number1: [String] = [ "1", "2","3", "4", "5", "6" , "7", "8" , "9", "0" ]
                    ForEach(number1.indices, id: \.self) { index in
                        Button(number1[index]) {
                            if shownValue != zero {
                                shownValue += number1[index]
                            } else {shownValue = number1[index]}
                        }
                    }
                    Button(".") {
                        if !shownValue.contains(Character(".")) {
                            shownValue += "."
                        }
                    }
                    Button("=") {
                        shownValue = "0"
                    }
                }
                .buttonStyle(numberButton())
                .frame(maxWidth: 350, alignment: .center)
                VStack{
                    let arithmSign: [String] = ["+", "-", "*", "/"]
                    ForEach(arithmSign.indices, id: \.self) { index in
                        Button(arithmSign[index]){
                            firstNumber = Double(shownValue) ?? 0
                            mathSign = arithmSign[index]
                        }
                    }
                }
                .buttonStyle(arithmeticButton())
            }
            Spacer()
        }
        .frame(maxWidth: 500, alignment: .center)
        .background(Color.black)
        .clipShape(RoundedRectangle(cornerRadius: 20.0))
        .padding()
        .background(.gray)
    }

}
    // Button style
    //  1. For number
struct numberButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.largeTitle)
            .frame(width: 49, height: 49)
            .padding()
            .background(.lightOrange)
            .foregroundStyle(.black)
            .clipShape(RoundedRectangle(cornerRadius: 20.0))
            //            .shadow(color: .gray, radius: 2, x: 2, y: 2)
            .scaleEffect(configuration.isPressed ? 1.2 : 1)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
    }
}
    // 2. For Arithmetick
struct arithmeticButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.largeTitle)
            .frame(width: 49, height: 49)
            .padding()
            .background(.gray)
            .foregroundStyle(.black)
            .clipShape(RoundedRectangle(cornerRadius: 20.0))
            //            .shadow(color: .gray, radius: 2, x: 2, y: 2)
            .scaleEffect(configuration.isPressed ? 1.2 : 1)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
    }
}
    //    3. For spacial
struct spetialButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.largeTitle)
            .frame(width: 49, height: 49)
            .padding()
            .background(.brown)
            .foregroundStyle(.black)
            .clipShape(RoundedRectangle(cornerRadius: 20.0))
            //            .shadow(color: .gray, radius: 2, x: 2, y: 2)
            .scaleEffect(configuration.isPressed ? 1.2 : 1)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
    }
}


#Preview {
    ContentView()
}
