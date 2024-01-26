//
//  SwiftUIViewUnitTest.swift
//  ColourGame
//
//  Created by Kaushik on 16/01/24.
//

import SwiftUI

struct SwiftUIViewUnitTest: View {
    @StateObject private var vm: UnitTestViewModel
    
    init(isPremium: Bool) {
        _vm = StateObject(wrappedValue: UnitTestViewModel(isPremium: isPremium))
    }
    var body: some View {
        Text("\(vm.isPremium.description)")
    }
}

#Preview {
    SwiftUIViewUnitTest(isPremium: true)
}
