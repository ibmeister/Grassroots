//
//  GetRequestTests.swift
//  Community
//
//  Created by Ibrahim Oyekan on 2/7/17.
//  Copyright © 2017 Soya. All rights reserved.
//

import XCTest
@testable import Community

class GetRequestTests: XCTestCase {

    var campaignTableViewController: CampaignTableViewController!
    var testPost1: PostObject!
    var testPost2: PostObject!
    
    override func setUp() {
        super.setUp()
        
        
        testPost1 = PostObject()
        testPost2 = PostObject()
        
        testPost1.rating = 20
        testPost2.rating = 19
        
        let bundle = Bundle(for: type(of: self))
        let storyboard = UIStoryboard(name: "Main", bundle: bundle)
        
        
        campaignTableViewController = storyboard.instantiateViewController(withIdentifier: "CampaignTableViewController") as! CampaignTableViewController
       
        
       
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    func testSortRequests() {
         _ = campaignTableViewController.view //TODO
        var postArray:[PostObject] = [testPost2, testPost1]
        postArray = campaignTableViewController.sortPosts(sortPostArray: postArray)
        
        XCTAssert(postArray[0].rating! > postArray[1].rating!)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
        testPost1 = nil
        testPost2 = nil
        campaignTableViewController = nil
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
