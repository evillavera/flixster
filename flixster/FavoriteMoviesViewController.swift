//

//Still trying to figure out a way to update the data and display the movies in this VC
    //data was updated when array became static
//I have a few bookmarked links that I could look at
//Currently I made a button in MoviesDetailVC that will favorite the movie and update this VC
//This is different from the other way of passing data because this is not passing data through a segue, this is updating data on another VC while in a different VC. Also the tableView will not update on its on



//  FavoriteMoviesViewController.swift
//  flixster
//
//  Created by Erik Villavera on 11/23/20.
//

import UIKit

class FavoriteMoviesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    static var movies = [[String:Any]]() //creation of an array of dictionaries

    @IBOutlet weak var tableView: UITableView!

    @objc func reloadTableview() {
        print("Reloading data")
        self.tableView.reloadData()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.dataSource = self
        tableView.delegate = self
//        print("MOVIES LIST: ")
//        print(FavoriteMoviesViewController.movies)
//        print("Array Size: ")
//        print(FavoriteMoviesViewController.movies.count)

        let notificationNme = NSNotification.Name("NotificationIdf")
        NotificationCenter.default.addObserver(self, selector: #selector(FavoriteMoviesViewController.reloadTableview), name: notificationNme, object: nil)

        self.tableView.reloadData()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return FavoriteMoviesViewController.movies.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //print("UPDATING FAVORITES SCREEN")
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell") as! MovieCell

        let movie = FavoriteMoviesViewController.movies[indexPath.row]
        let title = movie["title"] as! String
        let synopsis = movie["overview"] as! String

        cell.titleLabel.text = title
        cell.synopsisLabel.text = synopsis

        let baseUrl = "https://image.tmdb.org/t/p/w185"
        let posterPath = movie["poster_path"] as! String
        let posterUrl = URL(string: baseUrl + posterPath)

        //cell.posterView.af_setImage(withURL: posterUrl!)
        cell.posterView.downloaded(from: posterUrl!)

        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        print("Loading up Details Screen")
        
        //Find the selected movie
        let cell = sender as! UITableViewCell
        let indexPath = tableView.indexPath(for: cell)!
        let movie = FavoriteMoviesViewController.movies[indexPath.row]
        
        //Pass the selected movie to the Details VC
        
        let detailViewController = segue.destination as! MovieDetailsViewController
        
        detailViewController.movie = movie
        
        tableView.deselectRow(at: indexPath, animated: true)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

//to prove that the movies can be displayed
//
////
//
////Still trying to figure out a way to update the data and display the movies in this VC
//    //data was updated when array became static
////I have a few bookmarked links that I could look at
////Currently I made a button in MoviesDetailVC that will favorite the movie and update this VC
////This is different from the other way of passing data because this is not passing data through a segue, this is updating data on another VC while in a different VC. Also the tableView will not update on its on
//
//
//
////  FavoriteMoviesViewController.swift
////  flixster
////
////  Created by Erik Villavera on 11/23/20.
////
//
//
//import UIKit
//
//class FavoriteMoviesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
//
//    static var movies = [[String:Any]]() //creation of an array of dictionaries
//
//    @IBOutlet weak var tableView: UITableView!
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        // Do any additional setup after loading the view.
//        tableView.dataSource = self
//        tableView.delegate = self
//
//        let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed")!
//        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
//        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
//        let task = session.dataTask(with: request) { (data, response, error) in
//           // This will run when the network request returns
//           if let error = error {
//              print(error.localizedDescription)
//           } else if let data = data {
//              let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
//
//            FavoriteMoviesViewController.movies = dataDictionary["results"] as! [[String:Any]]
//            //this is casting as! [[String:Any]]
//
//                //print(dataDictionary)
//
//            self.tableView.reloadData()
//              // TODO: Get the array of movies
//              // TODO: Store the movies in a property to use elsewhere
//              // TODO: Reload your table view data
//
//           }
//        }
//        task.resume()
//        self.tableView.reloadData()
//    }
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return FavoriteMoviesViewController.movies.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        //print("UPDATING FAVORITES SCREEN")
//        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell") as! MovieCell
//
//        let movie = FavoriteMoviesViewController.movies[indexPath.row]
//        let title = movie["title"] as! String
//        let synopsis = movie["overview"] as! String
//
//        cell.titleLabel.text = title
//        cell.synopsisLabel.text = synopsis
//
//        let baseUrl = "https://image.tmdb.org/t/p/w185"
//        let posterPath = movie["poster_path"] as! String
//        let posterUrl = URL(string: baseUrl + posterPath)
//
//        cell.posterView.af_setImage(withURL: posterUrl!)
//
//        return cell
//    }
//
//    /*
//    // MARK: - Navigation
//
//    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        // Get the new view controller using segue.destination.
//        // Pass the selected object to the new view controller.
//    }
//    */
//
//}
