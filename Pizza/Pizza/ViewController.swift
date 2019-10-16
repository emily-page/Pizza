//
//  ViewController.swift
//  Pizza
//
//  Created by ios6 on 5/8/17.
//  Copyright © 2017 ios6. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController, UNUserNotificationCenterDelegate
{
    var isGranted: Bool = false
    @IBOutlet weak var barnabysLabel: UILabel!
    override func viewDidLoad()
    {
        super.viewDidLoad()
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound])
        { (granted, Error) in
            self.isGranted = granted
            if !self.isGranted
            {
                //yell @ user
            }
        }
        UNUserNotificationCenter.current().delegate = self
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void)
    {
        completionHandler([.alert, .badge, .sound])
    }
    
    func makePizzaContent() -> UNMutableNotificationContent
    {
        var content = UNMutableNotificationContent()
        content.title = "Timed Pizza Step"
        content.body = "Making Pizza"
        content.userInfo = ["Step":0]
        return content
    }
    
    func addNotitcation(trigger: UNNotificationTrigger?, content: UNMutableNotificationContent, indentifier: String)
    {
        let request = UNNotificationRequest(identifier: indentifier, content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request)
        {
            (Error) in
            print("Something went wrong")
        }
    }
    
    @IBAction func makeAPizza(_ sender: UIButton)
    {
        if isGranted
        {
            let content = makePizzaContent()
            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 10.0, repeats: false)
            addNotitcation(trigger: trigger, content: content, indentifier: "Message.pizza")
        }
    }
    
    @IBAction func scheduleAPizza(_ sender: UIButton)
    {
        if isGranted
        {
            var content = UNMutableNotificationContent()
            content.title = "A Schedualed Pizza"
            content.body = "Time to make a Pizza"
            let unitFlags: Set<Calendar.Component> = [.minute, .hour, .second]
            var date = Calendar.current.dateComponents(unitFlags, from: Date())
            date.second = date.second! + 15
            let trigger = UNCalendarNotificationTrigger(dateMatching: date, repeats: false)
            addNotitcation(trigger: trigger, content: content, indentifier: "Message.schedule")
        }
    }
    
    @IBAction func nextPizzaStep(_ sender: UIButton)
    {
        if isGranted
        {
            var content = UNMutableNotificationContent()
            content.title = "Next Pizza"
            content.body = "Time to make a Pizza"
            let unitFlags: Set<Calendar.Component> = [.minute, .hour, .second]
            var date = Calendar.current.dateComponents(unitFlags, from: Date())
            date.second = date.second! + 15
            let trigger = UNCalendarNotificationTrigger(dateMatching: date, repeats: false)
            addNotitcation(trigger: trigger, content: content, indentifier: "Message.schedule")
        }
    }
    
    @IBAction func viewPendingNotif(_ sender: UIButton)
    {
        if isGranted
        {
            var content = UNMutableNotificationContent()
            content.title = "View Pending Pizza"
            content.body = "Time to make a Pizza"
            let unitFlags: Set<Calendar.Component> = [.minute, .hour, .second]
            var date = Calendar.current.dateComponents(unitFlags, from: Date())
            date.second = date.second! + 15
            let trigger = UNCalendarNotificationTrigger(dateMatching: date, repeats: false)
            addNotitcation(trigger: trigger, content: content, indentifier: "Message.schedule")
        }
    }
    
    @IBAction func viewDeliveredNotif(_ sender: UIButton)
    {
        if isGranted
        {
            var content = UNMutableNotificationContent()
            content.title = "View Delivered Pizza"
            content.body = "Time to make a Pizza"
            let unitFlags: Set<Calendar.Component> = [.minute, .hour, .second]
            var date = Calendar.current.dateComponents(unitFlags, from: Date())
            date.second = date.second! + 15
            let trigger = UNCalendarNotificationTrigger(dateMatching: date, repeats: false)
            addNotitcation(trigger: trigger, content: content, indentifier: "Message.schedule")
        }
    }
    
    @IBAction func removeNotif(_ sender: UIButton)
    {
        if isGranted
        {
            var content = UNMutableNotificationContent()
            content.title = "Remove Pizza"
            content.body = "Time to make a Pizza"
            let unitFlags: Set<Calendar.Component> = [.minute, .hour, .second]
            var date = Calendar.current.dateComponents(unitFlags, from: Date())
            date.second = date.second! + 15
            let trigger = UNCalendarNotificationTrigger(dateMatching: date, repeats: false)
            addNotitcation(trigger: trigger, content: content, indentifier: "Message.schedule")
        }
    }
}
