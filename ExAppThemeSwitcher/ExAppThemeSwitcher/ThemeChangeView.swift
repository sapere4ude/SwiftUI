//
//  ThemeChangeView.swift
//  ExAppThemeSwitcher
//
//  Created by Kant on 12/23/23.
//

import SwiftUI

struct ThemeChangeView: View {
    
    var scheme: ColorScheme
    @AppStorage("user_theme") private var userTheme: Theme = .systemDefault
    
    /// For sliding Effect
    @Namespace private var animation
    /// View Properties
    @State private var circleOffset: CGSize = .zero
    
    init(scheme: ColorScheme) {
        self.scheme = scheme
        let isDark = scheme == .dark
        self._circleOffset = .init(initialValue: CGSize(width: isDark ? 30 : 150,
                                                        height: isDark ? -25: 150))
    }
    
    var body: some View {
        VStack(spacing: 15) {
            Circle()
                .fill(userTheme.color(scheme).gradient)
                .frame(width: 150, height: 150)
                .mask {
                    Rectangle()
                        .overlay {
                            // 기본 이미지 위에 Claer 한 Circle 을 올려준다
                            Circle()
                                .offset(circleOffset)
                                .blendMode(.destinationOut)
                        }
                }
            
            Text("Choose a Style")
                .font(.title.bold())
                .padding(.top, 25)
            
            Text("Pop or subtitle, Day or night. \nCustomize your interface.")
                .multilineTextAlignment(.center)
            
            HStack(spacing: 0) {
                ForEach(Theme.allCases, id: \.rawValue) { theme in
                    Text(theme.rawValue)
                        .padding(.vertical, 10)
                        .frame(width: 100)
                        .background {
                            ZStack {
                                if userTheme == theme {
                                    Capsule()
                                        .fill(.themeBG)
                                        .matchedGeometryEffect(id: "ACTIVE", in: animation) // 관련 블로그: https://medium.com/hcleedev/swift-matchedgeometryeffect-알아보기-150da275b277
                                }
                            }
                            .animation(.snappy, value: userTheme)
                        }
                        .contentShape(.rect)
                        .onTapGesture {
                            userTheme = theme
                        }
                }
            }
            .padding(3)
            .background(.primary.opacity(0.06), in: .capsule)
            .padding(.top, 20)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .frame(height: 410)
        .background(.themeBG)
        .clipShape(.rect(cornerRadius: 30))
        .padding(.horizontal, 15)
        .environment(\.colorScheme, scheme)
        .onChange(of: scheme, initial: false) { _, newValue in
            let isDark = newValue == .dark
            withAnimation(.bouncy) {
                circleOffset = CGSize(width: isDark ? 30 : 150,
                                      height: isDark ? -25: 150)
            }
        }
    }
}


