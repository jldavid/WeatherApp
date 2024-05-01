import SwiftUI
import Foundation

// https://www.weatherapi.com/docs/weather_conditions.json
func getWeatherEmoji(code: Int) -> String {
    var weatherEmoji = "☀️"
    switch code {
    case 1000:
        weatherEmoji = "☀️"
        break
    case 1003:
        weatherEmoji = "🌤️"
        break
    case 1273, 1276, 1279, 1282:
        weatherEmoji = "⛈️"
        break
    case 1087:
        weatherEmoji = "🌩️"
        break
    case 1147, 1135, 1030, 1009, 1006:
        weatherEmoji = "☁️"
        break
    case 1264, 1261, 1258, 1252, 1249, 1201, 1198, 1195, 1192, 1189, 1186, 1183, 1180, 1171, 1168, 1153, 1150, 1072, 1063:
        weatherEmoji = "🌧️"
        break
    case 1255, 1246, 1243, 1240, 1237, 1225, 1222, 1219, 1216, 1213, 1210, 1207, 1204, 1117, 1114, 1069, 1066:
        weatherEmoji = "🌨️"
        break
    default:
        weatherEmoji = "☀️"
        break
    }
    return weatherEmoji
}

func getBackgroundColor(code: Int) -> Color {
    var backgroundColor = Color.init(red: 47/255, green: 79/255, blue: 79/255)
    switch code {
    case 1000, 1003:
        backgroundColor = Color.init(red: 0/255, green: 114/255, blue: 160/255)
        break
    default:
        break
    }
    return backgroundColor
}

func getShortDate(epoch: Int) -> String {
    return Date(timeIntervalSince1970: TimeInterval(epoch)).formatted(Date.FormatStyle().weekday(.abbreviated))
}

// 2024-03-19 00:00
func getShortTime(time: String) -> String {
    var meridiem = "AM"
    var displayTime = 1
    let militaryTime = time.suffix(5)
    let currentTime = militaryTime.prefix(2)
    if (currentTime == "00" || currentTime == "12") {
        displayTime = 12
        if (currentTime == "00") {
            meridiem = "AM"
        } else {
            meridiem = "PM"
        }
    } else {
        if let intTime = Int(currentTime) {
            if (intTime >= 13) {
                displayTime = intTime - 12
                meridiem = "PM"
            } else {
                displayTime = intTime
                meridiem = "AM"
            }
        }
    }
    return "\(displayTime)\(meridiem)"
}
