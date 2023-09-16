//
//  Alerts29.swift
//  LearningSwiftApp
//
//  Created by Thore Brehmer on 13.09.23.
//

import SwiftUI

//1. for multiple alerts use enum -> switch
//2. there are two versions, one will be deprecated soon
//3. why not just use multiple .alerts instead of computation of enum + switch?

enum AlertType: LocalizedError{
    case error
    case success
}

struct Alerts29: View {
    @State var backgroundColor: Color = .white
    @State var showAlert: Bool = false
    @State var showAlert2: Bool = false
    @State var alertType: AlertType?
    
    var body: some View {
        ZStack{
            backgroundColor.ignoresSafeArea()
            
            HStack{
                Button("Success") {
                    alertType = .success
                    showAlert.toggle()
                }
                
                Button("Error") {
                    alertType = .error
                    showAlert.toggle()
                }
            }
            alertNew()
            //old alert
           // .alert(isPresented: $showAlert, content: oldAlert)
            
        }
        
    }
    
    func alertNew() -> some View {
        var title: String {
            switch alertType {
            case .success:
                return "Success Title"
            case .error:
                return "Error Title"
            default:
                return "nil"
            }
        }
        
        
        return ZStack{}.alert(title, isPresented: $showAlert) {
            //actions
            switch alertType {
            case .success:
                Button("OK",role: .cancel) {}
            case .error:
                Button("Cancel",role: .cancel) {}
                Button("Delete", role: .destructive) {}
            default:
                Button("nil") {}
            }
        } message: {
            switch alertType {
            case .success:
                Text("Success msg")
            case .error:
                Text("Error msg")
            default:
                Button("nil") {}
            }
        }
    }
    
    func oldAlert() -> Alert {
        switch alertType {
        case .success:
            return Alert(
                title: Text("Success Title"),
                message: Text("Success msg"),
                dismissButton: .cancel(Text("Ok")))
        case .error:
            return Alert(
                title: Text("Error title"),
                message: Text("Error msg"),
                primaryButton: .cancel(Text("Cancel")),
                secondaryButton: .destructive(Text("Destroy")))
        default:
            return Alert(
                title: Text("Nil"),
                message: Text("Nil"))
        }
    }
    
}

struct Alerts29_Previews: PreviewProvider {
    static var previews: some View {
        Alerts29()
    }
}
