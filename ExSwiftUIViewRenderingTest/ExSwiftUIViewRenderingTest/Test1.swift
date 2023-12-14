//
//  ContentView.swift
//  ExSwiftUIViewRenderingTest
//
//  Created by Kant on 12/14/23.
//

import SwiftUI

struct Test1: View {
    
    // Test 1
    // ContentView 는 viewModel 을 가지고 있긴 하지만, viewModel 의 @Published 프로퍼티를 전혀 사용하고 있지 않다.
    // 이런 경우, count 프로퍼티의 변화는 ContentView 의 body 를 재호출 하게 될까?
    // 결과는 O. body 를 재호출하게 된다. 하지만 이것은 view 가 rendering 된다는 것과는 다른 말이다.
    @ObservedObject private var viewModel = RenderingViewModel()
    
    var body: some View {
        Text("테스트를 위해 작성합니다")
            .onTapGesture {
                viewModel.increment()
            }
    }
}

final class RenderingViewModel: ObservableObject {
    @Published private(set) var count = 0
    
    func increment() {
        count += 1
    }
}

#Preview {
    Test1()
}
