import SwiftUI

// Structure of what the boxes should contain
struct DayInfo: Identifiable {
    var id = UUID()
    var day: Int
    var dayTimeCheck: Bool
    var nightTimeCheck: Bool
    var dayTimestamp: String?
    var nightTimestamp: String?
}

struct DailyRemindr: View {
    @State private var daily: [DayInfo] = {
        // Load saved states and timestamps from UserDefaults
        var days = [DayInfo]()
        for i in 1...7 {
            let dayTimeCheck = UserDefaults.standard.bool(forKey: "dayTimeCheck_\(i)")
            let nightTimeCheck = UserDefaults.standard.bool(forKey: "nightTimeCheck_\(i)")
            let dayTimestamp = UserDefaults.standard.string(forKey: "dayTimestamp_\(i)")
            let nightTimestamp = UserDefaults.standard.string(forKey: "nightTimestamp_\(i)")
            days.append(DayInfo(day: i, dayTimeCheck: dayTimeCheck, nightTimeCheck: nightTimeCheck, dayTimestamp: dayTimestamp, nightTimestamp: nightTimestamp))
        }
        return days
    }()
    
    var body: some View {
        ZStack
        {
            VStack {
                Text("Dosage Log")
                    .font(.title2) 
                    .fontWeight(.bold)
                
                ForEach($daily) { $day in
                    HStack {

                        Spacer()
                        Text("Day \(day.day)")
                            .font(.headline)
                        Spacer()
                        Button(action: {
                            day.dayTimeCheck.toggle()
                            if day.dayTimeCheck {
                                day.dayTimestamp = getCurrentTime()
                                UserDefaults.standard.set(day.dayTimestamp, forKey: "dayTimestamp_\(day.day)")
                            } else {
                                day.dayTimestamp = nil
                                UserDefaults.standard.removeObject(forKey: "dayTimestamp_\(day.day)")
                            }
                            UserDefaults.standard.set(day.dayTimeCheck, forKey: "dayTimeCheck_\(day.day)")
                        }) {
                            Image(systemName: day.dayTimeCheck ? "sun.max.fill" : "sun.max")
                                .font(.system(size: 24))
                        }
                        Spacer()
                        Text(day.dayTimestamp ?? "")
                            .font(.footnote)
                            .foregroundColor(.gray)
                        Spacer()
                        Button(action: {
                            day.nightTimeCheck.toggle()
                            if day.nightTimeCheck {
                                day.nightTimestamp = getCurrentTime()
                                UserDefaults.standard.set(day.nightTimestamp, forKey: "nightTimestamp_\(day.day)")
                            } else {
                                day.nightTimestamp = nil
                                UserDefaults.standard.removeObject(forKey: "nightTimestamp_\(day.day)")
                            }
                            UserDefaults.standard.set(day.nightTimeCheck, forKey: "nightTimeCheck_\(day.day)")
                        }) {
                            Image(systemName: day.nightTimeCheck ? "moon.fill" : "moon")
                                .font(.system(size: 24))
                        }
                        Spacer()
                        Text(day.nightTimestamp ?? "")
                            .font(.footnote)
                            .foregroundColor(.gray)
                        Spacer()
                    }
                    .frame(height: 20)
                    Divider()
                }
                .padding()
            }
            .navigationTitle("Daily Dose")
        }
    }
}

// Function to get the current time as a string (only time)
func getCurrentTime() -> String {
    let formatter = DateFormatter()
    formatter.timeStyle = .short
    return formatter.string(from: Date())
}

#Preview {
    DailyRemindr()
}
