//
//  ViewController.swift
//  CocoapodsUiSwift
//
//  Created by Vinita Miranda on 5/21/15.
//  Copyright (c) 2015 Vinita Miranda. All rights reserved.
//

import UIKit

class ViewController: UIViewController,CKCalendarViewDataSource, CKCalendarViewDelegate {

    var data = NSMutableDictionary()
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func viewWillAppear(animated: Bool) {
    
    var title = "Event 1"
    var date = NSDate(day: 21, month: 05, year: 2015)
    var releaseUpdatedCalendarKit : CKCalendarEvent = CKCalendarEvent(title: title, andDate: date, andInfo: nil)
    self.data.setObject([releaseUpdatedCalendarKit], forKey: date)
    
    var calendar : CKCalendarView = CKCalendarView()
    calendar.delegate = self
    calendar.dataSource = self
    self.view.addSubview(calendar)
    
    
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func calendarView(calendarView: CKCalendarView!, eventsForDate date: NSDate!) -> [AnyObject]! {
        var date = NSDate(day: 21, month: 05, year: 2015)

        return self.data[date] as? [AnyObject]
    }

}

