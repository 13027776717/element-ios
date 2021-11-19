// File created from SimpleUserProfileExample
// $ createScreen.sh Room/PollTimeline PollTimeline
/*
 Copyright 2021 New Vector Ltd
 
 Licensed under the Apache License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at
 
 http://www.apache.org/licenses/LICENSE-2.0
 
 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.
 */

import Foundation
import UIKit
import SwiftUI
import MatrixSDK

struct PollTimelineCoordinatorParameters {
    let session: MXSession
    let room: MXRoom
    let pollStartEvent: MXEvent
}

final class PollTimelineCoordinator: Coordinator, PollAggregatorDelegate {
    
    // MARK: - Properties
    
    // MARK: Private
    
    private let parameters: PollTimelineCoordinatorParameters
    
    private var pollAggregator: PollAggregator
    private var _pollTimelineViewModel: Any? = nil
    private var pollTimelineHostingController: UIViewController!
    
    @available(iOS 14.0, *)
    fileprivate var pollTimelineViewModel: PollTimelineViewModel {
        return _pollTimelineViewModel as! PollTimelineViewModel
    }
    
    // MARK: Public

    // Must be used only internally
    var childCoordinators: [Coordinator] = []
    
    // MARK: - Setup
    
    @available(iOS 14.0, *)
    init(parameters: PollTimelineCoordinatorParameters) throws {
        self.parameters = parameters
        
        try pollAggregator = PollAggregator(session: parameters.session, room: parameters.room, pollStartEvent: parameters.pollStartEvent)
        let viewModel = PollTimelineViewModel(timelinePoll: mapPoll(pollAggregator.poll))
        let view = PollTimeline(viewModel: viewModel.context)
            
        _pollTimelineViewModel = viewModel
        pollTimelineHostingController = VectorHostingController(rootView: view)
    }
    
    // MARK: - Public
    func start() {
        
    }
    
    func toPresentable() -> UIViewController {
        return self.pollTimelineHostingController
    }
    
    // MARK: - PollAggregatorDelegate
    
    func pollAggregatorDidUpdateData(_ aggregator: PollAggregator) {
        
    }
    
    func pollAggregatorDidStartLoading(_ aggregator: PollAggregator) {
        
    }
    
    func pollAggregatorDidEndLoading(_ aggregator: PollAggregator) {
        
    }
    
    func pollAggregator(_ aggregator: PollAggregator, didFailWithError: Error) {
        
    }
    
    // MARK: - Private
    
    func mapPoll(_ poll: PollProtocol) -> TimelinePoll {
        let answerOptions = poll.answerOptions.map { pollAnswerOption in
            PollTimelineAnswerOption(text: pollAnswerOption.text,
                                     count: pollAnswerOption.count,
                                     winner: pollAnswerOption.isWinner,
                                     selected: pollAnswerOption.isCurrentUserSelection)
        }
        
        return TimelinePoll(question: poll.text,
                            answerOptions: answerOptions,
                            closed: poll.isClosed,
                            totalAnswerCount: poll.totalAnswerCount)
    }
}
