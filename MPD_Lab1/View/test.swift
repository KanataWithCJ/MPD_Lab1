//
//  TestMoveButton.swift
//  Marking (iOS)
//
//  Created by jc_xcode on 2021/7/24.
//

import SwiftUI

struct TestMoveButton: View {
    private let circleWidth = CGFloat(60)
    @State private var dragAmount: CGPoint?
    
    var body: some View {
        GeometryReader { geometry in
            Button(action: {
                
            }, label: {
                ZStack{
                    Circle()
                        .foregroundColor(.white)
                        .shadow(radius: 5)
                    
                    Image(systemName: "square.and.pencil")
                }
            })
            .frame(width: circleWidth, height: circleWidth)
            .animation(.default)
            .position(self.dragAmount ?? CGPoint(x: geometry.size.width - circleWidth - 15, y: geometry.size.height - circleWidth))
            .highPriorityGesture(DragGesture().onChanged {
                var location = $0.location
                let contant = circleWidth / 2 + CGFloat(20)
                if location.x < contant {
                    location.x = contant
                } else if location.x > geometry.size.width - contant {
                    location.x = geometry.size.width - contant
                }
                if location.y < contant {
                    location.y = contant
                } else if location.y > geometry.size.height - contant {
                    location.y = geometry.size.height - contant
                }
                self.dragAmount = location
            })
        }
    }
}

struct TestMoveButton_Previews: PreviewProvider {
    static var previews: some View {
        TestMoveButton()
    }
}

