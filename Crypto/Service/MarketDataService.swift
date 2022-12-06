//
//  MarketDataService.swift
//  Crypto
//
//  Created by Victor  on 29.11.2022.
//

import Foundation
import Combine

class MarketDataService  {
    @Published var marketData: MarketData? = nil
    var marketDataSubscription: AnyCancellable?
    
    init() {
        getData ()
    }
    
     func getData() {
         let urlString = Constant.coinGecko.hostUrl + Constant.coinGecko.marketPath
        guard let url = URL(string: urlString) else { return }
        marketDataSubscription = NetworkingManager.download(url: url)
            .decode(type: GlobalData.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: NetworkingManager.handleCompletion , receiveValue: {[weak self] returnedGlobalData in
                self?.marketData = returnedGlobalData.data
                self?.marketDataSubscription?.cancel()
            })
    }
}
