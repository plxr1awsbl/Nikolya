import SwiftUI

//MainView
struct ContentView: View {
    
    //For Date creating sheet
    @State private var isCreatingDate = false
    
    //Check todays weekday
    private func toDayCheck(curDay: Int) -> Image {
        if (curDay == curWeekDay) {return Image(systemName: "checkmark.seal.fill")}
        else {return Image(systemName: "checkmark.seal")}
    }
    
    var body: some View {
        VStack{
            
            NavigationView{
                //List with weekdays and Dates
                List {

                    ForEach(weekDays) { day in
                        
                        NavigationLink(destination: DayView()) {
                            Text(day.name)
                            toDayCheck(curDay: day.num)
                                
                        }
                    }
                }
                .navigationTitle("Days")
                .toolbar {EditButton()}
            }
        
        //Date Creating sheet
        Button("Create a Date", action: {isCreatingDate.toggle()})
            .sheet(isPresented: $isCreatingDate,
                   onDismiss: didDismiss) {
                VStack{
                    dateCreationView()
                    Button("Dismiss", action: {isCreatingDate.toggle()})
                }
            }
        }
    }
    
    //Dismiss func for Date Creating sheet
    func didDismiss() {
        
    }
    
}

//ContentView
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//Weekday array
private var weekDays = [
    WeekDay(name: "Monday", num: 2),
    WeekDay(name: "Tuesday", num: 3),
    WeekDay(name: "Wednesday", num: 4),
    WeekDay(name: "Thursday", num: 5),
    WeekDay(name: "Friday", num: 6),
    WeekDay(name: "Saturday", num: 7),
    WeekDay(name: "Sunday", num: 1)
]

//Simple Day struct
struct WeekDay: Identifiable {
    let name: String
    let num: Int
    let id = UUID()
}


//Date and Time for now
var calendar = Calendar.current
var curWeekDay = calendar.component(.weekday, from: Date())
var curYear = calendar.component(.year, from: Date())
var curMonth = calendar.component(.month, from: Date())
var curDay = calendar.component(.day, from: Date())
