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
                .frame(maxWidth: .infinity, alignment: .trailing)
                .background(.black)
            
            Spacer()
            HStack {
                Button("%"){}
                Button("+ / -"){}
                Button("AC"){}
                Button("!"){}
            }
            .buttonStyle(spetialButton())
            HStack {
                Grid(alignment: .center) {
                    var number = "0"
                    let zero = "0"
                    GridRow {
                        Button("1") {
                            number = "1"
                            if shownValue != zero {
                                shownValue += number
                            } else {shownValue = number}
                        }
                        Button("2") {
                            number = "2"
                            if shownValue != zero {
                                shownValue += number
                            } else {shownValue = number}
                        }
                        Button("3") {
                            number = "3"
                            if shownValue != zero {
                                shownValue += number
                            } else {shownValue = number}
                        }
                    }
                    GridRow {
                        Button("4") {
                            number = "4"
                            if shownValue != zero {
                                shownValue += number
                            } else {shownValue = number}
                        }
                        
                        Button("5") {
                            number = "5"
                            if shownValue != zero {
                                shownValue += number
                            } else {shownValue = number}
                        }
                        
                        Button("6") {
                            number = "6"
                            if shownValue != zero {
                                shownValue += number
                            } else {shownValue = number}
                        }
                    }
                    GridRow {
                        Button("7") {
                            number = "7"
                            if shownValue != zero {
                                shownValue += number
                            } else {shownValue = number}
                        }
                        Button("8") {
                            number = "8"
                            if shownValue != zero {
                                shownValue += number
                            } else {shownValue = number}
                        }
                        Button("9") {
                            number = "9"
                            if shownValue != zero {
                                shownValue += number
                            } else {shownValue = number}
                        }
                    }
                    GridRow {
                        Button("0") {
                            number = "0"
                            if shownValue != zero {
                                shownValue += number
                            }
                        }
                        
                        Button(".") {
                            shownValue += "."
                        }
                        
                        Button("=") {
                            shownValue = "0"
                        }
                    }
                }
                .buttonStyle(numberButton())
                VStack{
                    Button("+"){}
                    Button("-"){}
                    Button("*"){}
                    Button("/"){}
                }
                .buttonStyle(arithmeticButton())
            }
            Spacer()
        }
        .padding()
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
            .padding(4)
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
            .padding(4)
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
            .padding(4)
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
