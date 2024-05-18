//
//  WebMDInterviewTestSwiftUITests.swift
//  WebMDInterviewTestSwiftUITests
//
//  Created by Ramadugu, Akshith on 1/17/24.
//

import XCTest
import Foundation

@testable import WebMDInterviewTestSwiftUI

final class WebMDInterviewTestSwiftUITests: XCTestCase {
    
    /**
     1. Write 1 unit test to ensure that the NewsAPI is working as expected.
     - BONUS: Mock the API
     2. Write 1 unit test to ensure that the news articles are properly decoded
     3. OPTIONAL: Write at least 1 unit test for a functionality you think that it needs to be covered by tests.
     */
    
    func testNewsAPI() {
        let expectation = self.expectation(description: "Fetch news data from API")
        
        NewsAPI.fetchNews { result in
            switch result {
            case .success(let news):
                XCTAssertFalse(news.isEmpty, "News list should not be empty")
                expectation.fulfill()
                
            case .failure(let err):
                XCTFail("Fail to fetch news data: \(err.localizedDescription)")
            }
        }
        
        waitForExpectations(timeout: 10, handler: nil)
    }
    
    func testNewsDecoding() {
        let jsonData = """
        
        {
          "status": "ok",
          "totalResults": 15126,
          "articles": [
            {
              "source": {
                "id": "die-zeit",
                "name": "Die Zeit"
              },
              "author": "ZEIT ONLINE: News -",
              "title": "Fabrikgelände: Tesla: SPD-Abgeordneter sieht Gewässerschutz gesichert",
              "description": "Hier finden Sie Informationen zu dem Thema „Fabrikgelände“. Lesen Sie jetzt „Tesla: SPD-Abgeordneter sieht Gewässerschutz gesichert“.",
              "url": "https://www.zeit.de/news/2024-05/17/tesla-spd-abgeordneter-sieht-gewaesserschutz-gesichert",
              "urlToImage": "https://img.zeit.de/news/2024-05/17/tesla-spd-abgeordneter-sieht-gewaesserschutz-gesichert-image-group/wide__1300x731",
              "publishedAt": "2024-05-17T06:55:11Z",
              "content": "Der Brandenburger SPD-Bundestagsabgeordnete Mathias Papendieck hat die geplante Erweiterung des Fabrikgeländes des E-Autokonzerns Tesla in Grünheide bei Berlin verteidigt. Das dortige Wasserschutzgeb… [+2250 chars]"
            }
          ]
        }
        
        """.data(using: .utf8)!
        
        do {
            let decoder = JSONDecoder()
            let news = try decoder.decode(News.self, from: jsonData)
            
            
            XCTAssertEqual(news.articles.count, 1)
            XCTAssertEqual(news.articles[0].author, "ZEIT ONLINE: News -")
        }
        catch {
            XCTFail("Failed to decode news data")
        }
    }
    
    func testDateConversion() {
        let testCases = [
            ("2023-05-18T12:34:56Z", "12:34 PM, 18 May 2023"),
            ("2022-01-01T00:00:00Z", "12:00 AM, 01 Jan 2022"),
            ("2024-05-17T06:55:11Z", "06:55 AM, 17 May 2024"),
            ("2020-02-29T14:30:00Z", "02:30 PM, 29 Feb 2020"),
            ("", ""),
            ("InvalidDate", "")
        ]
        
        for (input, expected) in testCases {
            let result = Date.toString(ipDateStr: input)
            XCTAssertEqual(result, expected, "Expected \(expected) for input \(input) but got \(result)")
        }
    }

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
}
