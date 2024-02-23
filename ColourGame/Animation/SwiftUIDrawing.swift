//
//  SwiftUIDrawing.swift
//  ColourGame
//
//  Created by Kaushik on 23/02/24.
//

import SwiftUI
struct Lines {
    var points:[CGPoint]
    var color: Color
}
struct SwiftUIDrawing: View {
    @State private var lines: [Lines] = []
    @State private var selectedColor = Color.orange
    @State private var colorListArray: [Color] = [.green, .red,.blue,.yellow,.pink,.brown,.black,.purple]
    var body: some View {
        VStack {
            HStack(spacing: 3) {
                ForEach(colorListArray, id: \.self) { color in
                    colorButton(color: color)
                }
                
                clearButton()
            }
            Canvas {ctx , size in
                for line in lines {
                    var path = Path()
                    path.addLines(line.points)
                    ctx.stroke(path, with: .color(line.color), style: StrokeStyle(lineWidth: 5, lineCap: .round, lineJoin: .round))
                }
            }
            
            .gesture(
                DragGesture(minimumDistance: 0, coordinateSpace: .local)
                    .onChanged({ value in
                        let position = value.location
                        if value.translation == .zero {
                            lines.append(Lines(points: [position], color: selectedColor))
                        } else {
                            guard let lastIdx = lines.indices.last else {
                                return
                            }
                            lines[lastIdx].points.append(position)
                        }
                    })
            )
            
        }
        .padding()
    }
    
    @ViewBuilder
    func colorButton(color: Color) -> some View {
        Button(action: {
            selectedColor = color
        }, label: {
            Image(systemName: "circle.fill")
                .font(.largeTitle)
                .foregroundColor(color)
                .mask {
                    Image(systemName: "pencil.tip")
                        .font(.largeTitle)
                }
        })
    }
    
    @ViewBuilder
    func clearButton() -> some View {
        Button {
            lines = []
        } label: {
            Image(systemName: "pencil.tip.crop.circle.badge.minus")
                .font(.largeTitle)
                .foregroundColor(.gray)
        }
        
    }
    
}

#Preview {
    SwiftUIDrawing()
}

