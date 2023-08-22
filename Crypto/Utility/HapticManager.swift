//
//  HapticManager.swift
//  Crypto
//
//  Created by Victor  on 29.11.2022.
//

import Foundation

import Foundation
import SwiftUI

class HapticManager {
    static private let generator = UINotificationFeedbackGenerator()
    static func notification(type: UINotificationFeedbackGenerator.FeedbackType) {
        generator.notificationOccurred(type)
    }
}
