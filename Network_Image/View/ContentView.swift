//
//  ContentView.swift
//  Network_Image
//
//  Created by 최은기 on 2021/06/23.
//  api-url: https://60d2d8c8858b410017b2e48e.mockapi.io/user


import SwiftUI

struct ContentView: View {
    
    @State private var users = [User]()
    @State var data: String = ""
    
    var body: some View {
        NavigationView{
            ScrollView{
                LazyVGrid(columns: [GridItem(.flexible())], content: {
                    SearchBarView(searchData: $data)
                    ForEach(users) { user in
                        NavigationLink(
                            destination: UserDetailView(user: user),
                            label: {
                                HStack{
                                    URLImageView(urlString: user.avatar)
                                    Text("\(user.name)")
                                    Spacer() // for alignment contents
                                }
                            }
                        )
                        Divider() // making the seperate line :)
                    }
                })
            }
            .navigationBarTitle(Text("Load Image by Using Rest Api"), displayMode:.inline )
            
        }
        .onAppear{
            WebService().loadUsers{(users) in
                self.users = users
            }
            
            WebService().loadUsers { (users) in
                self.users = users
                    
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
