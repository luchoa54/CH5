//
//  ViewController.swift
//  CH5-watchOS
//
//  Created by Ana Kiara Medeiros Braga on 07/11/22.
//

import SwiftUI

struct ViewController : View {
    @State private var routine = RoutineInfo.datas
    var body: some View {
        
//        NavigationView {
//            HomeView(routine: .constant(RoutineInfo.datas))
//        }
        
        NavigationView {
            welcomeView(routine: .constant(RoutineInfo.datas))
        }
    }
}
