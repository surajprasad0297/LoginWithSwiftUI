//
//  LoginView.swift
//  LoginWithSwiftUI
//
//  Created by Suraj Prasad on 01/11/23.
//

import SwiftUI

struct LoginView: View {
    @ObservedObject var viewModel = LoginViewModel()
    
    var body: some View {
        VStack {
            Text("Login")
                .font(.system(size: 32, weight: .bold))
            
            // Login TextFields
            
            VStack(alignment: .leading, spacing: 5) {
                CommonTextField(loginFieldModel: $viewModel.emailField)
                    .onSubmit {
                        viewModel.emailField.onSubmitError()
                    }
                
                CommonTextField(loginFieldModel: $viewModel.passwordField)
                    .onSubmit {
                        viewModel.passwordField.onSubmitError()
                    }
            }
            
            Button("Login") {
                // Action
                if viewModel.emailField.onValidate() && viewModel.passwordField.onValidate() {
                    print("Success")
                    print(viewModel.emailField)
                    print(viewModel.passwordField)
                }
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
