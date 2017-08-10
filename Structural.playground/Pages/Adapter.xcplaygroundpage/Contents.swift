
// Existing Interface
protocol OldMediaPlayer {
    func insertGramophoneRecord(title: String)
    func play()
}

enum RecordType {
    case gram, cd
}

// Existing realisation
class Gramophone: OldMediaPlayer {
    func insertGramophoneRecord(title: String) {
        print("Inserting \(title) Gramophone Record")
    }
    
    func play() {
        print("Playing song from Gramophone Record")
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
        print("Playing track from CD")
    }
}


// Adapter
class MediaAdapter: OldMediaPlayer {
    
    private let mediaPlayer: CDPlayer
    
    init(mediaPlayer: CDPlayer) {
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
let adaptedMediaPlayer = MediaAdapter(mediaPlayer: CDPlayer())

adaptedMediaPlayer.insertGramophoneRecord(title: "[Sia - Elastic Heart]")

adaptedMediaPlayer.play()


// переделать адаптер - генерик на вход + проверка