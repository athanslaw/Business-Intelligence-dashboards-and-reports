/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
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

/**
 *
 * @author sbtemisdev2
 */
@Entity
@Table(name = "pos_merchant")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "PosMerchant.findAll", query = "SELECT p FROM PosMerchant p")
    , @NamedQuery(name = "PosMerchant.findByMerchantId", query = "SELECT p FROM PosMerchant p WHERE p.merchantId = :merchantId")
    , @NamedQuery(name = "PosMerchant.findByMerchantName", query = "SELECT p FROM PosMerchant p WHERE p.merchantName = :merchantName")
    , @NamedQuery(name = "PosMerchant.findByEmail", query = "SELECT p FROM PosMerchant p WHERE p.email = :email")
    , @NamedQuery(name = "PosMerchant.findByPhoneNumber", query = "SELECT p FROM PosMerchant p WHERE p.phoneNumber = :phoneNumber")
    , @NamedQuery(name = "PosMerchant.findByAddress", query = "SELECT p FROM PosMerchant p WHERE p.address = :address")
    , @NamedQuery(name = "PosMerchant.findByReportStatus", query = "SELECT p FROM PosMerchant p WHERE p.reportStatus = :reportStatus")
    , @NamedQuery(name = "PosMerchant.findByAccountNumber", query = "SELECT p FROM PosMerchant p WHERE p.accountNumber = :accountNumber")})
public class PosMerchant implements Serializable {

    private static final long serialVersionUID = 1L;
    @Size(max = 45)
    @Column(name = "MERCHANT_ID")
    private String merchantId;
    @Size(max = 45)
    @Column(name = "MERCHANT_NAME")
    private String merchantName;
    // @Pattern(regexp="[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?", message="Invalid email")//if the field contains email address consider using this annotation to enforce field validation
    @Size(max = 45)
    @Column(name = "EMAIL")
    private String email;
    @Size(max = 45)
    @Column(name = "PHONE_NUMBER")
    private String phoneNumber;
    @Size(max = 45)
    @Column(name = "ADDRESS")
    private String address;
    @Column(name = "REPORT_STATUS")
    private Character reportStatus;
    @Size(max = 45)
    @Column(name = "ACCOUNT_NUMBER")
    private String accountNumber;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "ID")
    private Integer id;

    public PosMerchant() {
    }

    public PosMerchant(Integer id) {
        this.id = id;
    }

    public String getMerchantId() {
        return merchantId;
    }

    public void setMerchantId(String merchantId) {
        this.merchantId = merchantId;
    }

    public String getMerchantName() {
        return merchantName;
    }

    public void setMerchantName(String merchantName) {
        this.merchantName = merchantName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Character getReportStatus() {
        return reportStatus;
    }

    public void setReportStatus(Character reportStatus) {
        this.reportStatus = reportStatus;
    }

    public String getAccountNumber() {
        return accountNumber;
    }

    public void setAccountNumber(String accountNumber) {
        this.accountNumber = accountNumber;
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
        if (!(object instanceof PosMerchant)) {
            return false;
        }
        PosMerchant other = (PosMerchant) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.entity.PosMerchant[ id=" + id + " ]";
    }
    
}
