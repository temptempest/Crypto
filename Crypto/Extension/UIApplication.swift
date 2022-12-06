//
//  UIApplication.swift
//  Crypto
//
//  Created by Victor  on 29.11.2022.
//

import Foundation
import SwiftUI

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
