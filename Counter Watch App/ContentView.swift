//
//  ContentView.swift
//  Counter Watch App
//
//  Created by JooMin Choi on 12/05/2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var currentCount = UserDefaults.standard.integer(forKey: "currentCount")
    
    @State private var isDecrementOn = false
    
    var body: some View {
        ScrollView {
            VStack(alignment: .center, spacing: 10) {
                HStack(alignment: .center, spacing: 20) {
                    Button(action: {
                        self.isDecrementOn.toggle()
                    }) {
                        Image(systemName: isDecrementOn ? "minus" : "plus")
                            .font(.headline)
                            .foregroundColor(.blue)
                            .aspectRatio(contentMode: .fit)
                    }
                    
                    Button(action: {
                        self.currentCount = 0
                        UserDefaults.standard.set(0, forKey: "currentCount")
                    }) {
                        Image(systemName: "trash")
                            .font(.headline)
                            .foregroundColor(.red)
                            .aspectRatio(contentMode: .fit)
                    }
                }
                
                Button(action: {
                    self.performMaths(isSubtract: self.isDecrementOn, num: 1)
                }) {
                    Text("\(currentCount)")
                        .font(.title)
                }
                
                ScrollView(.horizontal) {
                    HStack(alignment: .center, spacing: 10) {
                        Button(action: {
                            self.performMaths(isSubtract: self.isDecrementOn, num: 1)
                        }) {
                            Text(isDecrementOn ? "-1" : "+1")
                        }
                        
                        Button(action: {
                            self.performMaths(isSubtract: self.isDecrementOn, num: 2)
                        }) {
                            Text(isDecrementOn ? "-2" : "+2")
                        }
                        
                        Button(action: {
                            self.performMaths(isSubtract: self.isDecrementOn, num: 3)
                        }) {
                            Text(isDecrementOn ? "-3" : "+3")
                        }
                        
                        Button(action: {
                            self.performMaths(isSubtract: self.isDecrementOn, num: 4)
                        }) {
                            Text(isDecrementOn ? "-4" : "+4")
                        }
                        
                        Button(action: {
                            self.performMaths(isSubtract: self.isDecrementOn, num: 5)
                        }) {
                            Text(isDecrementOn ? "-5" : "+5")
                        }
                        
                        Button(action: {
                            self.performMaths(isSubtract: self.isDecrementOn, num: 10)
                        }) {
                            Text(isDecrementOn ? "-10" : "+10")
                        }
                        
                    }
                }
            }.padding(.all)
        }
    }
    
    func performMaths(isSubtract: Bool, num: Int) {
        
        var result = self.currentCount
        
        if isSubtract == true {
            result -= num
        } else {
            result += num
        }
        
        if result >= 0 {
            currentCount = result
            UserDefaults.standard.set(currentCount, forKey: "currentCount")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
