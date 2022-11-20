//
 //  HomeView.swift
 //  CH5-watchOS
 //
 //  Created by Ana Kiara Medeiros Braga on 11/11/22.
 //

 import SwiftUI

 struct HomeView: View {
     @Binding var routine: [RoutineInfo]
     @State var orangeName = UserDefaults.standard.string(forKey: "laranjito")
//     @AppStorage("rotina concluida") var routineDone = false
     @AppStorage("orange") var assetOrange = "mainsad"
     @AppStorage("fezRotina") var fezRotina = false
     @State var isActive : Bool = false
     @State var shift: Int
     @State var tempo: String = ""
     let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
     


     var body: some View {
         VStack {

             HStack {
                 Text("Vamos cuidar da sua pele?")
                     .font(.system(size: 24))
                     .fontWeight(.black)
                     .foregroundColor(.titleColor)
                     //.padding([.horizontal], 20)
                 
                 Spacer()

//                 Button {
//
//                 } label: {
//                     Image(systemName: "plus.app.fill")
//                         .resizable()
//                         .foregroundColor(.purpleColor)
//                         .frame(width: 48, height: 44)
//                         //.padding([.horizontal], 31)
//
//                 }

             }

             Spacer()
             
             Text("\(orangeName ?? "Laranjito") está com a pele bem maltrada. Que tal iniciar sua rotina de skincare?")
                 .padding()
                 .padding(.horizontal)
                 .multilineTextAlignment(.center)
                 .font(.system(size: 12))
                 .foregroundColor(.orangeText)
                 .background(Color.orangeLabelBackground)
                 .cornerRadius(12)
                 .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color.orangeBorder,lineWidth: 1))
             
             Spacer()

             Image("\(assetOrange)")

             Spacer()

             Text("Suas atividades")
                 .font(.system(size: 20))
                 .fontWeight(.bold)
                 .foregroundColor(.titleColor)
                 .padding([.trailing], 204)


             if  tempo >= "05:00" && tempo < "10:59"{
                 
                 HStack {
                     NavigationLink(destination: StepByStepView(routine: $routine[0], rootIsActive: self.$isActive), isActive: self.$isActive){
                                 
                                 CardView(routine: $routine[0])
                                 
                     }
                     
                     Spacer()
                 }

             }else if tempo >= "13:00" && tempo < "16:59"{
                 
                 HStack {
                     NavigationLink(destination: StepByStepView(routine: $routine[1], rootIsActive: self.$isActive), isActive: self.$isActive){
                                 
                                     CardView(routine: $routine[1])
                        
                     }
                     
                     Spacer()
                 }

             }else if tempo >= "17:00" && tempo < "23:59"{
                         
                 HStack {
                     NavigationLink(destination: StepByStepView(routine: $routine[2], rootIsActive: self.$isActive), isActive: self.$isActive){
                                 
                                     CardView(routine: $routine[2])
                                 
                     }
                     
                     Spacer()
                 }

             }
             else {
                 
                 Text("sem rotina")

             }
                      }
         .onAppear(){
             if fezRotina == false {
                 assetOrange = "mainsad"
             }else {
                 assetOrange = "mainhappy"
             }
         }
         .padding()
         .background(Image("mainbackground").resizable().scaledToFill())
         //.ignoresSafeArea()
         .navigationBarBackButtonHidden()
         //.navigationTitle("App")
         //.navigationBarTitleDisplayMode(.inline)
         .onReceive(timer){ timer in
             tempo = getTime()
         }
         .onAppear(){
             tempo = getTime()
         }
         
     }
 }

func getTime() -> String {
    let formatter = DateFormatter()
    formatter.timeStyle = .short
    let dateString = formatter.string(from: Date())
    return dateString
}

 struct HomeView_Previews: PreviewProvider {
     static var previews: some View {
         HomeView(routine: .constant(RoutineInfo.datas), shift: 0)
     }
 }
