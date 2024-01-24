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
                                totalNumber = calcuatorNumber(button: item)
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

private func calcuatorNumber(button: ButtonType) -> String {
    return "TEST"
}

private func buttonWidth(button: ButtonType) -> CGFloat {
    return (button == .zero) ? (UIScreen.main.bounds.width - 5 * 10) / 4 * 2
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
