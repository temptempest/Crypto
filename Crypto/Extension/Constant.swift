//
//  Constant.swift
//  Crypto
//
//  Created by Victor  on 29.11.2022.
//

import Foundation

enum Constant {
    enum coinGecko {
        static let hostUrl = "https://api.coingecko.com/api/v3"
        static let marketPath = "/global"
        
        static let coinsListPath = "/coins/markets"
        static let coinsListQuery = "?vs_currency=usd&order=market_cap_desc&per_page=250&page=1&sparkline=true&price_change_percentage=24h"
        
        static let coinDetailsPath = "/coins"
        static let coinDetailsQuery = "?localization=false&tickers=false&market_data=false&community_data=false&developer_data=false&sparkline=false"
    }
    //...//
}
