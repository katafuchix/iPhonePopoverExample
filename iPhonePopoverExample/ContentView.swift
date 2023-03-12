//
//  ContentView.swift
//  iPhonePopoverExample
//
//  Created by cano on 2023/03/12.
//

import SwiftUI

struct ContentView: View {
    /// - View Properties
    @State private var showPopover: Bool = false
    @State private var arrowDirection: ArrowDirection = .up
    @State private var background: Color = .white
    
    var body: some View {
        VStack(alignment: .leading,spacing: 12){
            Text("iPhone PopOver Example")
                .font(.title)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(12)
            Text("Arrow Direction")
                .font(.caption)
                .foregroundColor(.gray)
            Picker("", selection: $arrowDirection) {
                ForEach(ArrowDirection.allCases,id: \.rawValue){direction in
                    Text(direction.rawValue)
                        .tag(direction)
                }
            }
            .pickerStyle(.segmented)
            
            Text("Background")
                .font(.caption)
                .foregroundColor(.gray)
            Picker("", selection: $background) {
                Text("White")
                    .tag(Color.white)
                Text("Blue")
                    .tag(Color.blue)
                Text("Red")
                    .tag(Color.red)
                Text("Orange")
                    .tag(Color.orange)
            }
            .pickerStyle(.segmented)
            
            HStack {
                Button("Show Popover"){
                    showPopover.toggle()
                }
            }
            
            .iOSPopover(isPresented: $showPopover, arrowDirection: arrowDirection.direction) {
                VStack(spacing: 12){
                    Text("Hello, it's me, Popover.")
                        .foregroundColor(background == .white ? .black : .white)
                    
                    Button("Close"){
                        showPopover.toggle()
                    }
                    .foregroundColor(background == .white ? .blue : .white.opacity(0.8))
                }
                .padding(15)
                /// - You can also Give Full Popover Color like this
                .background {
                    Rectangle()
                        .fill(background.gradient)
                        .padding(-20)
                }
            }
            .padding(.top,25)
        }
        .frame(maxHeight: .infinity,alignment: .top)
        .padding(15)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
