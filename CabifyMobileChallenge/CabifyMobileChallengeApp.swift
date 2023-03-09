//
//  CabifyMobileChallengeApp.swift
//  CabifyMobileChallenge
//
//  Created by Yeniel Landestoy on 7/3/23.
//

import SwiftUI
import Stinsen

@main
struct AppLauncher {
    static func main() throws {
        if NSClassFromString("XCTestCase") == nil {
            CabifyMobileChallengeApp.main()
        } else {
            TestApp.main()
        }
    }
}

struct CabifyMobileChallengeApp: App {
    @SceneBuilder
    var body: some Scene {
        WindowGroup {
            AppCoordinator().view()
        }
    }
}

struct TestApp: App {
    var body: some Scene {
        WindowGroup { Text("Running Unit Tests") }
    }
}
