//
//  KeyboardInputView.swift
//  SwiftUI-Themeboard
//
//  Created by Saumil Shah on 19/11/24.
//

import SwiftUI

struct KeyboardInputView: View {
    
    // MARK: - Properties -
    @ObservedObject var viewModel: KeyboardTypesListVM
    @State private var textFieldValue = ""
    @FocusState private var isFocused: Bool
    
    // MARK: - body -
    var body: some View {
        VStack {
            TextField(StringConstants.enter, text: $textFieldValue)
                .padding()
                .keyboardType(viewModel.selectedKeyboardType.type)
                .focused($isFocused)
                .overlay(
                    RoundedRectangle(cornerRadius: 2)
                        .stroke(Color.gray.opacity(0.5), lineWidth: 1)
                )
                .background(.inputBackground)
        }
        .padding()
        .frame(maxHeight: .infinity)
        .background(.appBackground)
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text(viewModel.selectedKeyboardType.title)
                    .font(.headline)
            }
        }
        .onAppear {
            // Focus textfield when screen appears
            isFocused = true
        }
    }
}

#Preview {
    KeyboardInputView(viewModel: KeyboardTypesListVM())
}
