//
//  SoundSetting.swift
//  Restart
//
//  Created by 이찬영 on 2023/06/07.
//

import Foundation
import SwiftUI
import AVKit

class SoundSetting : ObservableObject {
    
    static let instance = SoundSetting()
    
    var player : AVAudioPlayer?
    
    func playSound(audioName : String, withExtension : String) {
        
            
        guard let url = Bundle.main.url(forResource: audioName, withExtension: withExtension) else { return }
            
            do {
                player = try AVAudioPlayer(contentsOf: url)
                player?.play()
            } catch let error {
                print("재생하는데 오류가 발생했습니다. \(error.localizedDescription)")
            }
        }
    
}
