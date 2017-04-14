//
//  AudioController.swift
//  CinemaLogic2
//
//  Created by Dmitry Tolmachev on 19.02.17.
//  Copyright © 2017 Dmitry Tolmachev. All rights reserved.
//

import Foundation
import AVFoundation

class AudioController {
    fileprivate var audio = [String:AVAudioPlayer]()
    
    func preloadAudioEffects(_ effectFileNames:[String]) {
        for effect in AudioEffectFiles {
            //let soundPath = Bundle.paths(forResourcesOfType: "mp3", inDirectory: "")
            let soundPath = Bundle.main.resourcePath!.stringByAppendingPathComponent1(path: effect)
            let soundURL = URL(fileURLWithPath: soundPath)
            print ("путь: \(soundURL), \(soundPath)")
            //2 load the file contents
            let loadError: Error?
            /*var player = AVAudioPlayer(contentsOf: soundURL, error: loadError)
            do {
            player = try AVAudioPlayer(contentsOf: soundURL)
            } catch {
                
            }
            assert(loadError == nil, "Load sound failed")
            //3 prepare the play
            player.numberOfLoops = 0
            player.prepareToPlay()
            //4 add to the audio dictionary
            audio[SoundDing] = player*/
        }
    }
    
    func playEffect(_ name:String) {
        if let player = audio[name] {
            if player.isPlaying {
                player.currentTime = 0
            } else {
                player.play()
            }
        }
    }
}

extension String {
    func stringByAppendingPathComponent1(path: String) -> String {
        let nsSt = self as NSString
        return nsSt.appendingPathComponent(path)
    }
}
