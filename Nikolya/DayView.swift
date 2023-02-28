import Foundation
import SwiftUI

struct DayView: View {
    
    @State private var isEmpty = true
    
    func addNewTask() -> Void {
        print(1)
    }
    
    var body: some View {
        if (isEmpty) {
            VStack{
                
            }.navigationTitle("")
        }
    }
}

//struct Day
struct Day: View {
    var body: some View {
        VStack {
            
        }
    }
}
