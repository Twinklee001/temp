package com.smartagrirent.payment.dto.request;

import java.math.BigDecimal;

public class CardPaymentRequest {
    private Integer contractId;
    private Integer serviceRequestId;
    private BigDecimal amount;
    private String cardNumber;
    private String cardHolder;
    private String expiryDate;
    private String cvv;
    private String cardType; // VISA, MASTERCARD, NAPAS_ATM
    private String plotCode;
    private String customerName;

    public CardPaymentRequest() {
    }

    public CardPaymentRequest(Integer contractId, Integer serviceRequestId, BigDecimal amount,
                              String cardNumber, String cardHolder, String expiryDate, String cvv,
                              String cardType, String plotCode, String customerName) {
        this.contractId = contractId;
        this.serviceRequestId = serviceRequestId;
        this.amount = amount;
        this.cardNumber = cardNumber;
        this.cardHolder = cardHolder;
        this.expiryDate = expiryDate;
        this.cvv = cvv;
        this.cardType = cardType;
        this.plotCode = plotCode;
        this.customerName = customerName;
    }

    public Integer getContractId() {
        return contractId;
    }

    public void setContractId(Integer contractId) {
        this.contractId = contractId;
    }

    public Integer getServiceRequestId() {
        return serviceRequestId;
    }

    public void setServiceRequestId(Integer serviceRequestId) {
        this.serviceRequestId = serviceRequestId;
    }

    public BigDecimal getAmount() {
        return amount;
    }

    public void setAmount(BigDecimal amount) {
        this.amount = amount;
    }

    public String getCardNumber() {
        return cardNumber;
    }

    public void setCardNumber(String cardNumber) {
        this.cardNumber = cardNumber;
    }

    public String getCardHolder() {
        return cardHolder;
    }

    public void setCardHolder(String cardHolder) {
        this.cardHolder = cardHolder;
    }

    public String getExpiryDate() {
        return expiryDate;
    }

    public void setExpiryDate(String expiryDate) {
        this.expiryDate = expiryDate;
    }

    public String getCvv() {
        return cvv;
    }

    public void setCvv(String cvv) {
        this.cvv = cvv;
    }

    public String getCardType() {
        return cardType;
    }

    public void setCardType(String cardType) {
        this.cardType = cardType;
    }

    public String getPlotCode() {
        return plotCode;
    }

    public void setPlotCode(String plotCode) {
        this.plotCode = plotCode;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }
}
