import SwiftUI

struct MoodGrid: View {
    
    // MARK: - Data Models
    struct Day: Identifiable {
        let id = UUID()
        let date: Date
    }
    
    private let calendar = Calendar.current
    private let columns = Array(repeating: GridItem(.flexible()), count: 7)
    
    // Hardcoded July 2025
    private let targetMonth = Calendar.current.date(from: DateComponents(year: 2025, month: 7))!
    
    // Predefined mood colors for specific dates
    private let greenShades: [Color] = [
        Color(red: 0.85, green: 1.0, blue: 0.85), // lightest
        Color(red: 0.6, green: 0.9, blue: 0.6),
        Color(red: 0.3, green: 0.75, blue: 0.3),
        Color(red: 0.0, green: 0.6, blue: 0.0),
        Color(red: 0.0, green: 0.4, blue: 0.0)  // darkest
    ]
    
    private var hardcodedMoodColors: [Date: Color] {
        var dict: [Date: Color] = [:]
        for day in 1...31 {
            if let date = calendar.date(from: DateComponents(year: 2025, month: 7, day: day)) {
                let level = day % 5
                dict[calendar.startOfDay(for: date)] = greenShades[level]
            }
        }
        return dict
    }

    // MARK: - Body
    var body: some View {
        VStack {
            Text("Exercise Graph")
                .font(.title)
                .bold()
                .padding(.top)
            
            Divider()

            // Month Header
            Text("July 2025")
                .font(.title2)
                .padding(.vertical, 8)

            // Weekday headers
            HStack {
                ForEach(calendar.shortWeekdaySymbols, id: \.self) { day in
                    Text(day)
                        .font(.callout)
                        .frame(maxWidth: .infinity)
                }
            }
            .padding(.horizontal)

            // Calendar grid
            LazyVGrid(columns: columns, spacing: 8) {
                ForEach(generateDaysInJuly()) { day in
                    if day.date == .distantPast {
                        Color.clear.frame(height: 50)
                    } else {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(hardcodedMoodColors[calendar.startOfDay(for: day.date)] ?? Color.gray)
                            .frame(height: 50)
                            .overlay(
                                Text("\(calendar.component(.day, from: day.date))")
                                    .foregroundColor(.white)
                            )
                    }
                }
            }
            .padding()
        }
    }
    
    // MARK: - Functions
    private func generateDaysInJuly() -> [Day] {
        var days: [Day] = []
        
        guard let range = calendar.range(of: .day, in: .month, for: targetMonth) else { return [] }
        
        let firstDayOfMonth = calendar.date(from: calendar.dateComponents([.year, .month], from: targetMonth))!
        let weekdayOffset = (calendar.component(.weekday, from: firstDayOfMonth) - calendar.firstWeekday + 7) % 7

        for _ in 0..<weekdayOffset {
            days.append(Day(date: .distantPast))
        }
        
        for day in range {
            if let date = calendar.date(byAdding: .day, value: day - 1, to: firstDayOfMonth) {
                days.append(Day(date: date))
            }
        }

        return days
    }
}

struct Previews: PreviewProvider {
    static var previews: some View {
        MoodGrid()
    }
}
