//
//  HomeView.swift
//  CH5-watchOS
//
//  Created by Ana Kiara Medeiros Braga on 11/11/22.
//

import SwiftUI

struct HomeView: View {
    @AppStorage("orange") var assetOrange = "mainsad"
    @AppStorage("fezRotina") var fezRotina = false
    @AppStorage("laranjito") var orangeName = ""
    @Binding var routine: [RoutineInfo]
    @State private var data = RoutineInfo.NewData()
    @State private var isPresentingEditView = false
    @State var isActive : Bool = false
    @State var shift: Int
    @State var actualTime: String = ""
    @State var dayIndex: Int = 0
    @State var currentStep: Int = 1
    @State var indexStep: Int = 0
    @StateObject var counter = Counter()
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack {
            HStack {
                Text("Vamos cuidar da sua pele?")
                    .font(.system(size: 24))
                    .fontWeight(.black)
                    .foregroundColor(.titleColor)
                Spacer()
            }
            Spacer()
            Text("\(orangeName) está com a pele bem maltrada. Que tal iniciar sua rotina de skincare?")
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
            HStack{
                Text("Suas atividades")
                    .font(.system(size: 20))
                    .fontWeight(.bold)
                    .foregroundColor(.titleColor)
                    .padding([.trailing], 155)
                Button("Editar"){
                    isPresentingEditView = true
                }
            }
            
            if  actualTime >= "05:00" && actualTime <= "10:59" && routine[0].numberSteps > 0{
                if(routine[0].numberSteps > 0 && routine[0].weekStatus[dayIndex] == true){
                    NavigationLink(destination: TimerStepView(routine: $routine[0], rootIsActive: self.$isActive), isActive: self.$isActive){
                        if fezRotina {
                            CardView(routine: $routine[0], text: "Rotina concluída", colorCompleted: "greenCompleted")
                        }
                        else {
                            CardView(routine: $routine[0], text: "Possui \(routine[0].numberSteps) passos", colorCompleted: "descriptionCard")
                        }
                    }
                }else {
                    Rectangle()
                        .frame(width: 264, height: 120, alignment: .center)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                        .overlay(
                            HStack{
                                Image(systemName: "info.circle")
                                    .foregroundColor(Color.orangeText)
                                Text("Você não adicionou nenhum passo nessa rotina ou essa rotina está desativada!")
                                    .font(.system(size: 15))
                                    .foregroundColor(Color.orangeText)
                                    .fontWeight(.semibold)
                                    .frame(maxWidth: .infinity, alignment: .center)
                                    .multilineTextAlignment(.center)
                                }
                        )
                }
                Spacer()
            }else if actualTime >= "13:00" && actualTime <= "16:59" && routine[1].numberSteps > 0{
                if(routine[1].numberSteps > 0 && routine[1].weekStatus[dayIndex] == true){
                    NavigationLink(destination: TimerStepView(routine: $routine[1], rootIsActive: self.$isActive), isActive: self.$isActive){
                        if fezRotina {
                            CardView(routine: $routine[1], text: "Rotina concluída", colorCompleted: "greenCompleted")
                        }
                        else {
                            CardView(routine: $routine[1], text: "Possui \(routine[1].numberSteps) passos", colorCompleted: "descriptionCard")
                        }
                    }
                }else {
                    Rectangle()
                        .frame(width: 350, height: 123, alignment: .center)
                        .foregroundColor(.clear)
                        .cornerRadius(12)
                        .overlay(
                            HStack{
                                Image(systemName: "info.circle")
                                    .foregroundColor(Color.orangeText)
                                Text("Você não adicionou nenhum passo nessa rotina ou essa rotina está desativada!")
                                    .font(.system(size: 15))
                                    .foregroundColor(Color.orangeText)
                                    .fontWeight(.semibold)
                                    .frame(maxWidth: .infinity, alignment: .center)
                                    .multilineTextAlignment(.center)
                                }
                            )
                }
                Spacer()
            }else if actualTime >= "19:00" && actualTime <= "23:59" && routine[2].numberSteps > 0{
                if(routine[2].numberSteps > 0 && routine[2].weekStatus[dayIndex] == true){
                    NavigationLink(destination: TimerStepView(routine: $routine[2], rootIsActive: self.$isActive), isActive: self.$isActive){
                        if fezRotina {
                            CardView(routine: $routine[2], text: "Rotina concluída", colorCompleted: "greenCompleted")
                        }
                        else {
                            CardView(routine: $routine[2], text: "Possui \(routine[2].numberSteps) passos", colorCompleted: "descriptionCard")
                        }
                    }
                }else {
                    Rectangle()
                        .frame(width: 350, height: 123, alignment: .center)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                        .overlay(
                            Text("Você não adicionou nenhum passo nessa rotina ou essa rotina está desativada!")
                                .fontWeight(.bold)
                                .frame(maxWidth: .infinity, alignment: .center)
                                .multilineTextAlignment(.center)
                        )
                }
                Spacer()
            }
            else {
                if  actualTime >= "00:00" && actualTime <= "04:59" {
                    Text("Próxima skincare marcada para manhã.")
                        .padding()
                        .padding(.horizontal)
                        .multilineTextAlignment(.center)
                        .font(.system(size: 12))
                        .foregroundColor(.orangeText)
                        .background(Color.orangeLabelBackground)
                        .cornerRadius(12)
                        .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color.orangeBorder,lineWidth: 1))
                        .onAppear(){
                            fezRotina = false
                        }
                }
                else if actualTime >= "11:00" && actualTime <= "12:59" {
                    Text("Próxima skincare marcada para tarde.")
                        .padding()
                        .padding(.horizontal)
                        .multilineTextAlignment(.center)
                        .font(.system(size: 12))
                        .foregroundColor(.orangeText)
                        .background(Color.orangeLabelBackground)
                        .cornerRadius(12)
                        .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color.orangeBorder,lineWidth: 1))
                        .onAppear(){
                            fezRotina = false
                        }
                }
                else if actualTime >= "17:00" && actualTime <= "18:59" {
                    Text("Próxima skincare marcada para noite.")
                        .padding()
                        .padding(.horizontal)
                        .multilineTextAlignment(.center)
                        .font(.system(size: 12))
                        .foregroundColor(.orangeText)
                        .background(Color.orangeLabelBackground)
                        .cornerRadius(12)
                        .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color.orangeBorder,lineWidth: 1))
                        .onAppear(){
                            fezRotina = false
                        }
                }
            }
        }
        //        .onAppear(){
        //            NotificationManager.instance.requestAuthorization()
        //            UIApplication.shared.applicationIconBadgeNumber = 0
        //        }
        .onAppear(){
            if fezRotina {
                assetOrange = "mainhappy"
            }
            else {
                assetOrange = "mainsad"
            }
        }
        .padding()
        .background(Image("mainbackground").resizable().scaledToFill()).padding(.bottom)
        .navigationBarBackButtonHidden()
        .onReceive(timer){ timer in
            actualTime = getTime()
            dayIndex = getWeekDayByIndex()
        }
        .onAppear(){
            actualTime = getTime()
            dayIndex = getWeekDayByIndex()
        }.sheet(isPresented: $isPresentingEditView){
            NavigationView {
                UpdateRoutineView(routine: $routine)
                    .toolbar {
                        ToolbarItem(placement: .cancellationAction) {
                            Button("Cancelar") {
                                isPresentingEditView = false
                            }
                        }
                        ToolbarItem(placement: .confirmationAction) {
                            Button("Concluir") {
                                isPresentingEditView = false
                            }
                        }
                    }
            }
        }
    }
}

func getTime() -> String {
    let formatter = DateFormatter()
    formatter.timeStyle = .short
    let dateString = formatter.string(from: Date())
    return dateString
}

func getWeekDayByIndex() -> Int {
    let weekday = Calendar.current.component(.weekday, from: Date())
    return weekday - 2
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(routine: .constant(RoutineInfo.datas), shift: 1)
    }
}
