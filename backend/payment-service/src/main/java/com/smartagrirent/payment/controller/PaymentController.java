package com.smartagrirent.payment.controller;

import com.smartagrirent.payment.dto.request.VietQrGenerateRequest;
import com.smartagrirent.payment.dto.response.ApiResponse;
import com.smartagrirent.payment.dto.response.PaymentResponse;
import com.smartagrirent.payment.dto.response.VietQrResponse;
import com.smartagrirent.payment.service.PaymentService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/v1/payments")
@Tag(name = "Payment & VietQR API", description = "Endpoints for VietQR code generation and payment transaction ledger")
public class PaymentController {

    private final PaymentService paymentService;

    public PaymentController(PaymentService paymentService) {
        this.paymentService = paymentService;
    }

    @PostMapping("/vietqr/generate")
    @Operation(summary = "Generate VietQR payment code and record PENDING transaction in PostgreSQL")
    public ApiResponse<VietQrResponse> generateVietQr(@RequestBody VietQrGenerateRequest request) {
        VietQrResponse response = paymentService.generateVietQr(request);
        return ApiResponse.ok("Khởi tạo mã VietQR thanh toán thành công", response);
    }

    @PostMapping("/{transactionId}/confirm")
    @Operation(summary = "Confirm payment completion and mark transaction as SUCCESS in PostgreSQL")
    public ApiResponse<PaymentResponse> confirmPayment(@PathVariable("transactionId") Integer transactionId) {
        PaymentResponse response = paymentService.confirmPayment(transactionId);
        return ApiResponse.ok("Xác nhận thanh toán thành công", response);
    }

    @GetMapping("/{transactionId}")
    @Operation(summary = "Get payment transaction details by ID")
    public ApiResponse<PaymentResponse> getTransactionById(@PathVariable("transactionId") Integer transactionId) {
        PaymentResponse response = paymentService.getTransactionById(transactionId);
        return ApiResponse.ok(response);
    }

    @GetMapping
    @Operation(summary = "Get all payment transactions in PostgreSQL ledger")
    public ApiResponse<List<PaymentResponse>> getAllTransactions() {
        List<PaymentResponse> list = paymentService.getAllTransactions();
        return ApiResponse.ok(list);
    }
}
