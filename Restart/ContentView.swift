//
//  ContentView.swift
//  Restart
//
//  Created by 이찬영 on 2023/05/30.
//

import SwiftUI

struct ContentView: View {
    
    @AppStorage("isOnboardingView") var isOnboardingView : Bool = true
    
    var body: some View {
        
        if isOnboardingView {
            
            OnboardingView()
            
        } else {
            
            HomeView()
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
