import SwiftUI

// Structure of what the boxes should contain
struct DayInfo: Identifiable {
    var id = UUID()
    var day: Int
    var dayTimeCheck: Bool
    var nightTimeCheck: Bool
}

struct DailyRemindr: View {
    @State private var daily: [DayInfo] = [
        DayInfo(day: 1, dayTimeCheck: UserDefaults.standard.bool(forKey: "dayTimeCheck_1"), nightTimeCheck: UserDefaults.standard.bool(forKey: "nightTimeCheck_1")),
        DayInfo(day: 2, dayTimeCheck: UserDefaults.standard.bool(forKey: "dayTimeCheck_2"), nightTimeCheck: UserDefaults.standard.bool(forKey: "nightTimeCheck_2")),
        DayInfo(day: 3, dayTimeCheck: UserDefaults.standard.bool(forKey: "dayTimeCheck_3"), nightTimeCheck: UserDefaults.standard.bool(forKey: "nightTimeCheck_3")),
        DayInfo(day: 4, dayTimeCheck: UserDefaults.standard.bool(forKey: "dayTimeCheck_4"), nightTimeCheck: UserDefaults.standard.bool(forKey: "nightTimeCheck_4")),
        DayInfo(day: 5, dayTimeCheck: UserDefaults.standard.bool(forKey: "dayTimeCheck_5"), nightTimeCheck: UserDefaults.standard.bool(forKey: "nightTimeCheck_5")),
        DayInfo(day: 6, dayTimeCheck: UserDefaults.standard.bool(forKey: "dayTimeCheck_6"), nightTimeCheck: UserDefaults.standard.bool(forKey: "nightTimeCheck_6")),
        DayInfo(day: 7, dayTimeCheck: UserDefaults.standard.bool(forKey: "dayTimeCheck_7"), nightTimeCheck: UserDefaults.standard.bool(forKey: "nightTimeCheck_7")),
    ]
    
    var body: some View {
        VStack {
            Text("Dosage dose")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            ForEach($daily) { $day in // Using binding here
                HStack {
                    Spacer()
                    Text("Day \(day.day)")
                        .font(.title)
                    Spacer()
                    Button(action: {
                        day.dayTimeCheck.toggle()
                        UserDefaults.standard.set(day.dayTimeCheck, forKey: "dayTimeCheck_\(day.day)") // Save state
                    }) {
                        Image(systemName: day.dayTimeCheck ? "sun.max.fill" : "sun.max")
                            .font(.system(size: 30))
                    }
                    Spacer()
                    Button(action: {
                        day.nightTimeCheck.toggle()
                        UserDefaults.standard.set(day.nightTimeCheck, forKey: "nightTimeCheck_\(day.day)") // Save state
                    }) {
                        Image(systemName: day.nightTimeCheck ? "moon.fill" : "moon")
                            .font(.system(size: 30))
                    }
                    Spacer()
                }
                .frame(width: 350, height: 5) // Adjusted height for visibility
                Divider()
            }
            .padding()
        }
        .navigationTitle("Daily dose")
    }
}

#Preview {
    DailyRemindr()
}
