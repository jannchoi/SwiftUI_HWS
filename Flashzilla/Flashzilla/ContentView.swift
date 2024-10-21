//
//  ContentView.swift
//  Flashzilla
//
//  Created by 최정안 on 10/14/24.
//

import SwiftUI

extension View {
    func stacked(at position: Int, in total: Int) -> some View{
        let offset = Double(total - position)
        return self.offset(y: offset * 10)
    }
}

struct ContentView: View {
    @Environment(\.accessibilityDifferentiateWithoutColor) var accessibilityDifferentiateWithoutColor
    @Environment(\.accessibilityVoiceOverEnabled) var accessibilityVoiceOverEnabled
    
    @State private var cards = [Card]()
    @State private var showingEditScreen = false
    
    @State private var timeRemaining = 100
    let timer = Timer.publish(every: 1, on: .main, in: .common)
    
    @Environment(\.scenePhase) var scenePhase
    @State private var isActive = true
    
    @State private var isCorrect = false
    
    var body: some View {
        ZStack{
            Image(decorative: "background")// decorative를 사용하면 접근 요소로 인식하지 않아서 VoiceOver에서 이미지를 읽지 않는다.
                .resizable()
                .ignoresSafeArea()
            
            VStack{
                Text("Time: \(timeRemaining)")
                    .font(.largeTitle)
                    .foregroundStyle(.white)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 5)
                    .background(.black.opacity(0.75))
                    .clipShape(.capsule)
                
                ZStack{
                    ForEach(0..<cards.count, id: \.self) { index in
                        CardView(card: cards[index]) { _ in
                            withAnimation{
                                removeCard(at: index, correct: isCorrect)
                            }
                        }
                        .stacked(at: index, in: cards.count)
                        .allowsHitTesting(index == cards.count - 1)// 최상위 카드만 스와이프 가능하도록 한다.
                        .accessibilityHidden(index < cards.count - 1)
                        // 최상위 카드가 아닌 요소를 접근 요소에서 제거하여 VoiceOver에서 읽히지 않도록 한다.
                    }
                }
                .allowsHitTesting(timeRemaining > 0)
                // 시간이 남아있을 때만 스와이프가 가능하도록 한다.
                
                if cards.isEmpty {
                    Button("Start Again", action: resetCards)
                        .padding()
                        .background(.white)
                        .foregroundStyle(.black)
                        .clipShape(.capsule)
                }
            }
            
            VStack {
                HStack {
                    Spacer()
                    
                    Button {
                        showingEditScreen = true
                    } label: {
                        Image(systemName: "plus.circle")
                            .padding()
                            .background(.black.opacity(0.7))
                            .clipShape(.circle)
                    }
                }
                Spacer()
            }
            .foregroundStyle(.white)
            .font(.largeTitle)
            .padding()
            
            if accessibilityDifferentiateWithoutColor || accessibilityVoiceOverEnabled {
                VStack {
                    Spacer()
                    
                    HStack{
                        Button{// VoiceOver 사용자에게 편리성을 위해 이미지를 버튼으로 만든다.
                            withAnimation {
                                removeCard(at: cards.count - 1, correct: false)
                            }
                        } label: {
                            Image(systemName: "xmark.circle")
                                .padding()
                                .background(.black.opacity(0.7))
                                .clipShape(.circle)
                        }
                        .accessibilityLabel("Wrong")
                        .accessibilityHint("Mark your answer as being incorrect.")
                        Spacer()
                        
                        Button{
                            withAnimation{
                                removeCard(at: cards.count - 1, correct: true)
                            }
                        } label: {
                            Image(systemName: "checkmark.circle")
                                .padding()
                                .background(.black.opacity(0.7))
                                .clipShape(.circle)
                        }
                        .accessibilityLabel("Correct")
                        .accessibilityHint("Mark your answer as being correct")
                    }
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .padding()
                }
            }
        }
        .onReceive(timer) {// 타이머가 값을 1초마다 방출할 때마다 onReceive가 호출된다.
            time in
            
            guard isActive else {return}
            if timeRemaining > 0 {
                timeRemaining -= 1
            }
        }
        .onChange(of: scenePhase) {
            if scenePhase == .active { // 앱이 활성화되면 isActive를 true로 설정.
                if cards.isEmpty == false {
                    isActive = true
                }
            } else {
                isActive = false
            }
        }
        // #1 init 사용
        .sheet(isPresented: $showingEditScreen, onDismiss: resetCards, content: EditCards.init)
        //onDismiss: 시트가 사라질 때 호출되는 함수.
        /*.
         #2 클로저 사용
         sheet(isPresented: $showingEditScreen) {
         EditCards()
         
     }
*/
        .onAppear(perform: resetCards)
    }
    
    func removeCard(at index: Int, correct: Bool) {
        guard index >= 0 else {return} // 음수 인덱스가 전달될 경우 메서드를 조기 종료 -> 유효하지 않은 인덱스를 제거하는 것을 방지.
        let card = cards[index]
        cards.remove(at: index)
        
        if !correct {// Challenge 3
            cards.append(card)
        }
        
        if cards.isEmpty {
            isActive = false
        }
    }
    
    func resetCards() {
        timeRemaining = 100
        isActive = true
        loadData()
    }
    
    func loadData() {
        if let data = UserDefaults.standard.data(forKey: "Cards") {
            if let decoded = try? JSONDecoder().decode([Card].self, from: data) {
                cards = decoded
            }
        }
    }
}

#Preview {
    ContentView()
}
