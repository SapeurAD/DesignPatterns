//: [Previous](@previous)

// Existing Interface
protocol OldMediaPlayerInterface {
    func insertCD(title: String)
    func play()
}

// Existing realisation
class OldMediaPlayer: OldMediaPlayerInterface {
    func insertCD(title: String) {
        print("Inserting \(title) CD")
    }
    
    func play() {
        print("Playing track from CD")
    }
}

// New interface
protocol NewMediaPlayerInterface {
    func getMedia(title: String)
    func playMedia()
}

// New realisation
class NewMediaPlayer: NewMediaPlayerInterface {
    func getMedia(title: String) {
        print("Downloading \(title) from the cloud")
    }
    
    func playMedia() {
        print("Playing track from the cloud")
    }
}

// Adapter
class MediaPlayerAdapter: OldMediaPlayerInterface {
    
    private let mediaPlayer: NewMediaPlayer
    
    init(mediaPlayer: NewMediaPlayer) {
        self.mediaPlayer = mediaPlayer
    }
    
    func insertCD(title: String) {
        mediaPlayer.getMedia(title: title)
    }
    
    func play() {
        mediaPlayer.playMedia()
    }
}

// Demo
let mediaPlayerAdapter = MediaPlayerAdapter(mediaPlayer: NewMediaPlayer())
mediaPlayerAdapter.insertCD(title: "Skrillex")
mediaPlayerAdapter.play()

//: [Next](@next)
