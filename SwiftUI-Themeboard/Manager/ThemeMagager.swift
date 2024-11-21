//
//  ThemeMagager.swift
//  SwiftUI-Themeboard
//
//  Created by Saumil on 20/11/24.
//
import SwiftUI

class ThemeManager: ObservableObject {
    @Published var isDarkMode: Bool = UITraitCollection.current.userInterfaceStyle == .dark {
        didSet {
            // Save the preference using AppStorage
            UserDefaults.standard.set(isDarkMode, forKey: AppStorageKey.isDarkMode)
        }
    }
    
    init() {
        // Initialize with the saved preference or system default
        if let savedPreference = UserDefaults.standard.value(forKey: AppStorageKey.isDarkMode) as? Bool {
            isDarkMode = savedPreference
        } else {
            isDarkMode = UITraitCollection.current.userInterfaceStyle == .dark
        }
    }
}
