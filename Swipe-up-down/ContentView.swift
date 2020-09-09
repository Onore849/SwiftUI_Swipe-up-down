//
//  ContentView.swift
//  Swipe-up-down
//
//  Created by 野澤拓己 on 2020/09/09.
//  Copyright © 2020 Takumi Nozawa. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    // increase size until ur satisfication
    
    @State var size: CGFloat = UIScreen.main.bounds.height - 100
    
    var body: some View {
        
        ZStack {
            
            Color.orange
            
            swipe().cornerRadius(20).padding(15).offset(y: size)
            .gesture(DragGesture()
                .onChanged({ (value) in
                
                if value.translation.height > 0 {
                    
                    self.size = value.translation.height
                    
                }
                else {
                    
                    let temp = UIScreen.main.bounds.height - 130
                    self.size = temp + value.translation.height
                    
                    // in up wards value will be negative so we substracting the value one by from  bottom
                    
                }
            })
                .onEnded({ (value) in
                    
                    if value.translation.height > 0 {
                        
                        if value.translation.height > 200 {
                            
                            self.size = UIScreen.main.bounds.height - 130
                            
                        }
                        else {
                            
                            self.size = 15
                            
                        }
                    }
                    else {
                        
                        // since in negative lower value will be greater......
                        
                        if value.translation.height > -200 {
                            
                            self.size = UIScreen.main.bounds.height - 130
                            
                        }
                        else {
                            
                            self.size = UIScreen.main.bounds.height - 130
                            
                        }
                        
                    }
                    
                })).animation(.spring())
            
            // animation for drag
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct swipe: View {
    
    var body: some View {
        
        VStack {
            
            // for pushing view up / down
            VStack {
                
                // top + bottom 30 so aprox height - 100
                Text("Swipe up to See More").fontWeight(.heavy).padding([.top, .bottom], 15)
                
            }
            
            // your custom view
            HStack {
                
                Spacer()
                Text("hello top").fontWeight(.heavy).padding()
                
            }
            
            Spacer()
            Text("hello bottom").fontWeight(.heavy).padding()
            
            
        }.background(Color.white)
    }
}

// you can customize the view of bottom swipe
