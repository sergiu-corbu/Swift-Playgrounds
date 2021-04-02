import UIKit


//clases
//datatypes start with capital letter
class BlogPost{
    var title = ""
    var body = ""
    var author = ""
    var numberof_comments = 0
    
    func addcomment(){
        numberof_comments += 1
    }
}

let mypost = BlogPost()
mypost.title="Jell"
mypost.body="id"
mypost.author="ergi"
mypost.addcomment()
print(mypost.numberof_comments)

//inheritance (subclases)
