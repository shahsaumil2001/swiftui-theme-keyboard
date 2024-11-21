//
//  KeyboardTypesListView.swift
//  SwiftUI-Themeboard
//
//  Created by Saumil Shah on 19/11/24.
//

import SwiftUI

struct KeyboardTypesListView: View {
    
    // MARK: - Properties -
    @EnvironmentObject var themeManager: ThemeManager
    @StateObject private var viewModel = KeyboardTypesListVM()
    @State private var moveToSelectedType = false
    // MARK: - body -
    var body: some View {
        NavigationStack {
            List {
                Section {
                    ForEach(viewModel.keyboardTypes.indices, id: \.self) { index in
                        let keyboardType = viewModel.getKeyboardType(index: index)
                        Button {
                            viewModel.setKeyboardType(index: index)
                            moveToSelectedType = true
                        } label: {
                            HStack {
                                Text(keyboardType.title)
                                    .foregroundStyle(.appPrimary)
                                Spacer()
                                Image(systemName: Images.right)
                                    .foregroundStyle(.gray)
                            }
                        }
                    }
                }
                header: {
                    // Adds top space
                    Spacer()
                }
            }
            .navigationBarTitle(StringConstants.keyboardTypes, displayMode: .large)
            .navigationDestination(isPresented: $moveToSelectedType, destination: {
                KeyboardInputView(viewModel: viewModel)
            })
            .toolbar {
                // Toggle
                ToolbarItem(placement: .navigationBarTrailing) {
                    ToggleView(isDarkMode: $themeManager.isDarkMode)
                }
            }
        }
    }
}

struct ToggleView: View {
    @Binding var isDarkMode: Bool
    @EnvironmentObject var themeManager: ThemeManager
    var body: some View {
        HStack {
            Toggle(isOn: $themeManager.isDarkMode) {
                Image(systemName: Images.sun)
                    .resizable()
                    .foregroundColor(.yellow)
                    .frame(width: 30, height: 30)
            }
            .toggleStyle(SwitchToggleStyle())
            Image(systemName: Images.moon)
                .resizable()
                .foregroundColor(.gray)
                .frame(width: 25, height: 25)
        }
    }
}

#Preview {
    KeyboardTypesListView()
}
