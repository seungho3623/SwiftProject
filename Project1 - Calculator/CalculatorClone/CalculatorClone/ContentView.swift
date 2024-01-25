//
//  ContentView.swift
//  CalculatorClone
//
//  Created by 송승호 on 2024/01/25.
//

import SwiftUI

enum ButtonType: String{
    case one, two, three, four, five, six, seven, eight, nine, zero
    case dot, equal, plus, minus, multiple, devide
    case percent, oppsite, clear
    
    var buttonDisplayName: String{
        switch self{
        case .one :
            return "1"
        case .two:
            return "2"
        case .three:
            return "3"
        case .four:
            return "4"
        case .five:
            return "5"
        case .six:
            return "6"
        case .seven:
            return "7"
        case .eight:
            return "8"
        case .nine:
            return "9"
        case .zero:
            return "0"
        case .dot:
            return "."
        case .equal:
            return "="
        case .plus:
            return "+"
        case .minus:
            return "-"
        case .multiple:
            return "X"
        case .devide:
            return "/"
        case .percent:
            return "%"
        case .oppsite:
            return "+/-"
        case .clear:
            return "C"
        }
    }
    var backGroundColor: Color{
        switch self{
        case .one, .two, .three, .four, .five, .six, .seven, .eight, .nine, .zero, .dot:
            return Color("NumberButton")
        case .equal, .plus, .minus, .multiple, .devide:
            return Color.orange
        case .clear, .oppsite, .percent:
            return Color.gray
        }
    }
    var foreGroundColor: Color{
        switch self{
        case .clear, .oppsite, .percent:
            return Color.black
        default:
            return Color.white
        }
    }
}

struct ContentView: View {
    
    @State private var totalNumber: String = "0"
    @State private var tempNubmer : Int = 0
    @State private var operateMode : ButtonType = .clear
    @State private var isEditing : Bool = false
    
    private let buttonData: [[ButtonType]] = [
        [.clear, .oppsite, .percent, .devide],
        [.seven, .eight, .nine, .multiple],
        [.four, .five, .six, .minus],
        [.one, .two, .three, .plus],
        [.zero, .dot, .equal]
    ]
    
    var body: some View {
        ZStack{
            Color.black.ignoresSafeArea()
            VStack {
                Spacer()
                HStack{
                    Spacer()
                    Text(totalNumber)
                        .padding()
                        .foregroundColor(.white)
                        .font(.system(size: 70))
                }
                
                ForEach(buttonData, id: \.self){ line in
                    HStack{
                        ForEach(line, id: \.self){ item in
                            Button{
                                if isEditing == false {
                                    if item == .clear {
                                        totalNumber = "0"
                                        isEditing = false
                                    } else if item == .plus {
                                        operateMode = .plus
                                    } else if item == .minus {
                                        operateMode = .minus
                                    } else if item == .multiple {
                                        operateMode = .multiple
                                    } else if item == .devide {
                                        operateMode = .devide
                                    } else if item == .percent {
                                        operateMode = .percent
                                    } else if item == .equal {
                                        tempNubmer = Int(totalNumber) ?? 0
                                        operateMode = .equal
                                    } else if item == .oppsite {
                                        operateMode = .oppsite
                                        totalNumber = (totalNumber == "0") ? "-0" : "0"
                                    } else {
                                        totalNumber = item.buttonDisplayName
                                        isEditing = true
                                    }
                                    
                                } else {
                                    if item == .clear {
                                        totalNumber = "0"
                                        operateMode = .clear
                                        isEditing = false
                                    } else if item == .plus {
                                        tempNubmer = Int(totalNumber) ?? 0
                                        operateMode = .plus
                                        isEditing = false
                                    } else if item == .minus {
                                        tempNubmer = Int(totalNumber) ?? 0
                                        operateMode = .minus
                                        isEditing = false
                                    } else if item == .multiple {
                                        tempNubmer = Int(totalNumber) ?? 0
                                        operateMode = .multiple
                                        isEditing = false
                                    } else if item == .devide {
                                        tempNubmer = Int(totalNumber) ?? 0
                                        operateMode = .devide
                                        isEditing = false
                                    } else if item == .percent {
                                        tempNubmer = Int(totalNumber) ?? 0
                                        operateMode = .percent
                                        isEditing = false
                                    } else if item == .oppsite {
                                        if totalNumber.prefix(1) == "-" {
                                            totalNumber = String(totalNumber.dropFirst(1))
                                        } else {
                                            totalNumber = "-" + totalNumber
                                        }
                                    } else if item == .equal {
                                        if operateMode == .plus {
                                            totalNumber = String((Int(totalNumber) ?? 0) + tempNubmer)
                                        } else if operateMode == .minus {
                                            totalNumber = String(tempNubmer - (Int(totalNumber) ?? 0))
                                        } else if operateMode == .multiple {
                                            totalNumber = String((Int(totalNumber) ?? 0) * tempNubmer)
                                        } else if operateMode == .devide {
                                            totalNumber = String(tempNubmer / (Int(totalNumber) ?? 0))
                                        } else if operateMode == .percent {
                                            totalNumber = String(tempNubmer % (Int(totalNumber) ?? 0))
                                        }
                                        isEditing = false
                                    }
                                    else {
                                        totalNumber += item.buttonDisplayName
                                    }
                                }
                            } label: {
                                Text(item.buttonDisplayName)
                                    .frame(width: buttonWidth(button: item),
                                           height: buttonHeight(button: item))
                                    .background(item.backGroundColor)
                                    .cornerRadius(40)
                                    .foregroundColor(item.foreGroundColor)
                                    .font(.system(size: 33))
                            }
                        }
                    }
                }
            }
        }
    }
}

private func buttonWidth(button: ButtonType) -> CGFloat {
    return (button == .zero) ? (UIScreen.main.bounds.width - 5 * 10) / 1.92
    : (UIScreen.main.bounds.width - 5 * 10) / 4
}

private func buttonHeight(button: ButtonType) -> CGFloat {
    return (UIScreen.main.bounds.width - 5 * 10) / 4
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
