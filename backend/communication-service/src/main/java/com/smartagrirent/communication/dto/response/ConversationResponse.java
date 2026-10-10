package com.smartagrirent.communication.dto.response;

import com.smartagrirent.communication.constant.ConversationStatus;
import com.smartagrirent.communication.constant.ConversationType;
import lombok.*;

import java.time.OffsetDateTime;
import java.util.List;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ConversationResponse {
    private Integer conversationId;
    private Integer participantOne;
    private Integer participantTwo;
    private Integer rentalId;
    private Integer plotId;
    private ConversationType type;
    private ConversationStatus status;
    private OffsetDateTime createdAt;
    private MessageResponse lastMessage;
    private List<MessageResponse> messages;
}
