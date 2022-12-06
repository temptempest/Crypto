//
//  String.swift
//  Crypto
//
//  Created by Victor  on 29.11.2022.
//

import Foundation

extension String {
    var removingHTMLOccurances: String {
        return self.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
    }
}
