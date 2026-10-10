package com.smartagrirent.communication.dto.response;

import lombok.*;

import java.time.OffsetDateTime;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class NotificationResponse {
    private Long notificationId;
    private Integer userId;
    private String title;
    private String content;
    private Boolean isRead;
    private OffsetDateTime createdAt;
}
