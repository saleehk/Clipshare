//
//  ClipShareApp.swift
//  ClipShare
//
//  Created by Saleeh k on 07/01/23.
//

import SwiftUI
import AppKit
//import UIKit


import Foundation
var useWindow1: Bool = true
struct RootView: View {
    var body: some View {
        Group {
            if useWindow1 {
//                ContentView()
            } else {
//                Window2()
            }
        }
    }
}
class AppDelegate: NSObject, NSApplicationDelegate {
    var timer: Timer!
    let pasteboard: NSPasteboard = .general
    var lastChangeCount: Int = 0
    private var window: NSWindow!
    // 1
    private var statusItem: NSStatusItem!

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
        // 3
        if let button = statusItem.button {
            button.image = NSImage(systemSymbolName: "1.circle", accessibilityDescription: "1")
        }
        setupMenus()
//        NotificationCenter.default.addObserver(self, selector: #selector(clipboardChanged),
//                                                       name: UIPasteboard.changedNotification, object: nil)
        

//        NSPasteboard.didChangeValue(forKey: <#T##String#>)
        startClipListen();
    }
    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
        timer.invalidate()
    }
    func startClipListen() {
        timer = Timer.scheduledTimer(withTimeInterval: 0.05, repeats: true) { (t) in
//            print("checking")
                if self.lastChangeCount != self.pasteboard.changeCount {
//                    print("checking")
                    self.lastChangeCount = self.pasteboard.changeCount
                    let pasteboard = NSPasteboard.general
                    if let clipboardString = pasteboard.string(forType: .string) {
                        sendToPhone(clipboard: clipboardString)
//                        print(clipboardString)
                    }
//                    NotificationCenter.default.post(name: .NSPasteboardDidChange, object: self.pasteboard)
                }
            }
    }
//    extension NSNotification.Name {
//        public static let NSPasteboardDidChange: NSNotification.Name = .init(rawValue: "pasteboardDidChangeNotification")
//    }
    // 1
       private func changeStatusBarButton(number: Int) {
           if let button = statusItem.button {
               button.image = NSImage(systemSymbolName: "\(number).circle", accessibilityDescription: number.description)
           }
       }

       @objc func didTapOne() {
                              let pasteboard = NSPasteboard.general
                              if let clipboardString = pasteboard.string(forType: .string) {
                                  sendToPhone(clipboard: clipboardString)
                              }
       }

       @objc func didTapTwo() {
           changeStatusBarButton(number: 2)
       }

       @objc func didTapThree() {
           changeStatusBarButton(number: 3)
       }
    func setupMenus() {
            let menu = NSMenu()
            let one = NSMenuItem(title: "Send to phone", action: #selector(didTapOne) , keyEquivalent: "1")
            menu.addItem(one)
            menu.addItem(NSMenuItem(title: "Quit", action: #selector(NSApplication.terminate(_:)), keyEquivalent: "q"))
            statusItem.menu = menu
        }
}

@main
struct ClipShareApp: App {
    @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    @Environment(\.scenePhase) var scenePhase

    private var statusItem: NSStatusItem!
    @State var currentNumber: String = "1"
    @State var settingsShow: Bool = false
    
       var body: some Scene {
           WindowGroup("Settings") {
               ContentView()
              }.onChange(of: scenePhase) { newScenePhase in
                  switch newScenePhase {
                  case .active:
                    print("App is active")
                  case .inactive:
                    print("App is inactive")
                  case .background:
                    print("App is in background")
                  @unknown default:
                    print("Oh - interesting: I received an unexpected new value.")
                  }
                }
//                      if(settingsShow)
//           {
//
//           }
//           Settings {
//                       Text("Hello")
//                   }

//           MenuBarExtra(currentNumber, systemImage: "\(currentNumber).circle") {
//               Button("Send to phone") {
//                   let pasteboard = NSPasteboard.general
//                   if let clipboardString = pasteboard.string(forType: .string) {
//                       sendToPhone(clipboard: clipboardString)
//                   }
//               }
//               .keyboardShortcut("1")
//               ContentView()
////               Button("Register Device") {
////                   currentNumber = "2"
////               }
////               .keyboardShortcut("3")
////               Button("Read Data") {
////                   let defaults = UserDefaults.standard
////                   if let stringOne = defaults.string(forKey: DefaultsKeys.deviceID) {
////                       print(stringOne) // Some String Value
////                   }
////               }
////               .keyboardShortcut("3")
////               Divider()
////               Button(currentNumber){
////
////               }
//
//               Button("Quit") {
//
//                   NSApplication.shared.terminate(nil)
//
//               }.keyboardShortcut("q")
//
//           }
       }
    
    
}
