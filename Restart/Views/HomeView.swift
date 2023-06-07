//
//  HomeView.swift
//  Restart
//
//  Created by 이찬영 on 2023/05/30.
//

import SwiftUI

struct HomeView: View {
    
    @AppStorage("isOnboardingView") var isOnboardingView : Bool = false
    
    var body: some View {

        ZStack {
            
            
            
            VStack {

                Spacer()
                
                ZStack {
                    
                    CircleImageView(color: Color.gray)
                    
                    Image("character-2")
                        .resizable()
                        .scaledToFit()
                    
                }
                .padding()

                Text("""
                    The time that leads to mastery is
                    dependant on the intensity of our
                    focus
                    """)
                .multilineTextAlignment(.center)
                .foregroundColor(Color.gray)
                .font(.title3)
                .fontWeight(.light)
                .padding()
                
                Spacer()
                
                Button {
                    isOnboardingView = true
                } label: {
                    
                    ZStack {
                        
                        Capsule()
                            .frame(width: 150, height: 60)
                        
                        HStack {
                            
                            Image(systemName: "arrow.triangle.2.circlepath.circle.fill")
                            
                            Text("ReStart")
                            
                        }
                        .foregroundColor(Color.white)
                        .font(.title2)
                        .bold()
                    }
                }
                
                
            } // VStack
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
