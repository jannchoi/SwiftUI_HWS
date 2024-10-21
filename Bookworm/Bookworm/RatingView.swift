//
//  RatingView.swift
//  Bookworm
//
//  Created by 최정안 on 9/27/24.
//

import SwiftUI

struct RatingView: View {
    @Binding var rating: Int
    
    var label = ""
    var maximumRating = 5
    
    var offImage: Image?
    var onImage = Image(systemName: "star.fill")
    
    var offColor = Color.gray
    var onColor = Color.yellow
    
    var body: some View {
        HStack {
            if label.isEmpty == false {
                Text(label)
            }
            
            ForEach(1..<maximumRating + 1, id: \.self) {
                number in
                Button {
                    rating = number
                } label: {
                    image(for: number)
                        .foregroundStyle(number > rating ? offColor : onColor)
                }

            }
        }
        .buttonStyle(.plain)
        // 기본적으로 버튼의 행의 어디든 터치 가능하도록 되어있기 때문에 버튼을 누르면 여러 개의 버튼을 1부터 5까지 차례로 누르게 되어 항상 별점 5점으로 설정된다. 이를 해결하기 위해서 buttonStyle을 설정하면 된다.
        .accessibilityElement()
        .accessibilityLabel(label)
        .accessibilityValue(rating == 1 ? "1 star" : "\(rating) stars")
        .accessibilityAdjustableAction {
            direction in
            switch direction{
            case .increment:
                if rating < maximumRating {rating += 1}
            case .decrement:
                if rating > 1 {rating -= 1}
            default:
                break
            }
        }
    }
    
    func image(for number: Int) -> Image {
        if number > rating {
            offImage ?? onImage
        } else {
            onImage
        }
    }
}

#Preview {
    RatingView(rating: .constant(4))
}
