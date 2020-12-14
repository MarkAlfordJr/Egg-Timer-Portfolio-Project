//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation



class ViewController: UIViewController {
    //access EggBrain object, to get its code
    var egg = EggBrain()
    
    //setup UI elements
    @IBOutlet weak var eggTimerProgress: UIProgressView!
    @IBOutlet weak var eggTimerLabel: UILabel!
  
    //starting view function.
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    //MARK: - Functionality
    //updater function used to execute code everytime the counter goes down/up, EVERY SINGLE INTERVAL. the counter goes, as directed by the timer function
    @objc func updateCounter() {
       //counter > 0, when timer is counting down
        if egg.timePassed < egg.totalTime {
            print("\(egg.timePassed) seconds till \(egg.totalTime)")
            egg.timePassed += 1
            //to make sure totalTime doesn't equal zero, when dividing, which will cuase an error.
            let percentage = Float(egg.timePassed / egg.totalTime)
            eggTimerProgress.progress = percentage
            print(percentage)
        } else if (egg.timePassed == egg.totalTime){ //counter == 0, when timer is done
            print("done")
            egg.timer.invalidate() //include this so timer stops
            egg.timePassed = 0
            eggTimerProgress.progress = 1.0
            eggTimerLabel.text = "DONE!"
            egg.playAudioFromProject()
        }
    }
    
    //BUTTON FUNCTION, acts like a switch statement, when more than one button is attached, just make use of the titles(ID)
    //depending on which egg image is pressed, will start the respective timer of the egg image
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        //INSIDE the button function, use this to stop the timer
        egg.timer.invalidate()
        
        eggTimerLabel.text = "How do you like your eggs?"
        
        let hardness = sender.currentTitle! //turns button function into switch statement
        
        egg.totalTime = Float(60 * egg.eggTimes[hardness]!!)
        
        //timer function, that tells amount of EACH interval(in seconds,1.0, or less), tells what function to use EVERY interval (#selector(updateCounter)), and if it repeats or not. have timer var, be this function
        egg.timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
        
        //simply call the updater function
        updateCounter()
        
    }
    
}
