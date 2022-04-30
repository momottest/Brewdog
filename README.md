# Brewdog

Description for Brewdog application

Short description of my decisions:
- I've used Swift 5 as a main language
- Project is built on top of MVVM pattern with binding between ViewModel and ViewController
- I've choose simplified Coordinator pattern for app navigation with coordinator for every module and callbacks on blocks
- API is designed on top of URLSession with help of Generics, Request has Response as associatedtype
- All models is Codable
- Custom LoadableImageView has it's own Cache. It is simplified version of 3rd party sd_webimage

What exactly I feel proud of?
- Simple understandable MVVM + Coordinators pattern, one of the best solution for small projects like this. Bindable could be easily replaced with delegates, blocks or even RX
- API design on top of Generics with Codable is very extendable and could be use even in commercial projects
- Following SOLID principles 

What could be done better?
- Add pagination to ListTableView using https://api.punkapi.com/v2/beers?page={pageNum}
- Make DetailsViewController on top of ScrollView and disable TalbeView scrolling to better UI/UX experience
- Add Unit Tests for coordinator, viewModel and API

