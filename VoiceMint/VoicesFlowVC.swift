//
//  VoicesFlowVC.swift
//  VoiceMint
//
//  Created by test on 30/08/25.
//

import UIKit
import AVFAudio
import AVFoundation

class VoicesFlowVC: UIViewController {

    let voices = AVSpeechSynthesisVoice.speechVoices()

    var maleVoices: [AVSpeechSynthesisVoice] = []
    var femaleVoices: [AVSpeechSynthesisVoice] = []
    var childVoices: [AVSpeechSynthesisVoice] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Available voices: \(voices.count)")

        for voice in voices {
            print("Language: \(voice.language), Name: \(voice.name), Identifier: \(voice.identifier)")
        }

        for voice in voices {
            let lowerName = voice.name.lowercased()
            let lowerId = voice.identifier.lowercased()
            
            if lowerName.contains("male") || lowerId.contains("male") {
                maleVoices.append(voice)
            } else if lowerName.contains("female") || lowerId.contains("female") {
                femaleVoices.append(voice)
            } else if lowerName.contains("child") || lowerId.contains("child") {
                childVoices.append(voice)
            }
        }

        print("Male voices: \(maleVoices.count)")
        print("Female voices: \(femaleVoices.count)")
        print("Child voices: \(childVoices.count)")

        // Example: printing some
        for v in maleVoices.prefix(5) {
            print("👨 Male → \(v.name) (\(v.language))")
        }
        for v in femaleVoices.prefix(5) {
            print("👩 Female → \(v.name) (\(v.language))")
        }
        for v in childVoices.prefix(5) {
            print("🧒 Child → \(v.name) (\(v.language))")
        }
        
        let grouped = Dictionary(grouping: voices, by: { $0.language })

        print("Available voices: \(voices.count)")
        print("Available languages: \(grouped.keys.count)\n")

        for (lang, voicesForLang) in grouped.sorted(by: { $0.key < $1.key }) {
            print("🌍 \(lang): \(voicesForLang.count) voices")
            for voice in voicesForLang {
                print("   • \(voice.name) [\(voice.identifier)]")
            }
            print("")
        }
        
    }

}
