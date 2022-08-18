//
//  PainMapDetailView.swift
//  PocketRehab
//
//  Created by Amin  Bagheri  on 2022-08-02.
//

import SwiftUI

enum CardType {
    case course
    case exercises
}

struct PainMapCourseCardView: View {
    @State var imageName: String
    @State var title: String
    @State var courseSubtitle: String?
    @State var cardType: CardType
    @State var isLocked: Bool
    var body: some View {
        ZStack {
            if isLocked == false {
                if cardType == .course {
                    ZStack {
                        Image(imageName)
                            .resizable()
                            .frame(width: UIScreen.main.bounds.width * 0.9 , height: 300)
                            .cornerRadius(20)
                            .opacity(0.9)
                            .shadow(radius: 20)
                        VStack {
                            Text(title)
                                .font(.system(size: 45, weight: .heavy, design: .default))
                                .foregroundColor(.white)
                                .shadow(radius: 10)
                                .shadow(radius: 10)
                                .shadow(radius: 10)
                                .frame(width: UIScreen.main.bounds.width * 0.9)
                                .padding(.bottom, 1)
                                .multilineTextAlignment(.leading)
                            Text(courseSubtitle!)
                                .font(.system(size: 35, weight: .heavy))
                                .foregroundColor(.white)
                                .shadow(radius: 10)
                                .shadow(radius: 10)
                                .shadow(radius: 10)
                                .frame(width: UIScreen.main.bounds.width * 0.9)
                                .multilineTextAlignment(.trailing)
                            
                        }
                        .frame(width: UIScreen.main.bounds.width * 0.85, height: 280)
                    }
                } else if cardType == .exercises {
                    ZStack {
                        Image(imageName)
                            .resizable()
                            .frame(width: UIScreen.main.bounds.width * 0.9 , height: 300)
                            .cornerRadius(20)
                            .opacity(0.9)
                            .shadow(radius: 20)
                        VStack {
                            Text(title)
                                .font(.system(size: 60, weight: .heavy, design: .default))
                                .foregroundColor(.white)
                                .shadow(radius: 10)
                                .shadow(radius: 10)
                                .shadow(radius: 10)
                                .shadow(radius: 10)
                            
                                .frame(width: UIScreen.main.bounds.width * 0.85)
                                .multilineTextAlignment(.center)
                                .padding(.bottom, 1)
                        }
                    }
                }
            } else {
                ZStack {
                    if cardType == .course {
                        ZStack {
                            Image(imageName)
                                .resizable()
                                .frame(width: UIScreen.main.bounds.width * 0.9 , height: 300)
                                .cornerRadius(20)
                                .opacity(0.3)
                                .shadow(radius: 20)
                            VStack {
                                Text(title)
                                    .font(.largeTitle)
                                    .bold()
                                    .foregroundColor(.white)
                                    .shadow(radius: 10)
                                    .shadow(radius: 10)
                                    .shadow(radius: 10)
                                    .frame(width: UIScreen.main.bounds.width * 0.9)
                                    .padding(.bottom, 1)
                                Text(courseSubtitle!)
                                    .font(.title)
                                    .bold()
                                    .foregroundColor(.white.opacity(1))
                                    .shadow(radius: 10)
                                    .shadow(radius: 10)
                                    .shadow(radius: 10)
                                    .frame(width: UIScreen.main.bounds.width * 0.9)
                                    .multilineTextAlignment(.trailing)
                                
                            }
                            .frame(width: UIScreen.main.bounds.width * 0.85, height: 280)

                        }
                    } else if cardType == .exercises {
                        ZStack {
                            Image(imageName)
                                .resizable()
                                .frame(width: UIScreen.main.bounds.width * 0.9 , height: 300)
                                .cornerRadius(20)
                                .opacity(0.3)
                                .shadow(radius: 20)
                            VStack {
                                Text(title)
                                    .font(.system(size: 60, weight: .heavy, design: .default))
                                    .foregroundColor(.white.opacity(1))
                                    .shadow(radius: 10)
                                    .shadow(radius: 10)
                                    .shadow(radius: 10)
                                    .frame(width: UIScreen.main.bounds.width * 0.85)
                                    .multilineTextAlignment(.center)
                                    .padding(.bottom, 1)
                            }
                        }
                        
                    }
                    //TODO: LOCK IMAGE
                    Image(systemName: "lock.fill")
                        .resizable()
                        .frame(width: 100, height: 140)
                        .foregroundColor(.black)
                        .shadow(radius: 20)
                }
                
            }
            
            
        }
    }
}

struct PainMapCourseCardView_Previews: PreviewProvider {
    static var previews: some View {
        PainMapCourseCardView(imageName: "backPain", title: "Why Back Pain Happens,", courseSubtitle: "and what you can do about it.", cardType: .course, isLocked: true)
    }
}
