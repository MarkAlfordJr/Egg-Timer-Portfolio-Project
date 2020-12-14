//
//  AppCompendium.swift
//  EggTimer
//
//  Created by Mark Alford on 12/7/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import Foundation

//MARK: - Features
//1 click on a certain egg and get back a timer depending on how hard you want to boil the egg(s)

//MARK: - Patterns
//MVC pattern.
//all logic and data go into a model folder, through methods and properties
//the ViewController ONLY calls these methods

//MARK: - Goals
//OVERALL GOAL
//1 click on egg button
//2 each egg button gives back a desired time
//3 each time is displayed in a progressView
//4 when the time is up, a sound will ring

//MODEL, VIEW, CONTROLLER
//MODEL- handle timing logic, sound logic, and data
//VIEW- design app screen labels and button
//CONTROLLER- handles which button is pressed
