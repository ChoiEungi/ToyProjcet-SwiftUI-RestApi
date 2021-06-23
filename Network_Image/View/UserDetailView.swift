//
//  UserDetailView.swift
//  Network_Image
//
//  Created by 최은기 on 2021/06/23.
//

import SwiftUI

struct UserDetailView: View {

    var user: User

    var body: some View {
        VStack(){
            URLImageView(urlString: user.avatar)
            Text(user.name)
                .font(.largeTitle)
            Text(user.createdAt)
        }
    }
}
