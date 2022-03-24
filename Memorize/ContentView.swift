//
//  ContentView.swift
//  Memorize
//
//  Created by Oleksandr Oliinyk on 18.03.2022.
//

import SwiftUI

struct ContentView: View {
    @State var emojis = ["✈️", "🚀", "🚄", "🚗", "🚚", "🚌", "🚃", "🚂", "🚢", "🚑", "🚡", "🚓", "⛵️", "🚊", "🚁", "🚒", "🛺", "🚟", "🚔", "🛞", "🚜", "🚦", "🏋️", "🏎"]
    @State var emojiCount = 4
    
    @State var randomNumberEmojis = 4
    
    var body: some View {
            VStack {
                Text("Memorize!")
                    .font(.largeTitle)
                ScrollView {
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 75))]) {
                        ForEach(emojis[0..<emojiCount], id: \.self) { emoji in
                            
                            CardView(content: emoji)
                                .aspectRatio(2/3, contentMode: .fit)
                        }
                    }
                }
                .foregroundColor(.red)
                Spacer()
    //            HStack {
    //                remove
    //                Spacer()
    //                add
    //            }
//                .font(.largeTitle)
//                .padding(.horizontal)
                
                HStack(alignment: .bottom) {
                    vehicles
                    Spacer()
                    bugs //add theme buttons here
                    Spacer()
                    faces
                }
                .font(.largeTitle)
                .padding(.horizontal)
            }
            .padding(.horizontal)
    }
    
    
    var vehicles: some View {
        Button {
            emojis = ["🚗", "⛵️", "🚜", "🚲", "🚕", "🚌", "🚁", "🛶", "🛸", "🚒", "🚖", "🛴"]
                .shuffled()
            randomNumberEmojis = Int.random(in: 4..<emojis.count)
        } label: {
            VStack {
                Image(systemName: "car")
                Text("Vehicles")
                    .font(.footnote)
            }
        }
        .padding(.horizontal)
    }
    
    var bugs: some View {
        Button {
            emojis = ["🐝", "🐛", "🦋", "🐞", "🐜", "🦟", "🦗", "🕷", "🦂", "🐌"]
                .shuffled()
            randomNumberEmojis = Int.random(in: 4..<emojis.count)
        } label: {
            VStack {
                Image(systemName: "ant")
                Text("Bugs")
                    .font(.footnote)
            }
        }
        .padding(.horizontal)
    }
    
    var faces: some View {
        Button {
            emojis = ["👳‍♂️", "👩‍🦰", "👨🏽", "🧑🏿‍🦲", "👩🏻‍🦱", "👴", "👱🏽‍♀️", "👶🏻", "👦🏼", "🧔🏻", "👧🏽", "👱🏻‍♂️", "👵🏻", "🧓🏾"]
                .shuffled()
            randomNumberEmojis = Int.random(in: 4..<emojis.count)
        } label: {
            VStack {
                Image(systemName: "face.smiling")
                Text("Faces")
                    .font(.footnote)
            }
        }
        .padding(.horizontal)
    }
    
    
    var add: some View {
        Button {
            if emojiCount < emojis.count {
                emojiCount += 1
            }
            
        } label: {
            Image(systemName: "plus.circle")
        }
    }
    
    var remove: some View {
        Button {
            if emojiCount > 1 {
                emojiCount -= 1
            }
        } label: {
            Image(systemName: "minus.circle")
        }
    }
}

struct CardView: View {
    @State var isFaceUp: Bool = true
    
    var content: String
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            
            if isFaceUp {
                shape
                    .fill()
                    .foregroundColor(.white)
                shape
                    .strokeBorder(lineWidth: 3)
                Text(content)
                    .font(.largeTitle)
            } else {
                shape
                    .fill()
            }
        }
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 13 Pro Max")
            .previewInterfaceOrientation(.portrait)
        ContentView()
            .previewDevice("iPhone SE (3rd generation)")
    }
}
