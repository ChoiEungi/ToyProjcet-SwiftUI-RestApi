//
//  SearchBarView.swift
//  Network_Image
//
//  Created by 최은기 on 2021/06/23.
//

import SwiftUI

struct SearchBarView: View {
    @Binding var searchData: String
    var body: some View {
        HStack{
            Image(systemName: "magnifyingglass").imageScale(.small)
                .foregroundColor(.gray)
            TextField("search", text: $searchData)
            Image(systemName: "x.circle.fill")
                .imageScale(.small)
                .foregroundColor(.gray)
            Spacer()
        }
        .padding(4)
        .background(Color(.white))
        .background(Color(.systemGray4))
        .cornerRadius(5.0)
    }
}

