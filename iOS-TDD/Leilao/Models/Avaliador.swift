//
//  Teste.swift
//  Leilao
//
//  Created by Franklin Carvalho on 24/05/23.
//


import Foundation

class Avaliador {
    
    private var maiorDeTodos = Double.leastNonzeroMagnitude
    private var menorDeTodos = Double.greatestFiniteMagnitude
    private var biggerBid:[Lance] = []
    
    func avalia(leilao:Leilao) {
        guard let lances = leilao.lances else { return }
        
        for lance in lances {
            if lance.valor > maiorDeTodos {
                maiorDeTodos = lance.valor
            }
            if lance.valor < menorDeTodos {
                menorDeTodos = lance.valor
            }
        }
        
        getTheThreeBestBidInAscendingOrder(leilao)
    }
    
    func maiorLance() -> Double {
        return maiorDeTodos
    }
    
    func menorLance() -> Double {
        return menorDeTodos
    }
    
    private func getTheThreeBestBidInAscendingOrder (_ leilao: Leilao){
        guard let bid = leilao.lances else { return }
        
        biggerBid = bid.sorted(by: { list1, list2 in
            return list1.valor > list2.valor
        })
        
        let biggerThreeBids = biggerBid.prefix(3)
        
        biggerBid = Array(biggerThreeBids)
        
        
    }
    
    func getTheThreeBestBidInAscendingOrderPublic () -> [Lance]{
        return biggerBid
    }
    
}
