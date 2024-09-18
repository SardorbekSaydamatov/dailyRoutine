//
//  ContentView.swift
//  PieChart
//
//  Created by Sardorbek Saydamatov on 31/08/24.
//

import SwiftUI
import Charts


struct MainView: View {
    private var dayRoutine: [ActivitiesModel] = [
        ActivitiesModel(title: "Sleep", start: "12:00 AM", stop: "08:00 AM", duration: 8, color: "gray"),
        ActivitiesModel(title: "Work", start: "09:00 AM", stop: "02:00 PM", duration: 6, color: "blue"),
        ActivitiesModel(title: "Exercise", start: "02:00 PM", stop: "03:00 PM", duration: 1.5, color: "red"),
        ActivitiesModel(title: "Leisure", start: "05:00 PM", stop: "10:00 PM", duration: 7.25, color: "yellow"),
        ActivitiesModel(title: "Work", start: "10:00 PM", stop: "01:00 AM", duration: 3, color: "orange"),
        ActivitiesModel(title: "Leisure", start: "01:00 AM", stop: "03:00 AM", duration: 2.2, color: "mint")
    ]
    
    var body: some View {
        VStack(alignment: .leading) {
            Chart {
                ForEach(generateChartData(), id: \.id) { segment in
                    SectorMark(
                        angle: .value("Duration", segment.duration),
                        innerRadius: .ratio(0.5),
                        angularInset: 1.0
                    )
                    .foregroundStyle(Color.from(name: segment.color))
                    .annotation(position: .overlay) {
                        Text(formatDuration(segment.duration) + "h")
                            .font(.caption)
                            .foregroundColor(Color.init(.secondaryLabel))
                    }
                }
            }
            .chartLegend(.visible)
            .frame(height: 300)
            
            VStack(alignment: .leading, spacing: 8) {
                ForEach(dayRoutine) { routine in
                    HStack(spacing: 20) {
                        Circle()
                            .fill(Color.from(name: routine.color))
                            .frame(width: 12, height: 12)
                        Text(routine.title)
                            .font(.body)
                        
                        Text("\(routine.start) - \(routine.stop)")
                            .font(.body)
                            .foregroundColor(.gray)
                    }
                }
            }
            .padding()
        }
        .navigationBarBackButtonHidden()
        .navigationTitle("One-day routine")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    private func formatDuration(_ duration: Double) -> String {
        if duration.truncatingRemainder(dividingBy: 1) == 0 {
            return String(format: "%.0f", duration)
        } else {
            return String(format: "%.1f", duration)
        }
    }
    
    private func generateChartData() -> [SegmentModel] {
        var segments: [SegmentModel] = []
        
        if let firstStartTime = time(from: dayRoutine.first?.start ?? "12:00 AM") {
            let firstActivityStart = firstStartTime
            let dayStart = time(from: "12:00 AM") ?? firstActivityStart
            let gapDuration = firstActivityStart.timeIntervalSince(dayStart) / 3600 // convert to hours
            if gapDuration > 0 {
                segments.append(SegmentModel(id: UUID(), duration: gapDuration, color: "lightgray"))
            }
        }
        
        for (i, routine) in dayRoutine.enumerated() {
            let startTime = time(from: routine.start) ?? Date()
            let endTime = time(from: routine.stop) ?? Date()
            let duration = endTime.timeIntervalSince(startTime) / 3600
            segments.append(SegmentModel(id: UUID(), duration: duration, color: routine.color))
            
            if i < dayRoutine.count - 1 {
                let nextStartTime = time(from: dayRoutine[i + 1].start) ?? Date()
                let gapDuration = nextStartTime.timeIntervalSince(endTime) / 3600
                if gapDuration > 0 {
                    segments.append(SegmentModel(id: UUID(), duration: gapDuration, color: "white"))
                }
            }
        }
        
        if let lastStopTime = time(from: dayRoutine.last?.stop ?? "03:00 AM") {
            let dayEnd = time(from: "03:00 AM") ?? lastStopTime
            let gapDuration = dayEnd.timeIntervalSince(lastStopTime) / 3600
            if gapDuration > 0 {
                segments.append(SegmentModel(id: UUID(), duration: gapDuration, color: "white"))
            }
        }
        
        return segments
    }
    
    private func time(from timeString: String) -> Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = "h:mm a"
        return formatter.date(from: timeString)
    }
}

#Preview {
    NavigationStack {
        MainView()
    }
}
