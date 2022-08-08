//
//  OrderAttributes.swift
//  LiveActivity
//
//  Created by Omega on 08.08.2022.
//

import SwiftUI
import ActivityKit

struct ChargeAttributes: ActivityAttributes {
    struct ContentState: Codable, Hashable {
        var status: Status = .progress
    }
}

enum Status: String, Codable, CaseIterable, Equatable {
    case waiting = "Добро пожаловать!"
    case progress = "Идет зарядка..."
    case needPay = "Ожидается оплата."
    
    var imagePath: String {
        switch self {
        case .progress:
            return "charging"
        case .needPay:
            return "payment"
        default:
            return ""
        }
    }
    
    var subTitle: String {
        switch self {
        case .waiting:
            return "Нажмите, чтобы перейти в приложение."
        case .progress:
            return "Зарядная сессия в процессе. Заряжено 4 кВт/ч. Сумма 100 р"
        case .needPay:
            return "Зарядка завершена. Для завершения оплатите зарядку."
        }
    }
}
