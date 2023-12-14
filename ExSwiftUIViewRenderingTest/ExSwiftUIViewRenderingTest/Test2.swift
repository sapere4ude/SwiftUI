//
//  Test2.swift
//  ExSwiftUIViewRenderingTest
//
//  Created by Kant on 12/14/23.
//

// 참조 블로그: https://velog.io/@ictechgy/SwiftUI의-View-렌더링은-언제-이루어지는가

// 무언가 값의 변경이 일어난다면? 뷰의 body 호출은 될 수 있어도 re-rendering 은 실질적인 내용 변화가 있는 경우에만 동작한다!

import SwiftUI

struct Test2: View {
    
    // Test2
    // View 가 State 프로퍼티를 가지고 있으나 body에서 사용하지 않고 있다 가정할때, 해당 프로퍼티의 변화가
    // view 의 body 를 재호출시킬까?
    // 정답은 X. 아래의 경우, body 는 재호출되지 않는다
    
    @State private var count = 0
    
    var body: some View {
        Text("테스트를 위해 작성합니다")
            .onTapGesture {
                count += 1
            }
    }
}

#Preview {
    Test2()
}
