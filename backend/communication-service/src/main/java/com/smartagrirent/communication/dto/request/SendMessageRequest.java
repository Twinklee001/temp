package com.smartagrirent.communication.dto.request;

import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class SendMessageRequest {
    private Integer conversationId;
    private Integer senderId;
    private String senderName;
    private String content;
    private String attachmentUrl;
}
