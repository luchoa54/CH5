//
//  DailySkinCare.swift
//  CH5-watchOS Watch App
//
//  Created by Luciano Uchoa on 09/11/22.
//

import Foundation

struct DailySkinCare: Identifiable {
    let id: UUID
    var turno: String
    var titulo: [String]
    var instrucao: [String]
    var duracaoPasso: [Int]
    var qtPassos: Int
    var horario: Int
    
    init(id: UUID = UUID(), turno: String, titulo: [String], instrucao: [String], duracaoPasso: [Int], qtPassos: Int, horario: Int) {
        self.id = id
        self.turno = turno
        self.titulo = titulo
        self.instrucao = instrucao
        self.duracaoPasso = duracaoPasso
        self.qtPassos = qtPassos
        self.horario = horario
    }
}


extension DailySkinCare {
    static let sampleData: [DailySkinCare] =
    [
        DailySkinCare(turno: "Manhã", titulo: ["Limpeza do rosto","Vitamina C", "Protetor Solar"], instrucao: ["Limpeza","Proteção", "Proteção"], duracaoPasso: [3,4,5], qtPassos: 3, horario: 3600),
        DailySkinCare(turno: "Tarde", titulo: ["Limpeza do rosto","Vitamina C", "Protetor Solar", "Passar Hidratante"], instrucao: ["Limpeza","Proteção", "Proteção", "Hidratação"], duracaoPasso: [3,4,5,6], qtPassos: 4, horario: 3600),
        DailySkinCare(turno: "Noite", titulo: ["Limpeza do rosto","Vitamina C"], instrucao: ["Limpeza","Proteção"], duracaoPasso: [3,4], qtPassos: 2, horario: 3600)
    ]
}
