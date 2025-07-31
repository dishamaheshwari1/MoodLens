//
//  LoggingView.swift
//  MoodLens
//
//  Created by Disha Maheshwari on 7/29/25.
//

import SwiftUI

struct DayEntry: Codable {
    var mood: String
    var activities: [String: Int]
}

struct LoggingView: View {
    @State private var selectedMood: String? = nil
    @State private var activityLogs: [String: Int] = [:]

    let availableMoods = ["😊", "😐", "😢", "😠", "😴"]
    let activities = ["Exercise", "Sleep", "Me-Time"]

    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Text("How are you feeling today?")
                    .font(.headline)

                HStack {
                    ForEach(availableMoods, id: \.self) { mood in
                        Text(mood)
                            .font(.largeTitle)
                            .padding()
                            .background(selectedMood == mood ? Color.blue.opacity(0.3) : Color.clear)
                            .clipShape(Circle())
                            .onTapGesture {
                                selectedMood = mood
                            }
                    }
                }

                Divider()

                Text("What did you do today?")
                    .font(.headline)

                VStack {
                    ForEach(activities, id: \.self) { activity in
                        VStack(alignment: .leading) {
                            Text(activity)
                            HStack {
                                ForEach(1...5, id: \.self) { level in
                                    Rectangle()
                                        .fill(colorForLevel(level))
                                        .frame(width: 30, height: 30)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 4)
                                                .stroke(activityLogs[activity] == level ? Color.black : Color.clear, lineWidth: 2)
                                        )
                                        .onTapGesture {
                                            activityLogs[activity] = level
                                        }
                                }
                            }
                        }
                        .padding(.vertical, 5)
                    }
                }

                Spacer()

                Button("Save Entry") {
                    saveTodayEntry()
                }
                .disabled(selectedMood == nil)
                .buttonStyle(.borderedProminent)
            }
            .padding()
            .navigationTitle("Log Your Day")
        }
    }

    func colorForLevel(_ level: Int) -> Color {
        let baseColor = Color.green
        return baseColor.opacity(0.2 + 0.15 * Double(level - 1))
    }

    func saveTodayEntry() {
        guard let mood = selectedMood else { return }

        let entry = DayEntry(mood: mood, activities: activityLogs)

        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        let todayKey = formatter.string(from: Date())

        var allEntries = loadAllEntries()
        allEntries[todayKey] = entry

        if let encoded = try? JSONEncoder().encode(allEntries) {
            UserDefaults.standard.set(encoded, forKey: "dailyLogs")
        }
    }

    func loadAllEntries() -> [String: DayEntry] {
        if let data = UserDefaults.standard.data(forKey: "dailyLogs"),
           let decoded = try? JSONDecoder().decode([String: DayEntry].self, from: data) {
            return decoded
        }
        return [:]
    }
}


#Preview {
    LoggingView()
}
