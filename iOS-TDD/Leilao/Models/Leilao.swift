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
        
        guard let listBids = lances else{return}
        
        
        if listBids.count == 0 || CanMustBid(lance.usuario, listBids) == true{
            lances?.append(lance)
        }
    }
    
    private func CanMustBid(_ usuario:Usuario, _ listBids:[Lance])-> Bool{
       
        if lastBid(listBids).usuario != usuario && numberOfBidsForUser(usuario)<5{
            return true
        }
        return false
    }
    
    private func lastBid(_ lances:[Lance]) -> Lance{
        return lances[lances.count-1]
    }
    
    private func numberOfBidsForUser(_ usuario:Usuario) -> Int{
        guard let listBids = lances else{return 0}
        
        var totalBids = 0
        for atualBid in listBids{
            if atualBid.usuario == usuario{
                totalBids += 1
            }
        }
        return totalBids
    }
}
