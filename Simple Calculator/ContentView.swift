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
                .foregroundStyle(.white)
                .padding()
                .frame(maxWidth: .infinity, alignment: .trailing)
                .background(.black)
            Spacer()

            HStack {
                VStack(alignment:.leading) {
                    HStack {
                        Button("1") {
                            shownValue = "1"
                        }
                        .buttonStyle(numberButton())
                        Button("2") {
                            shownValue = "2"
                        }
                        .buttonStyle(numberButton())
                        Button("3") {
                            shownValue = "3"
                        }
                        .buttonStyle(numberButton())
                    }
                    HStack {
                        Button("4") {
                            shownValue = "4"
                        }
                        .buttonStyle(numberButton())
                        Button("5") {
                            shownValue = "5"
                        }
                        .buttonStyle(numberButton())
                        Button("6") {
                            shownValue = "6"
                        }
                        .buttonStyle(numberButton())
                    }
                    HStack {
                        Button("7") {
                            shownValue = "7"
                        }
                        .buttonStyle(numberButton())
                        Button("8") {
                            shownValue = "8"
                        }
                        .buttonStyle(numberButton())
                        Button("9") {
                            shownValue = "9"
                        }
                        .buttonStyle(numberButton())
                    }
                    HStack {
                        Button("0") {
                            shownValue = "0"
                        }
                        .buttonStyle(numberButton())
                        Button(".") {
                            shownValue = "0"
                        }
                        .buttonStyle(numberButton())
                        Button("=") {
                            shownValue = "0"
                        }
                        .buttonStyle(numberButton())
                    }
                }
                VStack{
                    Button("+"){}.buttonStyle(signButton())
                    Button("-"){}.buttonStyle(signButton())
                    Button("*"){}.buttonStyle(signButton())
                    Button("/"){}.buttonStyle(signButton())
                }
            }
            Spacer()
        }
        .padding()
    }

}
    // Button style
//  1. For number
struct numberButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            .frame(width: 70, height: 70)
            .padding(4)
            .background(.lightOrange)
            .foregroundStyle(.black)
            .clipShape(RoundedRectangle(cornerRadius: 4.0))
            .scaleEffect(configuration.isPressed ? 1.2 : 1)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
    }
}
// 2. For Arithmetick
struct signButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            .frame(width: 70, height: 70)
            .padding(4)
            .background(.gray)
            .foregroundStyle(.black)
            .clipShape(RoundedRectangle(cornerRadius: 4.0))
            .scaleEffect(configuration.isPressed ? 1.2 : 1)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
    }
}
#Preview {
    ContentView()
}
