//
//  World.swift
//  CentralizedDependencies
//
//  Created by Manu on 29/02/2024.
//

import Foundation

#if DEBUG
var Current = World()
#else
let Current = World()
#endif

struct World {
    var calendar = Calendar.autoupdatingCurrent
    var date = { Date() }
    var locale = Locale.autoupdatingCurrent
    var timeZone = TimeZone.autoupdatingCurrent

    var notificationHandler: NotificationCenter = NotificationCenter.default
    var pokemonsAPI = PokemonsAPI()
}

extension World {
    func dateFormatter(
        dateStyle: DateFormatter.Style = .full,
        timeStyle: DateFormatter.Style = .full
    ) -> DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = dateStyle
        formatter.timeStyle = timeStyle
        formatter.calendar = self.calendar
        formatter.locale = self.locale
        formatter.timeZone = self.timeZone
        return formatter
    }
}
