//
//  ContentView.swift
//  Weather
//
//  Created by Jan Lemar Baltazar on 12/24/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    var body: some View {
        ZStack {
            BackgroundView(isNight: $isNight)
            VStack {
                CityTextView(cityName: isNight ? "Dark Mode" : "Light Mode")
                
                StatusView(imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill",
                           temperature: 43)
             
                HStack(spacing: 20) {
                    WeatherDayView(
                        dayOfWeek: "MON",
                        imageName: "sunset.fill",
                        temperature: 48)
                    
                    WeatherDayView(
                        dayOfWeek: "TUE",
                        imageName: "cloud.sun.rain.fill",
                        temperature: 49)
                    
                    WeatherDayView(
                        dayOfWeek: "WED",
                        imageName: "cloud.sun.fill",
                        temperature: 42)
                    
                    WeatherDayView(
                        dayOfWeek: "THU",
                        imageName: "wind.snow",
                        temperature: 25)
                    
                    WeatherDayView(
                        dayOfWeek: "FRI",
                        imageName: "sun.max.fill",
                        temperature: 51)
                }
                Spacer()
                        
                Button {
                    isNight.toggle()
                } label: {
                    WeatherButton(title: "Change Time of Day",
                                  textColor: .blue,
                                  backgroundColor: .white)
                }
                    Spacer()
                }
            }
        }
    }

struct WeatherDayView: View {
    
    var dayOfWeek: String
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack{
            Text(dayOfWeek)
                .font(.system(size: 18, weight: .medium, design: .default))
                .foregroundColor(.white)
            
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50, height: 50)
            
            Text("\(temperature)°")
                .font(.system(size: 28, weight: .medium, design: .default))
                .foregroundColor(.white)
            
        }
    }
}

struct BackgroundView: View {
    //var topColor: Color
    //var bottomColor: Color
   @Binding var isNight: Bool
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors:
                                            [isNight ? .black : .blue,
             isNight ? .gray : .lightblue]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all)
    }
}

struct CityTextView: View{
    
    var cityName: String
    
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
    }
}

struct StatusView: View {
    
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack(spacing: 10) {
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
                
            Text("\(temperature)°")
                .font(.system(size: 70, weight: .medium))
                .foregroundColor(.white)
            }
            
        .padding(.bottom, 40)
    }
}


/*
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]

    var body: some View {
        NavigationSplitView {
            List {
                ForEach(items) { item in
                    NavigationLink {
                        Text("Item at \(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))")
                    } label: {
                        Text(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))
                    }
                }
                .onDelete(perform: deleteItems)
            }
#if os(macOS)
            .navigationSplitViewColumnWidth(min: 180, ideal: 200)
#endif
            .toolbar {
#if os(iOS)
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
#endif
                ToolbarItem {
                    Button(action: addItem) {
                        Label("Add Item", systemImage: "plus")
                    }
                }
            }
        } detail: {
            Text("Select an item")
        }
    }

    private func addItem() {
        withAnimation {
            let newItem = Item(timestamp: Date())
            modelContext.insert(newItem)
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(items[index])
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
*/

#Preview {
    ContentView()
}

