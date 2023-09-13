//
//  ContentView.swift
//  ExCombineNotificationCenter
//
//  Created by Kant on 2023/09/13.
//

import SwiftUI
import Combine

public struct Notifications {
    static let orientationChange = UIDevice.orientationDidChangeNotification
    static let willEnterForeground = UIApplication.willEnterForegroundNotification
    static let didEnterBackground = UIApplication.didEnterBackgroundNotification
    static let willResignActive = UIApplication.willResignActiveNotification
    static let willTerminate = UIApplication.willTerminateNotification
    static let customNotification = Notification.Name("CustomNotification")
}

struct ContentView: View {
    
    @State private var newTask: String?
    
    var body: some View {
        VStack {
            Spacer()
            Button("노티를 생성해주세요!(Post)") {
                // 내가 생성하고 싶은 custom Noti
                NotificationCenter.default.post(name: Notifications.customNotification, object: "Receive Notification SUCCESS!")
            }
            Spacer()
            Text(newTask ?? "노티를 통해 전달받는\n결과값이 호출됩니다.(Receive)")
                .onReceive(NotificationCenter.default.publisher(for: Notifications.customNotification)) { result in
                    newTask = result.object as? String
                }
                .multilineTextAlignment(.center)
            Spacer()
        } // 아래의 5가지 노티는 기본적으로 제공되는 것들
        .onReceive(NotificationCenter.default.publisher(for: Notifications.orientationChange)) { _ in
            print("orientationChange")
        }
        .onReceive(NotificationCenter.default.publisher(for: Notifications.willResignActive, object: nil)) { _ in
            print("willResignActive")
        }
        .onReceive(NotificationCenter.default.publisher(for: Notifications.willTerminate, object: nil)) { _ in
            print("willTerminate")
        }
        .onReceive(NotificationCenter.default.publisher(for: Notifications.willEnterForeground, object: nil)) { _ in
            print("willEnterForeground")
        }
        .onReceive(NotificationCenter.default.publisher(for: Notifications.didEnterBackground, object: nil)) { _ in
            print("didEnterBackground")
        }
    }
    
}
