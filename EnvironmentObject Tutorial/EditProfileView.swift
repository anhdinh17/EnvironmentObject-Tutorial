//
//  EditProfileView.swift
//  EnvironmentObject Tutorial
//
//  Created by Anh Dinh on 4/22/24.
//

import SwiftUI
import Foundation

struct EditProfileView: View {
    @EnvironmentObject var viewModel: ContentViewModel
    
    var body: some View {
        List {
            Section("Edit Options") {
                Text(viewModel.user.name)
                
                NavigationLink{
                    EditEmailView()
                        //.environmentObject(viewModel)
                } label: {
                    Text(viewModel.user.email)
                }
                
                NavigationLink{
                    EditAddressView()
                        //.environmentObject(viewModel)
                } label: {
                    Text(viewModel.user.address)
                }
            }
        }
    }
}

struct EditEmailView: View {
    @State var email: String = ""
    @Environment(\.dismiss) var dismiss
    
    @EnvironmentObject var viewModel: ContentViewModel
        
    var body: some View {
        VStack {
            TextField("Edit your email", text: $email)
                .font(.subheadline)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .padding(.horizontal,4)
            
            Divider()
            
            Spacer()
        }
        .navigationTitle("Edit Email")
        .navigationBarTitleDisplayMode(.inline)
        .padding()
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button("Done") {
                    viewModel.user.email = self.email
                    dismiss()
                }
                .fontWeight(.semibold)
            }
        }
    }
}

struct EditAddressView: View {
    @State var address: String = ""
    @Environment(\.dismiss) var dismiss
    
    @EnvironmentObject var viewModel: ContentViewModel
    
    private var user: User {
        return viewModel.user
    }
    
    var body: some View {
        VStack {
            TextField("Edit your address", text: $address)
                .font(.subheadline)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .padding(.horizontal,4)
            
            Divider()
            
            Spacer()
        }
        .navigationTitle("Edit Address")
        .navigationBarTitleDisplayMode(.inline)
        .padding()
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button("Done") {
                    viewModel.user.address = self.address
                    dismiss()
                }
                .fontWeight(.semibold)
            }
        }
    }
}

#Preview {
    EditProfileView()
}
