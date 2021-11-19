// File created from SimpleUserProfileExample
// $ createScreen.sh Room/PollTimeline PollTimeline
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

import SwiftUI
import Combine

@available(iOS 14, *)
typealias PollTimelineViewModelType = StateStoreViewModel< PollTimelineViewState,
                                                           PollTimelineStateAction,
                                                           PollTimelineViewAction >
@available(iOS 14, *)
class PollTimelineViewModel: PollTimelineViewModelType {
    
    // MARK: - Properties

    // MARK: Private
    
    // MARK: Public
    
    // MARK: - Setup
    
    init(timelinePoll: TimelinePoll) {
        super.init(initialViewState: PollTimelineViewState(poll: timelinePoll))
    }
    
//    private static func defaultState() -> PollTimelineViewState {
//        
//        let answerOptions = [PollTimelineAnswerOption(text: "First", count: 5, winner: false, selected: true),
//                             PollTimelineAnswerOption(text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.", count: 15, winner: true, selected: false),
//                             PollTimelineAnswerOption(text: "Third", count: 10, winner: false, selected: false)]
//        
//        let poll = TimelinePoll(question: "Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
//                                answerOptions: answerOptions,
//                                isClosed: false,
//                                totalAnswerCount: 30)
//        
//        return PollTimelineViewState(poll: poll)
//    }
    
    // MARK: - Public
    
    override func process(viewAction: PollTimelineViewAction) {
        dispatch(action: .viewAction(viewAction))
    }
    
    override class func reducer(state: inout PollTimelineViewState, action: PollTimelineStateAction) {
        switch action {
        case .viewAction(let viewAction):
            switch viewAction {
            case .selectAnswerOption(_):
                break
            default:
                break
            }
        }
    }
}
