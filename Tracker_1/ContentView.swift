//
//  ContentView.swift
//  Tracker_1
//
//  Created by Eric Martinez on 12/19/22.
//
import Charts
import SwiftUI

enum Tab {
    case first
    case second
}

struct TabButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .opacity(configuration.isPressed ? 0.9 : 1)
            .scaleEffect(configuration.isPressed ? 0.98 : 1)
    }
}


struct ContentView: View {
    @State private var selectedTab: Tab = .first
    var body: some View {
        VStack{
            switch selectedTab {
            case.first:
                NavigationView {
                    HomeView()
                }
            case .second:
                NavigationView {
                    SettingsView()
                }
            }
            CustomTabView(selectedTab: $selectedTab)
                .frame(height: 50)
        }
    }
}

// Where the tab buttons are edited
struct CustomTabView: View {
    @Binding var selectedTab: Tab
    var body: some View {
        HStack {
            Spacer()
            Button {
                selectedTab = .first
            } label: {
                VStack {
                    Image(systemName: "calendar")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, height: 30)
                        .foregroundColor(.primary)
                }
                .foregroundColor(selectedTab == .first ? .blue : .primary)
            }
            // This is the main circular button to add how much is being consumed
            Spacer()
            Button {
                
            } label: {
                ZStack{
                    Circle()
                        .foregroundColor(.white)
                        .frame(width: 80, height: 80)
                        .shadow(radius: 2)
                    Image(systemName: "drop.circle.fill")
                        .resizable()
                        .foregroundColor(.blue)
                        .frame(width: 72, height: 72)
                }
                .offset(y: -32)
            }
            .buttonStyle(TabButtonStyle())
            Spacer()
            Button {
                selectedTab = .second
            } label: {
                VStack {
                    Image(systemName: "gearshape.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, height: 30)
                        .foregroundColor(.primary)
                }
                .foregroundColor(selectedTab == .second ? .blue : .primary)
            }
            Spacer()
        }
    }
}

struct Item: Identifiable {
    var id = UUID()
    let Day: String
    let Water: Double
}

    struct HomeView: View{
        let items: [Item] = [
            Item(Day: "M", Water: 100),
            Item(Day: "T", Water: 78),
            Item(Day: "W", Water: 60),
            Item(Day: "Th", Water: 90),
            Item(Day: "F", Water: 40),
            Item(Day: "S", Water: 80),
            Item(Day: "Su", Water: 10),
        ]
        @State var currentTab: String = "Week"
        var body: some View{
            NavigationStack {
                VStack {
                    HStack{
                        Spacer()
                        Text("Views")
                            .fontWeight(.semibold)
                    
                        Picker("", selection: $currentTab){
                            Text("Week")
                                .tag("Week")
                            Text("Month")
                                .tag("Month")
                        }
                        .pickerStyle(.segmented)
                        .padding(.leading,80)
                        Spacer()
                    }
                    
                    Chart(items) { item in
                        BarMark(
                            x: .value("Days", item.Day),
                            y: .value("Water", item.Water)
                        )
                        .foregroundStyle(Color.blue.gradient)
                    }
                    .frame(height: 200)
                }
                Spacer()
            }
            .padding()
            .navigationTitle("Welcome Back!")

        }
    }
    
    struct SettingsView: View{
        var body: some View {
            Color(.systemGray6)
                .ignoresSafeArea()
                .navigationTitle("Settings")
        }
    }
    
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        
    }
}
