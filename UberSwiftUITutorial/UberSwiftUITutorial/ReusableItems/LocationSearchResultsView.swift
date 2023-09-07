//
//  LocationSearchResultsView.swift
//  UberSwiftUITutorial
//
//  Created by Kant on 2023/09/03.
//

import SwiftUI

struct LocationSearchResultsView: View {
    
    // TODO: - StateObject를 사용하는 이유가 뭔지 확인하고 작성하기
    // 왜 EnvironmentObject 를 사용하지 않고 StateObject를 사용한걸까?
    // viewModel을 EnvironmentObject 으로 변경하고 실행한 결과, 홈 > 검색 > 결과 노출된 뒤 Settings > Home 으로 진입했을때 검색 결과가 남아있는 이슈가 있는걸 볼 수 있었음. 즉, viewModel 의 데이터가 재사용되고 있는걸 확인함
    // 이 두가지의 속성 래퍼에 대한 설명은 해당 내용에 정리해뒀으니 확인해보기
    //
    @StateObject var viewModel: HomeViewModel
    
    let config: LocationResultsViewConfig
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                ForEach(viewModel.results, id: \.self) { result in
                    LocationSearchResultCell(title: result.title, subtitle: result.subtitle)
                        .onTapGesture {
                            withAnimation(.spring()) {
                                viewModel.selectLocation(result, config: config)
                            }
                        }
                }
            }
        }
    }
}
