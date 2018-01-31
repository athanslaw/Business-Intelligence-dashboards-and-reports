
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
@Table(name = "pos")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Pos.findAll", query = "SELECT p FROM Pos p ORDER BY p.merchantName DESC")
    , @NamedQuery(name = "Pos.findByTerminalId", query = "SELECT p FROM Pos p WHERE p.terminalId = :terminalId")
    , @NamedQuery(name = "Pos.findBySolId", query = "SELECT p FROM Pos p WHERE p.solId = :solId")
    , @NamedQuery(name = "Pos.findByStateCode", query = "SELECT p FROM Pos p WHERE p.stateCode = :stateCode")
    , @NamedQuery(name = "Pos.findByMerchantId", query = "SELECT p FROM Pos p WHERE p.merchantId = :merchantId")
    , @NamedQuery(name = "Pos.findByModelId", query = "SELECT p FROM Pos p WHERE p.modelId = :modelId")
    , @NamedQuery(name = "Pos.findByAccountNumber", query = "SELECT p FROM Pos p WHERE p.accountNumber = :accountNumber")
    , @NamedQuery(name = "Pos.findByAccountType", query = "SELECT p FROM Pos p WHERE p.accountType = :accountType")
    , @NamedQuery(name = "Pos.findByMerchantName", query = "SELECT p FROM Pos p WHERE p.merchantName = :merchantName")})
public class Pos implements Serializable {

    private static final long serialVersionUID = 1L;
    @Size(max = 10)
    @Column(name = "TERMINAL_ID")
    private String terminalId;
    @Size(max = 5)
    @Column(name = "SOL_ID")
    private String solId;
    @Size(max = 60)
    @Column(name = "PTSP")
    private String ptsp;
    @Size(max = 5)
    @Column(name = "STATE_CODE")
    private String stateCode;
    @Size(max = 20)
    @Column(name = "MERCHANT_ID")
    private String merchantId;
    @Size(max = 5)
    @Column(name = "MODEL_ID")
    private String modelId;
    @Size(max = 15)
    @Column(name = "ACCOUNT_NUMBER")
    private String accountNumber;
    @Column(name = "ACCOUNT_TYPE")
    private Character accountType;
    @Column(name = "STATUS")
    private Character status;
    @Size(max = 50)
    @Column(name = "MERCHANT_NAME")
    private String merchantName;
    @Size(max = 100)
    @Column(name = "PHYSICAL_ADDRESS")
    private String physicalAddress;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "ID")
    private Integer id;

    public Pos() {
    }

    public Pos(Integer id) {
        this.id = id;
    }

    public String getTerminalId() {
        return terminalId;
    }

    public void setTerminalId(String terminalId) {
        this.terminalId = terminalId;
    }

    public String getSolId() {
        return solId;
    }

    public void setSolId(String solId) {
        this.solId = solId;
    }

    public String getPtsp() {
        return ptsp;
    }

    public void setPtsp(String ptsp) {
        this.ptsp = ptsp;
    }

    public String getStateCode() {
        return stateCode;
    }

    public void setStateCode(String stateCode) {
        this.stateCode = stateCode;
    }

    public String getMerchantId() {
        return merchantId;
    }

    public void setMerchantId(String merchantId) {
        this.merchantId = merchantId;
    }

    public String getModelId() {
        return modelId;
    }

    public void setModelId(String modelId) {
        this.modelId = modelId;
    }

    public String getAccountNumber() {
        return accountNumber;
    }

    public void setAccountNumber(String accountNumber) {
        this.accountNumber = accountNumber;
    }

    public Character getAccountType() {
        return accountType;
    }

    public void setAccountType(Character accountType) {
        this.accountType = accountType;
    }

    public Character getStatus() {
        return status;
    }

    public void setStatus(Character status) {
        this.status = status;
    }

    public String getMerchantName() {
        return merchantName;
    }

    public void setMerchantName(String merchantName) {
        this.merchantName = merchantName;
    }

    public String getPhysicalAddress() {
        return physicalAddress;
    }

    public void setPhysicalAddress(String physicalAddress) {
        this.physicalAddress = physicalAddress;
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
        if (!(object instanceof Pos)) {
            return false;
        }
        Pos other = (Pos) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.entity.Pos[ id=" + id + " ]";
    }
    
}
