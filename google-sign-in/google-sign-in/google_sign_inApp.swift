//
//  google_sign_inApp.swift
//  google-sign-in
//
//  Created by An Luu on 2/3/25.
//

import SwiftUI

import GoogleSignIn

@main
struct googleSigInApp: App {
    let SRC = "googleSigInApp"
    var body: some Scene {
        WindowGroup {
            Text(SRC)
                .onAppear {
                    GIDSignIn.sharedInstance.restorePreviousSignIn { user, error in
                        if user != nil {
                            print("\(SRC): user = \(user!)|")
                        }
                        else {
                            print("\(SRC): ERROR: User is nil")
                        }
                        
                        if error != nil {
                            print("\(SRC): ERROR = \(error!)|")
                        }                    }
                }
                .onOpenURL { url in
                    let SRC = self.SRC + ".onOpenURL"
                    print("\(SRC): url = \(url)|")
                    
                    GIDSignIn.sharedInstance.handle(url)
                }
        }
    }
}
