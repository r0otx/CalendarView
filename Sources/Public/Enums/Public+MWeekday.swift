//
//  Public+MWeekday.swift of CalendarView
//
//  Created by Alina Petrovska on 25.10.2023.
//    - Mail: alina.petrovskaya@mijick.com
//    - GitHub: https://github.com/Mijick
//
//  Copyright ©2023 Mijick. Licensed under MIT License.


public enum MWeekday: Int { case sunday = 1, monday, tuesday, wednesday, thursday, friday, saturday }

public enum WeekdayRule {
    enum StartDay {
        case sunday, saturday, monday
    }
    
    static func firstWeekday(for countryCode: String) -> MWeekday {
        let startDay = startDay(for: countryCode)
        switch startDay {
        case .sunday: return .sunday
        case .saturday: return .saturday
        case .monday: return .monday
        }
    }
    
    private static func startDay(for countryCode: String) -> StartDay {
        let country = countryCode.uppercased()
        
        // 🇺🇸 SUNDAY - ~50% of the world
        let sundayCountries = [
            // North America
            "US", "CA", "MX",
            // South America
            "BR", "AR", "CL", "CO", "PE", "VE", "BO", "UY", "PY", "EC", "GY", "SR", "GF",
            // Asia
            "IN", "CN", "JP", "KR", "PH", "VN", "TH", "ID", "MY", "SG",
            // Middle East
            "IL",
            // Oceania
            "AU", "NZ"
        ]
        
        // 🇸🇦 SATURDAY - Muslim countries
        let saturdayCountries = [
            // Persian Gulf
            "SA", "QA", "KW", "OM", "BH", "AE", // UAE partially switched to Sunday
            // North Africa
            "EG", "LY", "DZ", "MA", "TN",
            // Others
            "AF", "IQ", "YE", "SO"
        ]
        
        if sundayCountries.contains(country) { return .sunday }
        if saturdayCountries.contains(country) { return .saturday }
        
        // Default: Monday (Europe, Russia, majority)
        return .monday
    }
}
