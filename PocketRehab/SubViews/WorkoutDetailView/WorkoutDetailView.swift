//
//  WorkoutDetailView.swift
//  PocketRehab
//
//  Created by Amin  Bagheri  on 2022-07-26.
//

import SwiftUI
import AVKit

struct WorkoutDetailView: View {
    
    @ObservedObject var exercise: WorkoutDetailViewModel.WorkoutDetail
    @State var instructions: String = ""
    var body: some View {
        
        ZStack {
            ScrollView(showsIndicators: false) {
                VStack {
                    Text(exercise.workoutTitle)
                        .font(.largeTitle)
                        .bold()
                    LoopingPlayer(videoUrl: exercise.videoUrl)
                        .cornerRadius(20)
                        .frame(width: UIScreen.main.bounds.width, height: 270)
                    ZStack {
                        
                        Text(
                            """
    Recommended Repetitions: \(exercise.recommendedReps)
"""
                        )
                        .multilineTextAlignment(.center)
                        .font(.headline)
                        .frame(width: UIScreen.main.bounds.width * 0.85, height: 60)
                        .padding()
                        
                        .foregroundColor(.white)
                        .background(.gray)
                        .cornerRadius(20)
                        .shadow(color: .gray.opacity(0.4), radius: 20, x: 0, y: 0   )
                        .padding(.bottom)
                    }
                    HStack {
                        Text("Instructions")
                            .font(.system(size: 25))
                            .fontWeight(.semibold)
                            .bold()
                            .padding(.leading, 20)
                        Spacer()
                        Rectangle()
                            .frame(width: 0, height: 0, alignment: .center)
                    }
                    HStack {
                        Text(instructions)
                            .padding(.leading, 20)
                            .frame(width: UIScreen.main.bounds.width * 1)
                            .foregroundColor(.gray)
                            .padding(.bottom)
                        Spacer()
                        Rectangle()
                            .frame(width: 0, height: 0, alignment: .center)
                    }
                    Spacer()
                }
            }.onAppear {
                if exercise.videoUrl == Bundle.main.url(forResource: "catCow", withExtension: "mp4")! {
                    instructions = """
1. Begin on your hands and knees in table pose, with a neutral spine. As you exhale, come into cat pose while rounding your spine outward, tucking in your tailbone, and drawing your pubic bone forward.

2. Release your head toward the floor — just don’t force your chin to your chest. Most importantly, just relax.

3. As you inhale and move into cow pose, lift your sit bones upward, press your chest forward and allow your belly to sink.

4. Lift your head, relax your shoulders away from your ears, and gaze straight ahead.
"""
                } else if exercise.videoUrl == Bundle.main.url(forResource: "cossackSquat", withExtension: "mp4")! {
                    instructions = """
1. Setup by standing with your feet spread wide and your toes pointing out slightly.

2. Shift your body weight onto one leg by bending at the knee, keeping your body as upright as you can.

3. Continue moving into the stretched position until your groin and hamstring flexibility limit you or you start to lose posture in the back.

4. Then, reverse the motion and return to the starting position with your body weight balanced on both legs.

5. Now, repeat steps 2 - 4, but on the other leg.
"""
                } else if exercise.videoUrl == Bundle.main.url(forResource: "pikeToCobra", withExtension: "mp4")! {
                    instructions = """
1.Start in a pike position, with your hands shoulder-width apart, your glutes in the air with your body in a V shape, and your feet hip-width apart.

2. Bend your elbows and lower your chest until it’s just above the floor, going into the bottom position of a pushup.

3. Straighten your arms, lift your torso and go into an upward cobra.

4. Lower your torso, lift your hips and return to the pike position.

5. Repeat until the set is complete.
"""
                } else if exercise.videoUrl == Bundle.main.url(forResource: "standingLatStretch", withExtension: "mp4")! {
                    instructions = """
1. Stand with your left arm at your head, and your right arm at your side.
 
2. Then, holding this position, lean to your right, feeling the stretch down the other side of your torso.

3. Pause for a second and then reverse the motion, now with your right arm at your head, and bending towards your left side.
"""
                } else if exercise.videoUrl == Bundle.main.url(forResource: "worldsGreatestStretch", withExtension: "mp4")! {
                    instructions = """
1. Step forward with your left leg, and lower your body into a lunge. As you go down, place your right hand on the floor so it’s even with your left foot. Your right knee should remain above the floor—not touching.
 
2. Now move your arm across your body and behind your right arm. Square your hips so you feel a stretch on both sides, and try to keep your back as flat as possible.

3. Move your left hand outside your left foot, and twist to reach for the sky.

4. Repeat the motion on the other side, after the recommended amount of repetitions for that side.
"""
                } else if exercise.videoUrl == Bundle.main.url(forResource: "bandedShoulderStretch", withExtension: "mp4")! {
                    instructions = """
1. Grab a band if available. If not, you can use a towel, a t-shirt, a scarf or even a long PVC pipe.
 
2. Start by grabbing the band (or other object) as wide as possible. This is to allow you to gauge how much flexibility you have, and to prevent injury. If no stretch is felt, make your grip more narrow and vice versa.

3. Bring the band over your head, and keep a comfortable tension in the chest and shoulders. It should not be painful. If it is, widen your grip.

4. Then bring the band down towards your lower back, and then return to the starting position.
"""
                } else if exercise.videoUrl == Bundle.main.url(forResource: "birdDog", withExtension: "mp4")! {
                    instructions = """
1. Start on your hands and knees with the hands under the shoulders and the knees under the hips.

2. Extend one leg and the opposite arm at the same time. The leg shouldnt go 'up' per say, but rather it should 'come out'.

3. Pause for 3 to 5 seconds, return to the starting position, and switch sides.

4. Continue alternating sides until set is complete.
"""
                } else if exercise.videoUrl == Bundle.main.url(forResource: "burpee", withExtension: "mp4")! {
                    instructions = """
1. Stand straight with your feet shoulder-width apart.

2. Squat and place your hands in front of your feet.

3. 'Jump back' your legs until they are fully extended and your body is in plank position.

4. Do a push up, jump back to the sqat position and jump up, with your arms over your head.

5. Repeat until the set is complete.
"""
                } else if exercise.videoUrl == Bundle.main.url(forResource: "calfStretch", withExtension: "mp4")! {
                    instructions = """
1. Find a platform that is about knee-height. A bench, bed or chair work well.

2. Place one foot on the floor, and one foot on the platform.

3. Straighten out the foot that is on the platform and reach forward. Try to grab your toes and pull slightly to create a good stretch.

4. Hold for 5 seconds, and repeat.
"""
                } else if exercise.videoUrl == Bundle.main.url(forResource: "childsPose", withExtension: "mp4")! {
                    instructions = """
1. Get down on your hands and knees.

2. Sit on your heels, separate the knees, lay your torso down and stretch your arms in front of you.

3. Rest your forehead on the mat and relax for 20 seconds.

4. Go back to the starting position and repeat.
"""
                } else if exercise.videoUrl == Bundle.main.url(forResource: "headRotations", withExtension: "mp4")! {
                    instructions = """
1. Begin with your head straight and looking forward.

2. Gently tilt your head to the right and start rolling it back. Maintain your shoulders relaxed and keep the movements big, slow and fluid. Breathe deeply and stretch the neck gently without letting it fall too far backward.

3. Keep rolling your head to the left and then down. If your neck is too weak or if you feel any discomfort you can start with a semicircular movement.

4. Bring your head up to the starting position and repeat in the opposite direction.
"""
                } else if exercise.videoUrl == Bundle.main.url(forResource: "hingeToSquat", withExtension: "mp4")! {
                    instructions = """
1. Stand up tall with your feet shoulder-width apart and place your hands behind the head.

2. Start bending at the hips, push your hips back and bend over to near parallel. Keep your knees as straight as possible, though a tiny bend is alright.

3. Try to keep your back as straight as possible, and stop whenever you feel a stretch in the hamstrings. Hold this for a second.

4. From this position, bend your knees and sit your butt down into a squat.

5. Push up back into the starting position. Repeat.
"""
                } else if exercise.videoUrl == Bundle.main.url(forResource: "kneelingHipFlexorStretch", withExtension: "mp4")! {
                    instructions = """
1. Kneel on your right leg and bend your left leg in front of you at a 90-degree angle.

2. Shift your weight forward until you feel a stretch in your hip. If yout don't feel a stretch, try and straighten your back leg even more.

3. Switch legs and repeat the stretch.
"""
                } else if exercise.videoUrl == Bundle.main.url(forResource: "legBridge", withExtension: "mp4")! {
                    instructions = """
1. Lie on your back with your arms by your sides, knees bent, and feet flat on the floor.

2. Keeping the upper body and neck relaxed and on the floor, raise one leg and lift your hips as high as you can.

3. At the top position, squeeze your glutes as hard as possible, as if they owe you money.

3. Lower your hips, repeat for the recommended reps, and repeat.
"""
                } else if exercise.videoUrl == Bundle.main.url(forResource: "supermanRow", withExtension: "mp4")! {
                    instructions = """
1. Lie on your belly, with your arms and legs fully extended.

2. Lift both arms and legs off the floor, and hold for a count of 1. Then, while arms and legs are still elevated, bring your elbows as close to your low back as possible.

3. Return to the starting position and repeat.
"""
                } else if exercise.videoUrl == Bundle.main.url(forResource: "thoracicBridge", withExtension: "mp4")! {
                    instructions = """
1. Sit on the floor with your feet infront of you, ad your hands under your shoulders. Make sure your glutes are not touching the floor.

2. Lift your glutes and hips up as high as physically possible, while lifting one of your arms up and behind you.

3. Return to the starting position and repeat, now lifting another one of your arms.
"""
                } else if exercise.videoUrl == Bundle.main.url(forResource: "toeTouch", withExtension: "mp4")! {
                    instructions = """
1. Stand with your feet shoulder width apart and your hands over your head.

2. While keeping your legs as straight as possible, bend over and try and reach for your toes. It's ok if you can't reach them, just hold where you feel the stretch for a couple of seconds.

3. Return to the starting position and repeat.
"""
                } else if exercise.videoUrl == Bundle.main.url(forResource: "backFoamRolling", withExtension: "mp4")! {
                    instructions = """
1. Begin by lying on your back with the foam roller positioned underneath your upper back.

2. Brace your core and lift yourself up into a shallow bridge position.

3. Slowly start to roll up and down between your lower neck and mid-back, stopping at tight areas along the way. Don't roll the neck or the lowerback, or you may get injured.

4. Repeat for the recommended reps.
"""
                } else if exercise.videoUrl == Bundle.main.url(forResource: "bandPullApart", withExtension: "mp4")! {
                    instructions = """
1. Stand up straight and hold an exercise band out in front of you at around chest height. Your hands should be shoulder width apart.

2. Then pull the band apart, squeezing your shoulder blades together.

3. Return to the starting position.
"""
                } else if exercise.videoUrl == Bundle.main.url(forResource: "calfRolling", withExtension: "mp4")! {
                    instructions = """
1. Sit on the ground with your legs extended in front of you and your hands on the ground behind you.

2. Rest one calf muscle on top of the foam roller.

3. Raise your hips so that your weight is resting on your hands and the foam roller.

4. Then, slowly begin to roll forward and backward so that your calf rolls up and down the roller.
"""
                } else if exercise.videoUrl == Bundle.main.url(forResource: "hipAbductions", withExtension: "mp4")! {
                    instructions = """
1. Stand with your legs shoulder width apart. You can have a table or chair next to you for stability.

2. Brace your core, keep your knee straight with your toes pointed and kick your leg out to the side of your body slowly.

3. Make sure you keep your upper body and back straight during the exercise

4. Return to starting position.
"""
                } else if exercise.videoUrl == Bundle.main.url(forResource: "kneelingLatStretch", withExtension: "mp4")! {
                    instructions = """
1. Start off in a kneeling position on the ground or on a mat.

2. Take one arm and reach out forward while turning your palm to make it face the ceiling.

3. Push down towards the floor with your chest until you feel a stretch.

4. Hold onto this position for about 10 seconds and then repeat on the opposite arm. This completes one repetition for both sides.
"""
                } else if exercise.videoUrl == Bundle.main.url(forResource: "rotatorCuff", withExtension: "mp4")! {
                    instructions = """
1. Stand next to an adjustable cable machine with your feet shoulder-width apart.

2. With a handle attachment positioned at chest height, grab the handle with the hand farthest from the machine, keeping your elbow tight to your side.

3. Rotate your shoulder to bring the handle across your body, keeping your elbow stable and tight to your side.

4. When your forearm is straight out at a 90 to 110 degree angle from your stomach, pause and then reverse to return to the starting position.
"""
                } else if exercise.videoUrl == Bundle.main.url(forResource: "scapulaPullup", withExtension: "mp4")! {
                    instructions = """
1. Start by hanging from a pull-up bar with an overhand (pronated) grip.

2. With your arms fully extended in the hanging position, pull against bar while keeping your elbows completely straight.

3. Wrap your thumbs over the bar as opposed to gripping it like a baseball bat.

4. You should feel your entire shoulder girdle shift down a few inches as the rest of your body moves upward. Hold the position for a moment, then relax your shoulders and allow them to raise up again.

5. The range of motion is minimal, and this does require practice to get it right. You will notice that your body moves a few inches backward in the contracted position, placing your arms slightly in front of your body. This puts your arms into the scapular plane, where the lats are stretched and shoulders out of impingement danger.
"""
                } else if exercise.videoUrl == Bundle.main.url(forResource: "singleLegDeadlift", withExtension: "mp4")! {
                    instructions = """
1. Stand with your feet shoulder-width apart and knees slightly bent and raise one leg off the floor. Activate your glutes.
2. Without changing the bend in your knee, keep your back naturally arched, bend (hinge) at your hips, and lower your torso until it’s almost parallel to the floor.

3. Briefly pause at the bottom, then squeeze you glutes, thrust your hips forward, and raise your torso back to the starting position.
4. Repeat until you complete the prescribed number of repetitions
"""
                } else if exercise.videoUrl == Bundle.main.url(forResource: "supineDrawIn", withExtension: "mp4")! {
                    instructions = """
1. Stand with your feet shoulder width apart. Place the fingers of one of your hands on your waistline, just inside the bony protrusions of your hips.

2. Take a deep breath and slowly exhale all the air from your lungs. At the end of your breath out, brace your stomach as if you were about to get punched.

3. Then, further activate your deep core muscles by drawing your belly button inward as if vou were trying to touch it to your spine.

4. Hold this position for a few moments, then release the contraction and take a breath in.
"""
                } else if exercise.videoUrl == Bundle.main.url(forResource: "wristCircles", withExtension: "mp4")! {
                    instructions = """
1. Stand with feet shoulder width apart keeping your back straight and face forward.

2. Bend your elbows and bring your forearms infront of your body.

3. Rotate your wrists slowly counter clock wise and then clock wise. Keep your breathing normal.
"""
                } else if exercise.videoUrl == Bundle.main.url(forResource: "chinTucks", withExtension: "mp4")! {
                    instructions = """
1. Sit upright and look straight ahead with the ears directly over the shoulders.

2. Place a finger on the chin.

3. Without moving the finger, pull the chin and head straight back until a good stretch is felt at the base of the head and top of the neck. The head shouldnt move up or down. Only straight back and forward.

4. Hold for 5 seconds if possible.
"""
                } else if exercise.videoUrl == Bundle.main.url(forResource: "facepull", withExtension: "mp4")! {
                    instructions = """

1. Reach up and grasp the ends of the band (or the handles of a rope cable machine extension) with both hands with your palms facing in. Step back until your arms are fully extended, then engage your core and lean back slightly, positioning your body at a roughly 20-degree angle.

2. Pull the rope or band toward you slightly, then engage your shoulders, rolling them back to create good posture — you don't want your shoulders hunching or rolling forward. This is your starting position.

3. Pull the band or handles of the attachment straight toward your forehead. Keep your palms facing in as your elbows flare outward toward the sides, engaging the rear delts.

4. Reverse the movement and slowly extend your arms without allowing your shoulders or chest to roll forward as you extend. You want to maintain good posture throughout the exercise.
"""
                } else if exercise.videoUrl == Bundle.main.url(forResource: "legRaises", withExtension: "mp4")! {
                    instructions = """
1. Lie on your back, legs straight and together.

2. Keep your legs straight and lift them all the way up to the ceiling until your butt comes off the floor.

3. Slowly lower your legs back down till they're just above the floor. Hold for a moment.

4. Raise your legs back up. Repeat.
"""
                } else if exercise.videoUrl == Bundle.main.url(forResource: "cablePullThrough", withExtension: "mp4")! {
                    instructions = """
1. Grab the rope attachment in between your legs and face away from the cable machine. Walk forward to remove the slack.

2. Bend your knees and stick out your glutes, keeping a straight line from your shoulders to hips. Tighten your abs.

3. Drive your hips up and forward, straightening your legs. Pause and squeeze your glutes tightly, then return to the starting position.

4. Drive your hips up and forward, straightening your legs. Pause and squeeze your glutes tightly, then return to the starting position.
"""
                } else if exercise.videoUrl == Bundle.main.url(forResource: "farmersWalks", withExtension: "mp4")! {
                    instructions = """
1. Grab two dumbells that are relatively heavy.

2. With shoulders back and down, walk around for the time specified, making sure to grip the dumbbells the entire time.
"""
                } else if exercise.videoUrl == Bundle.main.url(forResource: "wristFlexorStretch", withExtension: "mp4")! {
                    instructions = """
1. Stick your arm out with your palm facing the ceiling.

2. Then, with your other arm, grab your fingers and pull them back. Make sure to keep them straight.
"""
                } else if exercise.videoUrl == Bundle.main.url(forResource: "wristExtensorStretch", withExtension: "mp4")! {
                    instructions = """
1. Stick your arm out with your palm facing the floor.

2. Then, with your other arm, grab your fingers and pull them back. Make sure to keep them straight.

3. If you need a greater stretch, turn your palm into a fist, and pull the fist towards you.
"""
                } else if exercise.videoUrl == Bundle.main.url(forResource: "wristCurl", withExtension: "mp4")! {
                    instructions = """
1. Put on end of a band under your feet and grab the other end with your palm facing up. (You could use a dumbbell or even a water bottle instead.)

2. Then, curl the band / dumbbell as if you were flexing your forearm.
"""
                } else if exercise.videoUrl == Bundle.main.url(forResource: "reverseWristCurl", withExtension: "mp4")! {
                    instructions = """
1. Put on end of a band under your feet and grab the other end with your palm facing down. (You could use a dumbbell or even a water bottle instead.)

2. Then, curl the band / dumbbell as if you were revving a motercycle.
"""
                } else if exercise.videoUrl == Bundle.main.url(forResource: "wristPronationSupination", withExtension: "mov")! {
                    instructions = """
1. Grab any item that is more heavy on one end than the other. A hammer is perfect, but a broomstick, pvc pipe or even a dumbbell work well.

2. Then grab the side that does not have the weight on it.

3. Starting with your thumb facing the ceiling, rotate all the way to your left, then all they way to your right. This completes one rep.
"""
                } else if exercise.videoUrl == Bundle.main.url(forResource: "radialUlnarDeviation", withExtension: "mov")! {
                    instructions = """
1. Stick your arm out with your thumb facing the ceiling.

2. Without bringing your arm close to you or bending your elbow, try to rotate your hand as close to you as possible, then rotate your hand down.
"""
                } else if exercise.videoUrl == Bundle.main.url(forResource: "neckIsometrics", withExtension: "mov")! {
                    instructions = """
1. The first isometric to do is done by placing your hand on your forehead and applying pressure "to push your head back". HOWEVER, since this is an isometric hold, you should not allow your head to move back at all. Resist the pressure and keep your head in place.

2. The second and third isometrics to do are done by placing your hand on the side of your head and applying pressure "to push your head". Then, do the same thing but on the other side of your head. Again, resist the pressure by keeping your head in place.

3. The fourth isometric to do is done by placing your hands behind your head and applying pressure "to push your head forward". Again, resist the pressure by keeping your head in place.
"""
                } else if exercise.videoUrl == Bundle.main.url(forResource: "neckSideToSide", withExtension: "mp4")! {
                    instructions = """
1. Turn your head to your right as if trying to look over your shoulder. Then, return to the starting position and turn your head to the left.
"""
                } else if exercise.videoUrl == Bundle.main.url(forResource: "neckUpDownLeftRight", withExtension: "mp4")! {
                    instructions = """
1. Look up as if trying to look at the sky.

2. Then, look down as if trying to look at your shirt.

3. Then, tilt your head to the left as if you were trying to touch your shoulder. (Don't move your shoulder)

3. Then, tilt your head to the right as if you were trying to touch your shoulder.
"""
                } else if exercise.videoUrl == Bundle.main.url(forResource: "soleusStretch", withExtension: "mp4")! {
                    instructions = """
1. Stand facing a wall from 3 feet away. Take one step toward the wall with your right foot.

2. Place both palms on the wall. Bend both knees and lean forward. Keep both heels on the floor.

3. Hold for 10 to 20 seconds. Then relax both legs. Repeat the exercise 3 times.

4. Switch legs and repeat.
"""
                } else if exercise.videoUrl == Bundle.main.url(forResource: "ankleDorsiflexion", withExtension: "mp4")! {
                    instructions = """
1. With a band fastened around the top of the foot, bend the ankle back towards the body as far as possible.

2. Return, and repeat.
"""
                } else if exercise.videoUrl == Bundle.main.url(forResource: "anklePlantarflexion", withExtension: "mp4")! {
                    instructions = """
1. With a band around the bottom of the foot, push your toes away from body, straightening the ankle out as far as possible.

2. Return, and repeat.
"""
                } else if exercise.videoUrl == Bundle.main.url(forResource: "ankleInversion", withExtension: "mp4")! {
                    instructions = """
1. With band placed across the top of the foot, bring foot in towards the body as far as possible.

2. Turn, and repeat.
"""
                } else if exercise.videoUrl == Bundle.main.url(forResource: "ankleEversion", withExtension: "mp4")! {
                    instructions = """
1. With a band attached to the top of your foot, rotate the foot as far as possible to the outside.

2. Turn, and repeat.
"""
                } else if exercise.videoUrl == Bundle.main.url(forResource: "ankleBalance", withExtension: "mp4")! {
                    instructions = """
1. Place a pillow on the floor.

2. Standard directly in center, maintaining your trunk in an upright position.

3. Lift one foot off the ground.

4. Keep your pelvis level and maintain balance on the single foot.
"""
                } else if exercise.videoUrl == Bundle.main.url(forResource: "bandPushup", withExtension: "mp4")! {
                    instructions = """
1. Wrap the band around your back just under the armpits. While holding the end, loop the band an extra time around each hand if needed to tighten it.

2. Kneel down placing the handles against the floor then extend your legs long until you are in a plank position.

3. Slowly lower your chest to the floor keeping the back straight. Press back up until your arms are fully locked out. Repeat.
"""
                } else if exercise.videoUrl == Bundle.main.url(forResource: "dumbbellRaise", withExtension: "mp4")! {
                    instructions = """
1. Grab a dumbbell in each hand.

2. With your arms fully straight, bring one of them up until paralell with the floor. Make sure your arms are out by about 30 degrees.

3. Repeat with the other arm.
"""
                } else if exercise.videoUrl == Bundle.main.url(forResource: "kettlebellPush", withExtension: "mp4")! {
                    instructions = """
1. Obtain a light kettlebell and position it onto your shoulder in a bottoms-up position

2. The bell will be facing up and the handle will be down

3. Ensure that you grip the kettlebell tightly, and keep your elbow close to your body as the bottom up position will immediately create an unstable weight

4. Brace your core, squeeze your glutes, and focus on keeping the kettlebell absolutely still before beginning the exercise

5. Begin pressing the kettlebell directly overhead until your elbow is locked out

6. Slowly lower the weight and perform for the desired amount of repetitions
"""
                } else if exercise.videoUrl == Bundle.main.url(forResource: "singleDumbbellRow", withExtension: "mp4")! {
                    instructions = """
1. For a single-arm dumbbell row, you’ll need something to lean on, like a chair, box, or just the side of a coach.

2. Start by placing a dumbbell on the side of your platform, and kneel your left leg and right hand on the bench, so that your upper body is parallel to the ground.

3. Reach down and pick up the dumbbell with your right hand. Keep the grip neutral, so that your palm is facing your body, and keep your arm outstretched.

4. Slowly, and with control, bring the dumbbell up towards your chest, hinging at the elbow. The movement should come from your back and shoulder muscles, not from your arm.

5. Pause at the top of the movement, before lowering the dumbbell back to your starting position.

6. Do all your reps on one arm before you switch to the other side.
"""
                } else if exercise.videoUrl == Bundle.main.url(forResource: "bulgarianSplitSquat", withExtension: "mp4")! {
                    instructions = """
1. Stand 2 to 3 feet in front of a knee-high platform. Extend your right leg behind you and rest your toes on the bench. Toes can be flat or tucked, according to personal preference. Square your hips and shoulders.

2. Keeping your torso upright, slowly lower your right knee toward the floor. Your front knee will form approximately a 90-degree angle (keep your knees DIRECTLY inline with your toes. Don't allow them to cave inwards).

3. Maintain evenly distributed weight in your whole foot. Don’t shift forward on the toes or exaggerate pushing through the heel.

4. Squeeze your rear glute at the top of the movement.

5. Reverse the move and return to the starting position.
"""
                } else if exercise.videoUrl == Bundle.main.url(forResource: "stepup", withExtension: "mp4")! {
                    instructions = """

1. Start with your right foot on a bench or box, with your left foot straight behind you.

2. Steup and bring the left foot to meet your right foot on top of the step. (Make sure to keep your right knee - or whatever knee is on the bench - completely INLINE with your toes. Don't allow them to cave inwards)

3. Bend your right knee and step back down with the left foot.

4. Bring the right foot down to meet the left foot on the ground.

5. Start again, but with your left food on a bench or box.
"""
                } else if exercise.videoUrl == Bundle.main.url(forResource: "hamstringCurl", withExtension: "mp4")! {
                    instructions = """

1. Lie face down on the lying leg curls machine, stretching your legs out fully. The roller pad should rest just above the heels, a few inches over your calves.

2. Grasp the support handles on each side of the machine.

3. Exhale and flex your knees, pulling your ankles as close to your buttocks as possible. Keep your hips firmly on the bench.

4. Hold briefly.

5. Inhale as you return your feet to the starting position in a slow and controlled movement.
"""
                } else if exercise.videoUrl == Bundle.main.url(forResource: "wallSit", withExtension: "mp4")! {
                    instructions = """


1. Start with your back against a wall with your feet shoulder width and about 2 feet from the wall.

2. Engage your abdominal muscles and slowly slide your back down the wall until your thighs are parallel to the ground.

3. Adjust your feet so your knees are directly above your ankles (rather than over your toes).

4. Keep your back flat against the wall.

5. Hold the position for 20 to 60 seconds.

6. Slide slowly back up the wall to a standing position.

7. Rest for 30 seconds and repeat the exercise as needed. Increase your hold time in five-second increments as you increase your strength.

8. If 45 seconds achieved, increase difficulty by lifting one foot off the floor.
"""
                } else if exercise.videoUrl == Bundle.main.url(forResource: "calfRaise", withExtension: "mp4")! {
                    instructions = """


1. Hold a dumbbell in each hand and stand with your feet about shoulder-width apart.

2. Let your arms hang straight below your shoulders.

3. Rise up onto your toes, then slowly return to the starting position.

4. You'll feel tension in the muscles in the back of your lower legs
"""
                }
            }
        }
    }
}

struct WorkoutDetailView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutDetailView(exercise: .init(videoUrl: Bundle.main.url(forResource: "catCow", withExtension: "mp4")!, workoutTitle: "Cat and Cows", recommendedReps: "15"))
    }
}
