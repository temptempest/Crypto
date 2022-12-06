//
//  PortfolioView.swift
//  Crypto
//
//  Created by Victor  on 29.11.2022.
//

import SwiftUI

struct PortfolioView: View {
    
    @Environment(\.dismiss) var dismiss
    
    @EnvironmentObject private var vm: HomeViewModel
    
    @State private var selectedCoin: Coin? = nil
    @State private var quantityText: String = ""
    @State private var showCheckmark: Bool = false
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 0) {
                    SearchBarView(searchText: $vm.searchText)
                    coinLogoList
                    if selectedCoin != nil {
                        withAnimation(.none) {
                            portfolioInputSection
                        }
                        .padding()
                        .font(.headline)
                    }
                }
            }
            .background(
                Color.theme.background
                    .ignoresSafeArea()
            )
            .navigationTitle("Edit Portfolio")
            
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    xMarkButton
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    trailingNavBarButtons
                }
            }
            .onChange(of: vm.searchText) { newValue in
                if newValue == "" {
                    removeSelectedCoin()
                }
            }
        }
    }
}

extension PortfolioView {
    private var coinLogoList: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(spacing: 10) {
                ForEach(vm.searchText.isEmpty ? vm.portfolioCoins : vm.allCoins) { coin in
                    CoinLogoView(coin: coin)
                        .frame(width: 75)
                        .padding(4)
                        .onTapGesture {
                            withAnimation(.easeIn) {
                                updateSelectedCoin(coin: coin)
                            }
                        }
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(selectedCoin?.id == coin.id ?  Color.theme.green : Color.clear,
                                        lineWidth: 1)
                        )
                }
            }
            .frame(height: 120)
            .padding(.leading)
        }
    }
    
    private func getCurrentValue() -> Double {
        if let quantity = Double(quantityText) {
            return quantity * (selectedCoin?.currentPrice ?? 0)
        }
        return 0
    }
    
    private func updateSelectedCoin(coin: Coin) {
        selectedCoin = coin
        
        if let portfolioCoin = vm.portfolioCoins.first(where: { $0.id == coin.id }),
           let amount = portfolioCoin.currentHoldings {
            quantityText = "\(amount)"
        } else {
            quantityText = ""
        }
    }
    
    private var portfolioInputSection: some View {
        withAnimation(.none) {
            VStack(spacing: 20) {
                HStack {
                    Text("Current prive of  \(selectedCoin?.symbol.uppercased() ?? ""):")
                    Spacer()
                    Text(selectedCoin?.currentPrice.asCurrencyWith6Decimals() ?? "")
                }
                Divider()
                HStack {
                    Text("Amount holding:")
                    Spacer()
                    TextField("Ex: 1.4", text: $quantityText)
                        .multilineTextAlignment(.trailing)
                        .keyboardType(.decimalPad)
                }
                Divider()
                HStack {
                    Text("Current value:")
                    Spacer()
                    Text(getCurrentValue().asCurrencyWith2Decimals())
                }
            }
        }
        .padding()
        .font(.headline)
    }
    
    private var xMarkButton : some View {
        Button (action: {
            dismiss()
        }, label: {
            Image(systemName: "xmark")
                .font(.headline)
        })
    }
    
    private var trailingNavBarButtons: some View {
        HStack(spacing: 10) {
            Image(systemName: "checkmark")
                 .opacity(showCheckmark ? 1.0 : 0.0)
            Button {
                saveButtonPressed()
            } label: {
                Text("Save".uppercased())
            }
            .opacity(
                (selectedCoin != nil && selectedCoin?.currentHoldings != Double(quantityText)) ? 1.0 : 0.0
            )
        }
        .font(.headline)
    }

    
    private func saveButtonPressed() {
        guard
            let coin = selectedCoin,
            let amount = Double(quantityText)
        else { return }
        
        //save to portfolio
        vm.updatePortfolio(coin: coin, amount: amount)
        
        //show checkmark
        withAnimation(.easeIn) {
            showCheckmark = true
            removeSelectedCoin()
        }
        
        //hide the keyboard
        UIApplication.shared.endEditing()
        
        //hide checkmark
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            withAnimation(.easeOut) {
                showCheckmark = false
            }
        }
    }
    
    private func removeSelectedCoin() {
        selectedCoin = nil
        vm.searchText = ""
    }
    
}

struct PortfolioView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            PortfolioView()
                .environmentObject(dev.homeVM)
            PortfolioView()
                .environmentObject(dev.homeVM)
                .preferredColorScheme(.dark)
        }
    }
}
