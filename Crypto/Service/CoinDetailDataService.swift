//
//  CoinDetailDataService.swift
//  Crypto
//
//  Created by Victor  on 29.11.2022.
//

import Foundation
import Combine

class CoinDetailDataService {
    @Published var coinDetails: CoinDetail? = nil
    var coinDetailSubscription: AnyCancellable?
    let coin: Coin
    
    init(coin: Coin) {
        self.coin = coin
        getCoinDetails()
    }
    
    func getCoinDetails() {
        let urlString = Constant.coinGecko.hostUrl + Constant.coinGecko.coinDetailsPath + "/\(coin.id)" + Constant.coinGecko.coinDetailsQuery
        guard let url = URL(string: urlString) else { return }
        coinDetailSubscription = NetworkingManager.download(url: url)
            .decode(type: CoinDetail.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: NetworkingManager.handleCompletion , receiveValue: {[weak self] returnedCoinDetails in
                self?.coinDetails = returnedCoinDetails
                self?.coinDetailSubscription?.cancel()
            })
    }
}
