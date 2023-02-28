import Foundation
import SwiftUI

struct CreateTaskView: View {
    
    @State private var date = Date()
    let dateRange: ClosedRange<Date> = {
        let calendar = Calendar.current
        
        let curYear = calendar.component(.year, from: Date())
        let curMonth = calendar.component(.month, from: Date())
        let curDay = calendar.component(.day, from: Date())
        let curHour = calendar.component(.hour, from: Date())
        let curMin = calendar.component(.minute, from: Date())
        
        let startComponents = DateComponents(year: curYear, month: curMonth, day: curDay, hour: curHour, minute: curMin)
        let endComponents = DateComponents(year: curYear, month: curMonth, day: curDay + 1, hour: curHour, minute: curMin)
        
        return calendar.date(from:startComponents)!
                ...
                calendar.date(from:endComponents)!
    }()
    
    var body: some View {
        DatePicker(
            "Start Date and Time",
            selection: $date,
            in: dateRange,
            displayedComponents: [.date, .hourAndMinute]
        )
    }
}

var TaskList = [Task]()

struct Task: View {
    @State private var name: String
    @State private var date: DateComponents
    
    var body: some View {
        VStack{
            
        }
    }
}

