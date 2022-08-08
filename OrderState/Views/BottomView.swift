//
//  BottomView.swift
//  LiveActivity
//
//  Created by Omega on 08.08.2022.
//

import SwiftUI

struct BottomView: View {
    
    let status: Status
    
    var body: some View {
        HStack(alignment: .bottom) {
            VStack(alignment: .leading, spacing: 4) {
                Text(status.rawValue)
                    .font(.title3)
                    .foregroundColor(.white)
                Text(status.subTitle)
                    .font(.caption2)
                    .foregroundColor(.white.opacity(0.7))
            }
            Spacer()
        }
        .frame(maxHeight: .infinity, alignment: .bottom)
    }
}
