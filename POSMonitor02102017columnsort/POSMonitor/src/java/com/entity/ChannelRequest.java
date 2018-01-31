
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
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

@Entity
@Table(name = "channel_request")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "ChannelRequest.findAll", query = "SELECT c FROM ChannelRequest c")
    , @NamedQuery(name = "ChannelRequest.findAllGroupByTerminalId", query = "SELECT c FROM ChannelRequest c GROUP BY c.a041CardAcceptorTerminalId ORDER BY c.feedTimestamp DESC")
    , @NamedQuery(name = "ChannelRequest.findAllDateRange", query = "SELECT c FROM ChannelRequest c WHERE c.feedTimestamp >= :datefrom AND c.feedTimestamp <= :dateto GROUP BY c.a041CardAcceptorTerminalId ORDER BY c.feedTimestamp DESC")
    , @NamedQuery(name = "ChannelRequest.findAllDateRangeCount", query = "SELECT c FROM ChannelRequest c WHERE c.a041CardAcceptorTerminalId = :a041CardAcceptorTerminalId AND c.feedTimestamp >= :datefrom AND c.feedTimestamp <= :dateto")
    , @NamedQuery(name = "ChannelRequest.findByFeedType", query = "SELECT c FROM ChannelRequest c WHERE c.feedType = :feedType")
    , @NamedQuery(name = "ChannelRequest.findByTerminalId", query = "SELECT c FROM ChannelRequest c WHERE c.a041CardAcceptorTerminalId = :a041CardAcceptorTerminalId ORDER BY c.feedTimestamp DESC")
    , @NamedQuery(name = "ChannelRequest.findByTerminalIdDateRange", query = "SELECT c FROM ChannelRequest c WHERE c.a041CardAcceptorTerminalId = :a041CardAcceptorTerminalId AND c.feedTimestamp >= :datefrom AND c.feedTimestamp <= :dateto ORDER BY c.feedTimestamp DESC")
    , @NamedQuery(name = "ChannelRequest.findByFeedMessageCode", query = "SELECT c FROM ChannelRequest c WHERE c.feedMessageCode = :feedMessageCode ORDER BY c.feedTimestamp DESC")
    , @NamedQuery(name = "ChannelRequest.findByTransactionId", query = "SELECT c FROM ChannelRequest c WHERE c.transactionId = :transactionId ORDER BY c.feedTimestamp DESC")
    , @NamedQuery(name = "ChannelRequest.findByChannelMessageCode", query = "SELECT c FROM ChannelRequest c WHERE c.channelMessageCode = :channelMessageCode ORDER BY c.feedTimestamp DESC")
    , @NamedQuery(name = "ChannelRequest.findByAcceptingInstitution", query = "SELECT c FROM ChannelRequest c WHERE c.acceptingInstitution = :acceptingInstitution ORDER BY c.feedTimestamp DESC")
    , @NamedQuery(name = "ChannelRequest.findByRetrievalReferenceNumber", query = "SELECT c FROM ChannelRequest c WHERE c.retrievalReferenceNumber = :retrievalReferenceNumber ORDER BY c.feedTimestamp DESC")
    , @NamedQuery(name = "ChannelRequest.findByCardAcceptorIdentCode", query = "SELECT c FROM ChannelRequest c WHERE c.cardAcceptorIdentCode = :cardAcceptorIdentCode ORDER BY c.feedTimestamp DESC")
    , @NamedQuery(name = "ChannelRequest.findByA043CardAccNmeLoc8583", query = "SELECT c FROM ChannelRequest c WHERE c.a043CardAccNmeLoc8583 = :a043CardAccNmeLoc8583 ORDER BY c.feedTimestamp DESC")
    , @NamedQuery(name = "ChannelRequest.findByTransactionCurrencyCode", query = "SELECT c FROM ChannelRequest c WHERE c.transactionCurrencyCode = :transactionCurrencyCode ORDER BY c.feedTimestamp DESC")
    , @NamedQuery(name = "ChannelRequest.findByCallHomeInformation", query = "SELECT c FROM ChannelRequest c WHERE c.t11CallHomeInformation IS NOT NULL AND c.t11CallHomeInformation != '' GROUP BY c.feedTimestamp ORDER BY c.feedTimestamp DESC")
    , @NamedQuery(name = "ChannelRequest.findByCallHomeInformationOne", query = "SELECT c FROM ChannelRequest c WHERE c.t11CallHomeInformation LIKE :t11CallHomeInformation GROUP BY c.feedTimestamp ORDER BY c.feedTimestamp DESC")
    , @NamedQuery(name = "ChannelRequest.findByCallHomeInformationBoth", query = "SELECT c FROM ChannelRequest c WHERE c.t11CallHomeInformation LIKE :t11CallHomeInformation1 OR c.t11CallHomeInformation LIKE :t11CallHomeInformation2 GROUP BY c.feedTimestamp ORDER BY c.feedTimestamp DESC")
    , @NamedQuery(name = "ChannelRequest.findByT12PosCommServProvider", query = "SELECT c FROM ChannelRequest c WHERE c.t12PosCommServProvider = :t12PosCommServProvider ORDER BY c.feedTimestamp DESC")})
public class ChannelRequest implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "ID")
    private Integer id;
    @Size(max = 45)
    @Column(name = "FEED_TYPE")
    private String feedType;
    @Size(max = 45)
    @Column(name = "FEED_MESSAGE_CODE")
    private String feedMessageCode;
    @Size(max = 45)
    @Column(name = "FEED_MESSAGE_VERSION")
    private String feedMessageVersion;
    @Size(max = 45)
    @Column(name = "FEED_TIMESTAMP")
    private String feedTimestamp;
    @Size(max = 45)
    @Column(name = "CLEARING_PERIOD")
    private String clearingPeriod;
    @Size(max = 45)
    @Column(name = "TRANSACTION_ID")
    private String transactionId;
    @Size(max = 45)
    @Column(name = "TERMINAL_TYPE")
    private String terminalType;
    @Size(max = 45)
    @Column(name = "PRT_APPLICATION_PDD")
    private String prtApplicationPdd;
    @Size(max = 45)
    @Column(name = "CHANNEL_MESSAGE_CODE")
    private String channelMessageCode;
    @Size(max = 45)
    @Column(name = "A041_CARD_ACCEPTOR_TERMINAL_ID")
    private String a041CardAcceptorTerminalId;
    @Size(max = 45)
    @Column(name = "AUTH_TRANSACTION_CODE")
    private String authTransactionCode;
    @Size(max = 45)
    @Column(name = "A012_LOCAL_TRANSACTION_TIME")
    private String a012LocalTransactionTime;
    @Size(max = 45)
    @Column(name = "A013_LOCAL_TRANSACTION_DATE")
    private String a013LocalTransactionDate;
    @Size(max = 45)
    @Column(name = "A004_TRANSACTION_AMOUNT")
    private String a004TransactionAmount;
    @Size(max = 45)
    @Column(name = "A007_TRANSMISION_DATE_AND_TIME")
    private String a007TransmisionDateAndTime;
    @Size(max = 45)
    @Column(name = "A011_SYSTEM_TRACE_AUDIT_NUMBER")
    private String a011SystemTraceAuditNumber;
    @Size(max = 45)
    @Column(name = "MERCHANT_CATEGORY_CODE")
    private String merchantCategoryCode;
    @Size(max = 45)
    @Column(name = "A022_PAN_AND_DATE_ENTRY_MODE")
    private String a022PanAndDateEntryMode;
    @Size(max = 45)
    @Column(name = "A022_PIN_ENTRY_CAPABILITY")
    private String a022PinEntryCapability;
    @Size(max = 45)
    @Column(name = "PAN_SEQUENCE_NUMBER")
    private String panSequenceNumber;
    @Size(max = 45)
    @Column(name = "A025_POS_CONDITION_CODE")
    private String a025PosConditionCode;
    @Size(max = 45)
    @Column(name = "A026_POS_PIN_CAPTURE_CODE")
    private String a026PosPinCaptureCode;
    @Size(max = 45)
    @Column(name = "ACCEPTING_INSTITUTION")
    private String acceptingInstitution;
    @Size(max = 45)
    @Column(name = "RETRIEVAL_REFERENCE_NUMBER")
    private String retrievalReferenceNumber;
    @Size(max = 45)
    @Column(name = "CARD_ACCEPTOR_IDENT_CODE")
    private String cardAcceptorIdentCode;
    @Size(max = 45)
    @Column(name = "A043_CARD_ACC_NME_LOC_8583")
    private String a043CardAccNmeLoc8583;
    @Size(max = 45)
    @Column(name = "TRANSACTION_CURRENCY_CODE")
    private String transactionCurrencyCode;
    @Size(max = 45)
    @Column(name = "T11_CALL_HOME_INFORMATION")
    private String t11CallHomeInformation;
    @Size(max = 45)
    @Column(name = "T12_POS_COMM_SERV_PROVIDER")
    private String t12PosCommServProvider;

    public ChannelRequest() {
    }

    public ChannelRequest(Integer id) {
        this.id = id;
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

    public String getTerminalType() {
        return terminalType;
    }

    public void setTerminalType(String terminalType) {
        this.terminalType = terminalType;
    }

    public String getPrtApplicationPdd() {
        return prtApplicationPdd;
    }

    public void setPrtApplicationPdd(String prtApplicationPdd) {
        this.prtApplicationPdd = prtApplicationPdd;
    }

    public String getChannelMessageCode() {
        return channelMessageCode;
    }

    public void setChannelMessageCode(String channelMessageCode) {
        this.channelMessageCode = channelMessageCode;
    }

    public String getA041CardAcceptorTerminalId() {
        return a041CardAcceptorTerminalId;
    }

    public void setA041CardAcceptorTerminalId(String a041CardAcceptorTerminalId) {
        this.a041CardAcceptorTerminalId = a041CardAcceptorTerminalId;
    }

    public String getAuthTransactionCode() {
        return authTransactionCode;
    }

    public void setAuthTransactionCode(String authTransactionCode) {
        this.authTransactionCode = authTransactionCode;
    }

    public String getA012LocalTransactionTime() {
        return a012LocalTransactionTime;
    }

    public void setA012LocalTransactionTime(String a012LocalTransactionTime) {
        this.a012LocalTransactionTime = a012LocalTransactionTime;
    }

    public String getA013LocalTransactionDate() {
        return a013LocalTransactionDate;
    }

    public void setA013LocalTransactionDate(String a013LocalTransactionDate) {
        this.a013LocalTransactionDate = a013LocalTransactionDate;
    }

    public String getA004TransactionAmount() {
        return a004TransactionAmount;
    }

    public void setA004TransactionAmount(String a004TransactionAmount) {
        this.a004TransactionAmount = a004TransactionAmount;
    }

    public String getA007TransmisionDateAndTime() {
        return a007TransmisionDateAndTime;
    }

    public void setA007TransmisionDateAndTime(String a007TransmisionDateAndTime) {
        this.a007TransmisionDateAndTime = a007TransmisionDateAndTime;
    }

    public String getA011SystemTraceAuditNumber() {
        return a011SystemTraceAuditNumber;
    }

    public void setA011SystemTraceAuditNumber(String a011SystemTraceAuditNumber) {
        this.a011SystemTraceAuditNumber = a011SystemTraceAuditNumber;
    }

    public String getMerchantCategoryCode() {
        return merchantCategoryCode;
    }

    public void setMerchantCategoryCode(String merchantCategoryCode) {
        this.merchantCategoryCode = merchantCategoryCode;
    }

    public String getA022PanAndDateEntryMode() {
        return a022PanAndDateEntryMode;
    }

    public void setA022PanAndDateEntryMode(String a022PanAndDateEntryMode) {
        this.a022PanAndDateEntryMode = a022PanAndDateEntryMode;
    }

    public String getA022PinEntryCapability() {
        return a022PinEntryCapability;
    }

    public void setA022PinEntryCapability(String a022PinEntryCapability) {
        this.a022PinEntryCapability = a022PinEntryCapability;
    }

    public String getPanSequenceNumber() {
        return panSequenceNumber;
    }

    public void setPanSequenceNumber(String panSequenceNumber) {
        this.panSequenceNumber = panSequenceNumber;
    }

    public String getA025PosConditionCode() {
        return a025PosConditionCode;
    }

    public void setA025PosConditionCode(String a025PosConditionCode) {
        this.a025PosConditionCode = a025PosConditionCode;
    }

    public String getA026PosPinCaptureCode() {
        return a026PosPinCaptureCode;
    }

    public void setA026PosPinCaptureCode(String a026PosPinCaptureCode) {
        this.a026PosPinCaptureCode = a026PosPinCaptureCode;
    }

    public String getAcceptingInstitution() {
        return acceptingInstitution;
    }

    public void setAcceptingInstitution(String acceptingInstitution) {
        this.acceptingInstitution = acceptingInstitution;
    }

    public String getRetrievalReferenceNumber() {
        return retrievalReferenceNumber;
    }

    public void setRetrievalReferenceNumber(String retrievalReferenceNumber) {
        this.retrievalReferenceNumber = retrievalReferenceNumber;
    }

    public String getCardAcceptorIdentCode() {
        return cardAcceptorIdentCode;
    }

    public void setCardAcceptorIdentCode(String cardAcceptorIdentCode) {
        this.cardAcceptorIdentCode = cardAcceptorIdentCode;
    }

    public String getA043CardAccNmeLoc8583() {
        return a043CardAccNmeLoc8583;
    }

    public void setA043CardAccNmeLoc8583(String a043CardAccNmeLoc8583) {
        this.a043CardAccNmeLoc8583 = a043CardAccNmeLoc8583;
    }

    public String getTransactionCurrencyCode() {
        return transactionCurrencyCode;
    }

    public void setTransactionCurrencyCode(String transactionCurrencyCode) {
        this.transactionCurrencyCode = transactionCurrencyCode;
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
        if (!(object instanceof ChannelRequest)) {
            return false;
        }
        ChannelRequest other = (ChannelRequest) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.entity.ChannelRequest[ id=" + id + " ]";
    }
    
}
