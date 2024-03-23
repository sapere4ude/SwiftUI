//
//  NoteManager.swift
//  Memo+DependencyInjection
//
//  Created by Kant on 12/12/23.
//

import Foundation
import SwiftUI

class NoteManager {
    
    var notes: [Note] = []
    
    func addNote(_ note: Note) {
        notes.append(note)
    }
    
    func getAllNotes() -> [Note] {
        return notes
    }
}

struct Note {
    var title: String
    var content: String
}

protocol NoteManagerInjectable {
    var noteManager: NoteManager { get }
}

extension EnvironmentValues {
    var noteManager: NoteManager {
        get { self[NoteManagerKey.self] }
        set { self[NoteManagerKey.self] = newValue }
    }
}

private struct NoteManagerKey: EnvironmentKey {
    static var defaultValue: NoteManager = NoteManager()
}
