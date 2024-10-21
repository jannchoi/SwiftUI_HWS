//
//  CardView.swift
//  Flashzilla
//
//  Created by 최정안 on 10/15/24.
//

import SwiftUI

struct CardView: View {
    @Environment(\.accessibilityDifferentiateWithoutColor) var accessibilityDifferentiateWithoutColor
    @Environment(\.accessibilityVoiceOverEnabled) var accessibilityVoiceOverEnabled
    
    @State private var offset = CGSize.zero // 카드를 얼마나 드래그 했는지 추적.
    @State private var isShowingAnswer = false
    
    let card: Card
    var removal: ((Bool) -> Void)? = nil
    // 상위 뷰에서 특정 동작(카드 제거)을 클로저(removeCard(at:)로 전달하면 그 클로저를 통헤 동작이 실행.
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25)
                .fill(
                    accessibilityDifferentiateWithoutColor
                    ? .white
                    : .white
                        .opacity(1 - Double(abs(offset.width / 50)))
                    // 드래그의 거리에 따라 점차 투명해지도록 한다.
                )
                .background(
                    accessibilityDifferentiateWithoutColor
                    ? nil
                    : RoundedRectangle(cornerRadius: 25)
                    .fill(abs(offset.width) > 10 ? (offset.width > 0 ? .green : .red) : .clear)
                    // 카드를 오른쪽으로 스와이프하면 초록색, 왼쪽으로 하면 빨간색으로 변하도록 한다.
                    // 드래그 거리가 10 이상일 때만 배경 색상이 변하도록 한다.
                
                )
                .shadow(radius: 10)
            
            VStack{
                if accessibilityVoiceOverEnabled {
                    //VoiceOver가 활성화된 경우 답변을 읽어준다.
                    Text(isShowingAnswer ? card.answer : card.prompt)
                        .font(.largeTitle)
                        .foregroundStyle(.black)
                } else {
                    Text(card.prompt)
                        .font(.largeTitle)
                        .foregroundStyle(.black)
                    if isShowingAnswer {
                        Text(card.answer)
                            .font(.title)
                            .foregroundStyle(.secondary)
                    }
                }
            }
            .padding(20)
            .multilineTextAlignment(.center)
        }
        .frame(width: 450, height: 250)
        .rotationEffect(.degrees(offset.width / 5.0)) // 드래그한 거리에 따라 카드를 회전시킨다. 이때 회전 속도를 천천히 조절하기 위해 드래그 거리를 5로 나눈다.
        .offset(x: offset.width * 5)
        // 드래그 할 때 뷰가 이동하도록 한다. 조금 드래그 해도 반응하도록 5를 곱한다.
        .opacity(2 - Double(abs(offset.width / 50)))
        // 카드를 멀리 드래그 할 수록 투명해디게 한다. 카드가 50이상 거리로 드래그될 때 점점 투명해지도록 한다.
        .accessibilityAddTraits(.isButton)
        // VoiceOver에 터치 가능한 버튼이라는 것을 알려서 사용자가 해당 카드를 터치할 수 있다는 것을 알려준다.
        .gesture(
        DragGesture()
            .onChanged {
                gesture in
                offset = gesture.translation
                // 사용자가 드래그하는 동안 위치 정보 offset을 업데이트한다.
            }
            .onEnded {// 사용자가 드래그를 끝냈을 떄 호출되고 거리가 100 이상이면 카드를 제거하고, 그렇지 않으면 offset을 초기화한다.
                _ in
                if abs(offset.width) > 100 {
                    let isCorrect = offset.width > 0
                    removal?(isCorrect)
                    // removal을 호출했으니까 removeCard가 호출된다.
                } else {
                    withAnimation {
                        offset = .zero
                    }
                }
            }
        )
        .onTapGesture {
            isShowingAnswer.toggle()
        }
        .animation(.bouncy, value: offset)
    }
}

#Preview {
    CardView(card: .example)
}
