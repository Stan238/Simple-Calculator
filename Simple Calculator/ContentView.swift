    //
    //  ContentView.swift
    //  Simple Calculator
    //
    //  Created by Stan U on 6/4/24.
    //

import SwiftUI

struct ContentView: View {
    @State private var shownValue : String = "0"
    var body: some View {
        VStack {
            Spacer()
            Text(shownValue)
                .font(.largeTitle)
                .foregroundStyle(.green)
                .padding()
                .frame(maxWidth: 700, alignment: .trailing)
                .background(.black)

            Spacer()
            HStack {
                Button(" "){}
                Button("+ / -"){}
                Button("AC"){}
                Button("!"){}
            }
            .padding()
            .buttonStyle(spetialButton())
            HStack(alignment: .center) {
                LazyVGrid(columns:Array(repeating: GridItem(.fixed(100)), count: 3) ){
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
                        shownValue += "."
                    }
                    Button("=") {
                        shownValue = "0"
                    }
                }
                .buttonStyle(numberButton())
                VStack{
                    Button("+"){}
                    Button("-"){}
                    Button("*"){}
                    Button("/"){}
                }
                .padding()
                .buttonStyle(arithmeticButton())
            }
            .padding()
            Spacer()
        }
        .background(.gold)
    }

}
    // Button style
    //  1. For number
struct numberButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.largeTitle)
            .frame(width: 70, height: 70)
            .padding()
            .background(.lightOrange)
            .foregroundStyle(.black)
            .clipShape(RoundedRectangle(cornerRadius: 40.0))
            .shadow(color: .gray, radius: 2, x: 2, y: 2)
            .scaleEffect(configuration.isPressed ? 1.2 : 1)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
    }
}
    // 2. For Arithmetick
struct arithmeticButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.largeTitle)
            .frame(width: 70, height: 70)
            .padding()
            .background(.gray)
            .foregroundStyle(.black)
            .clipShape(RoundedRectangle(cornerRadius: 40.0))
            .shadow(color: .gray, radius: 2, x: 2, y: 2)
            .scaleEffect(configuration.isPressed ? 1.2 : 1)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
    }
}
    //    3. For spacial
struct spetialButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.largeTitle)
            .frame(width: 70, height: 70)
            .padding()
            .background(.brown)
            .foregroundStyle(.black)
            .clipShape(RoundedRectangle(cornerRadius: 40.0))
            .shadow(color: .gray, radius: 2, x: 2, y: 2)
            .scaleEffect(configuration.isPressed ? 1.2 : 1)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
    }
}


#Preview {
    ContentView()
}
