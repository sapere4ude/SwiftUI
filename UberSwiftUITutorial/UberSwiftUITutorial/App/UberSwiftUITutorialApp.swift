//
//  UberSwiftUITutorialApp.swift
//  UberSwiftUITutorial
//
//  Created by Kant on 2023/03/16.
//

import SwiftUI
import Firebase

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
}


@main
struct UberSwiftUITutorialApp: App {
    
    // 정리 1. StateObject로 생성된 객체는 View의 라이프 사이클에 상관없이, SwiftUI가 View와 별개의 메모리 공간에 저장해 데이터를 안전하게 보관하도록 합니다.
    
    // 정리 2. environmentObject: parent 뷰에서 subview 에 특정 상태를 주입하여, subview 에서 그 상태에 접근할때 사용.
    // subview 에서 superview 로부터 주입받은 @EnvironmentObject 프로퍼티를 변경시키면 부모에서도 모두 뷰가 업데이트
    // 전역적으로 데이터를 공유하는 형태이므로, 뷰 간 데이터를 공유할때 사용
    
    //@StateObject var locationViewModel = LocationSearchViewModel()
    @StateObject var authViewModel = AuthViewModel()
    @StateObject var homeViewModel = HomeViewModel()
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            HomeView()
//                .environmentObject(locationViewModel)
                .environmentObject(authViewModel)
                .environmentObject(homeViewModel)
        }
    }
}
