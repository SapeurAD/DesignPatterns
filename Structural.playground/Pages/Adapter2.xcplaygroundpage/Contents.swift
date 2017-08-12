
// Existing Interface
protocol OldMediaPlayer {
    func insertGramophoneRecord(title: String)
    func play()
}

// Existing realisation
class Gramophone: OldMediaPlayer {
    func insertGramophoneRecord(title: String) {
        print("Inserting \(title) Gramophone Record")
    }
    
    func play() {
        print("Pressing 'Play' lever on gramophone")
    }
}


// New interface
protocol NewMediaPlayer {
    func insertCD(title: String)
    func playCD()
}

// New realisation
class CDPlayer: NewMediaPlayer {
    func insertCD(title: String) {
        print("Inserting \(title) CD")
    }
    
    func playCD() {
        print("Pressing 'Play' button on CD-player")
    }
}


// Adapter
class MediaAdapter: NewMediaPlayer {
    
    private let mediaPlayer: Gramophone
    
    init(mediaPlayer: Gramophone) {
        self.mediaPlayer = mediaPlayer
    }
    
    func insertCD(title: String) {
        mediaPlayer.insertGramophoneRecord(title: title)
    }
    
    func playCD() {
        mediaPlayer.play()
    }
}


// Demo
let actualPlayer = CDPlayer()
let adaptedMediaPlayer = MediaAdapter(mediaPlayer: Gramophone())

var list: [NewMediaPlayer] = []
list.append(actualPlayer)
list.append(adaptedMediaPlayer)

for player in list {
    player.insertCD(title: "[Elvis Presley - Elastic Heart]")
    player.playCD()
}
