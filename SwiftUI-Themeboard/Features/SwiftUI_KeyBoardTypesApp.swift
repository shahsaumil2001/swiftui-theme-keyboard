//
//  SwiftUI_KeyBoardTypesApp.swift
//  SwiftUI-Themeboard
//
//  Created by Saumil Shah on 19/11/24.
//

import SwiftUI

@main
struct SwiftUI_KeyBoardTypesApp: App {
    
    @StateObject private var themeManager = ThemeManager()
    
    var body: some Scene {
        WindowGroup {
            KeyboardTypesListView()
                .environmentObject(themeManager)
                .preferredColorScheme(themeManager.isDarkMode ? .dark : .light)
        }
    }
}
