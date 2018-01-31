
package com.servlet;

import java.sql.Connection;
import java.sql.ResultSet;
import java.util.Calendar;

public class HelperClass {
    private String terminalId;
    private String solId;
    private String ptsp;
    private String stateCode;
    private String merchantId;
    private String modelId;
    private String accountNumber;
    private Character accountType;
    private Character status;
    private String merchantName;
    private String physicalAddress;
    private Integer id;
    public static String activeClass;
    public static String dbname;
    public static String dbhost;
    public static String username;
    public static String password;
    public static Connection con;

    public HelperClass() {
    }

    public HelperClass(String terminalId, String solId, String ptsp, String stateCode, String merchantId, String modelId, String accountNumber, Character accountType, Character status, String merchantName, String physicalAddress, Integer id) {
        this.terminalId = terminalId;
        this.solId = solId;
        this.ptsp = ptsp;
        this.stateCode = stateCode;
        this.merchantId = merchantId;
        this.modelId = modelId;
        this.accountNumber = accountNumber;
        this.accountType = accountType;
        this.status = status;
        this.merchantName = merchantName;
        this.physicalAddress = physicalAddress;
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
    
    public Pagination_Util fetch(String query, int offset, int limit){
        LookUp lookup = new LookUp();
	return lookup.fetch(query, offset, limit, query);
    }
    
    public Pagination_Util view_record(String query){
        LookUp lookup = new LookUp();
	return lookup.view_record(query);
    }
    
    public ResultSet view_record_single(String query){
        LookUp lookup = new LookUp();
	return lookup.view_record_single(query);
    }
    
    public String previousdate(){
        Calendar calendar = Calendar.getInstance(); // this would default to now
        calendar.add(Calendar.DAY_OF_MONTH, -5);
        return calendar.toString();
    }
        
}
