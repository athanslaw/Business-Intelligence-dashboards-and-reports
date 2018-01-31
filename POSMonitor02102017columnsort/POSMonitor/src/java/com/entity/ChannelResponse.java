
package com.entity;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

@Entity
@Table(name = "channel_response")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "ChannelResponse.findAll", query = "SELECT c FROM ChannelResponse c")
    , @NamedQuery(name = "ChannelResponse.findById", query = "SELECT c FROM ChannelResponse c WHERE c.id = :id")
    , @NamedQuery(name = "ChannelResponse.findByFeedType", query = "SELECT c FROM ChannelResponse c WHERE c.feedType = :feedType ORDER BY c.transactionTimestamp DESC")
    , @NamedQuery(name = "ChannelResponse.findByFeedMessageCode", query = "SELECT c FROM ChannelResponse c WHERE c.feedMessageCode = :feedMessageCode ORDER BY c.transactionTimestamp DESC")
    , @NamedQuery(name = "ChannelResponse.findByFeedMessageVersion", query = "SELECT c FROM ChannelResponse c WHERE c.feedMessageVersion = :feedMessageVersion ORDER BY c.transactionTimestamp DESC")
    , @NamedQuery(name = "ChannelResponse.findByFeedTimestamp", query = "SELECT c FROM ChannelResponse c WHERE c.feedTimestamp = :feedTimestamp ORDER BY c.transactionTimestamp DESC")
    , @NamedQuery(name = "ChannelResponse.findByClearingPeriod", query = "SELECT c FROM ChannelResponse c WHERE c.clearingPeriod = :clearingPeriod ORDER BY c.transactionTimestamp DESC")
    , @NamedQuery(name = "ChannelResponse.findByTransactionId", query = "SELECT c FROM ChannelResponse c WHERE c.transactionId = :transactionId ORDER BY c.transactionTimestamp DESC")
    , @NamedQuery(name = "ChannelResponse.findByChannelMessageCode", query = "SELECT c FROM ChannelResponse c WHERE c.channelMessageCode = :channelMessageCode ORDER BY c.transactionTimestamp DESC")
    , @NamedQuery(name = "ChannelResponse.findByAuthResponseCode", query = "SELECT c FROM ChannelResponse c WHERE c.authResponseCode = :authResponseCode ORDER BY c.transactionTimestamp DESC")
    , @NamedQuery(name = "ChannelResponse.findByAuthResponseIdentifier", query = "SELECT c FROM ChannelResponse c WHERE c.authResponseIdentifier = :authResponseIdentifier ORDER BY c.transactionTimestamp DESC")
    , @NamedQuery(name = "ChannelResponse.findByFwdInstitutionIdCode", query = "SELECT c FROM ChannelResponse c WHERE c.fwdInstitutionIdCode = :fwdInstitutionIdCode ORDER BY c.transactionTimestamp DESC")
    , @NamedQuery(name = "ChannelResponse.findByTransactionTimestamp", query = "SELECT c FROM ChannelResponse c WHERE c.transactionTimestamp = :transactionTimestamp ORDER BY c.transactionTimestamp DESC")
    , @NamedQuery(name = "ChannelResponse.findByTransactionAmount", query = "SELECT c FROM ChannelResponse c WHERE c.transactionAmount = :transactionAmount ORDER BY c.transactionTimestamp DESC")
    , @NamedQuery(name = "ChannelResponse.findByAmountSignal", query = "SELECT c FROM ChannelResponse c WHERE c.amountSignal = :amountSignal ORDER BY c.transactionTimestamp DESC")
    , @NamedQuery(name = "ChannelResponse.findByBankCode", query = "SELECT c FROM ChannelResponse c WHERE c.bankCode = :bankCode ORDER BY c.transactionTimestamp DESC")
    , @NamedQuery(name = "ChannelResponse.findByPrimaryAccountNumber", query = "SELECT c FROM ChannelResponse c WHERE c.primaryAccountNumber = :primaryAccountNumber ORDER BY c.transactionTimestamp DESC")
    , @NamedQuery(name = "ChannelResponse.findByPaymentSystem", query = "SELECT c FROM ChannelResponse c WHERE c.paymentSystem = :paymentSystem ORDER BY c.transactionTimestamp DESC")
    , @NamedQuery(name = "ChannelResponse.findByCallHomeInformation", query = "SELECT c FROM ChannelResponse c WHERE c.t11CallHomeInformation = :t11CallHomeInformation ORDER BY c.transactionTimestamp DESC")
    , @NamedQuery(name = "ChannelResponse.findByCallHomeInformationOne", query = "SELECT c FROM ChannelResponse c WHERE c.t11CallHomeInformation LIKE :t11CallHomeInformation ORDER BY c.transactionTimestamp DESC")
    , @NamedQuery(name = "ChannelResponse.findByCallHomeInformationBoth", query = "SELECT c FROM ChannelResponse c WHERE c.t11CallHomeInformation LIKE :t11CallHomeInformation1 OR c.t11CallHomeInformation LIKE :t11CallHomeInformation2 ORDER BY c.transactionTimestamp DESC")
    , @NamedQuery(name = "ChannelResponse.findByT12PosCommServProvider", query = "SELECT c FROM ChannelResponse c WHERE c.t12PosCommServProvider = :t12PosCommServProvider ORDER BY c.transactionTimestamp DESC")})
public class ChannelResponse implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(name = "FEED_TYPE")
    private String feedType;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(name = "FEED_MESSAGE_CODE")
    private String feedMessageCode;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(name = "FEED_MESSAGE_VERSION")
    private String feedMessageVersion;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(name = "FEED_TIMESTAMP")
    private String feedTimestamp;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(name = "CLEARING_PERIOD")
    private String clearingPeriod;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(name = "TRANSACTION_ID")
    private String transactionId;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(name = "EBMS_TRANSACTION_TAG")
    private String ebmsTransactionTag;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(name = "CHANNEL_MESSAGE_CODE")
    private String channelMessageCode;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(name = "EPMS_RESPONSE_CODE")
    private String epmsResponseCode;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(name = "A041_CARD_ACCEPTOR_TERMINAL_ID")
    private String a041CardAcceptorTerminalId;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(name = "AUTH_RESPONSE_CODE")
    private String authResponseCode;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(name = "AUTH_RESPONSE_IDENTIFIER")
    private String authResponseIdentifier;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(name = "FWD_INSTITUTION_ID_CODE")
    private String fwdInstitutionIdCode;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(name = "TRANSACTION_TIMESTAMP")
    private String transactionTimestamp;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(name = "TRANSACTION_AMOUNT")
    private String transactionAmount;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(name = "AMOUNT_SIGNAL")
    private String amountSignal;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(name = "EPMS_TERMINAL_ID")
    private String epmsTerminalId;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(name = "BANK_CODE")
    private String bankCode;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(name = "PRIMARY_ACCOUNT_NUMBER")
    private String primaryAccountNumber;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(name = "CIPHER_DATA_KEY_INDEX")
    private String cipherDataKeyIndex;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(name = "CARD_EXPIRATION_DATE")
    private String cardExpirationDate;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(name = "PAYMENT_SYSTEM")
    private String paymentSystem;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(name = "EPMS_DECISION_SCENARIO")
    private String epmsDecisionScenario;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(name = "T11_CALL_HOME_INFORMATION")
    private String t11CallHomeInformation;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(name = "T12_POS_COMM_SERV_PROVIDER")
    private String t12PosCommServProvider;

    public ChannelResponse() {
    }

    public ChannelResponse(Integer id) {
        this.id = id;
    }

    public ChannelResponse(Integer id, String feedType, String feedMessageCode, String feedMessageVersion, String feedTimestamp, String clearingPeriod, String transactionId, String ebmsTransactionTag, String channelMessageCode, String epmsResponseCode, String a041CardAcceptorTerminalId, String authResponseCode, String authResponseIdentifier, String fwdInstitutionIdCode, String transactionTimestamp, String transactionAmount, String amountSignal, String epmsTerminalId, String bankCode, String primaryAccountNumber, String cipherDataKeyIndex, String cardExpirationDate, String paymentSystem, String epmsDecisionScenario, String t11CallHomeInformation, String t12PosCommServProvider) {
        this.id = id;
        this.feedType = feedType;
        this.feedMessageCode = feedMessageCode;
        this.feedMessageVersion = feedMessageVersion;
        this.feedTimestamp = feedTimestamp;
        this.clearingPeriod = clearingPeriod;
        this.transactionId = transactionId;
        this.ebmsTransactionTag = ebmsTransactionTag;
        this.channelMessageCode = channelMessageCode;
        this.epmsResponseCode = epmsResponseCode;
        this.a041CardAcceptorTerminalId = a041CardAcceptorTerminalId;
        this.authResponseCode = authResponseCode;
        this.authResponseIdentifier = authResponseIdentifier;
        this.fwdInstitutionIdCode = fwdInstitutionIdCode;
        this.transactionTimestamp = transactionTimestamp;
        this.transactionAmount = transactionAmount;
        this.amountSignal = amountSignal;
        this.epmsTerminalId = epmsTerminalId;
        this.bankCode = bankCode;
        this.primaryAccountNumber = primaryAccountNumber;
        this.cipherDataKeyIndex = cipherDataKeyIndex;
        this.cardExpirationDate = cardExpirationDate;
        this.paymentSystem = paymentSystem;
        this.epmsDecisionScenario = epmsDecisionScenario;
        this.t11CallHomeInformation = t11CallHomeInformation;
        this.t12PosCommServProvider = t12PosCommServProvider;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getFeedType() {
        return feedType;
    }

    public void setFeedType(String feedType) {
        this.feedType = feedType;
    }

    public String getFeedMessageCode() {
        return feedMessageCode;
    }

    public void setFeedMessageCode(String feedMessageCode) {
        this.feedMessageCode = feedMessageCode;
    }

    public String getFeedMessageVersion() {
        return feedMessageVersion;
    }

    public void setFeedMessageVersion(String feedMessageVersion) {
        this.feedMessageVersion = feedMessageVersion;
    }

    public String getFeedTimestamp() {
        return feedTimestamp;
    }

    public void setFeedTimestamp(String feedTimestamp) {
        this.feedTimestamp = feedTimestamp;
    }

    public String getClearingPeriod() {
        return clearingPeriod;
    }

    public void setClearingPeriod(String clearingPeriod) {
        this.clearingPeriod = clearingPeriod;
    }

    public String getTransactionId() {
        return transactionId;
    }

    public void setTransactionId(String transactionId) {
        this.transactionId = transactionId;
    }

    public String getEbmsTransactionTag() {
        return ebmsTransactionTag;
    }

    public void setEbmsTransactionTag(String ebmsTransactionTag) {
        this.ebmsTransactionTag = ebmsTransactionTag;
    }

    public String getChannelMessageCode() {
        return channelMessageCode;
    }

    public void setChannelMessageCode(String channelMessageCode) {
        this.channelMessageCode = channelMessageCode;
    }

    public String getEpmsResponseCode() {
        return epmsResponseCode;
    }

    public void setEpmsResponseCode(String epmsResponseCode) {
        this.epmsResponseCode = epmsResponseCode;
    }

    public String getA041CardAcceptorTerminalId() {
        return a041CardAcceptorTerminalId;
    }

    public void setA041CardAcceptorTerminalId(String a041CardAcceptorTerminalId) {
        this.a041CardAcceptorTerminalId = a041CardAcceptorTerminalId;
    }

    public String getAuthResponseCode() {
        return authResponseCode;
    }

    public void setAuthResponseCode(String authResponseCode) {
        this.authResponseCode = authResponseCode;
    }

    public String getAuthResponseIdentifier() {
        return authResponseIdentifier;
    }

    public void setAuthResponseIdentifier(String authResponseIdentifier) {
        this.authResponseIdentifier = authResponseIdentifier;
    }

    public String getFwdInstitutionIdCode() {
        return fwdInstitutionIdCode;
    }

    public void setFwdInstitutionIdCode(String fwdInstitutionIdCode) {
        this.fwdInstitutionIdCode = fwdInstitutionIdCode;
    }

    public String getTransactionTimestamp() {
        return transactionTimestamp;
    }

    public void setTransactionTimestamp(String transactionTimestamp) {
        this.transactionTimestamp = transactionTimestamp;
    }

    public String getTransactionAmount() {
        return transactionAmount;
    }

    public void setTransactionAmount(String transactionAmount) {
        this.transactionAmount = transactionAmount;
    }

    public String getAmountSignal() {
        return amountSignal;
    }

    public void setAmountSignal(String amountSignal) {
        this.amountSignal = amountSignal;
    }

    public String getEpmsTerminalId() {
        return epmsTerminalId;
    }

    public void setEpmsTerminalId(String epmsTerminalId) {
        this.epmsTerminalId = epmsTerminalId;
    }

    public String getBankCode() {
        return bankCode;
    }

    public void setBankCode(String bankCode) {
        this.bankCode = bankCode;
    }

    public String getPrimaryAccountNumber() {
        return primaryAccountNumber;
    }

    public void setPrimaryAccountNumber(String primaryAccountNumber) {
        this.primaryAccountNumber = primaryAccountNumber;
    }

    public String getCipherDataKeyIndex() {
        return cipherDataKeyIndex;
    }

    public void setCipherDataKeyIndex(String cipherDataKeyIndex) {
        this.cipherDataKeyIndex = cipherDataKeyIndex;
    }

    public String getCardExpirationDate() {
        return cardExpirationDate;
    }

    public void setCardExpirationDate(String cardExpirationDate) {
        this.cardExpirationDate = cardExpirationDate;
    }

    public String getPaymentSystem() {
        return paymentSystem;
    }

    public void setPaymentSystem(String paymentSystem) {
        this.paymentSystem = paymentSystem;
    }

    public String getEpmsDecisionScenario() {
        return epmsDecisionScenario;
    }

    public void setEpmsDecisionScenario(String epmsDecisionScenario) {
        this.epmsDecisionScenario = epmsDecisionScenario;
    }

    public String getT11CallHomeInformation() {
        return t11CallHomeInformation;
    }

    public void setT11CallHomeInformation(String t11CallHomeInformation) {
        this.t11CallHomeInformation = t11CallHomeInformation;
    }

    public String getT12PosCommServProvider() {
        return t12PosCommServProvider;
    }

    public void setT12PosCommServProvider(String t12PosCommServProvider) {
        this.t12PosCommServProvider = t12PosCommServProvider;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof ChannelResponse)) {
            return false;
        }
        ChannelResponse other = (ChannelResponse) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.entity.ChannelResponse[ id=" + id + " ]";
    }
    
}
