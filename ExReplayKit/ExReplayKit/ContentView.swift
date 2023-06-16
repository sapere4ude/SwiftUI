//
//  ContentView.swift
//  ExReplayKit
//
//  Created by Kant on 2023/06/13.
//

import SwiftUI
import ReplayKit
import MobileCoreServices

struct ContentView: View {
    @State private var isRecording = false
    @StateObject private var recorder = ScreenRecorder()

    var body: some View {
        VStack {
            Button(action: {
                if isRecording {
                    stopRecording()
                } else {
                    startRecording()
                }
            }) {
                Text(isRecording ? "Stop Recording" : "Start Recording")
                    .padding()
                    .background(isRecording ? Color.red : Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            
            Text(isRecording ? "Recording in progress" : "")
                .foregroundColor(isRecording ? .red : .clear)
                .padding(.top, 10)
        }
    }

    private func startRecording() {
        guard recorder.isAvailable else {
            print("Screen recording is not available.")
            return
        }

        recorder.startRecording { error in
            if let error = error {
                print("Error starting screen recording: \(error.localizedDescription)")
            } else {
                print("Screen recording started.")
                isRecording = true
            }
        }
    }

    private func stopRecording() {
        recorder.stopRecording { url, error in
            guard let url = url else {
                print("에러")
                return
            }
            
//            let activityViewController = UIActivityViewController(activityItems: [url], applicationActivities: nil)
//            activityViewController.excludedActivityTypes = [
//                .addToReadingList,
//                .assignToContact,
//                .print
//            ]
//
//            // Present the activity view controller...
//            DispatchQueue.main.async {
//                if let windowScene = UIApplication.shared.connectedScenes
//                    .first(where: { $0.activationState == .foregroundActive }) as? UIWindowScene,
//                    let window = windowScene.windows.first {
//                    window.rootViewController?.present(activityViewController, animated: true, completion: nil)
//                }
//            }
            
            shareVideoAsStory(url: url)
        }
        
        isRecording = false
    }
    
    func shareVideoAsStory(url: URL) {
//        guard let path = Bundle.main.path(forResource: "vid", ofType:"mp4") else {
//            debugPrint("video.m4v not found")
//            return
//        }
        do {
            let video = try Data(contentsOf: url)
            if let storiesUrl = URL(string: "instagram-stories://share") {
                if UIApplication.shared.canOpenURL(storiesUrl) {
                    let pasteboardItems: [String: Any] = [
                        "com.instagram.sharedSticker.backgroundVideo": video,
                        "com.instagram.sharedSticker.backgroundTopColor": "#636e72",
                        "com.instagram.sharedSticker.backgroundBottomColor": "#b2bec3"
                    ]
                    let pasteboardOptions = [
                        UIPasteboard.OptionsKey.expirationDate:
                            Date().addingTimeInterval(300)
                    ]
                    UIPasteboard.general.setItems([pasteboardItems], options:
                                                    pasteboardOptions)
                    DispatchQueue.main.async {
                        UIApplication.shared.open(storiesUrl, options: [:],
                                                  completionHandler: nil)
                        //self.dismiss(animated: true, completion: nil)
                    }
                } else {
                    print("Sorry the application is not installed")
                }
            }
        } catch {
            print(error)
            return
        }
    }
}

class ScreenRecorder: NSObject, ObservableObject, RPPreviewViewControllerDelegate {
    private let recorder = RPScreenRecorder.shared()

    var isAvailable: Bool {
        return recorder.isAvailable
    }

    func startRecording(completion: @escaping (Error?) -> Void) {
        recorder.startRecording { error in
            completion(error)
        }
    }

    func stopRecording(completion: @escaping (URL?, Error?) -> Void) {
        guard let outputURL = tempURL() else { return }
        recorder.stopRecording(withOutput: outputURL) { error in
            print(outputURL)
            completion(outputURL, error)
        }
    }

    func previewControllerDidFinish(_ previewController: RPPreviewViewController) {
        previewController.dismiss(animated: true)
    }
    
    func tempURL() -> URL? {
        let directory = NSTemporaryDirectory() as NSString
            
        if directory != "" {
            let path = directory.appendingPathComponent(NSUUID().uuidString + ".mp4")
            return URL(fileURLWithPath: path)
        }
        return nil
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
