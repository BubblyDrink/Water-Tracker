//
//  ContentView.swift
//  Tracker_1
//
//  Created by Eric Martinez on 12/19/22.
//
import Charts
import SwiftUI

struct Item: Identifiable {
    var id = UUID()
    let type: String
    let value: Double
}

struct ContentView: View {
    var body: some View {
        TabView() {
            HomeView()
                .tabItem {
                    Image(systemName: "house")
                }
            SettingsView()
                .tabItem {
                    Image(systemName: "gear")
                }
            CalendarView()
                .tabItem {
                    Image(systemName: "calendar")
                }
        }
    }
}

struct CalendarView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Color.green
            }
            .navigationTitle("Month at a glance")
        }
    }
}

struct SettingsView: View{
    var body: some View{
        NavigationView{
            ZStack{
                Color.blue
            }
            .navigationTitle("Settings")
        }
    }
}


struct HomeView: View {
    // Put info/variables under struct
    let items: [Item] = [
        Item(type:"M", value: 100),
        Item(type:"T", value: 95),
        Item(type:"W", value: 80),
        Item(type:"Th", value: 35),
        Item(type:"F", value: 70),
        Item(type:"Sa", value: 40),
        Item(type:"Su", value: 60)
    ]
    
    var body: some View{
        NavigationView{
            ZStack{
                Chart(items) { item in
                    BarMark(
                        x: .value("Day", item.type),
                        y: .value("Water", item.value))
                    .cornerRadius(5)
                    
                }
                .foregroundStyle(Color.blue.gradient)
                .frame(height:200)
                .padding()
            }
        .navigationTitle("Week at a glance")
    }
}


    

    

            
            
            
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        }
    }
}

