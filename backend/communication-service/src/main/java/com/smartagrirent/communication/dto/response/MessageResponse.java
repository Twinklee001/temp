package com.smartagrirent.communication.dto.response;

import lombok.*;

import java.time.OffsetDateTime;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class MessageResponse {
    private Long messageId;
    private Integer conversationId;
    private Integer senderId;
    private String senderName;
    private String content;
    private String attachmentUrl;
    private String time;
    private OffsetDateTime createdAt;
}
