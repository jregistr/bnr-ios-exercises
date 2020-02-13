//
// Created by Registre, Jeff on 2/11/20.
// Copyright (c) 2020 jregistr. All rights reserved.
//

import Foundation

class Downloader {
    let session: URLSession
    let downloadTask: URLSessionTask?

    var things = 10223 {
        didSet (oldValue) {
            print("Old Value was: \(oldValue)")
        }

        willSet (incomingValue) {
            print("Looks like things are a changing")
        }

    }

    init(sess: URLSession, downTask: URLSessionTask) {
        session = sess
        downloadTask = downTask
    }

    deinit {
        downloadTask?.cancel()
    }
}