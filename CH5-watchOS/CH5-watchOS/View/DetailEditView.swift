//
//  RegistrationDetailEditView.swift
//  CH5-watchOS
//
//  Created by Luciano Uchoa on 21/11/22.
//

import SwiftUI

struct DetailEditView: View {
    
    @Binding var data: RoutineInfo.NewData
    
    var body: some View {
        Form{
            Section(header: Text("Instruções")) {
                CheckboxFieldView(checkState: $data.stepStatus[0], name: $data.titleStep[0], steps: $data.numberSteps)
                CheckboxFieldView(checkState: $data.stepStatus[1], name: $data.titleStep[1], steps: $data.numberSteps)
                CheckboxFieldView(checkState: $data.stepStatus[2], name: $data.titleStep[2], steps: $data.numberSteps)
                CheckboxFieldView(checkState: $data.stepStatus[3], name: $data.titleStep[3], steps: $data.numberSteps)
                CheckboxFieldView(checkState: $data.stepStatus[4], name: $data.titleStep[4], steps: $data.numberSteps)
                CheckboxFieldView(checkState: $data.stepStatus[5], name: $data.titleStep[5], steps: $data.numberSteps)
            }
            Section(header: Text("Rotina")){
                WeekView(data: $data)
                    .buttonStyle(.borderless)
                Toggle("Habilitar rotina", isOn: $data.routineIsActive)
                    .tint(Color.purpleColor)
            }
            Section(header: Text("Notificações"), footer: Text("Ao habilitar esta opção, você receberá uma notificação no início do turno escolhido")){
                if(data.shift == "Manhã"){
                    Toggle("Notificar rotina", isOn: $data.notificationStatus)
                        .onChange(of: data.notificationStatus) { value in
                            NotificationManager.instance.scheduleNotification()
                        }
                        .tint(Color.purpleColor)
                }
                else if(data.shift == "Tarde"){
                    Toggle("Notificar rotina", isOn: $data.notificationStatus)
                        .onChange(of: data.notificationStatus) { value in
                            NotificationManager.instance.scheduleNotification2()
                        }
                        .tint(Color.purpleColor)
                }
                else if(data.shift == "Noite"){
                    Toggle("Notificar rotina", isOn: $data.notificationStatus)
                        .onChange(of: data.notificationStatus) { value in
                            NotificationManager.instance.scheduleNotification3()
                        }
                        .tint(Color.purpleColor)
                }
            }
        }
    }
}

struct CheckboxFieldView: View {
    
    @Binding var checkState: Bool
    @Binding var name: String
    @Binding var steps: Double
    
    var body: some View {
        
        Button(action:{
            //1. Save state
            self.checkState = !self.checkState
            if #available(iOS 16, *){
                if !checkState {
                    steps += 1
                }else {
                    steps -= 1
                }
            }else {
                if !checkState {
                    steps -= 1
                }else {
                    steps += 1
                }
            }
        }) {
            HStack {
                //2. Will update according to state
                Image(self.checkState ? "Selection_on" : "Selection_off")
                    .resizable()
                    .frame(width: 20, height: 20)
                Text("\(name)")
                    .foregroundColor(Color.init("blackColor"))
            }
        }
    }
}


struct DetailEditView_Previews: PreviewProvider {
    static var previews: some View {
        DetailEditView(data: .constant(RoutineInfo.datas[0].data))
    }
}
