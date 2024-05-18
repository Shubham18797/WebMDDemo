//
//  Date+Extension.swift
//  WebMDInterviewTestSwiftUI
//
//

import Foundation


extension Date {
    static func toString(ipDateStr: String) -> String {
        let ipDateformatter = DateFormatter()
        ipDateformatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        ipDateformatter.timeZone = TimeZone(identifier: "UTC")
        
        if let ipDate = ipDateformatter.date(from: ipDateStr) {
            let opDateformatter = DateFormatter()
            opDateformatter.dateFormat = "hh:mm a, dd MMM yyyy"
            opDateformatter.timeZone = TimeZone(identifier: "UTC")
            
            let opDateStr = opDateformatter.string(from: ipDate)
            return opDateStr
        }
        return ""
    }
}
