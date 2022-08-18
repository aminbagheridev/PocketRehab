//
//  ContentView.swift
//  PocketRehab
//
//  Created by Amin  Bagheri  on 2022-07-16.
//

import SwiftUI
import ExytePopupView

struct HomeView: View {
    
    @StateObject var update = Update()
    
    @State var widgets: [WidgetView]
    @StateObject private var StreakVM = StreakViewModel()
    @EnvironmentObject var viewRouter: ViewRouter
    @StateObject var VM = LoginRegisterViewModel()
    @AppStorage("email") var email: String?
    @AppStorage("timesInitializedHome") var timesInitializedHome: Int?
    @State var userImage: UIImage?
    @AppStorage("username") var userName: String?
    @State var firstName: String? = ""
    @State var imageData: Data? = nil
    @State var quote = Quote()
    
    @StateObject var apiCaller = QuoteApi()
    @State var quoteAuthor = ""
    @State var quoteText = ""
    
    var body: some View {
        Spacer()
        GeometryReader { geometry in
            NavigationView{
                VStack(spacing: 0){
                    
                    ScrollView {
                        VStack {
                            Rectangle()
                                .frame(width: 0, height: 20)
                                .background(.black)
                                .accessibilityHidden(true)
                            if imageData == nil {
                                Image(systemName: "person.fill")
                                    .resizable()
                                    .frame(width: 150, height: 150)
                                    .clipShape(Circle())
                                    
                                    .foregroundColor(.black)
                            } else {
                                Image(uiImage: UIImage(data: imageData!)!)
                                
                                    .resizable()
                                    .frame(width: 150, height: 150)
                                    .shadow(radius: 7)
                                    .clipShape(Circle(), style: .init(eoFill: true, antialiased: true))
                                    
                            }
                            
                            
                            if firstName != nil {
                                Text("Welcome back,\n \(firstName!)!")
                                    .bold()
                                    .font(.largeTitle)
                                    .padding(.bottom, 8)
                                    .lineLimit(2)
                                    .minimumScaleFactor(0.2)
                                    .multilineTextAlignment(.center)
                                    .frame(width: UIScreen.main.bounds.width * 0.9)
                                    .minimumScaleFactor(0.1)
                                    .padding(.top)
                                    
                            } else {
                                Text("Welcome back,\n User!")
                                    .bold()
                                    .font(.largeTitle)
                                    .padding(.bottom, 8)
                                    .lineLimit(1)
                                    .minimumScaleFactor(0.1)
                                    .padding(.top)
                                    
                            }
                            VStack(spacing: 5.0) {
                                Text("\(StreakVM.streakCount) Day Streak!")
                                    .foregroundColor(.blue)
                                    .font(.title)
                                    .bold()
                                    .lineLimit(1)
                                    
                                Text(StreakVM.motivationalMessege(streak: StreakVM.streakCount))
                                    .font(.title2)
                                    .fontWeight(.semibold)
                                    .lineLimit(2)
                                    .multilineTextAlignment(.center)
                                    
                                
                            }
                            .padding(.bottom, 8)
                            .frame(width: UIScreen.main.bounds.width * 0.9)
                            CustomDivider()
                                .padding()
                            
                            ZStack {
                                RoundedRectangle(cornerRadius: 20)
                                    .foregroundColor(.gray)
                                    .frame(width: UIScreen.main.bounds.width * 0.9, height: (UIScreen.main.bounds.width * 0.8) * 0.66)
                                    

                                VStack {
                                    Text(quoteAuthor)
                                        .font(.title)
                                        .fontWeight(.heavy)
                                        .foregroundColor(.white)
                                        .frame(alignment: .leading)
                                        .shadow(radius: 10)
                                        .animation(.default)
                                        .multilineTextAlignment(.center)
                                        .padding(.top, 5)
                                    Text(quoteText)
                                        .font(.title)
                                        .fontWeight(.semibold)
                                        .foregroundColor(.white)
                                        .padding(.horizontal)
                                        .multilineTextAlignment(.center)
                                        .shadow(radius: 10)
                                        .animation(.default)
                                        .minimumScaleFactor(0.4)
                                        .padding(.horizontal, 5)
                                        .padding(.bottom, 5)



                                }
                                
                            }
                            .onTapGesture {
                                QuoteApi().loadData { (quote) in
                                    self.quote = quote
                                    quoteText = quote.first!.quote!
                                    quoteAuthor = quote.first!.author!
                                }
                            }
                            .frame(width: UIScreen.main.bounds.width * 0.9, height: (UIScreen.main.bounds.width * 0.8) * 0.66)
                            
                            
                            
                            
                            
                            Spacer()
                            
                        }
                    }
                    .navigationBarTitleDisplayMode(.large)
                    .edgesIgnoringSafeArea(.bottom)
                    .toolbar {
                        
                        NavigationLink {
                            SettingsView()
                                .navigationBarTitleDisplayMode(.inline)
                                .navigationTitle("Settings")
                        } label: {
                            Label("Settings", systemImage: "gear")
                        }
                        
                    }
                    
                    HStack {
                        TabBarIcon(width: geometry.size.width/5, height: geometry.size.height/28, systemIconName: "person.crop.circle", tabName: "Home", viewRouter: viewRouter, currentView: .home)
                        TabBarIcon(width: geometry.size.width/5, height: geometry.size.height/28, systemIconName: "figure.stand", tabName: "Pain Map", viewRouter: viewRouter, currentView: .painMap)
                        TabBarIcon(width: geometry.size.width/5, height: geometry.size.height/28, systemIconName: "repeat", tabName: "Routines", viewRouter: viewRouter, currentView: .routines)
                        TabBarIcon(width: geometry.size.width/5, height: geometry.size.height/28, systemIconName: "brain.head.profile", tabName: "Courses", viewRouter: viewRouter, currentView: .courses)
                    }
                    .frame(width: geometry.size.width, height: geometry.size.height/8)
                    .background(Color("TabBarBackground").shadow(radius: 2))
                }
                
                .edgesIgnoringSafeArea(.bottom)
                .navigationTitle("Home")
                
                .onAppear {
                    
                    QuoteApi().loadData { (quote) in
                        self.quote = quote
                        
                            quoteText = quote.first!.quote!
                            quoteAuthor = quote.first!.author!
                        
                        
                        
                    }
                    firstName = UserDefaults.standard.string(forKey: "firstName")
                    imageData = UserDefaults.standard.data(forKey: "imageData")
                    
                    
                    StreakVM.updateStreak()
                }
            }
            
        }
    }
}
struct CustomDivider: View {
    var body: some View {
        HStack {
            Rectangle()
                .foregroundColor(.clear)
                .frame(width: 20, height: 0)
            VStack {
                Divider()
            }
            Rectangle()
                .foregroundColor(.clear)
                .frame(width: 20, height: 0)
        }
        
        
        .padding(.bottom, 10)
    }
}

