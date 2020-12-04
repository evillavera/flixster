//
//  MovieDetailsViewController.swift
//  flixster
//
//  Created by Erik Villavera on 11/20/20.
//

import UIKit
import AlamofireImage
import AVFoundation
class MovieDetailsViewController: UIViewController {
    //let favoriteMoviesViewController = FavoriteMoviesViewController()
    
    @IBOutlet weak var backdropView: UIImageView!
    @IBOutlet weak var posterView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var synopsisLabel: UILabel!
    
    @IBAction func transition(_ sender: UITapGestureRecognizer) {
        print("Tapped!")
    }

    func handleTap(sender: UIView){
        print("Tap gesture")
    }

    var movie: [String:Any]!
    
    var audioPlayer = AVAudioPlayer()

    override func viewDidLoad() {
        super.viewDidLoad()

        titleLabel.text = movie["title"] as? String
        synopsisLabel.text = movie["overview"] as? String

        titleLabel.sizeToFit()
        synopsisLabel.sizeToFit()

        let sound = Bundle.main.path(forResource: "Blop", ofType: "mp3")
        
        do{
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
        }catch{
            print("Unable to play sound")
        }
        
//        posterView.isUserInteractionEnabled = true
//
//        var tapGesture = UITapGestureRecognizer(target: self, action: Selector("handleTap:"))
//
//        self.view.addGestureRecognizer(tapGesture)


        let baseUrl = "https://image.tmdb.org/t/p/w185"
        let posterPath = movie["poster_path"] as! String
        let posterUrl = URL(string: baseUrl + posterPath)

        posterView.af_setImage(withURL: posterUrl!)

        let backdropPath = movie["backdrop_path"] as! String
        let backdropUrl = URL(string: "https://image.tmdb.org/t/p/w780" + backdropPath)

        backdropView.af_setImage(withURL: backdropUrl!)

    }
    
    @IBAction func favoriteButton(_ sender: Any) {
//        print("Favorited! Movies List about to be posted")
//        print(favoriteMoviesViewController.movies)
//        favoriteMoviesViewController.movies.append(movie)
//        print("New list")
//        print(favoriteMoviesViewController.movies)
//        favoriteMoviesViewController.reloadData()
        
        //movies do append
//        for favMovie in FavoriteMoviesViewController.movies {
//            if favMovie == movie {
//                FavoriteMoviesViewController.movies.remove(at: <#T##Int#>)
//            }
//        }
        
        //FavoriteMoviesViewController.movies = FavoriteMoviesViewController.movies.filter {$0 != movie}
        
        
        //AVAudioPlayer
        audioPlayer.play()
        
        //UIView Animation
        let newButtonWidth: CGFloat = 60
        let offScreenDestX: CGFloat = 350
        let offScreenDestY: CGFloat = 850
        
        UIView.animate(withDuration: 2.0){
            self.posterView.frame = CGRect(x: 0, y: 0, width: newButtonWidth, height: newButtonWidth)
            //self.posterView.center = self.view.center
        }
        
        UIView.animate(withDuration: 2.0) {
            self.posterView.center = CGPoint(x: offScreenDestX, y: offScreenDestY)
        }
        
        FavoriteMoviesViewController.movies.append(movie)
        
        //need this to reload the data in FavoriteMoviesViewController
        let notificationNme = NSNotification.Name("NotificationIdf")
        NotificationCenter.default.post(name: notificationNme, object: nil)
    }
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        print("Loading WebView")

        //Find the selected movie
//        let cell = sender as! UITableViewCell
//        let indexPath = tableView.indexPath(for: cell)!
//        let movie = movies[indexPath.row]

        //Pass the selected movie to the Details VC

        let webViewController = segue.destination as! WebViewViewController

        webViewController.movie = self.movie


    }


}


//
//  MovieDetailsViewController.swift
//  flixster
//
//  Created by Erik Villavera on 11/20/20.
//
//import UIKit
//import AlamofireImage
//class MovieDetailsViewController: UIViewController {
//
//    @IBOutlet weak var backdropView: UIImageView!
//    @IBOutlet weak var posterView: UIImageView!
//    @IBOutlet weak var titleLabel: UILabel!
//    @IBOutlet weak var synopsisLabel: UILabel!
//
//    var movie: [String:Any]!
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        titleLabel.text = movie["title"] as? String
//        synopsisLabel.text = movie["overview"] as? String
//
//        titleLabel.sizeToFit()
//        synopsisLabel.sizeToFit()
//
//        let baseUrl = "https://image.tmdb.org/t/p/w185"
//        let posterPath = movie["poster_path"] as! String
//        let posterUrl = URL(string: baseUrl + posterPath)
//
//        posterView.af_setImage(withURL: posterUrl!)
//
//        let backdropPath = movie["backdrop_path"] as! String
//        let backdropUrl = URL(string: "https://image.tmdb.org/t/p/w780" + backdropPath)
//
//        backdropView.af_setImage(withURL: backdropUrl!)
//
//    }
//
//
//    /*
//    // MARK: - Navigation
//    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        // Get the new view controller using segue.destination.
//        // Pass the selected object to the new view controller.
//    }
//    */
//
//}
