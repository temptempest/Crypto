//
//  CoinDataService.swift
//  Crypto
//
//  Created by Victor  on 29.11.2022.
//

import Foundation
import Combine

class CoinDataService {
    @Published var allCoins: [Coin] = []
    var coinSubscription: AnyCancellable?
    
    init() {
        getCoins()
    }
    
    func getCoins() {
        let urlString = Constant.coinGecko.hostUrl + Constant.coinGecko.coinsListPath + Constant.coinGecko.coinsListQuery
        guard let url = URL(string: urlString) else { return }
        coinSubscription = NetworkingManager.download(url: url)
            .decode(type: [Coin].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: {[weak self] returnedCoins in
                self?.allCoins = returnedCoins
                self?.coinSubscription?.cancel()
            })
    }
}
