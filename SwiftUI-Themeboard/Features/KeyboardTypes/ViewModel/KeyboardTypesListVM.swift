//
//  KeyboardTypesListVM.swift
//  SwiftUI-Themeboard
//
//  Created by Saumil Shah on 19/11/24.
//

import SwiftUI
import UIKit

enum KeyboardTypes {
    case defaultType
    case numberPad
    case phonePad
    case decimalPad
    case emailAddress
    case url
    case twitter
    case webSearch
    
    var title: String {
        switch self {
        case .defaultType:
            return StringConstants.defaultType
        case .numberPad:
            return StringConstants.numberPad
        case .phonePad:
            return StringConstants.phonePad
        case .decimalPad:
            return StringConstants.decimalPad
        case .emailAddress:
            return StringConstants.emailAddress
        case .url:
            return StringConstants.url
        case .twitter:
            return StringConstants.twitter
        case .webSearch:
            return StringConstants.webSearch
        }
    }
    
    var type: UIKeyboardType {
        switch self {
        case .defaultType:
            return .default
        case .numberPad:
            return .numberPad
        case .phonePad:
            return .phonePad
        case .decimalPad:
            return .decimalPad
        case .emailAddress:
            return .emailAddress
        case .url:
            return .URL
        case .twitter:
            return .twitter
        case .webSearch:
            return .webSearch
        }
    }
}

final class KeyboardTypesListVM: ObservableObject {
    
    // MARK: - Properties -
    let keyboardTypes = [ KeyboardTypes.defaultType,
                          KeyboardTypes.numberPad,
                          KeyboardTypes.phonePad,
                          KeyboardTypes.decimalPad,
                          KeyboardTypes.emailAddress,
                          KeyboardTypes.url,
                          KeyboardTypes.twitter,
                          KeyboardTypes.webSearch]
    @Published var selectedKeyboardType: KeyboardTypes = .defaultType
    
    // MARK: - Functions -
    ///
    /// The func is `getKeyboardType` returns KeyboardType for given index
    ///  A KeyboardTypesListVM's `getKeyboardType` method
    ///
    func getKeyboardType(index: Int) -> KeyboardTypes {
        return self.keyboardTypes[index]
    }
    ///
    /// The func is `setKeyboardType` set KeyboardType of given index
    ///
    func setKeyboardType(index: Int) {
        let type = getKeyboardType(index: index)
        selectedKeyboardType = type
    }
}
