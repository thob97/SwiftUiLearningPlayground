//
//  Alerts29.swift
//  LearningSwiftApp
//
//  Created by Thore Brehmer on 13.09.23.
//

import SwiftUI

//takeaways
//1. there are two versions
// 1.1 old Alert: alert(binding){Alert()} (will be deprecated soon)
// 1.2 new Alert: alert(title, binding, actions, message)
//2. if using Opt1: only one .alert is useable as modifier -> multiple will break each other
//3. to use multiple alerts:
// 3.1 Method 1: either use enum + conditional for multiple alerts
// 3.2 Method 2: or connect .alert to different views, (eg zStacks -> simpler & cleaner imo)
// 3.3 use the new Alert

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
                    showAlert2.toggle()
                }
            }
            //For testing only -> old Alert: Multi Does not work
//            newAlertMethod1(alertType: alertType, showAlert: $showAlert)
//            newAlertMethod1(alertType: alertType, showAlert: $showAlert2)
            
            //old Alert: Method2 -> Multi Does Work!
//            ZStack{}.alert(isPresented: $showAlert) {Alert(title: Text("1"))}
//            ZStack{}.alert(isPresented: $showAlert2) {Alert(title: Text("2"))}
            
            //old Alert: Method1 -> Multi Does Work!
//           .alert(isPresented: $showAlert, content: oldAlertMethod1)
            
            newAlertMulti(showAlert: $showAlert, showAlert2: $showAlert2)

            
        }
        
    }
    
    func oldAlertMethod1() -> Alert {
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

struct newAlertMulti: View {
    @Binding var showAlert: Bool
    @Binding var showAlert2: Bool
    
    var body: some View{
        ZStack{}
            .alert("Success", isPresented: $showAlert) {
                Button("Cancel",role: .cancel) {}
                Button("Delete", role: .destructive) {}
            } message: {
                Text("Success msg")
            }
            .alert("Error", isPresented: $showAlert2) {
                Button("Cancel",role: .cancel) {}
                Button("Opt1") {}
                Button("Opt2") {}
                Button("Opt3") {}
            } message: {
                Text("Error msg")
            }
    }
}

struct Alerts29_Previews: PreviewProvider {
    static var previews: some View {
        Alerts29()
    }
}
