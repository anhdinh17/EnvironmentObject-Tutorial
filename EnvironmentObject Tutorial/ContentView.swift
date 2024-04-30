//
//  ContentView.swift
//  EnvironmentObject Tutorial
//
//  Created by Anh Dinh on 4/22/24.
//

import SwiftUI

struct User {
    var name: String
    var email: String
    var address: String
    
    init(name: String, email: String, address: String) {
        self.name = name
        self.email = email
        self.address = address
    }
}

class ContentViewModel: ObservableObject {
    @Published var user: User
    
    init(user: User) {
        self.user = user
    }
}

struct ContentView: View {
    @StateObject var viewModel = ContentViewModel(
        user: User(
            name: "Kang Gary",
            email: "kanggary@email.com",
            address: "4567 Park Way"
        )
    )
    
    private var user: User {
        return viewModel.user
    }
    
    var body: some View {
        NavigationStack {
            List {
                NavigationLink{
                    EditProfileView()
                        //.environmentObject(viewModel)
                } label: {
                    HStack {
                        Text("GD")
                            .fontWeight(.bold)
                            .foregroundStyle(.white)
                            .frame(width: 48, height: 48)
                            .background(Color(.systemGray4))
                            .clipShape(Circle())
                        
                        VStack(alignment: .leading, spacing: 3) {
                            Text(user.name)
                                .font(.headline)
                                
                            Text(user.email)
                                .font(.system(size: 14))
                                .foregroundStyle(.gray)
                                .tint(.gray)
                            
                            Text(user.address)
                                .font(.system(size: 14))
                                .foregroundStyle(.gray)
                                .tint(.gray)
                        }
                    }
                }
            }
        }
        .environmentObject(viewModel)
    }
}

#Preview {
    ContentView()
}
