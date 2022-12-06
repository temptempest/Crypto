//
//  SettingsView.swift
//  Crypto
//
//  Created by Victor  on 29.11.2022.
//

import SwiftUI

struct SettingsView: View {
    @Environment(\.dismiss) var dismiss
    
    let defaultURL = URL(string: "https://www.google.com")!
    let coingeckoURL = URL(string: "https://www.coingecko.com")!
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.theme.background
                    .ignoresSafeArea()
                
                List {
                    applicationSection
                        .listRowBackground(Color.theme.background.opacity(0.5))
                    coinGeckoSection
                        .listRowBackground(Color.theme.background.opacity(0.5))
                }
            }
            .font(.headline)
            .accentColor(Color.blue)
            .listStyle(.grouped)
            .navigationTitle("Settings")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    xMarkButton
                }
            }
        }
    }
}

extension SettingsView {
    private var xMarkButton : some View {
        Button (action: {
            dismiss()
        }, label: {
            Image(systemName: "xmark")
                .font(.headline)
        })
    }
}

extension SettingsView {
    private var applicationSection: some View {
        Section(header: Text("Application")) {
            VStack(alignment: .leading) {
                Image("logo")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 24))
                Text("This app use SwiftUI. It uses MVVM Architecture, Combine, and Core Data!")
                    .font(.callout)
                    .fontWeight(.medium)
                    .foregroundColor(Color.theme.accent)
            }
            .padding(.vertical)
            Link("Terms of Service", destination: defaultURL)
            Link("Privacy Policy", destination: defaultURL)
        }
    }
    
    private var coinGeckoSection: some View {
        Section(header: Text("CoinGecko")) {
            VStack(alignment: .leading) {
                Image("coingecko")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 24))
                Text("The cryptocurrency data that is used in this app comes from a free API from CoinGecko!")
                    .font(.callout)
                    .fontWeight(.medium)
                    .foregroundColor(Color.theme.accent)
            }
            .padding(.vertical)
            Link("Visit CoinGecko", destination: coingeckoURL)
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SettingsView()
            SettingsView()
                .preferredColorScheme(.dark)
        }
    }
}
