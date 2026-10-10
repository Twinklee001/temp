package com.smartagrirent.payment.service.impl;

import com.smartagrirent.payment.constant.PaymentStatus;
import com.smartagrirent.payment.constant.TransactionType;
import com.smartagrirent.payment.dto.request.VietQrGenerateRequest;
import com.smartagrirent.payment.dto.response.PaymentResponse;
import com.smartagrirent.payment.dto.response.VietQrResponse;
import com.smartagrirent.payment.entity.PaymentTransaction;
import com.smartagrirent.payment.repository.PaymentTransactionRepository;
import com.smartagrirent.payment.service.PaymentService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class PaymentServiceImpl implements PaymentService {

    private final PaymentTransactionRepository paymentTransactionRepository;

    private static final String DEFAULT_BANK_ID = "ICB"; // VietinBank
    private static final String DEFAULT_BANK_NAME = "VietinBank (Ngân hàng TMCP Công Thương Việt Nam)";
    private static final String DEFAULT_ACCOUNT_NO = "108876543210";
    private static final String DEFAULT_ACCOUNT_NAME = "FARMELY AGRIRENT CORP";

    public PaymentServiceImpl(PaymentTransactionRepository paymentTransactionRepository) {
        this.paymentTransactionRepository = paymentTransactionRepository;
    }

    @Override
    @Transactional
    public VietQrResponse generateVietQr(VietQrGenerateRequest request) {
        String bankId = (request.getBankId() != null && !request.getBankId().isBlank())
                ? request.getBankId().trim()
                : DEFAULT_BANK_ID;

        String accountNo = (request.getAccountNo() != null && !request.getAccountNo().isBlank())
                ? request.getAccountNo().trim()
                : DEFAULT_ACCOUNT_NO;

        String accountName = (request.getAccountName() != null && !request.getAccountName().isBlank())
                ? request.getAccountName().trim()
                : DEFAULT_ACCOUNT_NAME;

        BigDecimal amount = (request.getAmount() != null && request.getAmount().compareTo(BigDecimal.ZERO) > 0)
                ? request.getAmount()
                : new BigDecimal("1800000.00");

        long timestamp = System.currentTimeMillis();
        String gatewayRef = "VQR_" + (timestamp % 10000000);

        String description = (request.getDescription() != null && !request.getDescription().isBlank())
                ? request.getDescription().trim()
                : ("FARMELY " + (request.getPlotCode() != null ? request.getPlotCode() : "DAT") + " " + (timestamp % 100000));

        // Save PENDING transaction to PostgreSQL table payment_transactions
        PaymentTransaction transaction = PaymentTransaction.builder()
                .contractId(request.getContractId())
                .serviceRequestId(request.getServiceRequestId())
                .type(TransactionType.PAYMENT)
                .amount(amount)
                .paymentMethod("VIETQR")
                .gatewayRef(gatewayRef)
                .status(PaymentStatus.PENDING)
                .build();

        PaymentTransaction saved = paymentTransactionRepository.save(transaction);

        // Construct VietQR API Quick Image URL
        String encodedDesc = URLEncoder.encode(description, StandardCharsets.UTF_8);
        String encodedName = URLEncoder.encode(accountName, StandardCharsets.UTF_8);
        long amountLong = amount.longValue();

        String qrImageUrl = String.format(
                "https://img.vietqr.io/image/%s-%s-compact2.png?amount=%d&addInfo=%s&accountName=%s",
                bankId, accountNo, amountLong, encodedDesc, encodedName
        );

        String qrQuickLink = String.format(
                "https://vietqr.me/%s/%s/%d/%s",
                bankId, accountNo, amountLong, encodedDesc
        );

        return VietQrResponse.builder()
                .transactionId(saved.getTransactionId())
                .qrImageUrl(qrImageUrl)
                .qrQuickLink(qrQuickLink)
                .amount(saved.getAmount())
                .bankId(bankId)
                .bankName(DEFAULT_BANK_NAME)
                .accountNo(accountNo)
                .accountName(accountName)
                .description(description)
                .gatewayRef(gatewayRef)
                .status(saved.getStatus().name())
                .createdAt(saved.getCreatedAt())
                .build();
    }

    @Override
    @Transactional
    public PaymentResponse confirmPayment(Integer transactionId) {
        PaymentTransaction transaction = paymentTransactionRepository.findById(transactionId)
                .orElseThrow(() -> new RuntimeException("Giao dịch không tồn tại với ID: " + transactionId));

        transaction.setStatus(PaymentStatus.SUCCESS);
        PaymentTransaction updated = paymentTransactionRepository.save(transaction);
        return mapToResponse(updated);
    }

    @Override
    @Transactional(readOnly = true)
    public PaymentResponse getTransactionById(Integer transactionId) {
        PaymentTransaction transaction = paymentTransactionRepository.findById(transactionId)
                .orElseThrow(() -> new RuntimeException("Giao dịch không tồn tại với ID: " + transactionId));
        return mapToResponse(transaction);
    }

    @Override
    @Transactional(readOnly = true)
    public List<PaymentResponse> getAllTransactions() {
        return paymentTransactionRepository.findAllByOrderByCreatedAtDesc().stream()
                .map(this::mapToResponse)
                .collect(Collectors.toList());
    }

    private PaymentResponse mapToResponse(PaymentTransaction tx) {
        return PaymentResponse.builder()
                .transactionId(tx.getTransactionId())
                .contractId(tx.getContractId())
                .serviceRequestId(tx.getServiceRequestId())
                .cancellationRequestId(tx.getCancellationRequestId())
                .type(tx.getType())
                .amount(tx.getAmount())
                .paymentMethod(tx.getPaymentMethod())
                .gatewayRef(tx.getGatewayRef())
                .status(tx.getStatus())
                .createdAt(tx.getCreatedAt())
                .build();
    }
}
