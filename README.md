SwiftFollow
===========

SwiftFollow allows you to follow on twitter directly from your iOS app. Code is written entirely in Swift and is super easy
to implement.

<h2>Implementation </h2>

To add twitter sharing to your app:

- Drag the SwiftFollow.swift file into your app and add the social.framework and accounts.framework
```
import Social
import Accounts
```

- Call the twitter follow method as follows:

````
 @IBAction func followPressed(sender:AnyObject)
  {
  
    var twitterFollow:SwiftFollow = SwiftFollow()
    
    twitterFollow.follow("your_twitter_handle")
  }
  
````  
Once you've done that, simply hook up the action to a UIButton or the appropriate XIB. 

If this helps you, please follow me on twitter @sachinkesiraju and let me know!
