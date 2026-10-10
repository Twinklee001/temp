package com.smartagrirent.payment.service;

import com.smartagrirent.payment.dto.request.CardPaymentRequest;
import com.smartagrirent.payment.dto.request.VietQrGenerateRequest;
import com.smartagrirent.payment.dto.response.PaymentResponse;
import com.smartagrirent.payment.dto.response.VietQrResponse;

import java.util.List;

public interface PaymentService {
    VietQrResponse generateVietQr(VietQrGenerateRequest request);
    PaymentResponse confirmPayment(Integer transactionId);
    PaymentResponse processCardPayment(CardPaymentRequest request);
    PaymentResponse getTransactionById(Integer transactionId);
    List<PaymentResponse> getAllTransactions();
}
