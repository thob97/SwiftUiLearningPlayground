//
//  VsActorClassStruct71.swift
//  LearningSwiftApp
//
//  Created by Thore Brehmer on 05.10.23.
//

import SwiftUI

//takeaways:
//1. STRUCTS
// 1.1. structs are value types (when copying: not pointer/(reference to instance) but values of struct are copied)
// 1.2. structs need mutating keyword for functions which change values of struct (write on copy) (mutating)
// 1.3. structs need to be declared as var type, to be able to change its values (write on copy) (mutating)
// 1.4. better performance & saver / better code structure (einfacher zu durchschauen, da nur ein pointer)
// 1.5 thread-safe, (as only one pointer per object exists)
// 1.6 (immutable on structs preferred (its data will not change / everything is a let))
// 1.7 used for: data models, views

//2. OBJECTS
// 2.1 are reference types (when copying: copying pointer / reference to instance (values of all copied objects will update on a var change))
// 2.2 does not need mutating keyword or be declared as var type (var or let)
// 2.3 slower performance (as all pointers need to stay in sync with the data) & less clear (as you do not know on runtime who does have access to objects)
// 2.4 not thread-safe (as multiple pointers can exist and access the data simultaneously)
// 2.5 used for: view model

//3. ACTORS
// 3.1 actors are like classes but thread-safe (locking: when multiple pointers to the actor access the same data) (-> async environment)
// 3.2 -> values can only be changed inside the thread (as if the vars are private(set))
// 3.3 -> functions and vars need await
// 3.4 used for: only for shared classes, like 'manager' and 'data stores' (not viewModel, as its is only accessed by mainThread)
struct VsActorClassStruct71: View {
    var body: some View {
        Text("VS")
    }
}

#Preview {
    VsActorClassStruct71()
}
