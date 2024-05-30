//
//  CalculatorView.swift
//  Calculator
//
//  Created by Timur Murzakov on 11/05/2024.
//

import SwiftUI

struct CalculatorView: View {
    
    @ObserveInjection var inject
    
    @EnvironmentObject private var viewModel: ViewModel
    
    // MARK: Calculator View
    var body: some View {
        VStack {
            Spacer()
            displayText
            buttonPad
        }
        .padding(Constants.padding)
        .background(.black)
        
        .enableInjection()
    }
}

// MARK: - PREVIEWS
#Preview {
    CalculatorView()
}

// MARK: - COMPONENTS

extension CalculatorView {
    
    private var displayText: some View {
        Text(viewModel.displayText)
            .padding()
            .foregroundStyle(.white)
            .frame(maxWidth: .infinity, alignment: .trailing)
            .font(.system(size: 90, weight: .light))
            .lineLimit(1)
            .minimumScaleFactor(0.2)
    }
    
    private var buttonPad: some View {
        VStack(spacing: Constants.padding) {
            ForEach(viewModel.buttonTypes, id: \.self) { row in
                HStack(spacing: Constants.padding) {
                    ForEach(row, id: \.self) { buttonType in
                        CalculatorButton(buttonType: buttonType)
                    }
                }
            }
        }
    }
}
