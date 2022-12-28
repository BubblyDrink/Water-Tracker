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
    let type: String
    let value: Double
}

    struct HomeView: View{
        let items: [Item] = [
            Item(type:"M", value: 100),
            Item(type:"T", value: 80),
            Item(type:"W", value: 70),
            Item(type:"T", value: 30),
            Item(type:"F", value: 76),
            Item(type:"S", value: 90),
            Item(type:"S", value: 58),
        ]
        
        var body: some View{
            Chart(items) { item in
                BarMark(
                    x: .value("Days", item.type),
                    y: .value("Water", item.value))
            }
            .navigationTitle("First")
            .frame(height: 200)
        }
    }
    
    struct SettingsView: View{
        var body: some View {
            Color(.systemGray6)
                .ignoresSafeArea()
                .navigationTitle("Second")
        }
    }
    
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
