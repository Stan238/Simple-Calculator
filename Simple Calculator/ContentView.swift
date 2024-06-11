    //
    //  ContentView.swift
    //  Simple Calculator
    //
    //  Created by Stan U on 6/4/24.
    //

import SwiftUI

struct ContentView: View {
    @State private var shownValue : String = "0"
    @State private var shownValue2 : String = "0"
    @State private var firstNumber : Double = 0
    @State private var secondNumber : Double = 0
    @State private var mathSign: String = ""
    @State private var signCheckFlag: Bool = false
    @State private var equalsCheckFlag: Bool = false
    var body: some View {
        VStack {
            Spacer()
            Spacer()
            Spacer()
            Text(shownValue)
                .font(.system(size: 60))
                .foregroundStyle(.green)
                .padding()
                .frame(maxWidth: 440, alignment: .trailing)
                .background(.black)
                .padding(.horizontal)
            Text(shownValue2)
                .font(.system(size: 20))
                .foregroundStyle(.green)
                .padding()
                .frame(maxWidth: 440, alignment: .trailing)
                .background(.black)
                .padding(.horizontal)
            Spacer()
            Spacer()
            Spacer()
            HStack(alignment: .center, spacing: 15) {
                let arithmSign: [String] = [" ", " ", "+/-"]
                ForEach(arithmSign.indices, id: \.self) { index in
                    Button(arithmSign[index]){
                        shownValue = "0"
                    }
                }
                Button("C"){
                    shownValue = "0"
                    shownValue2 = "0"
                    firstNumber  = 0
                    secondNumber  = 0
                    mathSign = ""
                    signCheckFlag = false
                    equalsCheckFlag = false
                }
            }
            .buttonStyle(spetialButton())
            .padding(.horizontal)
//            .border(Color.blue, width: 5)
            HStack(alignment: .center) {
                LazyVGrid(columns:Array(repeating: GridItem(.fixed(49), spacing: 49), count: 3) ){
                    let zero = "0"
                    let number1: [String] = [ "1", "2","3", "4", "5", "6" , "7", "8" , "9", "0" ]
                    ForEach(number1.indices, id: \.self) { index in
                        Button(number1[index]) {
                            if (mathSign != "") && signCheckFlag {
                                shownValue = "0"
                                signCheckFlag = false
                            }
                            shownValue = (shownValue != zero ? shownValue + number1[index]: number1[index] )
                                // Xcode has failed because variables in the condition of the "if... else" statement had different data types.
                            shownValue2 = (firstNumber != 0 ? shownValue2 + number1[index]: shownValue)
                        }
                    }
//                    .border(Color.black)
                    Button(".") {
                            //  Checking for the ability to add "." just one time
                        if !shownValue.contains(Character(".")) {
                            shownValue += "."
                            shownValue2 = shownValue
                        }
                    }
                    Button("=") {
                        switch mathSign {
                            case "+" :
                                shownValue = String(firstNumber + (Double(shownValue) ?? 0))
                            case "*" :
                                shownValue = String(firstNumber * (Double(shownValue) ?? 0))
                            case "-" :
                                shownValue = String(firstNumber - (Double(shownValue) ?? 0))
                            case "/" :
                                shownValue = String(firstNumber / (Double(shownValue) ?? 0))
                            default:
                                firstNumber = Double(shownValue) ?? 0
                                signCheckFlag = true
                        }
                        mathSign = " "
                        shownValue2 = shownValue
                    }
                }
                .padding(.horizontal)
                .buttonStyle(numberButton())
//                .frame(maxWidth: 300, alignment: .center)
//                .border(Color.black, width: 5)
                VStack{
                    let arithmSign: [String] = ["+", "-", "*", "/"]
                    ForEach(arithmSign.indices, id: \.self) { index in
                        Button(arithmSign[index]){
                            if equalsCheckFlag && !signCheckFlag{
                                switch mathSign {
                                    case "+" :
                                        shownValue = String(firstNumber + (Double(shownValue) ?? 0))
                                    case "*" :
                                        shownValue = String(firstNumber * (Double(shownValue) ?? 0))
                                    case "-" :
                                        shownValue = String(firstNumber - (Double(shownValue) ?? 0))
                                    case "/" :
                                        shownValue = String(firstNumber / (Double(shownValue) ?? 0))
                                    default:
                                        firstNumber = Double(shownValue) ?? 0
                                        signCheckFlag = true
                                }
                                mathSign = " "
                                shownValue2 = shownValue
                            }
                            firstNumber = Double(shownValue) ?? 0
                            mathSign = arithmSign[index]
                            signCheckFlag = true
                            equalsCheckFlag = true
                                //                            if  firstNumber  {
                                //                            }
                            shownValue2 += mathSign
                            
                        }
                    }
                }
                .padding(.horizontal, 6)
                .buttonStyle(arithmeticButton())
//                .border(Color.green, width: 5)
            }
//            .border(Color.black)
            Spacer()
            Spacer()
            Spacer()

        }
        .frame(alignment: .center)
        .background(Color.white)
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
            .frame(width: 50, height: 49)
            .padding()
            .background(.lightOrange)
            .foregroundStyle(.black)
            .clipShape(RoundedRectangle(cornerRadius: 25.0))
            //  .shadow(color: .gray, radius: 2, x: 2, y: 2)
            .scaleEffect(configuration.isPressed ? 1.2 : 1)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
    }
}
    // 2. For Arithmetick
struct arithmeticButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.largeTitle)
            .frame(width: 50, height: 49)
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
            .frame(width: 50, height: 49)
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
