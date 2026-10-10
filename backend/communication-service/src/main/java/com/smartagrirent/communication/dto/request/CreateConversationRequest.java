package com.smartagrirent.communication.dto.request;

import com.smartagrirent.communication.constant.ConversationType;
import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class CreateConversationRequest {
    private Integer participantOne;
    private Integer participantTwo;
    private Integer rentalId;
    private Integer plotId;
    private ConversationType type;
}
