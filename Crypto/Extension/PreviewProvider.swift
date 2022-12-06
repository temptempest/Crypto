//
//  PreviewProvider.swift
//  Crypto
//
//  Created by Victor  on 29.11.2022.
//

import Foundation
import SwiftUI

extension PreviewProvider {
    static var dev: DeveloperPreview {
        return DeveloperPreview.instance
    }
}

class DeveloperPreview {
    static let instance = DeveloperPreview()
    private init() {}
    
    let homeVM = HomeViewModel()
    
    let stat1 = Statistic(title: "Market Cap", value: "$12.58n", percentageChange: 25.34)
    let stat2 = Statistic(title: "Total volume", value: "$1.23Tr")
    let stat3 = Statistic(title: "Portfolio value", value: "$50.4k", percentageChange: -12.34)
    
    
    let coin = Coin(
        id: "bitcoin",
        symbol: "btc",
        name: "Bitcoin",
        image: "https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1547033579",
        currentPrice: 20406,
        marketCap: 391151148991,
        marketCapRank: 1,
        fullyDilutedValuation: 428475731141,
        totalVolume: 31316717286,
        high24H: 20421,
        low24H: 19785.21,
        priceChange24H: 296.22,
        priceChangePercentage24H: 1.473,
        marketCapChange24H: 5737289631,
        marketCapChangePercentage24H: 1.4886,
        circulatingSupply: 19170687,
        totalSupply: 21000000,
        maxSupply: 21000000,
        ath: 69045,
        athChangePercentage: -70.42575,
        athDate: "2021-11-10T14:24:11.849Z",
        atl: 67.81,
        atlChangePercentage: 30013.21743,
        atlDate: "2013-07-06T00:00:00.000Z",
        lastUpdated: "2022-10-06T04:36:33.082Z",
        sparklineIn7D: SparklineIn7D(price: [
            16089.63697072075, 16073.783909170232, 16214.037839455497, 16234.570924644582, 16163.378702587872, 16052.862440419338, 16056.555207803576, 16000.304804972124, 15665.728828858591, 15835.072486141444, 15734.494872016803, 15759.21495702581, 15794.327604914475, 15885.888268145578, 15823.642467902782, 15813.484951266764, 15880.295908474383, 15835.25424768187, 15840.759180850695, 15758.848740937732, 15748.64141743841, 15728.290575641106, 15700.60132213548, 15817.852304267795, 15745.692202511065, 15832.85882041198, 16154.278025599786, 16111.42122464189, 16232.919812409002, 16200.157441280468, 16116.357715823304, 16150.128749164089, 16191.113745792902, 16161.282188136152, 16162.157702942757, 16176.97314581773, 16225.09189957465, 16209.596015309206, 16231.671031673663, 16512.41149262638, 16568.96762222911, 16523.571951122372, 16508.916188082265, 16510.125819512763, 16602.0592699326, 16551.215316568276, 16561.63682680324, 16622.990094437577, 16596.573301819506, 16537.799529752872, 16476.1283274828, 16446.310798642244, 16419.594593702615, 16408.496095646035, 16373.700567791879, 16495.491769334836, 16478.004530581038, 16562.384973654345, 16501.70819337447, 16530.49127394779, 16633.46357404885, 16555.09819291426, 16753.6264666303, 16705.741702919928, 16712.223296490873, 16692.317224983493, 16675.492413195687, 16693.167405345, 16687.03979038733, 16592.213656264223, 16602.18990063926, 16562.828315758143, 16565.130787077218, 16542.108772805834, 16590.899604308124, 16542.2388777077, 16575.77439856241, 16613.38351391628, 16609.76102385746, 16573.307829246267, 16577.332433531647, 16575.1389930571, 16563.181446727078, 16601.992914953473, 16605.799294851015, 16538.783859974512, 16541.18698294412, 16523.855447308633, 16510.215302989593, 16418.970640627897, 16400.96439275418, 16425.963264152506, 16473.12367990774, 16443.89888043115, 16468.834753625473, 16492.19577109786, 16539.275828400536, 16524.68652016038, 16496.052909480484, 16567.015292595217, 16499.533717551763, 16477.197338150316, 16513.21338040719, 16482.58208581089, 16528.75518788924, 16532.989921543045, 16525.096370371855, 16562.69686632468, 16521.12986806161, 16572.35337630616, 16650.140631394148, 16638.016639204277, 16630.78388721838, 16626.314454893985, 16644.543971347666, 16584.40256204829, 16574.887595442076, 16586.341327505826, 16603.33146933892, 16614.24981169916, 16587.98553584422, 16581.757304380164, 16608.540153248436, 16549.159545310944, 16525.169706466455, 16509.919025574694, 16532.0375291402, 16500.681652952197, 16528.372228198084, 16507.738024411636, 16514.009167597753, 16423.189512843557, 16465.292555082957, 16479.10501433501, 16496.763746496472, 16530.480329543443, 16535.240285290394, 16581.432615969083, 16569.189111450018, 16567.940668393043, 16572.893374500512, 16544.752854080372, 16531.4471380752, 16571.078853845884, 16549.194950408673, 16573.199399545705, 16541.791022969603, 16550.124207989906, 16577.087229857196, 16568.28208431658, 16532.858393700393, 16551.769773829532, 16548.94185654977, 16564.0098651726, 16597.834652245816, 16595.111658703972, 16459.149543755877, 16470.200838940345, 16157.676919005626, 16149.654036814965, 16193.360463920795, 16201.20938739389, 16193.029396048185, 16216.123830986704, 16222.797820194317, 16240.470728652723, 16238.131775271055, 16213.216082499514
        ]),
        priceChangePercentage24HInCurrency: 3952.64,
        currentHoldings: 1.5
    )
}

