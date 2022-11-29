//
//  StepByStepView.swift
//  CH5-watchOS
//
//  Created by Ana Kiara Medeiros Braga on 07/11/22.
//

import SwiftUI

struct StepByStepView: View {
    //let routine: RoutineInfo
    @Binding var routine: RoutineInfo
    @Binding var rootIsActive : Bool
    @State var currentStep: Int = 1
    @State var indexStep: Int = 0
    
    var body: some View {
        
        VStack {
            HStack {
                Text("Passo \(currentStep)")
                    .font(.system(size: 16, weight: .bold))
                    .foregroundColor(.textCurrentStep)
                
                Text("/ \(routine.numberSteps)")
                    .font(.system(size: 16, weight: .bold))
                    .foregroundColor(.textNextStep)
            }
            .padding([.horizontal], 16)
            .padding([.vertical], 8)
            .background(Color.stepTextBackground)
            .cornerRadius(8)
            
            ZStack {
                VStack (spacing: 12){
                    Text("\(routine.titleStep[indexStep])")
                        .foregroundColor(.titleColor)
                        .font(.callout)
                        .fontWeight(.bold)
                    //.padding([.bottom], 12)
                    Text("\(routine.descriptionStep[indexStep])")
                        .foregroundColor(.descriptionColor)
                        .multilineTextAlignment(.center)
                        .font(.body)
                }
                .padding([.all], 16)
            }
            .padding([.horizontal], 40)
            //.padding([.bottom], 10)
            
            Image("\(routine.imagesSteps[indexStep])")
            //.padding([.bottom], 175)
            
            Spacer()
            
            //            if(self.currentStep == routine.numberSteps) {
            //                NavigationLink(destination: FinalStepView()) {
            //                    Text("Finalizar")
            //                        .foregroundColor(.textButtonStep)
            //                        .font(.system(size: 17))
            //                        .padding([.horizontal], 148)
            //                        .padding([.vertical], 14)
            //                }
            //                .background(Color.purpleColor)
            //                .cornerRadius(12)
            //            }
            //            else {
            
            NavigationLink(destination: TimerStepView(indexStep: self.$indexStep, routine: $routine, currentStep: self.$currentStep, rootIsActive: self.$rootIsActive)) {
                Text("Iniciar")
                    .foregroundColor(.textButtonStep)
                    .font(.system(size: 17))
                    .frame(width: 350, height: 52)
            }
            .background(Color.purpleColor)
            .cornerRadius(12)
            //}
        }
        .onShake {
            print("shakeado")
        }
        .onAppear(){
            nextStep()
        }
        .navigationTitle("\(routine.shift)")
        .ignoresSafeArea(.all)
        .padding()
    }
    func nextStep(){
        var stepFound: Bool = false
        
        if indexStep == 0{
            while stepFound == false {
                if(routine.stepStatus[indexStep] == false && indexStep < 5){
                    self.indexStep += 1
                }else{
                    stepFound = true
                }
            }
        }
    }
}

struct StepByStepView_Previews: PreviewProvider {
    static var routine = RoutineInfo.datas[0]
    static var previews: some View {
        StepByStepView(routine: .constant(RoutineInfo.datas[0]), rootIsActive: .constant(false))
        //        StepByStepView(routine: .constant(RoutineInfo.datas[0]))
    }
}
