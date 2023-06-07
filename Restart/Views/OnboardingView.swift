//
//  OnboardingView.swift
//  Restart
//
//  Created by 이찬영 on 2023/05/30.
//

import SwiftUI

struct OnboardingView: View {
    
    @AppStorage("isOnboardingView") var isOnboardingView : Bool = true
    
    @State private var buttonWidth : Double = UIScreen.main.bounds.width - 80
    @State private var buttonOffset : CGFloat = 0
    @State private var isAnimating : Bool = false
    
    var body: some View {
        
        ZStack {
            
            Color("ColorBlue").edgesIgnoringSafeArea(.all)
            
            VStack {
                
                // Top Text View
                
                TopTextView()
                    .offset(y : isAnimating ? 0 : -50)
                    .animation(.easeInOut, value: isAnimating)
                
                // Middle
                
                ZStack {
                    
                    CircleImageView(color: Color.white)
                        .blur(radius: isAnimating ? 0 : 50)
                        .animation(.easeInOut(duration: 1.0), value: isAnimating)
                       
                    ZStack(alignment: .bottom) {
                        
                        Image("character-1")
                            .resizable()
                            .scaledToFit()
                        
                        Image(systemName: "arrow.left.and.right.circle")
                            .font(.largeTitle)
                            .foregroundColor(Color.white)
                            .fontWeight(.ultraLight)
                        
                    }
                    
                } // ZStack
                .padding()
                
                ZStack {
                    
                    Capsule()
                        .fill(Color.white.opacity(0.1))
                    Capsule()
                        .fill(Color.white.opacity(0.2))
                        .padding(8)
                    
                    HStack {
                        
                        ZStack {
                            
                            Capsule()
                                .fill(Color.red.opacity(0.7))
                                .frame(width: buttonOffset + 80)
                            
                            ZStack {
                                
                                Circle()
                                    .fill(Color("ColorRed"))
       
                                Circle()
                                    .fill(Color.black.opacity(0.15))
                                    .padding(8)
                                   
                                Image(systemName: "chevron.right.2")
                                    .font(.title2)
                                    .foregroundColor(Color.white)
                                    .bold()
                                
                            }
                            .offset(x : buttonOffset)
                            .gesture(
                                DragGesture(coordinateSpace: .global)
                                    .onChanged({ value in
                                        
                                        if value.translation.width - 80 > 0 && buttonOffset <= buttonWidth - 80 {
                                            
                                            buttonOffset = value.translation.width - 80
                                            
                                        }
                                        
                                    })
                                
                                    .onEnded { _ in
                                      withAnimation(Animation.easeOut(duration: 0.4)) {
                                        if buttonOffset > buttonWidth / 2 {
                                          SoundSetting.instance.playSound(audioName: "success", withExtension: ".m4a")
                                          buttonOffset = buttonWidth - 80
                                          isOnboardingView = false
                                            
                                        } else {
                                       
                                          buttonOffset = 0
                                            
                                        }
                                      }
                                    }
                            )
                        }
                        
                        Spacer()
                        
                    }
                    
                    Text("Get Started")
                        .foregroundColor(Color.white)
                        .bold()
                    
                }
                .frame(width: buttonWidth, height: 80)
                .offset(y: isAnimating ? 0 : 50)
                .animation(.easeInOut, value: isAnimating)
                
                Spacer()
                
            } // VStack
            
        } // ZStack : Background
        .onAppear {
            
            isAnimating = true
            
        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}

struct CircleImageView: View {
    
    let color : Color
    
    var body: some View {
        
        Circle()
            .stroke(lineWidth: 40)
            .frame(width: 280, height: 280)
            .foregroundColor(color)
            .opacity(0.2)
        
        Circle()
            .stroke(lineWidth: 80)
            .frame(width: 280, height: 280)
            .foregroundColor(color)
            .opacity(0.1)
        
    }
}

struct TopTextView: View {
    var body: some View {
        Text("Share.")
            .font(.system(size: 60))
            .fontWeight(.bold)
            .foregroundColor(Color.white)
            .padding(.top)
        
        Text("""
            It's not how much we give but
            how much love we put into giving.
            """)
        .multilineTextAlignment(.center)
        .fontWeight(.light)
        .foregroundColor(Color.white)
        .font(.title3)
    }
}
