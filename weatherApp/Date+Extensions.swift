//
//  Date+Extensions.swift
//  weatherApp
//
//  Created by Suneetha Nallamotu on 2/9/23.
//

import Foundation

extension Date {
    var displayFormat: String {
        self.formatted(.iso8601)
    }
}
