//
//  TransactionDecodableModel.swift
//  WorldOfTransactions
//
//  Created by Hamed Moosaei on 11/21/22.
//

import Foundation

// MARK: - Welcome
struct TransactionDecodableModel: Decodable {
    let items: [TransactionDecodable]
}

// MARK: - TransactionDecodable
struct TransactionDecodable: Decodable {
    let partnerDisplayName: String
    let alias: Alias
    let category: Int
    let transactionDetail: TransactionDetail
}

// MARK: - Alias
struct Alias: Decodable {
    let reference: String
}

// MARK: - TransactionDetail
struct TransactionDetail: Decodable {
    let transactionDetailDescription: Description?
    let bookingDate: String
    let value: Value

    enum CodingKeys: String, CodingKey {
        case transactionDetailDescription = "description"
        case bookingDate, value
    }
}

enum Description: String, Decodable {
    case punkteSammeln = "Punkte sammeln"
}

// MARK: - Value
struct Value: Decodable {
    let amount: Int
    let currency: Currency
}

enum Currency: String, Decodable {
    case pbp = "PBP"
}
