//
//  Teste.swift
//  Leilao
//
//  Created by Franklin Carvalho on 24/05/23.
//


import Foundation

class Leilao {
    
    let descricao:String
    let imagem:String?
    var lances:[Lance]?
    
    init(descricao:String, imagem:String? = nil, lances:[Lance] = []) {
        self.descricao = descricao
        self.imagem = imagem
        self.lances = lances
    }
    
    func propoe(lance:Lance) {
        lances?.append(lance)
    }
}
