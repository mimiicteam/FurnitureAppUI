//
//  CustomTabBar.swift
//  FurnitureAppUI
//
//  Created by NGUYEN MINH DUC on 03/06/2022.
//

import SwiftUI

// This App will work for Both iOS 14/15...
struct CustomTabBar: View {
    @Binding var currentTab: Tab
    var animation: Namespace.ID
    // Current Tab XValue...
    @State var currentXValue: CGFloat = 0.0
    let black: Color = Color("Black")
    let gray: Color = Color("Gray")
    let orange: Color = Color("Orange")
    var body: some View {
        HStack(spacing: 0) {
            ForEach(Tab.allCases, id: \.rawValue) { tab in
                TabButton(tab: tab)
                    .overlay(
                        Text(tab.rawValue)
                            .font(.system(size: 14, weight: .semibold))
                            .foregroundColor(gray)
                            .offset(y: currentTab == tab ? 15 : 100)
                    )
            }
        }
        .padding(.top)
        // Preview wont show safe...
        .padding(.bottom, getSafeArea().bottom == 0 ? 15 : 10)
        .background {
            Color.white
                .shadow(color: black.opacity(0.08), radius: 5, x: 0, y: -5)
                .clipShape(CurveBottom(currentXValue: currentXValue))
                .ignoresSafeArea(.container, edges: .bottom)
        }
        
    }
    
    // TabButton...
    @ViewBuilder
    func TabButton(tab: Tab) -> some View {
        // Since we need XAxis Value for Curve
        GeometryReader { proxy in
            Button {
                withAnimation(.easeInOut) {
                    currentTab = tab
                    // Updating Value...
                    currentXValue = proxy.frame(in: .global).midX
                }
            } label: {
                // Moving Button up for current Tab...
                Image(tab.rawValue)
                // Since we need perfect value for curved...
                    .resizable()
                    .renderingMode(.template)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 25, height: 25)
                    .frame(maxWidth: .infinity)
                    .foregroundColor(currentTab == tab ? .white : gray)
                    .padding(currentTab == tab ? 15 : 0)
                    .background(
                        ZStack {
                            if currentTab == tab {
                                Circle()
                                    .fill(gray)
                                    .shadow(color: black.opacity(0.1), radius: 8, x: 5, y: 5)
                                    .matchedGeometryEffect(id: "TAB", in: animation)
                            }
                        }
                    )
                    .contentShape(Rectangle())
                    .offset(y: currentTab == tab ? -50 : 0)
            }
            // Setting intial Curve Position...
            .onAppear {
                if tab == Tab.allCases.first && currentXValue == 0 {
                    currentXValue = proxy.frame(in: .global).midX
                }
            }
        }
        .frame(height: 30)
    }
}

//MARK: - Tabs
enum Tab: String, CaseIterable {
    case home = "Home"
    case cart = "Cart"
    case favourite = "Star"
    case profile = "Profile"
}


// Getting Safe Area...
extension View {
    func getSafeArea() -> UIEdgeInsets {
        guard let screen = UIApplication.shared.connectedScenes.first as? UIWindowScene else {
            return .zero
        }
        
        guard let safeArea = screen.windows.first?.safeAreaInsets else {
            return .zero
        }
        return safeArea
    }
}
