//
//  OrderState.swift
//  OrderState
//
//  Created by Omega on 08.08.2022.
//

import WidgetKit
import SwiftUI
import Intents

@main
struct WidgetState: Widget {    
    var body: some WidgetConfiguration {
        ActivityConfiguration(attributesType: ChargeAttributes.self) { content in
            ZStack {
                RoundedRectangle(cornerRadius: 15, style: .continuous)
                    .fill(Color.blue.gradient)
                VStack {
                    UpperView(imagePath: content.state.status.imagePath)
                    BottomView(status: content.state.status)
                }
                .padding(20)
            }
        }
    }
}
