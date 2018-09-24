//
//  AppDelegate.swift
//  TinkoffFinance
//
//  Created by Denis Nefedov on 24/09/2018.
//  Copyright © 2018 X. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    /* Функция определения текущего статуса состояния приложения */
    private func currentState() -> String {
        let applicationState = UIApplication.shared.applicationState
        var state : String
        switch applicationState {
        case .active:
            state = "Active"
        case .background:
            state = "Background"
        case .inactive:
            state = "Inactive"
        }
        return state
    }
    
    /**
     * Handler смены статуса состояния приложения
     * Выводит текущий статус эпликейшена + имя функции из который был вызван
     */
    private func stateChangeLogger(from previousState: String? = nil, to nextState: String? = nil, function: String = #function) {
        #if DEBUG
        if previousState == nil, let next = nextState {
            print("Application moves from \(currentState()) to \(next) state: \(function)")
        } else if let previous = previousState {
            print("Application moved from \(previous) to \(currentState()) state: \(function)")
        }
        print("********************************************\n")
        #endif
    }

    func application(_ application: UIApplication, willFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        #if DEBUG
        stateChangeLogger(from: "Not running") // переходим из "not running" -> "inactive"
        #endif
        return true
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        #if DEBUG
        // Здесь по прежнему остаемся Inactive....
        if application.applicationState == .inactive {
            print("Current state is Inactive... \(#function)")
            print("********************************************\n")
        }
        #endif
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
        #if DEBUG
        stateChangeLogger(to: "Inactive") // переходим из "Active" -> "inactive"
        #endif
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
        #if DEBUG
        stateChangeLogger(from: "Inactive")
        #endif
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
        #if DEBUG
        stateChangeLogger(to: "Inactive") 
        #endif
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
        #if DEBUG
        stateChangeLogger(from: "Inactive") // переходим из "inactive" -> "Active"
        #endif
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        // Saves changes in the application's managed object context before the application terminates.
        #if DEBUG
        stateChangeLogger(to: "Not running") // переходим из "not running" -> "inactive"
        #endif
        self.saveContext()
    }

    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
        */
        let container = NSPersistentContainer(name: "TinkoffFinance")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                 
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

}

