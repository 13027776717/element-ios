// 
// Copyright 2021 New Vector Ltd
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//

import Foundation
import Combine

@available(iOS 14.0, *)
class TemplateRoomListService: TemplateRoomListServiceProtocol {
    
    // MARK: - Properties
    
    // MARK: Private
    
    private let session: MXSession
    private var listenerReference: Any?
    
    // MARK: Public
    private(set) var roomsSubject: CurrentValueSubject<[TemplateRoomListRoom], Never>
    
    // MARK: - Setup
    
    init(session: MXSession) {
        self.session = session
        
        let unencryptedRooms = session.rooms
            .filter({ !$0.summary.isEncrypted })
            .map(TemplateRoomListRoom.init(mxRoom:))
        self.roomsSubject = CurrentValueSubject(unencryptedRooms)
    }

}

fileprivate extension TemplateRoomListRoom {
    
    init(mxRoom: MXRoom) {
        self.init(id: mxRoom.roomId, avatar: mxRoom.avatarData, displayName: mxRoom.summary.displayname)
    }
}
