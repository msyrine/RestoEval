//
//  Offre.swift
//  Test2
//
//  Created by Methlouthi Syrine on 12/22/17.
//  Copyright © 2017 Methlouthi Syrine. All rights reserved.
//

import UIKit

struct Offre
{
    
    var createdBy: Restaurant
    var timeAgo: String?
    var caption: String?
    var image: UIImage?
    var numberOfLikes: Int?
    var numberOfComments: Int?
    var numberOfShares: Int?
    
    static func fetchOffres() -> [Offre]
    {
        var posts = [Offre]()
        
//        let duc = Restaurant(username: "Duc Tran", profileImage: UIImage(named: "1.png"))
//        let Offre1 = Offre(createdBy: duc, timeAgo: "1 hr", caption: "Wise words from Will Smith: The only thing that I see that is distinctly different from me is: I'm not afraid to die on a treadmill. I will not be outworked, period. You might have more talent than me, you might be smarter than me, you might be sexier than me. You might be all of those things. You got it on me in nine categories. But if we get on the treadmill together, there's two things. You're getting off first, or I'm going to die. It's really that simple. Love that. I wish that you'll embrace this mindset in everything that you do. Tonight, when you think about 2017, don't set resolutions but set goals. Trust in your abilities to figure things out. No matter how small you start, start something that matters. With enough time, focus, effort, even resources and mentorship, you will develop new skills and achieve your goals.", image: UIImage(named: "1.png"), numberOfLikes: 12, numberOfComments: 32, numberOfShares: 28)
//        let Offre2 = Offre(createdBy: duc, timeAgo: "3 hrs", caption: "When you work on any thing that matters, it's ok to worry, fear, and be uncomfortable. Just never give up!", image: UIImage(named: "2.png"), numberOfLikes: 8, numberOfComments: 12, numberOfShares: 92)
//        let Offre3 = Offre(createdBy: duc, timeAgo: "5 hrs", caption: "New iOS tutorial is up for developers out in the world: JoinDuc.com/iosapp-fb", image: UIImage(named: "x3.png"), numberOfLikes: 8, numberOfComments: 92, numberOfShares: 89)
//        let Offre4 = Offre(createdBy: duc, timeAgo: "2d ago", caption: "Love it!", image: UIImage(named: "x1.png"), numberOfLikes: 2, numberOfComments: 8, numberOfShares: 9)
//        
//        let brendon = Restaurant(username: "Brendon Burchard", profileImage: UIImage(named: "Toast1"))
//        let offre5 = Offre(createdBy: brendon, timeAgo: "2 hrs", caption: "You are not selfish for desiring a better life. If you appreciate what you have but feel called to the next level, that's something to listen to.", image: UIImage(named: "x2.png"), numberOfLikes: 94, numberOfComments: 8, numberOfShares: 918)
//        let offre6 = Offre(createdBy: brendon, timeAgo: "8 hrs", caption: "No matter how small you start, start something that matters. Believe in your dreams and begin.", image: UIImage(named: "x4.png"), numberOfLikes: 99, numberOfComments: 83, numberOfShares: 89)
//        let offre7 = Offre(createdBy: brendon, timeAgo: "Yesterday", caption: "Congratulations to the graduating class of high performance academy 2017! Thank you for your engagement, joy and confidence. Now go serve the world!", image: UIImage(named: "1.png"), numberOfLikes: 9, numberOfComments: 82, numberOfShares: 74)
//        
//        posts.append(Offre1)
//        posts.append(offre5)
//        posts.append(Offre4)
//        posts.append(Offre2)
//        posts.append(offre7)
//        posts.append(Offre3)
//        posts.append(offre6)
//        
//        return posts
        return posts
    }

    
    
    
}
