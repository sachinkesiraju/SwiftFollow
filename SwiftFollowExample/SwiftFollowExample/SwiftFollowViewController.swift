//
//  SwiftFollowViewController.swift
//  SwiftFollow
//
//  Created by Sachin Kesiraju on 6/12/14.
//  Copyright (c) 2014 Sachin Kesiraju. All rights reserved.
//

import UIKit
import Accounts
import Social

class SwiftFollowViewController: UIViewController, UIAlertViewDelegate {
    
    var twitterhandle:NSString = ""
    
    func followMethod (handle:NSString)
    {
        twitterhandle = handle
        var accountStore:ACAccountStore = ACAccountStore()
        var accountType:ACAccountType = accountStore.accountTypeWithAccountTypeIdentifier(ACAccountTypeIdentifierTwitter)
        accountStore.requestAccessToAccountsWithType(accountType, options: nil, completion:{(granted:Bool!, error:NSError!) in
            
            if(granted)
            {
                var accountsArray:NSArray = accountStore.accountsWithAccountType(accountType)
                if(accountsArray.count > 0)
                {
                    var twitterAccount:ACAccount = accountsArray.objectAtIndex(0) as ACAccount
                    var tempDict:NSMutableDictionary = NSMutableDictionary()
                    tempDict.setValue(self.twitterhandle, forKey: "screen_name")
                    tempDict.setValue(true, forKey: "follow")
                    println(tempDict)
                    var postRequest:SLRequest = SLRequest(forServiceType: SLServiceTypeTwitter, requestMethod: SLRequestMethod.POST, URL: NSURL.URLWithString("https://api.twitter.com/1/friendships/create.json"), parameters: tempDict)
                    postRequest.account = twitterAccount
                    postRequest.performRequestWithHandler({(responseData:NSData!, urlResponse:NSHTTPURLResponse!, error:NSError!) in
                        
                        if(urlResponse.statusCode == 200)
                        {
                            var alert:UIAlertView = UIAlertView()
                            alert.title = "Follow success"
                            alert.message = "Follow was a success"
                            alert.delegate = self;
                            alert.addButtonWithTitle("OK")
                            dispatch_async(dispatch_get_main_queue(), {
                                alert.show()
                            }
                        )}
                
                        })
                }
            }
            
            })
    }

}