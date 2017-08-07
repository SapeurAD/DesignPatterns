//: [Previous](@previous)

// Existing Interface
protocol OldInterface {
    func insertGramophoneRecord(title: String)
    func play()
}

// Existing realisation
class OldMediaPlayer: OldInterface {
    func insertGramophoneRecord(title: String) {
        print("Inserting \(title) Gramophone Record")
    }
    
    func play() {
        print("Playing song from Gramophone Record")
    }
}

// New interface
protocol NewInterface {
    func insertCD(title: String)
    func playCD()
}

// New realisation
class NewMediaPlayer: NewInterface {
    func insertCD(title: String) {
        print("Inserting \(title) CD")
    }
    
    func playCD() {
        print("Playing track from CD")
    }
}

// Adapter
class OldMediaPlayerAdapter: OldInterface {
    
    private let mediaPlayer: NewMediaPlayer
    
    init(mediaPlayer: NewMediaPlayer) {
        self.mediaPlayer = mediaPlayer
    }
    
    func insertGramophoneRecord(title: String) {
        mediaPlayer.insertCD(title: title)
    }
    
    func play() {
        mediaPlayer.playCD()
    }
}

// Demo
let newMediaPlayer = OldMediaPlayerAdapter(mediaPlayer: NewMediaPlayer())

newMediaPlayer.insertGramophoneRecord(title: "[Eminem - Stan]")
newMediaPlayer.play()

//: [Next](@next)
