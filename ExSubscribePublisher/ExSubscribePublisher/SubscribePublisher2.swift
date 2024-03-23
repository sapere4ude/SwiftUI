//
//  SubscribePublisher2.swift
//  ExSubscribePublisher
//
//  Created by Kant on 10/8/23.
//

import SwiftUI
import Combine

class DataModel: ObservableObject {
    @Published var data: String = "☀️"
    
    init() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.data = "🌖"
        }
    }
}

struct TestView: View {
    
    @ObservedObject var model = DataModel()
    
    var body: some View {
        Text(model.data)
    }
}

#Preview {
    TestView(model: DataModel())
}
