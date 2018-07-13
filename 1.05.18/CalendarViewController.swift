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
            
            @IBOutlet weak var imageView: UIImageView!
            var receivedImage : UIImage?
            @IBOutlet weak var calendarView: CVCalendarView!
            @IBOutlet weak var menuView: CVCalendarMenuView!
            
            
            func firstWeekday() -> Weekday {
                return .monday
            }
            
            func presentationMode() -> CalendarMode {
                return .monthView
            }
            
            override func viewDidLoad() {
                super.viewDidLoad()
                imageView.image = receivedImage
            }
            
                override func viewDidLayoutSubviews() {
                super.viewDidLayoutSubviews()
                
                menuView.commitMenuViewUpdate()
                calendarView.commitCalendarViewUpdate()
            }
            
            
        }
