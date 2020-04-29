import UIKit

class Blog{
    static var blogger = [Blogger]()
    static var post = [Post]()
    
    static func BloggersAmount() -> Int{
        return Blog.blogger.count
    }
    
    static func PostsAmount() -> Int{
        return post.count
    }
    
    static func PopBlogger() -> Blogger{
        var s = 0.0
        var result = Blogger()
        for i in blogger{
            if s < i.myPostAVG(){
                s = i.myPostAVG()
                result = i
            }
        }
        return result
    }
    
    static func PopPost() -> Post{
        var s = 0
        var result = Post()
        for i in blogger {
            if i.popPost().PostRating > s {
                s = i.popPost().PostRating
                result = i.popPost()
            }
        }
        return result
    }
    static func postsAVG() -> Double{
        var s = 0.0
        for i in post{
            s += Double(i.PostRating)
        }
        return s / Double(post.count)
    }
}


class Blogger : Blog{
    private static var x = 100
    private var ID = Int()
    var Id: Int {get{return self.ID}}
    var posts = [Post]()
    var fName = String()
    var lName = String()
    
    override init() {
        
    }
    
    init(fName: String, lName: String) {
        self.fName = fName
        self.lName = lName
        Blogger.x += 1
        self.ID = Blogger.x
        super.init()
        Blog.blogger.append(self)
        
    }
    
    
    func myPosts() -> Int{
        return posts.count
    }
    
    func myPostAVG() -> Double{
        var avg = 0.0
        for i in posts{
            avg += Double(i.PostRating)
        }
        return avg / Double(posts.count)
    }
    
    func popPost() -> Post{
        var post = posts.first!
        for i in posts {
            if i.PostRating > post.PostRating{
                post = i
            }
        }
        return post
    }
   
}

struct Post{
    private var bloggerId = Int()
    private static var x = 1000
    private var ID = Int()
    var Id: Int {get{return self.ID}}
    private var pHeader = String()
    var pBody = String()
    private var pRating = Int()
    var PostRating: Int {get {return pRating}
        set{
            if 0 > newValue{pRating = 0}
            else if 5 < newValue{pRating = 5}
            else{ pRating = newValue}}}
    
    init() {
        
    }
    
    init(blogger: Blogger, pHeader: String, pBody: String, pRating: Int) {
        self.pHeader = pHeader
        self.pBody = pBody
        self.PostRating = pRating
        self.bloggerId = blogger.Id
        blogger.posts.append(self)
        Blog.post.append(self)
        Post.x += 1
        self.ID = Post.x
    }
}

var a = Blogger(fName: "giorgi", lName: "digmelashvili")
var b = Blogger(fName: "dato", lName: "digmelashvili")
var c = Blogger(fName: "dato", lName: "digmelashvili")

var pos1 = Post(blogger: a, pHeader: "the Beatles", pBody: "blalsladlsa adfjasdjkas gfah ashgd asghdasgh d", pRating: 1)
var pos2 = Post(blogger: a, pHeader: "the Beatles", pBody: "blalsladlsa adfjasdjkas gfah ashgd asghdasgh d", pRating: 4)
var pos3 = Post(blogger: a, pHeader: "the Beatles", pBody: "blalsladlsa adfjasdjkas gfah ashgd asghdasgh d", pRating: 5)
var pos4 = Post(blogger: b, pHeader: "the Beatles", pBody: "blalsladlsa adfjasdjkas gfah ashgd asghdasgh d", pRating: 3)
var pos5 = Post(blogger: b, pHeader: "the Beatles", pBody: "blalsladlsa adfjasdjkas gfah ashgd asghdasgh d", pRating: 2)
var pos6 = Post(blogger: b, pHeader: "the Beatles", pBody: "blalsladlsa adfjasdjkas gfah ashgd asghdasgh d", pRating: 5)
var pos7 = Post(blogger: c, pHeader: "the Beatles", pBody: "blalsladlsa adfjasdjkas gfah ashgd asghdasgh d", pRating: 4)
var pos8 = Post(blogger: c, pHeader: "the Beatles", pBody: "blalsladlsa adfjasdjkas gfah ashgd asghdasgh d", pRating: 1)
var pos9 = Post(blogger: c, pHeader: "the Beatles", pBody: "blalsladlsa adfjasdjkas gfah ashgd asghdasgh d", pRating: 5)
var pos = Post(blogger: b, pHeader: "the Beatles", pBody: "blalsladlsa adfjasdjkas gfah ashgd asghdasgh d", pRating: 3)
var pos0 = Post(blogger: a, pHeader: "the Beatles", pBody: "blalsladlsa adfjasdjkas gfah ashgd asghdasgh d", pRating: 2)

print(a.myPosts())
print(c.myPosts())
print(b.myPosts())
print(a.myPostAVG())
print(a.popPost())

Blog.BloggersAmount()
Blog.PostsAmount()
Blog.PopBlogger()
Blog.PopPost()
Blog.postsAVG()


