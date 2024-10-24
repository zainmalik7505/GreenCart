//
//  MainTabView.swift
//  GreenCart
//
//  Created by Zain Malik on 23/10/2024.
//

import SwiftUI

struct MainTabView: View {
    
    @StateObject var homeVM = HomeViewModel.shared
    
    var body: some View {
        VStack{
            TabView(selection: $homeVM.seletTab) {
                HomeView().tag(0)
                ExploreView().tag(1)
                ExploreView().tag(2)
                ExploreView().tag(3)
                ExploreView().tag(4)
            }
            
//            .onAppear{
//                UIScrollView.appearance().isScrollEnabled = false
//            }
            .animation(.bouncy(duration: 0.3), value: homeVM.seletTab) // Tab transition animation
            .tabViewStyle(.page(indexDisplayMode: .never))
            .onChange(of: homeVM.seletTab) { newValue in
                    debugPrint("Selected Tab: \(newValue)")
            }
            
            HStack{
                TabButton(title:"Shop", icon: "store_tab", isSelect: homeVM.seletTab == 0) {
                    DispatchQueue.main.async{
                        withAnimation(.easeInOut(duration: 0.3)) {
                            homeVM.seletTab = 0
                        }
                    }
                }
                TabButton(title:"Explore", icon: "explore_tab", isSelect: homeVM.seletTab == 1) {
                    DispatchQueue.main.async{
                        withAnimation(.easeInOut(duration: 0.3)) {
                            homeVM.seletTab = 1
                        }
                    }                }
                TabButton(title:"Cart", icon: "cart_tab", isSelect: homeVM.seletTab == 2) {
                    DispatchQueue.main.async{
                        withAnimation(.easeInOut(duration: 0.3)) {
                            homeVM.seletTab = 2
                        }
                    }
                }
                TabButton(title:"Favorite", icon: "fav_tab", isSelect: homeVM.seletTab == 3) {
                    DispatchQueue.main.async{
                        withAnimation(.easeInOut(duration: 0.3)){
                            homeVM.seletTab = 3
                        }
                    }
                }
                TabButton(title:"Account", icon: "account_tab", isSelect: homeVM.seletTab == 4) {
                    DispatchQueue.main.async{
                        withAnimation(.easeInOut(duration: 0.3)){
                            homeVM.seletTab = 4
                        }
                    }
                }
            }
            .padding(.top, 10)
            .padding(.bottom, .bottomInsets)
            .padding(.horizontal, 10)
            .background(Color.white)
            .cornerRadius(15)
            .shadow(color: Color.black.opacity(0.15), radius: 3, x: 0, y: -2)
        }
        .navigationTitle("")
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        .ignoresSafeArea()
    }
}

#Preview {
    MainTabView()
}
