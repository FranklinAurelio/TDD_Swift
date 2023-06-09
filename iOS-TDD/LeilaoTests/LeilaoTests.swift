//
//  Teste.swift
//  Leilao
//
//  Created by Franklin Carvalho on 24/05/23.
//


import XCTest
@testable import Leilao

class LeilaoTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }

    
    func testPerformanceExample() {
        self.measure {
        }
    }
    
    func testMustReciveBid(){
        let leilao = Leilao(descricao: "MacbookAir 15")
        XCTAssertEqual(0, leilao.lances?.count)
        
        let lucas = Usuario(nome: "Lucas")
        leilao.propoe(lance: Lance(lucas, 12000))
        XCTAssertNotEqual(0, leilao.lances?.count)
        XCTAssertEqual(12000, leilao.lances?.first?.valor)
    }
    
    func testMustReciveSomeBids(){
        let leilao = Leilao(descricao: "Apple Vision pro")
        
        let leticia = Usuario(nome: "Leticia")
        leilao.propoe(lance: Lance(leticia, 32000))
        
        let diego = Usuario(nome: "Diego")
        leilao.propoe(lance: Lance(diego, 32100))
        
        XCTAssertNotEqual(0, leilao.lances?.count)
        XCTAssertEqual(2, leilao.lances?.count)
        
        XCTAssertEqual(32000, leilao.lances?.first?.valor)
        XCTAssertEqual(32100, leilao.lances?[1].valor)

    }
    
    func testMustIgnoreTwoBidsOfUniqueUser(){
        let leilao = Leilao(descricao: "Apple Vision pro")
        
        let maria = Usuario(nome: "Maria")
        leilao.propoe(lance: Lance(maria, 32000))
        leilao.propoe(lance: Lance(maria, 32100))
        
        XCTAssertEqual(1, leilao.lances?.count)
        XCTAssertEqual(32000, leilao.lances?.first?.valor)
    }
    
    func testMustIgnoreMoreFiveBidsOfUniqueUser(){
        let leilao = Leilao(descricao: "MacbookAir 15")
        
        let lucas = Usuario(nome: "Lucas")
        let joao = Usuario(nome: "João")
        
        leilao.propoe(lance: Lance(lucas, 12000))
        leilao.propoe(lance: Lance(joao, 13000))
        leilao.propoe(lance: Lance(lucas, 14000))
        leilao.propoe(lance: Lance(joao, 15000))
        leilao.propoe(lance: Lance(lucas, 16000))
        leilao.propoe(lance: Lance(joao, 17000))
        leilao.propoe(lance: Lance(lucas, 18000))
        leilao.propoe(lance: Lance(joao, 19000))
        leilao.propoe(lance: Lance(lucas, 20000))
        leilao.propoe(lance: Lance(joao, 21000))
        leilao.propoe(lance: Lance(lucas, 22000))
        
        XCTAssertEqual(10, leilao.lances?.count)
        XCTAssertEqual(21000, leilao.lances?.last?.valor)
        
    }
    
}
