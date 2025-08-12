//
//  Index.swift
//  BaiTapDuLich
//
//  Created by Admin on 5/7/25.
//
import RealmSwift
class Index:Object{
    @Persisted(primaryKey: true) var _id: ObjectId
    @Persisted var pulse: Int
    @Persisted var hrv: Int
    var status: String {
        if(pulse < 60){
            return "Low"
        } else if(pulse > 100){
            return "Warning"
        } else{
            return "Good"
        }
    }
    
    convenience init(pulse: Int, hrv: Int) {
        self.init()
        self.pulse = pulse
        self.hrv = hrv
    }
}
