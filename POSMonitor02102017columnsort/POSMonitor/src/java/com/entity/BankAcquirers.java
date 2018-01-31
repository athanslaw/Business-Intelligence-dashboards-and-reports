
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
@Table(name = "bank_acquirers")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "BankAcquirers.findAll", query = "SELECT b FROM BankAcquirers b")
    , @NamedQuery(name = "BankAcquirers.findByBankId", query = "SELECT b FROM BankAcquirers b WHERE b.bankId = :bankId")
    , @NamedQuery(name = "BankAcquirers.findByCbnCode", query = "SELECT b FROM BankAcquirers b WHERE b.cbnCode = :cbnCode")
    , @NamedQuery(name = "BankAcquirers.findByAtmTerminalPrefix", query = "SELECT b FROM BankAcquirers b WHERE b.atmTerminalPrefix = :atmTerminalPrefix")
    , @NamedQuery(name = "BankAcquirers.findByPosTerminalPrefix", query = "SELECT b FROM BankAcquirers b WHERE b.posTerminalPrefix = :posTerminalPrefix")
    , @NamedQuery(name = "BankAcquirers.findByBank", query = "SELECT b FROM BankAcquirers b WHERE b.bank = :bank")})
public class BankAcquirers implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "bank_id")
    private Integer bankId;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(name = "cbn_code")
    private String cbnCode;
    @Basic(optional = false)
    @NotNull
    @Column(name = "atm_terminal_prefix")
    private int atmTerminalPrefix;
    @Basic(optional = false)
    @NotNull
    @Column(name = "pos_terminal_prefix")
    private int posTerminalPrefix;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(name = "bank")
    private String bank;

    public BankAcquirers() {
    }

    public BankAcquirers(Integer bankId) {
        this.bankId = bankId;
    }

    public BankAcquirers(Integer bankId, String cbnCode, int atmTerminalPrefix, int posTerminalPrefix, String bank) {
        this.bankId = bankId;
        this.cbnCode = cbnCode;
        this.atmTerminalPrefix = atmTerminalPrefix;
        this.posTerminalPrefix = posTerminalPrefix;
        this.bank = bank;
    }

    public Integer getBankId() {
        return bankId;
    }

    public void setBankId(Integer bankId) {
        this.bankId = bankId;
    }

    public String getCbnCode() {
        return cbnCode;
    }

    public void setCbnCode(String cbnCode) {
        this.cbnCode = cbnCode;
    }

    public int getAtmTerminalPrefix() {
        return atmTerminalPrefix;
    }

    public void setAtmTerminalPrefix(int atmTerminalPrefix) {
        this.atmTerminalPrefix = atmTerminalPrefix;
    }

    public int getPosTerminalPrefix() {
        return posTerminalPrefix;
    }

    public void setPosTerminalPrefix(int posTerminalPrefix) {
        this.posTerminalPrefix = posTerminalPrefix;
    }

    public String getBank() {
        return bank;
    }

    public void setBank(String bank) {
        this.bank = bank;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (bankId != null ? bankId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof BankAcquirers)) {
            return false;
        }
        BankAcquirers other = (BankAcquirers) object;
        if ((this.bankId == null && other.bankId != null) || (this.bankId != null && !this.bankId.equals(other.bankId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.entity.BankAcquirers[ bankId=" + bankId + " ]";
    }
    
}
