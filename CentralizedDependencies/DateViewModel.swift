//
//  DateViewModel.swift
//  CentralizedDependencies
//
//  Created by Manu on 29/02/2024.
//

import Foundation

struct DateViewModel {
    func currentFormattedDate(
        dateStyle: DateFormatter.Style = .full,
        timeStyle: DateFormatter.Style = .full
    ) -> String {
        Current.dateFormatter(dateStyle: dateStyle, timeStyle: timeStyle)
            .string(from: Current.date())
    }
}
