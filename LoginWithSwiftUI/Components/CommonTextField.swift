//
//  CommonTextField.swift
//  LoginWithSwiftUI
//
//  Created by Suraj Prasad on 01/11/23.
//

import SwiftUI

struct CommonTextField: View {
    var loginFieldModel: Binding<LoginFieldModel>
    
    var body: some View {
        VStack(alignment: .leading) {
            TextField(loginFieldModel.fieldType.wrappedValue.placeholder,
                      text: loginFieldModel.value)
            
            VStack {
                TextField("", text: loginFieldModel.value)
                    .padding(.horizontal, 8)
                    .frame(minHeight: 50, alignment: .center)
            }
            .background(Color.accentColor.opacity(0.2))
            .cornerRadius(10.0)
            
            if let error = loginFieldModel.error.wrappedValue {
                Text(error)
                    .foregroundColor(.red)
                    .font(.system(size: 15.0))
                    .multilineTextAlignment(.leading)
                    .padding(.horizontal, 0)
            }
        }
        .padding()
    }
}

struct CommonTextField_Previews: PreviewProvider {
    static var previews: some View {
        @ObservedObject var viewModel = LoginViewModel()
        CommonTextField(loginFieldModel: $viewModel.emailField)
    }
}
