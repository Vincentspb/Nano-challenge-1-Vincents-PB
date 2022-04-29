//
//  Extensions.swift
//  Nano challenge 1 Vincents PB
//
//  Created by Vincents Putra Barata on 28/04/22.
//

import Foundation

extension Date{
    public func formatToString() -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        return dateFormatter.string(from: self)
    }
}
