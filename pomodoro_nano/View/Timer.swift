//
//  Home.swift
//  pomodoro_nano
//
//  Created by Gerald Bryan on 25/07/22.
//

import SwiftUI
import AVKit
import AVFoundation
import Foundation

struct TimerView: View {
    
    let url = URL(string: "https://drive.google.com/uc?export=open&id=1nRI_PY8BS7diOzPN7GrWADkC-mK9bKAl")
 // "https://www.youtube.com/embed/b3qGFuCo6NI"
    @State var audioPlayer: AVPlayer!
    
    @State var counter: Int = 0
    var countTo: Int = 25*6*10
    @State var pause = false
    @State var mute = false
    
    @State var timer = Timer
        .publish(every: 1, on: .main, in: .common)
        .autoconnect()
    
    func counterToMinutes() -> String {
            let currentTime = countTo - counter
            let seconds = currentTime % 60
            let minutes = Int(currentTime / 60)
            
            return "\(minutes):\(seconds < 10 ? "0" : "")\(seconds)"
        }
    
    var body: some View {
        
        VStack{
            GeometryReader{proxy in
                VStack( spacing: 15){
                    // Timer Ring
                    ZStack{
                        Circle()
                            .stroke(Color("orange_inner").opacity(0.9), lineWidth:50
                            )
                        
                        Circle()
                            .trim(from: 0, to: progress())
                            .stroke(Color("Orange"),
                                    style: StrokeStyle(lineWidth: 40,
                                                       lineCap: .round
                                                      )
                            )
                            .rotationEffect(.init(degrees: -90))
                        VStack{
                            Text(counterToMinutes())
                                .font(Font.system(size:40, design: .rounded).bold())
                                .padding(5)
                            
                            Text("2 of 4 Sections")
                                .foregroundColor(.black.opacity(0.5))
                        }
                        .frame(alignment: .center)
                    }
                    .padding(50)
                    .frame(height: proxy.size.width)
                    .onReceive(timer) { time in
                         if (self.counter < self.countTo) { counter = counter + 1 }
                        }
                    
                    Text("Let’s stay focus and focus  on your work for this 25 minutes ")
                        .multilineTextAlignment(.center)
                    
                        .padding(10)
                    
                    HStack{
                        if pause == false {
                            Button(action: {
                                self.timer.upstream.connect().cancel()
                                self.pause = true
                                self.audioPlayer.pause()
                            }) {
                                Image(systemName: "pause.circle.fill")
                                    .foregroundColor(Color("Orange"))
                                    .font(Font.system(size:50).bold())
                            }
                            } else {
                                Button(action: {
                                    self.timer = Timer.publish (every: 1, on: .current, in:
                                            .common).autoconnect()
                                    self.pause = false
                                    self.audioPlayer.play()
                                }) {
                                    Image(systemName: "play.circle.fill")
                                        .foregroundColor(Color("Orange"))
                                        .font(Font.system(size:50).bold())
                                }
                            }
                        
                        if mute == false{
                            Button(action: {
                                self.mute = true
                                audioPlayer.volume = 0
                            }) {
                                Image(systemName: "speaker.slash.circle.fill")
                                    .foregroundColor(Color("Orange"))
                                    .font(Font.system(size:50).bold())
                            }

                        } else {
                            Button(action: {
                                audioPlayer.volume = 1
                                self.mute = false
                            }) {
                                Image(systemName: "speaker.circle.fill")
                                    .foregroundColor(Color("Orange"))
                                    .font(Font.system(size:50).bold())
                            }
                        }
                    }
                    .frame(alignment: .center)
                    
                    Image("task")
                        .resizable()
                        .scaledToFill()
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            }
        }
        .padding()
        .navigationBarTitle("Pomodoro Timer", displayMode: .inline)
        .onAppear(){
            play(url: url!)
//            let sound = Bundle.main.path(forResource: "tokecang_song", ofType: "mp3")
//                        self.audioPlayer = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
//            self.audioPlayer = try! AVPlayer(playerItem: AVPlayerItem(url: URL(self.url)))
//            self.audioPlayer.play()
        }
    }
    
    func progress() -> CGFloat {
            return (1 - (CGFloat(counter) / CGFloat(countTo)))
        }
    
    func play(url:URL) {
        print("playing \(url)")

        do {

            let playerItem = AVPlayerItem(url: url)

            self.audioPlayer = try AVPlayer(playerItem:playerItem)
            audioPlayer!.volume = 1.0
            audioPlayer!.play()
        } catch let error as NSError {
            self.audioPlayer = nil
            print(error.localizedDescription)
        } catch {
            print("AVAudioPlayer init failed")
        }
    }
}

struct Timer_Previews: PreviewProvider {
    static var previews: some View {
        TimerView()
    }
}



extension String {
   var embed: String {
       var strings = self.components(separatedBy: "/")
       let videoId = strings.last ?? ""
       strings.removeLast()
       let embedURL = strings.joined(separator: "/") + "embed/\(videoId)"
       return embedURL
   }
}


