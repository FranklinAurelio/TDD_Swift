//
//  Creator.swift
//  Leilao
//
//  Created by Franklin Carvalho on 09/06/23.
//

import UIKit

class Creator: NSObject {
    
    private var leilao: Leilao!
    
    func para(descricao:String) -> Self{
        leilao = Leilao(descricao: descricao)
        return self
    }
    
    func lance(_ usuario:Usuario, _ valor:Double) -> Self{
        leilao.propoe(lance: Lance(usuario,valor))
        
        return self
    }
    
    func constroi() -> Leilao{
        return leilao
    }
}
