//
//  UpperView.swift
//  LiveActivity
//
//  Created by Omega on 08.08.2022.
//

import SwiftUI

struct UpperView: View {
    let imagePath: String
    
    var body: some View {
        HStack(spacing: 20) {
            Image("logo-white")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50, height: 50)
                .cornerRadius(8)
            Text("NOVOMET")
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundColor(Color.white)
                .font(.title.bold())
            Image(imagePath)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 30, height: 30)
        }
    }
}
