import SwiftUI

struct MoodGrid: View {
    
    // MARK: - Data Models
    struct Day: Identifiable {
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
        
        var id: String { rawValue }
    }
    
    // MARK: - State
    @State private var currentMonth = Date()
    @State private var selectedColor: ColorTag = .red
    @State private var moodColors: [Date: Color] = [:]
    
    private let calendar = Calendar.current
    private let columns = Array(repeating: GridItem(.flexible()), count: 7)
    
    // MARK: - Body
    var body: some View {
        VStack {
            Divider()
            
            // Month Navigation
            HStack {
                Button(action: { changeMonth(by: -1) }) {
                    Image(systemName: "chevron.left")
                        .foregroundStyle(.blue)
                }
                Spacer()
                Text(monthYearString(from: currentMonth))
                    .font(.title2)
                    .bold()
                Spacer()
                Button(action: { changeMonth(by: 1) }) {
                    Image(systemName: "chevron.right")
                        .foregroundStyle(.blue)
                }
            }
            .padding(.horizontal)
            
            Divider()
            
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
                ForEach(generateDaysInMonth()) { day in
                    if day.date == .distantPast {
                        Color.clear.frame(height: 50)
                    } else {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(moodColors[calendar.startOfDay(for: day.date)] ?? Color.gray)
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
            
            // Color picker row
            VStack {
                Text("What's your mood today?")
                
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
            }
            .padding(.bottom)
        }
    }
    
    // MARK: - Functions
    private func generateDaysInMonth() -> [Day] {
        var days: [Day] = []
        
        guard let range = calendar.range(of: .day, in: .month, for: currentMonth) else { return [] }
        
        let firstDayOfMonth = calendar.date(from: calendar.dateComponents([.year, .month], from: currentMonth))!
        let weekdayOffset = (calendar.component(.weekday, from: firstDayOfMonth) - calendar.firstWeekday + 7) % 7
        
        // Empty days for alignment
        for _ in 0..<weekdayOffset {
            days.append(Day(date: .distantPast))
        }
        
        // Actual days
        for day in range {
            if let date = calendar.date(byAdding: .day, value: day - 1, to: firstDayOfMonth) {
                days.append(Day(date: date))
            }
        }
        
        return days
    }
    
    private func changeMonth(by value: Int) {
        if let newMonth = calendar.date(byAdding: .month, value: value, to: currentMonth) {
            currentMonth = newMonth
        }
    }
    
    private func monthYearString(from date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "LLLL yyyy"
        return formatter.string(from: date)
    }
}

struct MoodGrid_Previews: PreviewProvider {
    static var previews: some View {
        MoodGrid()
    }
}
