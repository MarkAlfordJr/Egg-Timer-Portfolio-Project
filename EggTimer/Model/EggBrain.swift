//
//  EggBrain.swift
//  EggTimer
//
//  Created by Mark Alford on 12/10/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import AVFoundation

struct EggBrain {
    
    //setup data
    var totalTime: Float = 60 //in seconds
    var timePassed: Float = 0
    //dictionary holding the titles of the buttons and their values
    let eggTimes : [ String? : Int? ] = [ "Soft" : 5, "Medium" : 7, "Hard" : 12]
    //make a timer var, to stop timer function, later
    var timer = Timer()
    var eggAlarm: AVPlayer? //Sound
    
    //EGG ALARM SOUND
    mutating func playAudioFromProject() {
             guard let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3") else {
                 print("error to get the mp3 file")
                 return
             }
             do {
                eggAlarm = try AVPlayer(url: url)
             } catch {
                 print("audio file error")
             }
             eggAlarm?.play()
         }
    
}
