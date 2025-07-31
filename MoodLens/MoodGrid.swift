import SwiftUI

struct MoodGrid: View {
    
    // MARK: - Data Models
    struct Day: Identifiable, Hashable {
        let id = UUID()
        let date: Date
    }
    
    enum ColorTag: String, CaseIterable, Identifiable {
        case red, green, blue, purple, orange, yellow
        
        var color: Color {
            switch self {
            case .red: return .red
            case .green: return .green
            case .blue: return .blue
            case .purple: return .purple
            case .orange: return .orange
            case .yellow: return .yellow
            }
        }
        
        var id: String { self.rawValue }
    }
    
    // MARK: - State
    @State private var currentMonth: Date = Date()  // The currently displayed month
    @State private var selectedColor: ColorTag = .red  // User's current mood color
    @State private var moodColors: [Date: Color] = [:] // Stores moods per date
    
    private let calendar = Calendar.current
    private let columns: [GridItem] = Array(repeating: .init(.flexible()), count: 7)
    
    // MARK: - Body
    var body: some View {
        VStack {
            // Title + Month Navigation
            HStack {
                Button(action: { changeMonth(by: -1) }) {
                    Image(systemName: "chevron.left")
                }
                Spacer()
                Text(monthYearString(from: currentMonth))
                    .font(.title2)
                    .bold()
                Spacer()
                Button(action: { changeMonth(by: 1) }) {
                    Image(systemName: "chevron.right")
                }
            }
            .padding(.horizontal)
            
            Divider()
            
            // Weekday Headers
            HStack {
                ForEach(calendar.shortWeekdaySymbols, id: \.self) { day in
                    Text(day)
                        .font(.callout)
                        .frame(maxWidth: .infinity)
                }
            }
            .padding(.horizontal)
            
            // Calendar Grid
            LazyVGrid(columns: columns, spacing: 8) {
                ForEach(generateDaysInMonth()) { day in
                    if day.date == Date.distantPast {
                        Color.clear.frame(height: 50) // Placeholder for empty days
                    } else {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(moodColors[calendar.startOfDay(for: day.date), default: .gray])
                            .frame(height: 50)
                            .overlay(
                                Text("\(calendar.component(.day, from: day.date))")
                                    .foregroundColor(.white)
                            )
                            .onTapGesture {
                                let dayKey = calendar.startOfDay(for: day.date)
                                moodColors[dayKey] = selectedColor.color
                            }
                    }
                }
            }
            .padding()
            
            // Color Picker Row
            HStack {
                ForEach(ColorTag.allCases) { tag in
                    Circle()
                        .fill(tag.color)
                        .frame(width: 40, height: 40)
                        .overlay(
                            Circle()
                                .stroke(Color.black, lineWidth: selectedColor == tag ? 3 : 0)
                        )
                        .onTapGesture {
                            selectedColor = tag
                        }
                }
            }
            .padding(.bottom)
        }
    }
    
    // MARK: - Functions
    
    /// Generates all the days for the current month including leading empty placeholders
    func generateDaysInMonth() -> [Day] {
        var days: [Day] = []
        guard let range = calendar.range(of: .day, in: .month, for: currentMonth) else { return [] }
        
        let firstDayOfMonth = calendar.date(from: calendar.dateComponents([.year, .month], from: currentMonth))!
        let weekdayOffset = calendar.component(.weekday, from: firstDayOfMonth) - calendar.firstWeekday
        
        // Add empty days for alignment
        for _ in 0..<((weekdayOffset + 7) % 7) {
            days.append(Day(date: Date.distantPast))
        }
        
        // Add actual days
        for day in range {
            let date = calendar.date(byAdding: .day, value: day - 1, to: firstDayOfMonth)!
            days.append(Day(date: date))
        }
        
        return days
    }
    
    /// Changes the current month by a given number of months
    func changeMonth(by value: Int) {
        if let newMonth = calendar.date(byAdding: .month, value: value, to: currentMonth) {
            currentMonth = newMonth
        }
    }
    
    /// Formats month/year string for the title
    func monthYearString(from date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "LLLL yyyy"
        return formatter.string(from: date)
    }
}

#Preview {
    MoodGrid()
}
