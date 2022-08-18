//
//  StreakViewModel.swift
//  PocketRehab
//
//  Created by Amin  Bagheri  on 2022-08-10.
//

import Foundation

class StreakViewModel: ObservableObject {
    
    // MARK: StreakCount is published as we are using it to update our text in another view
    @Published var streakCount: Int = 1 {
        // every time streak count changes, update the userdefaults location to be equal to the new value for streak count
        didSet {
            UserDefaults.standard.set(streakCount, forKey: "streakCount")
        }
    }
    
    // when initializing this view model, we are setting streak count to be equal to the userdefaults location
    init() {
        if UserDefaults.standard.integer(forKey: "streakCount") == 0 {
            UserDefaults.standard.set(1, forKey: "streakCount")
            self.streakCount = UserDefaults.standard.integer(forKey: "streakCount")
        } else {
            self.streakCount = UserDefaults.standard.integer(forKey: "streakCount")
        }
    }
    
    var lastLoggedIn: String? = nil {
        didSet {
            print("Last logged in", lastLoggedIn)
        }
    }
    var recentLoggedIn: String? = nil {
        didSet {
            print("Recent log in", recentLoggedIn)
        }
    }
    func motivationalMessege(streak: Int) -> String {
        if streak <= 7 {
            return "You're just getting started!"
        } else if streak <= 14 {
            return "Keep it up!"
        } else if streak <= 25 {
            return "Thats dedication!"
        } else if streak <= 40 {
            return "Phenominal!"
        } else if streak <= 60 {
            return "Amazing work!"
        }
        return "You're killing it!"
    }
    func updateStreak() -> Void {
        if UserDefaults.standard.string(forKey: "lastLoggedInDate") == nil {
            // MARK: Setting the last logged in date to be NOW. (Should only be executed once)
            UserDefaults.standard.set(Date.now.displayFormat, forKey: "lastLoggedInDate")
            lastLoggedIn = UserDefaults.standard.string(forKey: "lastLoggedInDate")
        } else { // MARK: the user has logged in for a second or more time.
            recentLoggedIn = Date.now.displayFormat
            lastLoggedIn = UserDefaults.standard.string(forKey: "lastLoggedInDate")
            
            if lastLoggedIn != recentLoggedIn {
                // MARK: User has logged in on different days
                print("User has logged in on different day")
                let lastLoggedInDay = Int.parse(from: lastLoggedIn!)
                let recentLoggedInDay = Int.parse(from: recentLoggedIn!)
                let loggedInXDaysAgo = recentLoggedInDay! - lastLoggedInDay!
                print("Logged in \(loggedInXDaysAgo) days ago.")
                if loggedInXDaysAgo == 1 || (recentLoggedInDay == 1 && (lastLoggedInDay == 28 || lastLoggedInDay == 29 || lastLoggedInDay == 30 || lastLoggedInDay == 31 ) ) {
                    // MARK: Has logged in consecutively
                    streakCount += 1
                    lastLoggedIn = recentLoggedIn
                    UserDefaults.standard.set(lastLoggedIn, forKey: "lastLoggedInDate")
                } else {
                    // MARK: Has missed a day
                    streakCount = 1
                    lastLoggedIn = Date.now.displayFormat
                    UserDefaults.standard.set(lastLoggedIn, forKey: "lastLoggedInDate")

                }
            } else {
                // MARK: User has logged in on same day
                print("User has logged in on the same day")
                streakCount = UserDefaults.standard.integer(forKey: "streakCount")
            }
        }
    }
}

extension Date {
    var displayFormat: String {
        self.formatted(
            .dateTime
                .weekday(.wide)
                .day(.defaultDigits)
        )
    }
    
}

extension Int {
    static func parse(from string: String) -> Int? {
        return Int(string.components(separatedBy: CharacterSet.decimalDigits.inverted).joined())
    }
}
