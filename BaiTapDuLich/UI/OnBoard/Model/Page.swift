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
            HearlIssue(healIssue: "Heart Rate", image: "pulseImage"),
            HearlIssue(healIssue: "High Blood\nPressure", image: "hypertensionImage"),
            HearlIssue(healIssue: "Stress & Anxiety", image: "stressImage"),
            HearlIssue(healIssue: "Low Energy\nLevels", image: "energyConsumptionImage")]
        case .page2: [
            HearlIssue(healIssue: "Improve Heart\nHealth", image: "dumbbellImage"),
            HearlIssue(healIssue: "Improve blood\npressure health", image: "pressureImage"),
            HearlIssue(healIssue: "Reduce Stress", image: "harmonyImage"),
            HearlIssue(healIssue: "Increase Energy\nLevels", image: "noEnergyImage")]
        case .page3:[
            HearlIssue(healIssue: "Educational Plan", image: "planImage"),
            HearlIssue(healIssue: "Exercise Plan", image: "exerciseRoutineImage"),
            HearlIssue(healIssue: "Health Tests", image: "stressTestImage")]
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
