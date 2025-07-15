//
//  page.swift
//  BaiTapDuLich
//
//  Created by Admin on 15/7/25.
//

import Foundation

enum Page: String, CaseIterable{
    case page1
    case page2
    case page3
    var items: [HearlIssue]{
        switch self{
        case .page1: [
            HearlIssue(healIssue: "Heart rate", image: "pulse"),
            HearlIssue(healIssue: "High Blood Pressure", image: "hybertension"),
            HearlIssue(healIssue: "Stress & Anxiety", image: "stress"),
            HearlIssue(healIssue: "Low Energy Levels", image: "energy-consumption")]
        case .page2: [
            HearlIssue(healIssue: "Improve Heart Health", image: "dumbbell"),
            HearlIssue(healIssue: "Improve blood pressure health", image: "pressure"),
            HearlIssue(healIssue: "Reduce Stress", image: "harmony"),
            HearlIssue(healIssue: "Increase Energy Levels", image: "no-energy")]
        case .page3:[
            HearlIssue(healIssue: "Educational Plan", image: "plan"),
            HearlIssue(healIssue: "Exercise Plan", image: "exercise-routine"),
            HearlIssue(healIssue: "Health Tests", image: "stress-test")]
        }
    }
    var titles: String{
        switch self{
        case .page1: "Which heart health issue concerns you the most?"
        case .page2: "What would you like to achieve?"
        case .page3: "What type of plan would you like to follow?"
        }
    }
}
