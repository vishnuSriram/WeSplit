//
//  ContentView.swift
//  WeSplit
//
//  Created by Vishnu Sriram on 7/25/23.
//

import SwiftUI

// We make a struct called ContentView which conforms to the View protocol
struct ContentView: View {
    // @State is a property wrapper that lets us circumvent the typical rules of structs with mutating variables in computed properties
    // @State is designed for simple properties stored in 1 view, we make this very clear by adding a private modifier
    @State private var tapCount = 0
    
    @State private var name = ""
    
    let students = ["Harry", "Hermione", "Ron"]
    @State private var selectedStudent = "Harry"

    // body is a computed property which returns some View
    // We don't know exactly what we are returning, so by supplying the opaque return type, "some View", we let Swift figure it out for us
    // You can add many more properties if you'd like!
    var body: some View {
        // NavigationView's provide us the ability to add a navigation bar below the safe area, and to show and hide view screens later on...
        NavigationView {
            Form {
                // ForEach allows you create dynamic views through closures
                // ForEach elements are especially useful with Picker views in SwiftUI
                Picker("Select your student", selection: $selectedStudent) {
                    // Note: SwiftUI needs to uniquely identify every view on a screen. "\.self" implies that the element your displaying is actually unique. This could cause a problem with duplicate elements.
                    ForEach(students, id: \.self) {
                        Text($0)
                    }
                }
                
                // Note: You need to be able to show a property of your struct in TextField's
                // "View's are a function of their State"
                // You need to use the binding operator ("$") here because you are updating the property in realtime -- 2 way binding -- read the value, and write it back to the TextField
                TextField("Enter your name", text: $name)
                Text("Your name is \(name)")
                Button("Tap Count: \(tapCount)") {
                    tapCount += 1
                }
                // Note: If you have more than 10 items in an element like a form or any kind of stack, you will need to group those elements. This applies everywhere in SwiftUI.
                // No element can have more than 10 children
                Section {
                    Text("Hello, world!")
                }
            }
            // Note: The navigationTitle property is attached to Form, not NavigationView
            .navigationTitle("SwiftUI")
            // Inline display mode is common on subsequent screens of settings app, and main title is on the main screen -- it's true!! Embrace the SwiftUI chunkiness LOL
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

// Virtual layout
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
