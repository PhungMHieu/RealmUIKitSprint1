//
//  Index.swift
//  BaiTapDuLich
//
//  Created by Admin on 5/7/25.
//

class Index{
    var pulse: Int
    var hrv: Int
    var status: String{
        if(pulse < 60){
            return "Low"
        }else if(pulse > 100){
            return "Warning"
        }else{
            return "Good"
        }
    }
    
    init(pulse: Int, hrv: Int) {
        self.pulse = pulse
        self.hrv = hrv
    }
}
