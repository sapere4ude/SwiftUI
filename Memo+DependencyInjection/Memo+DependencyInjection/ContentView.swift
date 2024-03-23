//
//  ContentView.swift
//  Memo+DependencyInjection
//
//  Created by Kant on 12/12/23.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.noteManager) private var noteManager: NoteManager
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(noteManager.getAllNotes(), id: \.title) { note in
                        Text(note.title)
                    }
                }
                
                Button("Add Note") {
                    let newNote = Note(title: "New Note", content: "Enter content here")
                    noteManager.addNote(newNote)
                }
            }
            .navigationTitle("Notes")
        }
        .environment(\.noteManager, NoteManager())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
