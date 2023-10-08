//
//  DoTryCatchThrows.swift
//  LearningSwiftApp
//
//  Created by Thore Brehmer on 29.09.23.
//

import SwiftUI

//Takeaways:
//1. custom errors can be created with enums and error protocols
//2. there are predefined errors
//3. try? can be optional -> will return nil on error throw instead of going to catch clausal
//4. "let error" can be left out and be implicit
//5. multiple catch blocks are possible, and thus multiple different errors can be caught

struct DoTryCatchThrows58: View {
    @State var text1 = "Not set yet"
    @State var text2 = "Not set yet"
    @State var text3 = "Not set yet"
    @State var text4 = "Not set yet"
    
    var body: some View {
        VStack{
            Text(text1)
            Text(text2)
            Text(text3)
            Text(text4)
        }.onTapGesture {
            //try optional
            if let t = try? throwingFunc(willPass: "optional try") {text1 = t}
            let _ = try? throwingFunc(willPass: "") //will throw error -> nil
            
            //5.2 catch specific error (with para from enum)
            do {
                let _ = try throwingFunc(willPass: "")
            } catch CustomError.error1(let msg) {
                text2 = "\(msg): customError1 was catched"
            } catch {}
            
            //5.2 catch specific error (with switch)
            do {
                let _ = try throwingFunc(willPass: "")
            } catch let error as CustomError {
                switch error {
                case .error1(let msg):
                    text2 = "\(msg): customError1 was catched"
                default:
                    print("default")
                }
                
            } catch {}
            
            //catch default error
            do {
                let _ = try throwingFunc(willPass: "")
            } catch CustomError.error2 {
                text2 = ""
            } catch {
                text3 = "default error was catched"
            }
            
            //try succedes
            do {
                text4 = try throwingFunc(willPass: "doTryCatch")
            } catch { //"let error" is implicit if nothing else stands beside catch
                text4 = error.localizedDescription
            } 
            
        }
    }

    enum CustomError: Error {
        case error1(message: String)
        case error2
        case error3
    }
    
    func throwingFunc(willPass: String) throws -> String {
        if !willPass.isEmpty {
            return willPass
        } else {
            throw CustomError.error1(message: "Error 1")
        }
    }
}



struct DoTryCatchThrows58_Previews: PreviewProvider {
    static var previews: some View {
        DoTryCatchThrows58()
    }
}
