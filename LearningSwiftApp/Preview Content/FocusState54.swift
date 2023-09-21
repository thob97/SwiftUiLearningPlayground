//
//  FocusState54.swift
//  LearningSwiftApp
//
//  Created by Thore Brehmer on 21.09.23.
//

import SwiftUI

//takeaways:
//1. useful for: go next textfield, on new page auto focus, submit on error focus
//2. use @FocusState var as binding & .focused() modifier on textField
//3. .focused() can either bind a bool (good for single textfields), or other hash-able values (e.g. enums, good for multiple textfields)
//4. textfield.focused() accepts nil values

enum FocusedTextField: Hashable { //<-----
    case username, password
}

struct FocusState54: View {
    @FocusState var focused: FocusedTextField? //<-----
    @State var username: String = ""
    @State var password: String = ""
    
    
    var body: some View {
        VStack {
            Group{
                TextField("Username", text: $username)
                    .focused($focused, equals: .username) //<-----
                    .submitLabel(.next)
                    .onSubmit {focused = .password} //<----- on Enter
                TextField("Password", text: $password)
                    .focused($focused, equals: .password) //<-----
            }
                .padding()
                .background(Color.gray.opacity(0.15))
                .cornerRadius(20)
                .padding()
            
            Button("Sign Up") { //<----- on validation
                //validate username & password
                if username.isEmpty{
                    focused = .username 
                }
                else if password.isEmpty{
                    focused = .password
                }
            }
        }
        .onAppear{
            //this may need a delay,
            focused = .username //<----- on opening Page
        }
    }
}

struct FocusState54_Previews: PreviewProvider {
    static var previews: some View {
        FocusState54()
    }
}
