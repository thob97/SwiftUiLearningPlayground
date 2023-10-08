//
//  Sendable71.swift
//  LearningSwiftApp
//
//  Created by Thore Brehmer on 05.10.23.
//

import SwiftUI

//takeaways
//1. is a protocol that can be inherited, to mark if the code is thread-safe/ safe to use in concurrent code (async code)
//2. implicit inherited on value types: int, string, structs, ...
//3. most used on reference types like: classes, actors, funcs
//4. @sendable for functions
//5. (compiler will warn if annotation is needed)

struct Sendable72: View, Sendable { //<-----
    
    @Sendable func test () {} //<-----
    
    var body: some View {
        Text("")
    }
}

#Preview {
    Sendable72()
}
