//
//  CalendarViewController.swift
//  15.05.18
//
//  Created by Andrii Kravchenko on 27.06.18.
//  Copyright © 2018 Samus Dimitriy. All rights reserved.
//

import UIKit
import CVCalendar

class CalendarViewController: UIViewController, CVCalendarViewDelegate, CVCalendarMenuViewDelegate {
    func presentationMode() -> CalendarMode {
        return .monthView
    }
    
    func firstWeekday() -> Weekday {
        return .monday
    }
    

    @IBOutlet weak var calendarView: CVCalendarView!
    @IBOutlet weak var menuView: CVCalendarMenuView!
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        menuView.commitMenuViewUpdate()
        calendarView.commitCalendarViewUpdate()
    }
}
