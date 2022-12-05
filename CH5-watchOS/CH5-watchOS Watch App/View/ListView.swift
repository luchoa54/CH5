//
//  ViewController.swift
//  CH5-watchOS Watch App
//
//  Created by Luciano Uchoa on 08/11/22.
//

import SwiftUI

struct ListView: View {
    
    @AppStorage("Orange")  var orangeImage = "mainsad"
    @AppStorage("fezRotina") var fezRotina = false
    @Binding var routine: [RoutineData]
    @State var isActive : Bool = false
    @State var shift: Int
    @StateObject var counter = Counter()
    
    var body: some View {
        let mudancas = Decode(data: counter.count)
        
        NavigationView{
            VStack(){
                let _ = print(mudancas.shift)
                Spacer(minLength: 30)
                Text("Meu Pou")
               
                    .frame(maxWidth: .infinity,alignment: .leading)
                Image("\(orangeImage)")
                    .resizable()
                    .frame(width: 68, height: 79, alignment: .center)
                if !fezRotina {
                    NavigationLink(destination: StepGuideView(rootIsActive: self.$isActive, routine: $routine[shift]), isActive: self.$isActive){
                        CardView(routine: $routine[shift])
                            .frame(height: 74)
                    }.frame(width: 154, height: 58)
                }else {
                    CompleteCardView(routine: $routine[shift])
                }
                    
            }
            
        }.navigationBarBackButtonHidden(true)
            .edgesIgnoringSafeArea(.all)
            .navigationTitle("App")
            .navigationBarTitleDisplayMode(.inline)
    }
    func Decode(data: Data) -> RoutineInfo{
        let decoder = JSONDecoder()
        let changes = try? decoder.decode(RoutineInfo.self, from: data)
        guard let changes = changes else { return RoutineInfo.datas[0] }
        return changes
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView(routine: .constant(RoutineData.datas), shift: 0)
    }
}

