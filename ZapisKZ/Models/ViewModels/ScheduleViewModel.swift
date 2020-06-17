//
//  ScheduleViewModel.swift
//  ZapisKZ
//
//  Created by Rauan on 5/15/20.
//  Copyright © 2020 Rauan. All rights reserved.
//

import Foundation

struct ScheduleViewModel {
    
    let daysOfWeek = [0: "ПН",
                      1: "ВТ",
                      2: "СР",
                      3: "ЧТ",
                      4: "ПТ",
                      5: "СБ",
                      6: "ВС",
    ]
    
    var today: Bool?
    var schedule: String?
    var day_str: String?
    var index: Int?
    var expand_str: String?
    
    init(_ index: Int, _ startTime: String, _ endTime: String, _ expand: Bool) {
        let _today = todayDayOfWeek() - 2 < 0 ? 6 : todayDayOfWeek() - 2
        today = _today == index
        expand_str = expand ? "Расписание ˄" : "Расписание ⌄"
        self.index = index
        day_str = daysOfWeek[index]
        let _startTime = startTime.components(separatedBy: " ").last ?? ""
        let _endTime = endTime.components(separatedBy: " ").last ?? ""
        schedule = "\(_startTime) - \(_endTime)"
    }
    
    private func todayDayOfWeek() -> Int {
        let formatter  = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        let todayDate = Date()
        let myCalendar = Calendar(identifier: .gregorian)
        let weekDay = myCalendar.component(.weekday, from: todayDate)
        return weekDay
    }
}

