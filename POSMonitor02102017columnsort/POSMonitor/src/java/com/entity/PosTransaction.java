
package com.entity;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

@Entity
@Table(name = "pos_transaction")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "PosTransaction.findAll", query = "SELECT p FROM PosTransaction p")
    , @NamedQuery(name = "PosTransaction.findByTransactionId", query = "SELECT p FROM PosTransaction p WHERE p.transactionId = :transactionId")
    , @NamedQuery(name = "PosTransaction.findByUploadId", query = "SELECT p FROM PosTransaction p WHERE p.uploadId = :uploadId")
    , @NamedQuery(name = "PosTransaction.findByTranDate", query = "SELECT p FROM PosTransaction p WHERE p.tranDate = :tranDate")
    , @NamedQuery(name = "PosTransaction.findByTermId", query = "SELECT p FROM PosTransaction p WHERE p.termId = :termId ORDER BY p.tranDate DESC")
    , @NamedQuery(name = "PosTransaction.findByTermIdValue", query = "SELECT p.amount FROM PosTransaction p WHERE p.termId = :termId ORDER BY p.tranDate DESC")
    , @NamedQuery(name = "PosTransaction.findByTermOwner", query = "SELECT p FROM PosTransaction p WHERE p.termOwner = :termOwner")
    , @NamedQuery(name = "PosTransaction.findByMerchantId", query = "SELECT p FROM PosTransaction p WHERE p.merchantId = :merchantId")
    , @NamedQuery(name = "PosTransaction.findByAmount", query = "SELECT p FROM PosTransaction p WHERE p.amount = :amount")
    , @NamedQuery(name = "PosTransaction.findByCardNumber", query = "SELECT p FROM PosTransaction p WHERE p.cardNumber = :cardNumber")
    , @NamedQuery(name = "PosTransaction.findByCurrency", query = "SELECT p FROM PosTransaction p WHERE p.currency = :currency")
    , @NamedQuery(name = "PosTransaction.findByTranCode", query = "SELECT p FROM PosTransaction p WHERE p.tranCode = :tranCode")
    , @NamedQuery(name = "PosTransaction.findByTranChannel", query = "SELECT p FROM PosTransaction p WHERE p.tranChannel = :tranChannel")
    , @NamedQuery(name = "PosTransaction.findByTranStatus", query = "SELECT p FROM PosTransaction p WHERE p.tranStatus = :tranStatus")
    , @NamedQuery(name = "PosTransaction.findByTranComment", query = "SELECT p FROM PosTransaction p WHERE p.tranComment = :tranComment")
    , @NamedQuery(name = "PosTransaction.findByTranStan", query = "SELECT p FROM PosTransaction p WHERE p.tranStan = :tranStan")})
public class PosTransaction implements Serializable {

    private static final long serialVersionUID = 1L;
//    p.id, SUM(p.amount), p.cardNumber, p.currency, p.merchantId, p.termId, p.termOwner, p.tranChannel, p.tranCode, p.tranComment, p.tranDate, p.tranStan, p.tranStatus, p.transactionId, p.uploadId, p.merchantId, p.tranDate
    @Column(name = "TRANSACTION_ID")
    private Integer transactionId;
    @Column(name = "UPLOAD_ID")
    private Integer uploadId;
    @Column(name = "TRAN_DATE")
    @Temporal(TemporalType.DATE)
    private Date tranDate;
    @Size(max = 10)
    @Column(name = "TERM_ID")
    private String termId;
    @Size(max = 60)
    @Column(name = "TERM_OWNER")
    private String termOwner;
    @Size(max = 16)
    @Column(name = "MERCHANT_ID")
    private String merchantId;
    @Column(name = "AMOUNT")
    private Integer amount;
    @Size(max = 20)
    @Column(name = "CARD_NUMBER")
    private String cardNumber;
    @Size(max = 3)
    @Column(name = "CURRENCY")
    private String currency;
    @Size(max = 12)
    @Column(name = "TRAN_CODE")
    private String tranCode;
    @Size(max = 2)
    @Column(name = "TRAN_CHANNEL")
    private String tranChannel;
    @Size(max = 2)
    @Column(name = "TRAN_STATUS")
    private String tranStatus;
    @Size(max = 60)
    @Column(name = "TRAN_COMMENT")
    private String tranComment;
    @Size(max = 15)
    @Column(name = "TRAN_STAN")
    private String tranStan;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "ID")
    private Integer id;
    
    public PosTransaction(Date tranDate, String merchantId, Integer amount) {
        this.tranDate = tranDate;
        this.merchantId = merchantId;
        this.amount = amount;
    }

    public PosTransaction() {
    }

    public PosTransaction(Integer id) {
        this.id = id;
    }

    public Integer getTransactionId() {
        return transactionId;
    }

    public void setTransactionId(Integer transactionId) {
        this.transactionId = transactionId;
    }

    public Integer getUploadId() {
        return uploadId;
    }

    public void setUploadId(Integer uploadId) {
        this.uploadId = uploadId;
    }

    public Date getTranDate() {
        return tranDate;
    }

    public void setTranDate(Date tranDate) {
        this.tranDate = tranDate;
    }

    public String getTermId() {
        return termId;
    }

    public void setTermId(String termId) {
        this.termId = termId;
    }

    public String getTermOwner() {
        return termOwner;
    }

    public void setTermOwner(String termOwner) {
        this.termOwner = termOwner;
    }

    public String getMerchantId() {
        return merchantId;
    }

    public void setMerchantId(String merchantId) {
        this.merchantId = merchantId;
    }

    public Integer getAmount() {
        return amount;
    }

    public void setAmount(Integer amount) {
        this.amount = amount;
    }

    public String getCardNumber() {
        return cardNumber;
    }

    public void setCardNumber(String cardNumber) {
        this.cardNumber = cardNumber;
    }

    public String getCurrency() {
        return currency;
    }

    public void setCurrency(String currency) {
        this.currency = currency;
    }

    public String getTranCode() {
        return tranCode;
    }

    public void setTranCode(String tranCode) {
        this.tranCode = tranCode;
    }

    public String getTranChannel() {
        return tranChannel;
    }

    public void setTranChannel(String tranChannel) {
        this.tranChannel = tranChannel;
    }

    public String getTranStatus() {
        return tranStatus;
    }

    public void setTranStatus(String tranStatus) {
        this.tranStatus = tranStatus;
    }

    public String getTranComment() {
        return tranComment;
    }

    public void setTranComment(String tranComment) {
        this.tranComment = tranComment;
    }

    public String getTranStan() {
        return tranStan;
    }

    public void setTranStan(String tranStan) {
        this.tranStan = tranStan;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
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
        if (!(object instanceof PosTransaction)) {
            return false;
        }
        PosTransaction other = (PosTransaction) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.entity.PosTransaction[ id=" + id + " ]";
    }
    
}
