//
//  AvaliadorTests.swift
//  LeilaoTests
//
//  Created by Franklin Carvalho on 02/06/23.
//

import XCTest
@testable import Leilao

final class AvaliadorTests: XCTestCase {

    override func setUpWithError() throws {
    }

    override func tearDownWithError() throws {
    }

    func testPerformanceExample() throws {
        self.measure {
        }
    }
    
    func testCanKnowBidInAscendingOrder(){
        let joao = Usuario(nome: "Joao")
        let jose = Usuario(nome: "Jose")
        let maria = Usuario(nome: "Maria")
        
        let leilao = Leilao(descricao: "Playstation 4")
        leilao.propoe(lance: Lance(maria, 250.0))
        leilao.propoe(lance: Lance(joao, 300.0))
        leilao.propoe(lance: Lance(jose, 400.0))
        
        // Acao
        
        let leiloeiro = Avaliador()
        leiloeiro.avalia(leilao: leilao)
        
        // Validacao
        
        XCTAssertEqual(250, leiloeiro.menorLance())
        XCTAssertEqual(400, leiloeiro.maiorLance())
    }
    
    func testCanKnowBidAscendingOrderWithDynamicValues(){
        let joao = Usuario(nome: "Joao")
        let jose = Usuario(nome: "Jose")
        let maria = Usuario(nome: "Maria")
        
        let leilao = Leilao(descricao: "Playstation 4")
        leilao.propoe(lance: Lance(maria, 1000.0))
        leilao.propoe(lance: Lance(joao, 1200.0))
        leilao.propoe(lance: Lance(jose, 3000.0))
        
        // Acao
        
        let leiloeiro = Avaliador()
        leiloeiro.avalia(leilao: leilao)
        
        // Validacao
        
        XCTAssertEqual(1000, leiloeiro.menorLance())
        XCTAssertEqual(3000, leiloeiro.maiorLance())
    }
    
    func testCanKnowOrderWithOneBid(){
        let joao = Usuario(nome: "João")
        
        let leilao = Leilao(descricao: "Apple watch")
        leilao.propoe(lance: Lance(joao, 1800.0))
        
        let leiloeiro = Avaliador()
        leiloeiro.avalia(leilao: leilao)
        
        XCTAssertEqual(1800.0, leiloeiro.maiorLance())
        XCTAssertEqual(1800.0, leiloeiro.menorLance())
    }
    
    func testFindThreeBiggerBid(){
        let joao = Usuario(nome: "Joao")
        let maria = Usuario(nome: "Maria")
        
        let leilao = Leilao(descricao: "MacBook pro M2")
        
        leilao.propoe(lance: Lance(maria, 1000.0))
        leilao.propoe(lance: Lance(joao, 1200.0))
        leilao.propoe(lance: Lance(maria, 1300.0))
        leilao.propoe(lance: Lance(joao, 1400.0))
        leilao.propoe(lance: Lance(maria, 1800.0))
        leilao.propoe(lance: Lance(joao, 2000.0))
        
        let leiloeiro = Avaliador()
        leiloeiro.avalia(leilao: leilao)
        
        let listBid = leiloeiro.getTheThreeBestBidInAscendingOrderPublic()
        
        XCTAssertEqual(3, listBid.count)
        XCTAssertEqual(2000.0, listBid[0].valor)
        XCTAssertEqual(1800.0, listBid[1].valor)
        XCTAssertEqual(1400.0, listBid[2].valor)
    }

}
