//
//  AvaliadorTests.swift
//  LeilaoTests
//
//  Created by Franklin Carvalho on 02/06/23.
//

import XCTest
@testable import Leilao

final class AvaliadorTests: XCTestCase {
    
    private var joao:Usuario!
    private var jose:Usuario!
    private var maria:Usuario!
    private var leiloeiro: Avaliador!

    override func setUpWithError() throws {
        joao = Usuario(nome: "Joao")
        jose = Usuario(nome: "Jose")
        maria = Usuario(nome: "Maria")
        leiloeiro = Avaliador()
    }

    override func tearDownWithError() throws {
    }

    func testPerformanceExample() throws {
        self.measure {
        }
    }
    
    func testCanKnowBidInAscendingOrder(){
        let leilao = Leilao(descricao: "Playstation 4")
        leilao.propoe(lance: Lance(maria, 250.0))
        leilao.propoe(lance: Lance(joao, 300.0))
        leilao.propoe(lance: Lance(jose, 400.0))
        
        // Acao
        try? leiloeiro.avalia(leilao: leilao)
        
        // Validacao
        
        XCTAssertEqual(250, leiloeiro.menorLance())
        XCTAssertEqual(400, leiloeiro.maiorLance())
    }
    
    func testCanKnowBidAscendingOrderWithDynamicValues(){
        let leilao = Leilao(descricao: "Playstation 4")
        leilao.propoe(lance: Lance(maria, 1000.0))
        leilao.propoe(lance: Lance(joao, 1200.0))
        leilao.propoe(lance: Lance(jose, 3000.0))
        
        // Acao
        try? leiloeiro.avalia(leilao: leilao)
        
        // Validacao
        
        XCTAssertEqual(1000, leiloeiro.menorLance())
        XCTAssertEqual(3000, leiloeiro.maiorLance())
    }
    
    func testCanKnowOrderWithOneBid(){
        let leilao = Leilao(descricao: "Apple watch")
        leilao.propoe(lance: Lance(joao, 1800.0))
        
        
        try? leiloeiro.avalia(leilao: leilao)
        
        XCTAssertEqual(1800.0, leiloeiro.maiorLance())
        XCTAssertEqual(1800.0, leiloeiro.menorLance())
    }
    
    func testFindThreeBiggerBid(){

        let leilao = Creator().para(descricao: "MacBook pro M2")
            .lance(maria, 1000.0)
            .lance(joao,1200.0)
            .lance(maria, 1300.0)
            .lance(joao,1400.0)
            .lance(maria, 1800.0)
            .lance(joao,2000.0).constroi()
        
        
        try? leiloeiro.avalia(leilao: leilao)
        
        let listBid = leiloeiro.getTheThreeBestBidInAscendingOrderPublic()
        
        XCTAssertEqual(3, listBid.count)
        XCTAssertEqual(2000.0, listBid[0].valor)
        XCTAssertEqual(1800.0, listBid[1].valor)
        XCTAssertEqual(1400.0, listBid[2].valor)
    }

    func testMustIgnoreLeilaoVoid(){
        let leilao  = Creator().para(descricao: "Apple Watch").constroi()
      
            XCTAssertThrowsError(try leiloeiro.avalia(leilao: leilao), "Não é possivel avaliar um leilao sem lances"){
                error in
                print(error.localizedDescription)
            }
    }
}
