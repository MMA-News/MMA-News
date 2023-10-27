import UIKit

//MARK: - Date format
extension String {
    
    func toDate(formatDate: FormatDate) -> Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = formatDate.rawValue
        let date = formatter.date(from: self)
        return date
    }
    
    func convert(from: FormatDate, to: FormatDate) -> String? {
        let formatter = DateFormatter()
        formatter.dateFormat = from.rawValue
        let date = formatter.date(from: self)
        let convertResult = date?.toString(formatDate: to)
        return convertResult
    }
    
    enum FormatDate: String {
        case fullData_Time    = "dd.MM.yy HH:mm"
        case time             = "HH:mm"
        case monthDay         = "MM.dd"
        case monthDayYear     = "MM.dd.yy"
        case dayMonthYear     = "dd.MM.yy"
        case ddDotMMDotyyyy   = "dd.MM.yyyy"
        case dayMonthText     = "dd MMMM"
        case dayMonthTextYear = "dd MMMM yyyy"
        case long             = "MMMM d, yyyy"
        case fcCalendar       = "yyyy-MM-dd"
        case orderDateTime    = "dd_MMMM_yyyy HH :mm :ss"
        case orderDatePath    = "dd_MMMM_yyyy/"
        case orderDate        = "dd_MMMM_yyyy"
        case longDateString   = "EEEE, MMM d, yyyy"
    }
}
