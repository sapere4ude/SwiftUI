//
//  ContentView.swift
//  ExSwiftUIDataFlow
//
//  Created by Kant on 2023/09/15.
//

import SwiftUI
import Combine

struct RandomNumberView: View {
    @State private var randomNumber: Int = 0
    private var cancellables = Set<AnyCancellable>()

    var body: some View {
        VStack {
            Text("Random Number: \(randomNumber)")
                .font(.largeTitle)
                .padding()

            Button("Generate Random Number") {
                self.generateRandomNumber()
            }
            .padding()
        }
    }

    private mutating func generateRandomNumber() {
        // 사용할 Publisher: 무작위 숫자를 생성하고 SwiftUI 뷰에 업데이트
        let randomNumberPublisher = Just(Int.random(in: 1...100))
            .receive(on: DispatchQueue.main)
            .assign(to: \.randomNumber, on: self)

        // Combine Subscription을 저장
        randomNumberPublisher
            .store(in: &cancellables)
    }
}

@main
struct RandomNumberApp: App {
    var body: some Scene {
        WindowGroup {
            RandomNumberView()
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        RandomNumberView()
    }
}
