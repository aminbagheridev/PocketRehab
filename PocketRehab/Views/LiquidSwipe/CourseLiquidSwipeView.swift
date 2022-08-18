//
//  WaveView.swift
//  PocketRehab
//
//  Created by Amin  Bagheri  on 2022-08-03.
//

import SwiftUI


struct CourseLiquidSwipeView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @State var course: Courses
    @State var leftData = SliderData(side: .left)
    @State var rightData = SliderData(side: .right)
    
    @State var pageIndex = 0
    @State var topSlider = SliderSide.right
    @State var sliderOffset: CGFloat = 0
    
    var btnBack : some View { Button(action: {
        self.presentationMode.wrappedValue.dismiss()
    }) {
        HStack {
            //just some spacing. i couldve used a padding but who cares
            Rectangle()
                .frame(width: 10, height: 1)
                .foregroundColor(.clear)
                .accessibilityHidden(true)
            Image(systemName: "arrow.left") // set image here
                .aspectRatio(contentMode: .fit)
                .foregroundColor(Color("m"))
                .shadow(radius: 10)
            Text("Go Back")
                .foregroundColor(Color("m"))
        }
    }
    }
    
    var body: some View {
        if #available(iOS 14.0, *) {
            ZStack {
                content()
                slider(data: $leftData)
                slider(data: $rightData)
            }
            .edgesIgnoringSafeArea(.vertical)
            .onChange(of: pageIndex) { newValue in
                print("Page: ", newValue)
                //MARK: Page limit set HERE.
                if pageIndex >= 5 && course == .shoulderPain {
                    pageIndex = 0
                }
                if pageIndex >= 6 && course == .backPain {
                    pageIndex = 0
                }
                if pageIndex >= 5 && course == .elbowPain {
                    pageIndex = 0
                }
                if pageIndex >= 2 && course == .wristPain {
                    pageIndex = 0
                }
                if pageIndex >= 2 && course == .anklePain {
                    pageIndex = 0
                }
                if pageIndex >= 3 && course == .neckPain {
                    pageIndex = 0
                }
            }
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: btnBack)
        } else {
            // Fallback on earlier versions
        }
    }
    
    func slider(data: Binding<SliderData>) -> some View {
        let value = data.wrappedValue
        return ZStack {
            wave(data: data)
            button(data: value)
        }
        
        .zIndex(topSlider == value.side ? 1 : 0)
        .offset(x: value.side == .left ? -sliderOffset : sliderOffset)
    }
    
    
    
    
    @ViewBuilder
    func content() -> some View {
        switch course {
            //MARK: BACK PAIN COURSE
        
        case .anklePain:
            if pageIndex == 0 {
                ZStack {
                    Rectangle().foregroundColor(Config.colors[pageIndex])
                    
                    VStack {
                    Rectangle()
                            .foregroundColor(.clear)
                            .accessibilityHidden(true)
                            .frame(width: 0, height: UIScreen.main.bounds.height * 0.05)
                            Text("Why Ankle Pain Happens")
                            .font(.system(size: 45, weight: .bold, design: .default))
                                .lineLimit(3)
                                .frame(width: UIScreen.main.bounds.width * 0.95)
                                .multilineTextAlignment(.center)
                        
                                .padding(.top, 50)
                        ScrollView(showsIndicators: false) {
                            VStack {
                                Text(
                                     """
                                     Pain in the ankle is both common in the youth as well as older adults. Younger people usually get ankle pain due to injury, and members of the older population not only are at risk of injury, but they can suffer from arthritis and normal wear and tear as well.
                                     """
                                    )
                                .font(.system(size: 20, weight: .semibold, design: .default))
                                    .padding()
                                Image("anklePain")
                                    .resizable()
                                    .frame(width: 300, height: 200)
                                    .cornerRadius(20)
                                    .shadow(radius: 20)
                                
                                Text(
                                 """
                                 So, the first common cause of ankle pain is acutre injury. During sports and physical activity ankle sprains are really common.
                                 
                                 By putting too much pressure on the connective tissue on the outer and inner sides of the foot during a wrong footplacement, pain can easily crop up as a result of the sprain.
                                 """
                                )
                                .font(.system(size: 20, weight: .semibold, design: .default))
                                .padding()
                                
                                Image("ankleSprain")
                                    .resizable()
                                    .frame(width: 250, height: 320)
                                    .cornerRadius(20)
                                    .shadow(radius: 20)
                                
                                Text(
                                 """
                                 Another fairly common cause of ankle pain is tendonitis or inflammation in the achilles tendon. It could be due to strain or even tears caused by sports that involve running, jumping, and sudden starts and stops.
                                 """
                                )
                                .font(.system(size: 20, weight: .semibold, design: .default))
                                .padding()
                                
                                Image("achillesTendon")
                                    .resizable()
                                    .frame(width: 250, height: 250)
                                    .cornerRadius(20)
                                    .shadow(radius: 20)
                                Text(
                                 """
                                 All exercises for ankle pain, both sprains and achilles tendon are in the ankle pain exercise center.
                                 """
                                )
                                .font(.system(size: 20, weight: .semibold, design: .default))
                                .padding()
                                
                            }
                            
                        }
                        .padding(.horizontal)
                        
                    }
                    
                }.edgesIgnoringSafeArea(.all)
            } else if pageIndex == 1 {
                ZStack {
                    Rectangle().foregroundColor(Config.colors[pageIndex])
                    
                    VStack {
                    Rectangle()
                            .foregroundColor(.clear)
                            .accessibilityHidden(true)
                            .frame(width: 0, height: UIScreen.main.bounds.height * 0.05)
                            Text("Why Ankle Pain Happens")
                            .font(.system(size: 45, weight: .bold, design: .default))
                                .lineLimit(3)
                                .frame(width: UIScreen.main.bounds.width * 0.95)
                                .multilineTextAlignment(.center)
                        
                                .padding(.top, 50)
                        ScrollView(showsIndicators: false) {
                            VStack {
                                Text(
                                     """
                                     Finally the second most common reason is just general wear and tear and arthritis, most of which in old age.
                                     """
                                    )
                                .font(.system(size: 20, weight: .semibold, design: .default))
                                    .padding()
                                Image("ankleArthritis")
                                    .resizable()
                                    .frame(width: 250, height: 120)
                                    .cornerRadius(20)
                                    .shadow(radius: 20)
                                
                                Text(
                                 """
                                 And while you can never get your ankle health back to how it was in your teens and twenties, we can definitely improve it with mobility and strengthening exercises, all available in the ankle pain center.
                                 """
                                )
                                .font(.system(size: 20, weight: .semibold, design: .default))
                                .padding()
                                
                               
                                
                                
                            }
                            
                        }
                        .padding(.horizontal)
                        
                    }
                    
                }.edgesIgnoringSafeArea(.all)
            }
        case .wristPain:
            if pageIndex == 0 {
                ZStack {
                    Rectangle().foregroundColor(Config.colors[pageIndex])
                    
                    VStack {
                    Rectangle()
                            .foregroundColor(.clear)
                            .accessibilityHidden(true)
                            .frame(width: 0, height: UIScreen.main.bounds.height * 0.05)
                            Text("Why Wrist Pain Happens")
                            .font(.system(size: 45, weight: .bold, design: .default))
                                .lineLimit(3)
                                .frame(width: UIScreen.main.bounds.width * 0.95)
                                .multilineTextAlignment(.center)
                        
                                .padding(.top, 50)
                        ScrollView(showsIndicators: false) {
                            VStack {
                                Text(
                                     """
                                     Pain in the wrist can be debilitating, but we can easily see some improvements with targeted stretching and exercises.
                                     """
                                    )
                                .font(.system(size: 20, weight: .semibold, design: .default))
                                    .padding()
                                Image("wristPain")
                                    .resizable()
                                    .frame(width: 300, height: 200)
                                    .cornerRadius(20)
                                    .shadow(radius: 20)
                                
                                Text(
                                 """
                                 One of the causes of wrist pain is repetitive overuse. When you use your wrists in a single position for a very long time, it can result in wrist pain.
                                 """
                                )
                                .font(.system(size: 20, weight: .semibold, design: .default))
                                .padding()
                                
                                Image("typing")
                                    .resizable()
                                    .frame(width: 310, height: 175)
                                    .cornerRadius(20)
                                    .shadow(radius: 20)

                                Text(
                                 """
                                 A few other examples of repetitive strain injuries to the wrist could stem from hitting a tennis ball to even bowing a chello.
                                 """
                                )
                                .font(.system(size: 20, weight: .semibold, design: .default))
                                .padding()
                                Text("The solution? Stretch and strengthen! All the exercises are in the wrist pain exercises routine")
                                    .font(.system(size: 20, weight: .semibold, design: .default))
                                    .padding()
                                
                            }
                            
                        }
                        .padding(.horizontal)
                        
                    }
                    
                }.edgesIgnoringSafeArea(.all)
            } else if pageIndex == 1 {
                ZStack {
                    Rectangle().foregroundColor(Config.colors[pageIndex])
                    
                    VStack {
                    Rectangle()
                            .foregroundColor(.clear)
                            .accessibilityHidden(true)
                            .frame(width: 0, height: UIScreen.main.bounds.height * 0.05)
                            Text("Why Wrist Pain Happens")
                            .font(.system(size: 45, weight: .bold, design: .default))
                                .lineLimit(3)
                                .frame(width: UIScreen.main.bounds.width * 0.95)
                                .multilineTextAlignment(.center)
                        
                                .padding(.top, 50)
                        ScrollView(showsIndicators: false) {
                            VStack {
                                Text(
                                     """
                                     One of the second common causes of wrist pain is wrist strain, and this could be from breaking a fall with your hands, to something as simple as putting your hands in an awkward position throughout the day.
                                     """
                                    )
                                .font(.system(size: 20, weight: .semibold, design: .default))
                                    .padding()
                                
                                
                                Text(
                                 """
                                 For example, holding a baby incorrectly can cause wrist pain, and so can doing barbell curls if you don't have the right level of wrist mobility. (Use dumbbells instead!)
                                 """
                                )
                                .font(.system(size: 20, weight: .semibold, design: .default))
                                .padding()
                                
                                Image("barbellCurll")
                                    .resizable()
                                    .frame(width: 300, height: 200)
                                    .cornerRadius(20)
                                    .shadow(radius: 20)
                                Image("babyhold")
                                    .resizable()
                                    .frame(width: 300, height: 200)
                                    .cornerRadius(20)
                                    .shadow(radius: 20)

                            }
                            
                        }
                        .padding(.horizontal)
                        
                    }
                    
                }.edgesIgnoringSafeArea(.all)
            }
        case .neckPain:
            if pageIndex == 0 {
                ZStack {
                    Rectangle().foregroundColor(Config.colors[pageIndex])
                    
                    VStack {
                    Rectangle()
                            .foregroundColor(.clear)
                            .accessibilityHidden(true)
                            .frame(width: 0, height: UIScreen.main.bounds.height * 0.05)
                            Text("Why Neck Pain Happens")
                            .font(.system(size: 45, weight: .bold, design: .default))
                                .lineLimit(3)
                                .frame(width: UIScreen.main.bounds.width * 0.95)
                                .multilineTextAlignment(.center)
                        
                                .padding(.top, 50)
                        ScrollView(showsIndicators: false) {
                            VStack {
                                Text(
                                     """
                                     Pain in the neck is extremely widespread in this day and age. From looking at our phones and computers day in and day out, we can create a lot of stiffness and tightness that can cause some serious pain.
                                     """
                                    )
                                .font(.system(size: 20, weight: .semibold, design: .default))
                                    .padding()
                                Image("badHeadPosture")
                                    .resizable()
                                    .frame(width: 200, height: 200)
                                    .cornerRadius(20)
                                    .shadow(radius: 20)
                                
                                Text(
                                 """
                                 The tightness that bad posture causes can give you headaches or even a throbbing and aching pain when moving your head.
                                 """
                                )
                                .font(.system(size: 20, weight: .semibold, design: .default))
                                .padding()
                                
                                Image("facepull")
                                    .resizable()
                                    .frame(width: 300, height: 200)
                                    .cornerRadius(20)
                                    .shadow(radius: 20)
                                Text(
                                 """
                                 So the solution? Pull those shoulders back, bring your chest up and bring your neck back as well.
                                 
                                 Strengthen the upper back and rear shoulders, as well as stretch and strengthen the neck muscles.
                                 """
                                )
                                .font(.system(size: 20, weight: .semibold, design: .default))
                                .padding()
                                
                                
                            }
                            
                        }
                        .padding(.horizontal)
                        
                    }
                    
                }.edgesIgnoringSafeArea(.all)
            } else if pageIndex == 1 {
                ZStack {
                    Rectangle().foregroundColor(Config.colors[pageIndex])
                    
                    VStack {
                    Rectangle()
                            .foregroundColor(.clear)
                            .accessibilityHidden(true)
                            .frame(width: 0, height: UIScreen.main.bounds.height * 0.05)
                            Text("Why Neck Pain Happens")
                            .font(.system(size: 45, weight: .bold, design: .default))
                                .lineLimit(3)
                                .frame(width: UIScreen.main.bounds.width * 0.95)
                                .multilineTextAlignment(.center)
                        
                                .padding(.top, 50)
                        ScrollView(showsIndicators: false) {
                            VStack {
                                Text(
                                     """
                                     Another cause of neck pain can be due to traumatic injury. For example, if you ever get punched in a boxing match, or, you have a car accident, the whiplash that happens in these events can cause muscle strain and soreness, pain, headaches and a whole host of problems.
                                     """
                                    )
                                .font(.system(size: 20, weight: .semibold, design: .default))
                                    .padding()
                                Image("whiplashPunch")
                                    .resizable()
                                    .frame(width: 275, height: 200)
                                    .cornerRadius(20)
                                    .shadow(radius: 20)
                                
                                Text(
                                 """
                                 In this case, during the next few days after the accident, let it rest without any extra movement. Then, after a couple days of rest, you may begin incorporating the exercises in the neck pain center.
                                 """
                                )
                                .font(.system(size: 20, weight: .semibold, design: .default))
                                .padding()
                                
                            }
                            
                        }
                        .padding(.horizontal)
                        
                    }
                    
                }.edgesIgnoringSafeArea(.all)
            } else if pageIndex == 2 {
                ZStack {
                    Rectangle().foregroundColor(Config.colors[pageIndex])
                    
                    VStack {
                    Rectangle()
                            .foregroundColor(.clear)
                            .accessibilityHidden(true)
                            .frame(width: 0, height: UIScreen.main.bounds.height * 0.05)
                            Text("Why Neck Pain Happens")
                            .font(.system(size: 45, weight: .bold, design: .default))
                                .lineLimit(3)
                                .frame(width: UIScreen.main.bounds.width * 0.95)
                                .multilineTextAlignment(.center)
                        
                                .padding(.top, 50)
                        ScrollView(showsIndicators: false) {
                            VStack {
                                HStack {
                                    Text(
                                     """
                                     A simple yet very common cause of neck pain is overuse. For example, you may be doing lateral raises, and unknowignly be shrugging your shoulders up to help.
                                     """
                                    )
                                    .font(.system(size: 20, weight: .semibold, design: .default))
                                    .padding()
                                    
                                    
                                }
                                    
                                Image("LRPNG")
                                    .resizable()
                                    .frame(width: 200, height: 200)
                                    .cornerRadius(20)
                                    .shadow(radius: 20)
                                Text(
                                 """
                                 Now, you are straining your neck muscles in an awkward position for 20 - 30 hard repetitions, and that is just one example of how a seemingly unrelated movement is causing your pain.
                                 """
                                )
                                .font(.system(size: 20, weight: .semibold, design: .default))
                                .padding()
                                
                            }
                            
                        }
                        .padding(.horizontal)
                        
                    }
                    
                }.edgesIgnoringSafeArea(.all)
            }
        
        case .elbowPain:
            if pageIndex == 0 {
                ZStack {
                    Rectangle().foregroundColor(Config.colors[pageIndex])
                    
                    VStack {
                    Rectangle()
                            .foregroundColor(.clear)
                            .accessibilityHidden(true)
                            .frame(width: 0, height: UIScreen.main.bounds.height * 0.05)
                            Text("Why Elbow Pain Happens")
                            .font(.system(size: 45, weight: .bold, design: .default))
                                .lineLimit(3)
                                .frame(width: UIScreen.main.bounds.width * 0.95)
                                .multilineTextAlignment(.center)
                        
                                .padding(.top, 50)
                        ScrollView(showsIndicators: false) {
                            VStack {
                                HStack {
                                    Text(
                                     """
                                     Most of the time, pain in the elbow happens in two places. Either the inside of the elbow, known as golfers elbow, or the outside, known as tennis elbow.
                                     
                                     (You don't even have to play sports to feel this pain, it's just their names)
                                     
                                     Normally, this pain is not due to illness or due to a traumatic injury, and is easilly fixed.
                                     """
                                    )
                                    .font(.system(size: 20, weight: .semibold, design: .default))
                                    
                                    
                                }
                                
                                .padding()
                                
                                VStack {
                                    Image("golfers")
                                        .resizable()
                                        .frame(width: 250, height: 175)
                                        .cornerRadius(20)
                                        .shadow(radius: 20)
                                        .padding(.vertical)
                                    Image("tennis")
                                        .resizable()
                                        .frame(width: 250, height: 175)
                                        .cornerRadius(20)
                                        .shadow(radius: 20)
                                }
                                Text(
                                 """
                                 First we will target golfers elbow.
                                 """
                                )
                                .font(.system(size: 20, weight: .bold, design: .default))
                                .padding()
                                
                            }
                            
                        }
                        .padding(.horizontal)
                        
                    }
                    
                }.edgesIgnoringSafeArea(.all)
            } else if pageIndex == 1 {
                ZStack {
                    Rectangle().foregroundColor(Config.colors[pageIndex])
                    
                    VStack {
                    Rectangle()
                            .foregroundColor(.clear)
                            .accessibilityHidden(true)
                            .frame(width: 0, height: UIScreen.main.bounds.height * 0.05)
                            Text("Why Golfers Elbow Happens")
                            .font(.system(size: 45, weight: .bold, design: .default))
                                .lineLimit(3)
                                .frame(width: UIScreen.main.bounds.width * 0.95)
                                .multilineTextAlignment(.center)
                        
                                .padding(.top, 50)
                        ScrollView(showsIndicators: false) {
                            VStack {
                                HStack {
                                    Text(
                                     """
                                     Improper technique when gripping heavy objects may be a cause of golfers elbow.
                                     """
                                    )
                                    .font(.system(size: 20, weight: .semibold, design: .default))
                                    
                                    
                                }
                                
                                .padding()
                                Image("fingerBar")
                                    .resizable()
                                    .frame(width: 300, height: 200)
                                    .cornerRadius(20)
                                    .shadow(radius: 20)
                                    .padding()
                                
                                Text(
                                 """
                                 When you grab a bar, dumbbell or any other heavy item from your fingers in the manner shown, it can pull on the tendons of your forearm and cause pain.
                                 """
                                )
                                .font(.system(size: 20, weight: .semibold, design: .default))
                                .padding()
                                Image("howToHoldBar")
                                    .resizable()
                                    .frame(width: 300, height: 200)
                                    .cornerRadius(20)
                                    .shadow(radius: 20)
                                
                                Text(
                                 """
                                 So, next time your grip is slipping on the pullups, don't fight it. Instead, work on building grip strength, which is all done in the exercises of the elbow pain center.
                                 """
                                )
                                .font(.system(size: 20, weight: .semibold, design: .default))
                                .padding()
                                
                            }
                            
                        }
                        .padding(.horizontal)
                        
                    }
                    
                }.edgesIgnoringSafeArea(.all)
            } else if pageIndex == 2 {
                ZStack {
                    Rectangle().foregroundColor(Config.colors[pageIndex])
                    
                    VStack {
                    Rectangle()
                            .foregroundColor(.clear)
                            .accessibilityHidden(true)
                            .frame(width: 0, height: UIScreen.main.bounds.height * 0.05)
                            Text("Why Golfers Elbow Happens")
                            .font(.system(size: 45, weight: .bold, design: .default))
                                .lineLimit(3)
                                .frame(width: UIScreen.main.bounds.width * 0.95)
                                .multilineTextAlignment(.center)
                        
                                .padding(.top, 50)
                        ScrollView(showsIndicators: false) {
                            VStack {
                                HStack {
                                    Text(
                                     """
                                     Another reason for improper technique which is very common for weight lifters is improper grip. Having an improper grip loads the tendons at your shoulder and can cause inflammation and pain.
                                     """
                                    )
                                    .font(.system(size: 20, weight: .semibold, design: .default))
                                    
                                    
                                }
                                
                                .padding()
                                
                                Image("golfers")
                                    .resizable()
                                    .frame(width: 300, height: 200)
                                    .cornerRadius(20)
                                    .shadow(radius: 20)
                                
                                Text(
                                 """
                                 Now imagine having bad grip / wirst positioning for hours at a time with extremely heavy weights in the gym. Or imagine a golfer, hitting a golf ball or sometimes even digging into the ground.
                                 
                                 Over time, the inner forearm muscles and tendons will get overworked, and then stress, strains and tears can cause debilitating fatigue.
                                 """
                                )
                                .font(.system(size: 20, weight: .semibold, design: .default))
                                .padding()
                                
                                
                                Group {
                                    
                                    Image("badWrist")
                                        .resizable()
                                        .frame(width: 300, height: 230)
                                        .cornerRadius(20)
                                        .shadow(radius: 20)
                                        .padding()
                                    Image("badWrist2")
                                        .resizable()
                                        .frame(width: 300, height: 230)
                                        .cornerRadius(20)
                                        .shadow(radius: 20)
                                        .padding()
                                    Text(
                                 """
                                 Whether it's on the bench press, during a row or just plain bicep curls, keep the hand in a neutral position.
                                 """
                                    )
                                    .font(.system(size: 20, weight: .semibold, design: .default))
                                    .padding()
                                    Image("goodWrist")
                                        .resizable()
                                        .frame(width: 300, height: 230)
                                        .cornerRadius(20)
                                        .shadow(radius: 20)
                                        .padding()
                                }
                                Text(
                                 """
                                 Now, does this mean you should never, ever let your wrist bend forward and back? No! However, if on every single row, or every single bench press rep you are bending your wrist when you shouldn't be, just to cheat the weight up, you may be causing unneccassary stress.
                                 """
                                )
                                .font(.system(size: 20, weight: .semibold, design: .default))
                                .padding()
                                Image("fingersDownForearmStretch")
                                    .resizable()
                                    .frame(width: 200, height: 300)
                                    .cornerRadius(20)
                                    .shadow(radius: 20)
                                Text(
                                     """
                            The solution? Well, we need to first of all stretch the sore tendons and muscles out, but we also need to strengthen the weak forearm thats causing the pain in the first place.
                            
                            All of the exercises are in the workout routine of the elbow pain center.
                            """
                                )
                                .font(.system(size: 20, weight: .semibold, design: .default))
                                .padding()
                                
                                    Text(
"""
Next up, tennis elbow pain.
"""
                                    )
                                    .font(.system(size: 20, weight: .bold, design: .default))
                                    .padding()
                                    
                                
                            }
                            
                        }
                        .padding(.horizontal)
                        
                    }
                    
                }.edgesIgnoringSafeArea(.all)
            } else if pageIndex == 3 {
                ZStack {
                    Rectangle().foregroundColor(Config.colors[pageIndex])
                    
                    VStack {
                    Rectangle()
                            .foregroundColor(.clear)
                            .accessibilityHidden(true)
                            .frame(width: 0, height: UIScreen.main.bounds.height * 0.05)
                            Text("Why Tennis Elbow Happens")
                            .font(.system(size: 45, weight: .bold, design: .default))
                                .lineLimit(3)
                                .frame(width: UIScreen.main.bounds.width * 0.95)
                                .multilineTextAlignment(.center)
                        
                                .padding(.top, 50)
                        ScrollView(showsIndicators: false) {
                            VStack {
                                
                                    Text(
                                     """
                                     There can be multiple causes to tennis elbow, and the first place we are going to be looking at is the forearm.
                                     """
                                    )
                                    .font(.system(size: 20, weight: .semibold, design: .default))
                                    .padding()
                                Image("tennis")
                                    .resizable()
                                    .frame(width: 300, height: 200)
                                    .cornerRadius(20)
                                    .shadow(radius: 20)
                                
                                Text(
                                 """
                                 Just like golfers elbow, tennis elbow can be caused by an overuse of the outer forarms muscles, and this can be caused by many reasons, even including a weakness of your inner forearm muscles!
                                 """
                                )
                                .font(.system(size: 20, weight: .semibold, design: .default))
                                .padding()
                                HStack {
                                    
                                    Image("LRPNG")
                                        .resizable()
                                        .frame(width: 200, height: 200)
                                        .cornerRadius(20)
                                        .shadow(radius: 20)
                                        .padding()
                                    Text(
                                 """
                                 This overuse could come from improper technique on lateral raises (Turn your thumb more vertical!) or, it could even come from prolonged typing!
                                 """
                                    )
                                    .font(.system(size: 20, weight: .semibold, design: .default))
                                    .padding()
                                    
                                }
                                
                                Text(
                                     """
                            The point is, if you overuse and abuse your forearm muscles, especially if they haven't been strengthened, you will experience pain.
                            """
                                )
                                .font(.system(size: 20, weight: .semibold, design: .default))
                                .padding()
                                Text(
"""
The solution? Stretch and strengthen! All exercises are linked in the elbow pain center.
"""
                                )
                                .font(.system(size: 20, weight: .semibold, design: .default))
                                .padding()
                            }
                            
                        }
                        .padding(.horizontal)
                        
                    }
                    
                }.edgesIgnoringSafeArea(.all)
            } else if pageIndex == 4 {
                ZStack {
                    Rectangle().foregroundColor(Config.colors[pageIndex])
                    
                    VStack {
                    Rectangle()
                            .foregroundColor(.clear)
                            .accessibilityHidden(true)
                            .frame(width: 0, height: UIScreen.main.bounds.height * 0.05)
                            Text("Why Tennis Elbow Happens")
                            .font(.system(size: 45, weight: .bold, design: .default))
                                .lineLimit(3)
                                .frame(width: UIScreen.main.bounds.width * 0.95)
                                .multilineTextAlignment(.center)
                        
                                .padding(.top, 50)
                        ScrollView(showsIndicators: false) {
                            VStack {
                                
                                    Text(
                                     """
                                     Another big cause of tennis elbow if lack of shoulder stability. The elbow can only go straight up or down, and so if the shoulder is out of place, it can cause other movement patterns that are foreign to the elbow, and can cause pain.
                                     """
                                    )
                                    .font(.system(size: 20, weight: .semibold, design: .default))
                                    .padding()
                                Image("Scapula")
                                    .resizable()
                                    .frame(width: 300, height: 200)
                                    .cornerRadius(20)
                                    .shadow(radius: 20)
                                
                                
                                Text(
                                 """
                                 If the arm bone rotates inward too much due to lack of shoulder and upper back strength, then the forearm will have no choice but work over-time to resist this and rotate in the opposite direction for you to complete your daily tasks effectively. This is why we will often say the elbow is the slave to the shoulder.
                                 
                                 Many things can contribute to this, such as working on computers endlessly, lack of stretching with the pecs and lats, poor thoracic mobility, and poor training techniques with poor postural awareness.
                                 """
                                )
                                .font(.system(size: 20, weight: .semibold, design: .default))
                                .padding()
                                Text(
                                     """
                            The point is, if you don't have adequate upper back strength, you can fall victem to elbow pain. We solve this via the exercises provided.
                            """
                                )
                                .font(.system(size: 20, weight: .semibold, design: .default))
                                .padding()
                                
                            }
                            
                        }
                        .padding(.horizontal)
                        
                    }
                    
                }.edgesIgnoringSafeArea(.all)
            }
        case .backPain:
            if pageIndex == 0 {
                ZStack {
                    Rectangle().foregroundColor(Config.colors[pageIndex])
                    
                    VStack {
                    Rectangle()
                            .foregroundColor(.clear)
                            .accessibilityHidden(true)
                            .frame(width: 0, height: UIScreen.main.bounds.height * 0.05)
                            Text("Why Back Pain Happens")
                            .font(.system(size: 45, weight: .bold, design: .default))
                                .lineLimit(3)
                                .frame(width: UIScreen.main.bounds.width * 0.95)
                                .multilineTextAlignment(.center)
                        
                                .padding(.top, 50)
                        ScrollView(showsIndicators: false) {
                            VStack {
                                HStack {
                                    Text(
                                     """
                                     As much attention the glutes get from an aesthetic perspective, they are extremely underrated for their muscular power and role in virtually every lower body movement.
                                     """
                                    )
                                    .font(.system(size: 20, weight: .semibold, design: .default))
                                    
                                    Image("gluteIcon")
                                        .resizable()
                                        .frame(width: 100, height: 100)
                                        .cornerRadius(20)
                                        .shadow(radius: 20)
                                    
                                }
                                
                                .padding()
                                Text(
                                 """
                                 The glutes provide joint stability not only for your lower back, but also your knees and lower legs.
                                 """
                                )
                                .font(.system(size: 20, weight: .semibold, design: .default))
                                .padding()
                                Image("buttHighlighted")
                                    .cornerRadius(20)
                                    .shadow(radius: 20)
                                
                                Text(
                                 """
                                 So, prolonged sitting, lack of lower body exercise and an overal inactive lifestyle can lead to gluteal amnesia. This means your glutes lose their muscular power and are unable to contract properly.
                                 """
                                )
                                .font(.system(size: 20, weight: .semibold, design: .default))
                                .padding()
                                Image("couchPotato")
                                    .resizable()
                                    .frame(width: 140, height: 100)
                                    .cornerRadius(20)
                                    .shadow(radius: 20)
                                Text(
                                 """
                                 This means that if your glutes are too weak to get the job done, your lower back will step up and do it. However, our lower backs are meant to be stable, and are not supposed to mobilize, and this this puts you at risk of low back injuries and chronic pain.
                                 """
                                )
                                .font(.system(size: 20, weight: .semibold, design: .default))
                                .padding()
                                HStack {
                                    Image("gluteBridgeMachine")
                                        .resizable()
                                        .frame(width: 150, height: 150)
                                        .cornerRadius(20)
                                        .shadow(radius: 20)
                                    Text(
                                 """
                                 The solution? Strenghten them glutes! The exercise routine in the back pain center takes care of that for you.
                                 """
                                    )
                                    .font(.system(size: 20, weight: .semibold, design: .default))
                                    .padding()
                                }
                            }
                            
                        }
                        .padding(.horizontal)
                        
                    }
                    
                }.edgesIgnoringSafeArea(.all)
            } else if pageIndex == 1 {
                ZStack {
                    Rectangle().foregroundColor(Config.colors[pageIndex])
                    
                    VStack {
                        Rectangle()
                                .foregroundColor(.clear)
                                .accessibilityHidden(true)
                                .frame(width: 0, height: UIScreen.main.bounds.height * 0.05)
                            Text("Why Back Pain Happens")
                            .font(.system(size: 45, weight: .bold, design: .default))
                                .lineLimit(3)
                                .frame(width: UIScreen.main.bounds.width * 0.95)
                                .multilineTextAlignment(.center)
                        
                                .padding(.top, 50)
                        ScrollView(showsIndicators: false) {
                            VStack {
                                HStack {
                                    Image("lowBackStrain")
                                        .resizable()
                                        .frame(width: 100, height: 120)
                                        .cornerRadius(20)
                                        .shadow(radius: 20)
                                    Text(
                                     """
                                     As we've discussed, the lower back is meant to be stable, and so if the muscles around your lower back - such as the hips and the upper back - are tight, your lower back is forced to flex and carry loads it's not designed to.
                                     """
                                    )
                                    .font(.system(size: 20, weight: .semibold, design: .default))
                                    
                                    
                                }
                                .padding()
                                
                                
                                
                                Text(
                                 """
                                 This means that if you spend a lot of your day with a hunched back posture staring at your phone or computer, or if you have tight hips because of a lot of sitting, you are at a higher risk for back pain.
                                 """
                                )
                                .font(.system(size: 20, weight: .semibold, design: .default))
                                .padding()
                                Image("hunchBack")
                                    .resizable()
                                    .frame(width: 150, height: 90)
                                    .cornerRadius(20)
                                    .shadow(radius: 20)
                                
                                HStack {
                                    
                                    Text(
                                 """
                                 The solution? mobilize the muscles around your lower back! The exercise routine in the back pain center takes care of that for you.
                                 """
                                    )
                                    .font(.system(size: 20, weight: .semibold, design: .default))
                                    .padding()
                                    Image("catCowShadow")
                                        .resizable()
                                        .frame(width: 150, height: 150)
                                        .cornerRadius(20)
                                        .shadow(radius: 20)
                                }
                            }
                            
                        }
                        .padding(.horizontal)
                        
                    }
                    
                }.edgesIgnoringSafeArea(.all)
            } else if pageIndex == 2 {
                ZStack {
                    Rectangle().foregroundColor(Config.colors[pageIndex])
                    
                    VStack {
                        Rectangle()
                                .foregroundColor(.clear)
                                .accessibilityHidden(true)
                                .frame(width: 0, height: UIScreen.main.bounds.height * 0.05)
                            Text("Why Back Pain Happens")
                            .font(.system(size: 45, weight: .bold, design: .default))
                                .lineLimit(3)
                                .frame(width: UIScreen.main.bounds.width * 0.95)
                                .multilineTextAlignment(.center)
                        
                                .padding(.top, 50)
                        ScrollView(showsIndicators: false) {
                            VStack {
                                HStack {
                                    Text(
                                     """
                                     If you've ever watched someone deadlift weight that is far too heavy for them, cringing at the sight of their back curving forward, it's because you intuitively know their spine is at risk.
                                     """
                                    )
                                    .font(.system(size: 20, weight: .semibold, design: .default))
                                    
                                    
                                }
                                
                                .padding()
                                Image("properLiftingTechnique")
                                    .resizable()
                                    .frame(width: 130, height: 100)
                                    .cornerRadius(20)
                                    .shadow(radius: 20)
                                Text(
                                 """
                                 Though are spines are meant to be able to flex, twsit and extend, they're not meant to do so under heavy loads.
                                 """
                                )
                                .font(.system(size: 20, weight: .semibold, design: .default))
                                .padding()
                                Image("couch")
                                    .resizable()
                                    .frame(width: 300, height: 150)
                                    .cornerRadius(20)
                                    .shadow(radius: 20)
                                Text(
                                 """
                                 If you've ever tweaked your back when moving furniture, it was probably because you didn;t do a proper hip hinge.
                                 """
                                )
                                .font(.system(size: 20, weight: .semibold, design: .default))
                                .padding()
                                
                                Text(
                                 """
                                 During a proper hip hinge, the lower and upper back stay relativly fixed. What should move are the hips, which allows the glutes and hamstrings to do most of the work. This is a fundamental movement in day to day life, and it should be perfected if you want to have a pain free back.
                                 """
                                )
                                .font(.system(size: 20, weight: .semibold, design: .default))
                                .padding()
                                Image("cablePullThrough")
                                    .resizable()
                                    .frame(width: 225, height: 150)
                                    .cornerRadius(20)
                                    .shadow(radius: 20)
                                HStack {
                                    Text(
                                 """
                                 The solution? Learn to properly hip hinge! Practice cable pull throughs. The exercise routine in the back pain center takes care of that for you.
                                 """
                                    )
                                    .font(.system(size: 20, weight: .semibold, design: .default))
                                    .padding()
                                }
                            }
                            
                        }
                        .padding(.horizontal)
                        
                    }
                    
                }.edgesIgnoringSafeArea(.all)
            } else if pageIndex == 3 {
                ZStack {
                    Rectangle().foregroundColor(Config.colors[pageIndex])
                    
                    VStack {
                        Rectangle()
                                .foregroundColor(.clear)
                                .accessibilityHidden(true)
                                .frame(width: 0, height: UIScreen.main.bounds.height * 0.05)
                            Text("Why Back Pain Happens")
                            .font(.system(size: 45, weight: .bold, design: .default))
                                .lineLimit(3)
                                .frame(width: UIScreen.main.bounds.width * 0.95)
                                .multilineTextAlignment(.center)
                        
                                .padding(.top, 50)
                        ScrollView(showsIndicators: false) {
                            VStack {
                                Image("tva")
                                    .resizable()
                                    .frame(width: 300, height: 210)
                                    .cornerRadius(20)
                                    .shadow(radius: 20)
                                Text(
                                     """
                                     The Transverse Abdominis, or TVA for short, is one of the primary deep-layer core muscles, located in the lower abdomen. It's primary fucntion is to stabalize your pelvise during movement.
                                     """
                                )
                                .font(.system(size: 20, weight: .semibold, design: .default))
                                .padding()
                                
                                HStack {
                                    Image("belt")
                                        .resizable()
                                        .frame(width: 162, height: 87.5)
                                        .cornerRadius(20)
                                        .shadow(radius: 20)
                                    Text(
                                     """
                                     Imagine a powerlifter wearing a weightlifting belft. Well, your TVA literally performs the same function. This is why overusing a weightlifting belt usually ends up in back pain, as your TVA weakens.
                                     """
                                    )
                                    .font(.system(size: 20, weight: .semibold, design: .default))
                                    .padding()
                                }
                                
                                
                                Text(
                                 """
                                 Research has shown a correlation between greater TVA strength and reduced back pain, and so it would be wise to work on improving the mind-muscle connection to your TVA.
                                 """
                                )
                                .font(.system(size: 20, weight: .semibold, design: .default))
                                .padding()
                                
            
                                HStack {
                                    Text(
                                 """
                                 The solution? Work on strenghtening your TVA! The exercise routine in the back pain center helps with that.
                                 """
                                    )
                                    .font(.system(size: 20, weight: .semibold, design: .default))
                                    .padding()
                                }
                            }
                            
                        }
                        .padding(.horizontal)
                        
                    }
                    
                }.edgesIgnoringSafeArea(.all)
            } else if pageIndex == 4 {
                ZStack {
                    Rectangle().foregroundColor(Config.colors[pageIndex])
                    
                    VStack {
                        Rectangle()
                                .foregroundColor(.clear)
                                .accessibilityHidden(true)
                                .frame(width: 0, height: UIScreen.main.bounds.height * 0.05)
                            Text("Why Back Pain Happens")
                            .font(.system(size: 45, weight: .bold, design: .default))
                                .lineLimit(3)
                                .frame(width: UIScreen.main.bounds.width * 0.95)
                                .multilineTextAlignment(.center)
                        
                                .padding(.top, 50)
                        ScrollView(showsIndicators: false) {
                            VStack {

                                
                                Text(
                                     """
                                     Building muscular endurance is really important, because if you have a strong and stable back, and try and squat, you might get a few good reps in, but before you know it, your back is fatigued and it's going to unnecassarily bend again.
                                     """
                                )
                                .font(.system(size: 20, weight: .semibold, design: .default))
                                .padding()
                                
                                HStack {
                                   
                                    Text(
                                     """
                                     Without sufficient endurance, your low back cannot maintain good posture through the day, let alone during exercise that causes fatigue.
                                     """
                                    )
                                    .font(.system(size: 20, weight: .semibold, design: .default))
                                    .padding()
                                }
                                
                                
                                Image("birdDog")
                                    .resizable()
                                    .frame(width: 270, height: 180)
                                    .cornerRadius(20)
                                    .shadow(radius: 20)
            
                                HStack {
                                    Text(
                                 """
                                 The solution? Work on building low back endurance! The exercise routine in the back pain center helps with that.
                                 """
                                    )
                                    .font(.system(size: 20, weight: .semibold, design: .default))
                                    .padding()
                                }
                            }
                            
                        }
                        .padding(.horizontal)
                        
                    }
                    
                }.edgesIgnoringSafeArea(.all)
            } else if pageIndex == 5 {
                ZStack {
                    Rectangle().foregroundColor(Config.colors[pageIndex])
                    
                    VStack {
                        Rectangle()
                                .foregroundColor(.clear)
                                .accessibilityHidden(true)
                                .frame(width: 0, height: UIScreen.main.bounds.height * 0.05)
                            Text("Final Tips")
                            .font(.system(size: 45, weight: .bold, design: .default))
                                .lineLimit(3)
                                .frame(width: UIScreen.main.bounds.width * 0.95)
                                .multilineTextAlignment(.center)
                        
                                .padding(.top, 50)
                        ScrollView(showsIndicators: false) {
                            VStack {

                                VStack {
                                    HStack {
                                        Text("Tip One: Brace Your Core")
                                            .font(.system(size: 25, weight: .bold, design: .default))
                                            .padding(.leading, 25)
                                        Spacer()
                                        EmptyyView()
                                    }
                                    
                                    Text(
                                         """
                                         Bracing your core before any heavy movements is key if you want to be able to lift heavy items, without damaging your back. Before you ever lift anything, follow these steps:
                                         
                                         1. Take a deep inhale and hold it, focusing on expanding your belly outward and preventing your chest from rising.
                                         
                                         2. Tighten your stomach while continuing to hold in the breath, like you are preparing to be punched in the stomach.
                                         
                                         3. Squeeze your butt muscles. This should create a sense of horizontal pressure between your butt and lower abdomen.
                                         
                                         Summary: take a big breath into your belly, suck your belly inward, clench your butt muscles. After practicing this a few times, you can shorten your mental cue list to "big belly breath, tighten, butt squeeze.
                                         """
                                    )
                                    .font(.system(size: 20, weight: .semibold, design: .default))
                                    .padding()
                                }
                                
                                
                                VStack {
                                    HStack {
                                        Text("Tip Two: Don't Sit Still")
                                            .font(.system(size: 25, weight: .bold, design: .default))
                                            .padding(.leading, 25)
                                        Spacer()
                                        EmptyyView()
                                    }
                                    
                                    Text(
                                         """
                                         As we've already disciussed, sitting still for long periods of time with bad posture can cause certain muscles like your hips to tighten, and this can lead to back pain.
                                         
                                         Thus, whenever sitting down, take regular breaks from sitting to stand, walk and stretch. Maybe get a standing desk, and change from sitting and standing regularly.
                                         
                                         No matter what you do, just remember to break up your sitting time into little breaks of movement.
                                         """
                                    )
                                    .font(.system(size: 20, weight: .semibold, design: .default))
                                    .padding()
                                }
                                
                                
                                VStack {
                                    HStack {
                                        Text("Tip Three: Walk Everyday")
                                            .font(.system(size: 25, weight: .bold, design: .default))
                                            .padding(.leading, 25)
                                        Spacer()
                                        EmptyyView()
                                    }
                                    
                                    Text(
                                         """
                                         Walking is the king of back pain relief exercises. Even 10 - 20 minutes a day can improve lumbar function, decrease dependence on pain killers, increase spinal muscle blood flow, and reduce low back pain (by up to 27%).
                                         
                                         Find a time sloit everyday and commit to the walking habit.
                                         """
                                    )
                                    .font(.system(size: 20, weight: .semibold, design: .default))
                                    .padding()
                                }
                            }
                            
                        }
                        .padding(.horizontal)
                        
                    }
                    
                }.edgesIgnoringSafeArea(.all)
            }
            // MARK: SHOULDER PAIN COURSE
        case .shoulderPain:
            if pageIndex == 0 {
                ZStack {
                    Rectangle().foregroundColor(Config.colors[pageIndex])
                    
                    VStack {
                        Rectangle()
                                .foregroundColor(.clear)
                                .accessibilityHidden(true)
                                .frame(width: 0, height: UIScreen.main.bounds.height * 0.05)
                            Text("Why Shoulder Pain Happens")
                            .font(.system(size: 45, weight: .bold, design: .default))
                                
                                .lineLimit(3)
                                .frame(width: UIScreen.main.bounds.width * 0.95)
                                .multilineTextAlignment(.center)
                                .padding(.top, 50)
                        ScrollView(showsIndicators: false) {
                            VStack {
                                HStack {
                                    Text(
                                     """
                                     The Latissimus Dorsi (Lat) is the biggest muscle in your upper body. It lies just underneath your armpit on each side of your body, extending down to the middle of your low back.
                                     """
                                    )
                                    .font(.system(size: 20, weight: .semibold, design: .default))

                                    Image("lat")
                                        .resizable()
                                        .frame(width: 100, height: 100)
                                        .cornerRadius(20)
                                        .shadow(radius: 20)
                                }
                                .padding()
                                Text(
                                 """
                                 With your arms at your side, your lats are in their shortest position. With them overhead, they are fully extended. And thats EXACTLY why it's related to shoulder pain.
                                 """
                                )
                                .font(.system(size: 20, weight: .semibold, design: .default))
                                .padding()
                                
                                Image("sittingAtDesk")
                                    .resizable()
                                    .frame(width: 250, height: 150)
                                    .cornerRadius(20)
                                    .shadow(radius: 20)
                                Text(
                                 """
                                 See, when you sit at your desk, lie in bed, drive your car or do any routine task, your lats are in their shortest position. How many things do you do with your hands over your head throughout the day?
                                 
                                 Not many things, or atleast not for much time.
                                 """
                                )
                                .font(.system(size: 20, weight: .semibold, design: .default))
                                .padding()
                                
                                Image("roundedShoulders")
                                    .resizable()
                                    .frame(width: 325, height: 175)
                                    .cornerRadius(20)
                                    .shadow(radius: 20)

                                Text(
                                 """
                                 Eventually, your lats will tighten and shorten. And here's the punchline: your lats are responsable for internally rotating your shoulder.
                                 
                                 This makes it so your shoulders are constantly pulled into a hunched position, and it makes it very difficult to get into a full overhead position.
                                 """
                                )
                                .font(.system(size: 20, weight: .semibold, design: .default))
                                .padding()
                                Image("shoulders")
                                    .resizable()
                                    .frame(width: 250, height: 150)
                                    .cornerRadius(20)
                                    .shadow(radius: 20)
                                HStack {
                                    
                                    Text(
                                 """
                                 All in all, this tightening and shortening makes it very difficult to get good form when doing overhead exercie like a shoulder press or bench press. This is why you may be experiencing shoulder pain during exercise.
                                 """
                                    )
                                    .font(.system(size: 20, weight: .semibold, design: .default))
                                    .padding()
                                }
                                Text(
                             """
                             The solution? Mobalize the lats! We need to get them looser and we do so through mobility work. All of that is handled in the exercises in the shoulder pain center.
                             """
                                )
                                .font(.system(size: 20, weight: .semibold, design: .default))
                                .padding()
                            }
                            
                        }
                        .padding(.horizontal)
                        
                    }
                    
                }.edgesIgnoringSafeArea(.all)
            } else if pageIndex == 1 {
                ZStack {
                    Rectangle().foregroundColor(Config.colors[pageIndex])
                    
                    VStack {
                        Rectangle()
                                .foregroundColor(.clear)
                                .accessibilityHidden(true)
                                .frame(width: 0, height: UIScreen.main.bounds.height * 0.05)
                            Text("Why Shoulder Pain Happens")
                            .font(.system(size: 45, weight: .bold, design: .default))
                                
                                .lineLimit(3)
                                .frame(width: UIScreen.main.bounds.width * 0.95)
                                .multilineTextAlignment(.center)
                                .padding(.top, 50)
                        ScrollView(showsIndicators: false) {
                            VStack {
                                
                                Text(
                                     """
                                     The secon reason why shoulder pain may be bothering you is simply incorrect shoulder positioning!
                                     
                                     When you have the proper "down and back" posture, it means your shoulder are in an alignment that allows your skeletal system to work efficiently and without pain.
                                     """
                                )
                                .font(.system(size: 20, weight: .semibold, design: .default))
                                .padding()
                                Image("goodShoulderPosture")
                                    .resizable()
                                    .frame(width: 250, height: 192.5)
                                    .cornerRadius(20)
                                    .shadow(radius: 20)
                                Text(
                                 """
                                 There are two main problems that prevent ideal shoulder positioning: kyphosis and anterior shoulder glide. The former is usually the result of bad sitting posture.
                                 
                                 The latter is caused by tight anterior shoulder muscles (front shoulder), and weak posterior muscles (back of shoulder).
                                 """
                                )
                                .font(.system(size: 20, weight: .semibold, design: .default))
                                .padding()
                                
                                HStack(spacing: 10) {
                                    VStack {
                                        Image("kyphosis")
                                            .resizable()
                                            .frame(width: 150, height: 150)
                                            .cornerRadius(20)
                                            .shadow(radius: 20)
                                        Text("Kyphosis")
                                            .font(.body)
                                            .bold()
                                    }
                                    VStack {
                                        Image("anteriorShoulderGlide")
                                            .resizable()
                                            .frame(width: 150, height: 150)
                                            .cornerRadius(20)
                                            .shadow(radius: 20)
                                        Text("Anterior Shoulder Glide")
                                            .font(.body)
                                            .bold()
                                            .multilineTextAlignment(.center)
                                    }
                                    
                                }
                                
                                Text(
                                 """
                                 So, whats the solution? Well, we need to practice and train proper scapula and shoulder positioning, and this is all taken care of in the exercises for the shoulder pain center.
                                 """
                                )
                                .font(.system(size: 20, weight: .semibold, design: .default))
                                .padding()
                            }
                            
                        }
                        .padding(.horizontal)
                        
                    }
                }.edgesIgnoringSafeArea(.all)
            } else if pageIndex == 2 {
                ZStack {
                    Rectangle().foregroundColor(Config.colors[pageIndex])
                    
                    VStack {
                        Rectangle()
                                .foregroundColor(.clear)
                                .accessibilityHidden(true)
                                .frame(width: 0, height: UIScreen.main.bounds.height * 0.05)
                            Text("Why Shoulder Pain Happens")
                            .font(.system(size: 45, weight: .bold, design: .default))
                                
                                .lineLimit(3)
                                .frame(width: UIScreen.main.bounds.width * 0.95)
                                .multilineTextAlignment(.center)
                                .padding(.top, 50)
                        ScrollView(showsIndicators: false) {
                            VStack {
                                
                                Text(
                                     """
                                     People love having a big chest with a wide back, and for good reason - they are arguable the most aesthetic muscles to build as a man especially.
                                     """
                                )
                                .font(.system(size: 20, weight: .semibold, design: .default))
                                .padding()
                                Image("arnold")
                                    .resizable()
                                    .frame(width: 170, height: 200)
                                    .cornerRadius(20)
                                    .shadow(radius: 20)
                                HStack {
                                    Text(
                                 """
                                 However, this is a problem. As we've already seen, the lats are internal rotators, and they are involved in almost all pressing and rowing movement, like the bench press.
                                 """
                                    )
                                    .font(.system(size: 20, weight: .semibold, design: .default))
                                    .padding()
                                    Image("benchPress")
                                        .resizable()
                                        .frame(width: 150, height: 150)
                                        .cornerRadius(20)
                                        .shadow(radius: 20)
                                }
                                
                                
                                Text(
                                 """
                                 If we keep on building our internal rotators, and neglect the smaller - yet equally as important - external rotators, we are very likely to fall victem to the pains of shoulder impingement.
                                 
                                 Not good.
                                 """
                                )
                                .font(.system(size: 20, weight: .semibold, design: .default))
                                .padding()
                                Image("externalRotation")
                                    .resizable()
                                    .frame(width: 300, height: 200)
                                    .cornerRadius(20)
                                    .shadow(radius: 20)
                                Text(
                                 """
                                 Lucky for us, fixing this problem is really, really easy. All we need to do is improve external rotation by strenghtening our shoulder external rotators. All of this is handled in the exercise routine.
                                 """
                                )
                                .font(.system(size: 20, weight: .semibold, design: .default))
                                .padding()
                            }
                            
                        }
                        .padding(.horizontal)
                        
                    }
                }.edgesIgnoringSafeArea(.all)
            } else if pageIndex == 3 {
                ZStack {
                    Rectangle().foregroundColor(Config.colors[pageIndex])
                    
                    VStack {
                        Rectangle()
                                .foregroundColor(.clear)
                                .accessibilityHidden(true)
                                .frame(width: 0, height: UIScreen.main.bounds.height * 0.05)
                            Text("Why Shoulder Pain Happens")
                            .font(.system(size: 45, weight: .bold, design: .default))
                                
                                .lineLimit(3)
                                .frame(width: UIScreen.main.bounds.width * 0.95)
                                .multilineTextAlignment(.center)
                                .padding(.top, 50)
                        ScrollView(showsIndicators: false) {
                            VStack {
                                
                                Text(
                                     """
                                     The rotator cuff is made up of several muscles and tendons that keep your upper arm bone fimly planted in the shoulder socket. Weakness in these muscles is one of the leading causes of shoulder pain.
                                     """
                                )
                                .font(.system(size: 20, weight: .semibold, design: .default))
                                .padding()
                                Image("rotatorCuffs")
                                    .resizable()
                                    .frame(width: 300, height: 200)
                                    .cornerRadius(20)
                                    .shadow(radius: 20)
                                HStack {
                                    Text(
                                 """
                                 Luckily for you, you don't need to learn the anatomy. Just kniow that the rotator cuff is comprised of several muscles that keep your shoulder strong and stable.
                                 """
                                    )
                                    .font(.system(size: 20, weight: .semibold, design: .default))
                                    .padding()
                                }
                                
                                
                                Text(
                                 """
                                 So, the solution? Strengthen the rotator cuffs! The best way to accomplish this is by using a variety of resistance movements that challenge your upper body stability and coordination.
                                 """
                                )
                                .font(.system(size: 20, weight: .semibold, design: .default))
                                .padding()
                                Image("kettlebellPush")
                                    .resizable()
                                    .frame(width: 300, height: 200)
                                    .cornerRadius(20)
                                    .shadow(radius: 20)
                                Text(
                                 """
                                 All of these exercises that can help will be found in the exerciuse routine in the shoulder pain center.
                                 """
                                )
                                .font(.system(size: 20, weight: .semibold, design: .default))
                                .padding()
                            }
                            
                        }
                        .padding(.horizontal)
                        
                    }
                }.edgesIgnoringSafeArea(.all)
            } else if pageIndex == 4 {
                ZStack {
                    Rectangle().foregroundColor(Config.colors[pageIndex])
                    
                    VStack {
                        Rectangle()
                                .foregroundColor(.clear)
                                .accessibilityHidden(true)
                                .frame(width: 0, height: UIScreen.main.bounds.height * 0.05)
                            Text("Why Shoulder Pain Happens")
                            .font(.system(size: 45, weight: .bold, design: .default))
                                
                                .lineLimit(3)
                                .frame(width: UIScreen.main.bounds.width * 0.95)
                                .multilineTextAlignment(.center)
                                .padding(.top, 50)
                        ScrollView(showsIndicators: false) {
                            VStack {
                                Text(
                                     """
                                     Finally, we need to build strength in the upper back. Like we've already seen, being in a slumped position is a huge factor for shoulder impingement.
                                    """
                                )
                                .font(.system(size: 20, weight: .semibold, design: .default))
                                .padding()
                                Text(
                                 """
                                 Any body can force their shoulders into good posture, temporarily. It takes good muscular endurance to be able to pull your shoulders into good posture AND keep them their.
                                 """
                                )
                                .font(.system(size: 20, weight: .semibold, design: .default))
                                .padding()
                                Image("inclineRow")
                                    .resizable()
                                    .frame(width: 300, height: 200)
                                    .cornerRadius(20)
                                    .shadow(radius: 20)
                                Text(
                                 """
                                 And thats exactly what we need to do. By building strength in the upper back, we'll have the power to pull our muscles into good position every single day, all throughout the day.
                                 """
                                )
                                .font(.system(size: 20, weight: .semibold, design: .default))
                                .padding()
                            }
                            
                        }
                        .padding(.horizontal)
                        
                    }
                }.edgesIgnoringSafeArea(.all)
            }
        case .kneePain:
            if pageIndex == 0 { //page 1
                ZStack {
                    Rectangle().foregroundColor(Config.colors[pageIndex])
                    
                    VStack {
                        Rectangle()
                                .foregroundColor(.clear)
                                .accessibilityHidden(true)
                                .frame(width: 0, height: UIScreen.main.bounds.height * 0.05)
                            Text("Why Knee Pain Happens")
                            .font(.system(size: 45, weight: .bold, design: .default))
                                .lineLimit(3)
                                .frame(width: UIScreen.main.bounds.width * 0.95)
                                .multilineTextAlignment(.center)
                                .padding(.top, 50)
                        ScrollView(showsIndicators: false) {
                            VStack {
                                Text(
                                     """
                                     Your knees take a beating. Virtually every movement requires your knees to either stabilize or move your legs.
                                     """
                                )
                                .font(.system(size: 20, weight: .semibold, design: .default))
                                .padding()
                                Image("kneePain")
                                    .resizable()
                                    .frame(width: 250, height: 160)
                                    .cornerRadius(20)
                                    .shadow(radius: 20)
                                Text(
                                     """
                                    Adding more repetitive exercise and high volume training isn't the answer to your pain, nor is taking a complete break from activity.
                                    """
                                )
                                .font(.system(size: 20, weight: .semibold, design: .default))
                                .padding()
                                Text(
                                 """
                                 The only way to bulletproof your knees is to increase their load capacity. (i.e. make them stronger!)
                                 
                                 This is not accomplished by stretching or mobility, but with slow, controlled repetitions of exercises that progressively challenge the load-bearing capabilities of connective tissue around your knees.
                                 """
                                )
                                .font(.system(size: 20, weight: .semibold, design: .default))
                                .padding()
                                Image("bulgarianSplitSquat")
                                    .resizable()
                                    .frame(width: 250, height: 180)
                                    .cornerRadius(20)
                                    .shadow(radius: 20)
                                Text(
                                 """
                                 The tips that follow, such as cleaning up your knee track and perfecting a hip-dominant squat pattern, are very important for you especially if you want to live a knee-pain-free life.
                                 """
                                )
                                .font(.system(size: 20, weight: .semibold, design: .default))
                                .padding()
                            }
                            
                        }
                        .padding(.horizontal)
                        
                    }
                }.edgesIgnoringSafeArea(.all)
            } else if pageIndex == 1 {
                ZStack {
                    Rectangle().foregroundColor(Config.colors[pageIndex])
                    
                    VStack {
                        Rectangle()
                                .foregroundColor(.clear)
                                .accessibilityHidden(true)
                                .frame(width: 0, height: UIScreen.main.bounds.height * 0.05)
                            Text("Why Knee Pain Happens")
                            .font(.system(size: 45, weight: .bold, design: .default))
                                .lineLimit(3)
                                .frame(width: UIScreen.main.bounds.width * 0.95)
                                .multilineTextAlignment(.center)
                                .padding(.top, 50)
                        ScrollView(showsIndicators: false) {
                            VStack {
                                Text(
                                     """
                                     Knee pain is often the result of incorrect joint positiining during movement.
                                     """
                                )
                                .font(.system(size: 20, weight: .semibold, design: .default))
                                .padding()
                                Image("abcKnockKnees")
                                    .resizable()
                                    .frame(width: 250, height: 160)
                                    .cornerRadius(20)
                                    .shadow(radius: 20)
                                Text(
                                     """
                                    For example, it's very common to see weightlifters and regular people alike move their knees far too inside the midline of their body, as shown in image C.
                                    
                                    Furthermore, although less common, people also may have the tendency to push their knees outwards, like image A.
                                    """
                                )
                                .font(.system(size: 20, weight: .semibold, design: .default))
                                .padding()
                                
                                Image("kneelaser")
                                    .resizable()
                                    .frame(width: 300, height: 300)
                                    .cornerRadius(20)
                                    .shadow(radius: 20)
                                Text(
                                 """
                                 To fix this issue, some people even go so far as to get knee tracking devices like the one above to guide their movements via lasers.
                                 
                                 We don't need to go so far. We can accomplish the same thing with a mirror and the bulgarian split squat.
                                 """
                                )
                                .font(.system(size: 20, weight: .semibold, design: .default))
                                .padding()
                                Image("bulgarianSplitSquat")
                                    .resizable()
                                    .frame(width: 300, height: 200)
                                    .cornerRadius(20)
                                    .shadow(radius: 20)
                                Text(
                                 """
                                 During the bulgarian split squat, focus on keeping your knee pointed straight ahead located directly over your foot or just slightly infront. The foot and the knee should point in the same direction.
                                 """
                                )
                                .font(.system(size: 20, weight: .semibold, design: .default))
                                .padding()
                                Text(
                                 """
                                 After you start moving your knees properly during movement / clean up your knee track, you remove the faulty movement patterns that caused your pain in the first place, effectiveley killing the cause of your pain.
                                 
                                 No anti-inflammatory drugs, no ice, no compression. Plain old killing the pain from the root.
                                 """
                                )
                                .font(.system(size: 20, weight: .semibold, design: .default))
                                .padding()
                               
                            }
                            
                        }
                        .padding(.horizontal)
                        
                    }
                }.edgesIgnoringSafeArea(.all)
            } else if pageIndex == 2 {
                ZStack {
                    Rectangle().foregroundColor(Config.colors[pageIndex])
                    
                    VStack {
                        Rectangle()
                                .foregroundColor(.clear)
                                .accessibilityHidden(true)
                                .frame(width: 0, height: UIScreen.main.bounds.height * 0.05)
                            Text("Why Knee Pain Happens")
                            .font(.system(size: 45, weight: .bold, design: .default))
                                .lineLimit(3)
                                .frame(width: UIScreen.main.bounds.width * 0.95)
                                .multilineTextAlignment(.center)
                                .padding(.top, 50)
                        ScrollView(showsIndicators: false) {
                            VStack {
                                HStack {
                                    Image("gluteIcon")
                                        .resizable()
                                        .frame(width: 100, height: 100)
                                        .cornerRadius(20)
                                        .shadow(radius: 20)
                                    Text(
                                     """
                                     Glutes are marvelous things. Just as strong glutes can greatly reduce back pain, they can do the same for your knees.
                                     """
                                    )
                                    .font(.system(size: 20, weight: .semibold, design: .default))
                                    .padding()
                                    
                                }
                            
                                Text(
                                     """
                                    Research has shown that if you have inactive (weak) glutes or deficits in hip abductors (moving leg away from your body), you're more likely to suffer from knee pain.
                                    """
                                )
                                .font(.system(size: 20, weight: .semibold, design: .default))
                                .padding()
                                Text(
                                 """
                                 Lucky for you, knee pain caused by hip abductor disfunction is very easy to fix. Just three weeks of targeted hip abductor strength training reduces kneep pain and improved knee function when walking.
                                 """
                                )
                                .font(.system(size: 20, weight: .semibold, design: .default))
                                .padding()
                                Image("hipAbductors")
                                    .resizable()
                                    .frame(width: 190, height: 300)
                                    .cornerRadius(20)
                                    .shadow(radius: 20)
                                Text(
                                 """
                                 All the exercises that do target hip and glute strengthening are in the exercise routine provided in the knee pain center.
                                 """
                                )
                                .font(.system(size: 20, weight: .semibold, design: .default))
                                .padding()
                               
                            }
                            
                        }
                        .padding(.horizontal)
                        
                    }
                }.edgesIgnoringSafeArea(.all)
            } else if pageIndex == 3 {
                ZStack {
                    Rectangle().foregroundColor(Config.colors[pageIndex])
                    
                    VStack {
                        Rectangle()
                                .foregroundColor(.clear)
                                .accessibilityHidden(true)
                                .frame(width: 0, height: UIScreen.main.bounds.height * 0.05)
                            Text("Why Knee Pain Happens")
                            .font(.system(size: 45, weight: .bold, design: .default))
                                .lineLimit(3)
                                .frame(width: UIScreen.main.bounds.width * 0.95)
                                .multilineTextAlignment(.center)
                                .padding(.top, 50)
                        ScrollView(showsIndicators: false) {
                            VStack {
                                
                                HStack {
                                    
                                    Text(
                                     """
                                     One of the most common muscle imbalances is having strong quadriceps (the front of your thigh), and having weak hamstrings (the back of your thigh).
                                     """
                                    )
                                    .font(.system(size: 20, weight: .semibold, design: .default))
                                    .padding()
                                    
                                }
                                Image("Hamstrings")
                                    .resizable()
                                    .frame(width: 250, height: 400)
                                    .cornerRadius(20)
                                    .shadow(radius: 20)
                                Text(
                                    """
                                    The larger and more powerful quadriceps fore the weaker hamstring muscles to stretch faster than they can contract to counter the force produced, and this can cause hamstring tears, as well as knee pain and knee injuries!
                                    """
                                )
                                .font(.system(size: 20, weight: .semibold, design: .default))
                                .padding()
                                Image("hamstringCurl")
                                    .resizable()
                                    .frame(width: 300, height: 200)
                                    .cornerRadius(20)
                                    .shadow(radius: 20)
                                Text(
                                 """
                                 It's your lucky day because fixing hamstring-weakness-induced knee pain is as simple as strengthening the hamstrings! All exercises are in the exercise section of the knee pain center.
                                 """
                                )
                                .font(.system(size: 20, weight: .semibold, design: .default))
                                .padding()
                                
                               
                            }
                            
                        }
                        .padding(.horizontal)
                        
                    }
                }.edgesIgnoringSafeArea(.all)
            } else if pageIndex == 4 {
                ZStack {
                    Rectangle().foregroundColor(Config.colors[pageIndex])
                    
                    VStack {
                        Rectangle()
                                .foregroundColor(.clear)
                                .accessibilityHidden(true)
                                .frame(width: 0, height: UIScreen.main.bounds.height * 0.05)
                            Text("Why Knee Pain Happens")
                            .font(.system(size: 45, weight: .bold, design: .default))
                                .lineLimit(3)
                                .frame(width: UIScreen.main.bounds.width * 0.95)
                                .multilineTextAlignment(.center)
                                .padding(.top, 50)
                        ScrollView(showsIndicators: false) {
                            VStack {
                                Image("hipFlexors")
                                    .resizable()
                                    .frame(width: 175, height: 200)
                                    .cornerRadius(20)
                                    .shadow(radius: 20)
                                    
                                    Text(
                                     """
                                     Your hips control the position of your knees when walking, jumpring and squatting. If your hips are tight or unstable, your knees will suffer the downstream effects.
                                     """
                                    )
                                    .font(.system(size: 20, weight: .semibold, design: .default))
                                    .padding()
                                    
                                
                            HStack {
                                Image("hip")
                                    .resizable()
                                    .frame(width: 90, height: 200)
                                    .padding(.leading)
                                    .cornerRadius(20)
                                    .shadow(radius: 20)
                                Text(
                                    """
                                    Since the knees are built primarily for stability, not mobility, all this work caused by weak hips leads to pain and injury.
                                    """
                                )
                                .font(.system(size: 20, weight: .semibold, design: .default))
                                .padding()
                            }
                                
                                Text(
                                 """
                                 Because most people lack both hip stability and mobility, and poor hip control causes low back and knee pain, improving hip function should be a top priority.
                                 """
                                )
                                .font(.system(size: 20, weight: .semibold, design: .default))
                                .padding()
                                
                                Text(
                                 """
                                 It may even be more important than strengthening your knees. A 2015 study in the Journal of Athletic Training demonstrated that knee rehabs focused on hip function helped relieve more pain than those focused on knee function alone.
                                 """
                                )
                                .font(.system(size: 20, weight: .semibold, design: .default))
                                .padding()
                                Text(
                                 """
                                 The exercises that will improve hip strength and control are all in the knee pain center exercise section.
                                 """
                                )
                                .font(.system(size: 20, weight: .semibold, design: .default))
                                .padding()
                            }
                            
                        }
                        .padding(.horizontal)
                        
                    }
                }.edgesIgnoringSafeArea(.all)
            } else if pageIndex == 5 {
                ZStack {
                    Rectangle().foregroundColor(Config.colors[pageIndex])
                    
                    VStack {
                        Rectangle()
                                .foregroundColor(.clear)
                                .accessibilityHidden(true)
                                .frame(width: 0, height: UIScreen.main.bounds.height * 0.05)
                            Text("Why Knee Pain Happens")
                            .font(.system(size: 45, weight: .bold, design: .default))
                                .lineLimit(3)
                                .frame(width: UIScreen.main.bounds.width * 0.95)
                                .multilineTextAlignment(.center)
                                .padding(.top, 50)
                        ScrollView(showsIndicators: false) {
                            VStack {
                                Text(
                                     """
                                     Fixing painful knees is tricky, because they already do so much work that we can easily overstress them with more exercises.
                                     """
                                    )
                                    .font(.system(size: 20, weight: .semibold, design: .default))
                                    .padding()
                                    
                                Image("wallSit")
                                    .resizable()
                                    .frame(width: 300, height: 200)
                                    .cornerRadius(20)
                                    .shadow(radius: 20)
                                HStack {
                            
                                Text(
                                    """
                                    This is why isometric holds and slow resistance trainings are your best friend. They help build strength and tendon load capacity with a lower risk of a pain response.
                                    """
                                )
                                .font(.system(size: 20, weight: .semibold, design: .default))
                                .padding()
                            }
                                
                                Text(
                                 """
                                 If you can't perform leg exercises without pain, focus on the wall sit exercise in the knee pain center exercises.
                                 
                                 Once you can do the wall-sit for 45 seconds with low pain, start doing them with one leg, until you can do it for 45 seconds as well.
                                 """
                                )
                                .font(.system(size: 20, weight: .semibold, design: .default))
                                .padding()
                            }
                        }.padding(.horizontal)
                    }
                }.edgesIgnoringSafeArea(.all)
            } else if pageIndex == 6 {
                ZStack {
                    Rectangle().foregroundColor(Config.colors[pageIndex])
                    
                    VStack {
                        Rectangle()
                                .foregroundColor(.clear)
                                .accessibilityHidden(true)
                                .frame(width: 0, height: UIScreen.main.bounds.height * 0.05)
                            Text("Why Knee Pain Happens")
                            .font(.system(size: 45, weight: .bold, design: .default))
                                .lineLimit(3)
                                .frame(width: UIScreen.main.bounds.width * 0.95)
                                .multilineTextAlignment(.center)
                                .padding(.top, 50)
                        ScrollView(showsIndicators: false) {
                            VStack {
                                Text(
                                     """
                                     The final two reasons that you may be experiencing knee pain is simply reduces ankle mobility, and inactive feet.
                                     """
                                    )
                                    .font(.system(size: 20, weight: .semibold, design: .default))
                                    .padding()
                                    
                                Image("ankleAndCalf")
                                    .resizable()
                                    .frame(width: 300, height: 200)
                                    .cornerRadius(20)
                                    .shadow(radius: 20)
                                HStack {
                            
                                Text(
                                    """
                                    A certain amount of ankle mobility is necessary to squat and even walk without creating shearing forces that overload the knee.
                                    """
                                )
                                .font(.system(size: 20, weight: .semibold, design: .default))
                                .padding()
                            }
                                
                                Text(
                                 """
                                 When lacking ankle mobility, your body has two choices to perform squatting motions: (1) lean the upper body forward to allow the hips to descend, which strains the low back, or (2) keep the upper body upright, which strains the tendons and ligaments in the front your knee.
                                 """
                                )
                                .font(.system(size: 20, weight: .semibold, design: .default))
                                .padding()
                                Image("calfRolling")
                                    .resizable()
                                    .frame(width: 300, height: 200)
                                    .cornerRadius(20)
                                    .shadow(radius: 20)
                                Text(
                                 """
                                 Freeing up ankle ranges of motion will allow you to develop stabilizing ankle strength, which provides a better foundation for your knees.
                                 """
                                )
                                .font(.system(size: 20, weight: .semibold, design: .default))
                                .padding()
                                Text(
                                 """
                                 Foot health doesn't get the attention it deserves when it comes to preventing knee pain. If you have flat feet or a fallen arch, it causes a chain reaction that pulls your entire body out of alignment.
                                 """
                                )
                                .font(.system(size: 20, weight: .semibold, design: .default))
                                .padding()
                                Image("foot")
                                    .resizable()
                                    .frame(width: 350, height: 275, alignment: .center)
                                    .cornerRadius(20)
                                    .shadow(radius: 20)
                                HStack {
                                    
                                    Image("tripod+foot")
                                        .resizable()
                                        .frame(width: 125, height: 250)
                                        .cornerRadius(20)
                                        .shadow(radius: 20)
                                    Text(
                                 """
                                 So, follow these two rules for healthy feet and happy knees:
                                 
                                 1. Always follow the three points of contact rule, where you have the heel, and the balls behind your pinky and big toe on the ground.
                                 
                                 2. Don't cramp your feet. It is much better to have shoes a size too big than a size too small. Let your feet have space to grip the floor.
                                 """
                                    )
                                    .font(.system(size: 20, weight: .semibold, design: .default))
                                    .padding()
                                }
                                
                                
                            }
                        }.padding(.horizontal)
                    }
                }.edgesIgnoringSafeArea(.all)
            }
        }
    }
        
    
    
    
    
    
    
    
    
    func button(data: SliderData) -> some View {
        let aw = (data.side == .left ? 1 : -1) * Config.arrowWidth / 2
        let ah = Config.arrowHeight / 2
        return ZStack {
            circle(radius: Config.buttonRadius).stroke().opacity(0.2)
            polyline(-aw, -ah, aw, 0, -aw, ah).stroke(Color.white, lineWidth: 2)
        }
        .offset(data.buttonOffset)
        .opacity(data.buttonOpacity)
    }
    
    func wave(data: Binding<SliderData>) -> some View {
        let gesture = DragGesture().onChanged {
            self.topSlider = data.wrappedValue.side
            data.wrappedValue = data.wrappedValue.drag(value: $0)
        }
            .onEnded {
                if data.wrappedValue.isCancelled(value: $0) {
                    withAnimation(.spring(dampingFraction: 0.5)) {
                        data.wrappedValue = data.wrappedValue.initial()
                    }
                } else {
                    self.swipe(data: data)
                }
            }
            .simultaneously(with: TapGesture().onEnded {
                self.topSlider = data.wrappedValue.side
                self.swipe(data: data)
            })
        return WaveView(data: data.wrappedValue).gesture(gesture)
            .foregroundColor(Config.colors[index(of: data.wrappedValue)])
    }
    
    private func swipe(data: Binding<SliderData>) {
        withAnimation() {
            data.wrappedValue = data.wrappedValue.final()
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            self.pageIndex = self.index(of: data.wrappedValue)
            self.leftData = self.leftData.initial()
            self.rightData = self.rightData.initial()
            
            self.sliderOffset = 100
            withAnimation(.spring(dampingFraction: 0.5)) {
                self.sliderOffset = 0
            }
        }
    }
    
    private func index(of data: SliderData) -> Int {
        let last = Config.colors.count - 1
        if data.side == .left {
            return pageIndex == 0 ? last : pageIndex - 1
        } else {
            return pageIndex == last ? 0 : pageIndex + 1
        }
    }
    
    private func circle(radius: Double) -> Path {
        return Path { path in
            path.addEllipse(in: CGRect(x: -radius, y: -radius, width: radius * 2, height: radius * 2))
        }
    }
    
    private func polyline(_ values: Double...) -> Path {
        return Path { path in
            path.move(to: CGPoint(x: values[0], y: values[1]))
            for i in stride(from: 2, to: values.count, by: 2) {
                path.addLine(to: CGPoint(x: values[i], y: values[i + 1]))
            }
        }
    }
    
}

