
create table person ( id  IDENTITY PRIMARY KEY, firstName varchar(255), lastName varchar(255));

create schema prod;

/*
CREATE TABLE prod.prod_customers
(
    customer_id NUMERIC(18,0), first_name VARCHAR(50), last_name VARCHAR(50),
    middle_initial VARCHAR(1), title VARCHAR(5),  home_phone_no VARCHAR(25),
    login_name VARCHAR(100), password VARCHAR(100), address_line1 VARCHAR(255),
    address_line2 VARCHAR(255), city VARCHAR(50), state VARCHAR(50),
    country VARCHAR(50), zip VARCHAR(50), email VARCHAR(50),
    date_of_birth DATETIME, promotional_materials VARCHAR(1), affiliate_id INT,
    affiliate_customer_id VARCHAR(255), suffix CHAR(3)
);
*/
CREATE TABLE prod.prod_customers
(
    customer_id NUMERIC(18,0) AUTO_INCREMENT PRIMARY KEY, -- need auto_increment to simulate trigger
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    middle_initial VARCHAR(1),
    title VARCHAR(5),
    sex VARCHAR(1),
    home_phone_no VARCHAR(25),
    office_phone_no VARCHAR(25),
    login_name VARCHAR(100),
    password VARCHAR(100),
    address_line1 VARCHAR(255),
    address_line2 VARCHAR(255),
    city VARCHAR(50),
    state VARCHAR(50),
    country VARCHAR(50),
    zip VARCHAR(50),
    email VARCHAR(50),
    cc_name VARCHAR(50),
    cc_type VARCHAR(50),
    cc_number VARCHAR(50),
    cc_expiration_date VARCHAR(50),
    cybercash_expiration_date DATETIME,
    discount_in_pct NUMERIC(2,0),
    discount_comment VARCHAR(255),
    discount_disable VARCHAR(1),
    credit_towards_products DECIMAL(19,4),
    account_disable VARCHAR(1),
    account_disable_date DATETIME,
    subscription_balance DECIMAL(19,4),
    other_products_balance DECIMAL(19,4),
    account_create_date DATETIME,
    past_due_balance DECIMAL(19,4),
    past_due_date DATETIME,
    transition_balance DECIMAL(19,4),
    mothers_maiden_name VARCHAR(50),
    date_of_birth DATETIME,
    referred_by VARCHAR(255),
    account_disable_comment TEXT,
    auto_billing_date DATETIME,
    promotional_materials VARCHAR(1),
    browser VARCHAR(100),
    company VARCHAR(50),
    timelastsessionbegan DATETIME,
    uppercase_last_name VARCHAR(50),
    uppercase_first_name VARCHAR(50),
    uppercase_email VARCHAR(50),
    comp_account_ind CHAR(1),
    comp_account_department CHAR(1),
    comp_account_description VARCHAR(255),
    legal_indicator CHAR(1),
    hco_transition_balance DECIMAL(19,4),
    email_verification_ind CHAR(1),
    email_verification_date DATETIME,
    mobile_download_date DATETIME,
    zip_code_valid_date DATETIME,
    updated_acct_info_date DATETIME,
    do_not_call_ind CHAR(1),
    bad_phone_number_ind CHAR(1),
    affiliate_id INT,
    affiliate_customer_id VARCHAR(255),
    call_history TEXT,
    call_comments TEXT,
    received_tutorial_ind CHAR(1),
    suffix CHAR(3),
    auto_process_indicator CHAR(1),
    auto_process_timestamp DATETIME
);

insert into prod.prod_customers (customer_id, first_name, last_name, middle_initial, title,
   home_phone_no, address_line1, address_line2, affiliate_customer_id,
   affiliate_id, city, state, zip, country, date_of_birth, email, login_name,
   password, promotional_materials, suffix )
   VALUES (1234567, 'Ron', 'Davis', null,null, '123-456-7890', '123 ABC Ave', null,null,null, 'Manhattan',
    'NY', '10021', 'USA', '1983-10-18', 'test2@mail.com', 'test2@mail.com', 'qqq123', 'N', null );


CREATE SCHEMA dbo;
CREATE TABLE dbo.drf_bets_customer
(
    customer_id NUMERIC(18,0) NOT NULL,
    external_customer_id NUMERIC(18,0) NOT NULL,
    company_code CHAR(1) NOT NULL,
    residential_street VARCHAR(50) NOT NULL,
    residential_zip_code VARCHAR(10) NOT NULL,
    residential_city VARCHAR(50) NOT NULL,
    mailing_street VARCHAR(50),
    mailing_zip_code VARCHAR(10),
    mailing_city VARCHAR(50),
    phone_number VARCHAR(15) NOT NULL,
    birth_date DATETIME NOT NULL,
    promotional_materials_ind CHAR(1) NOT NULL,
    signup_date DATETIME NOT NULL,
    signup_status CHAR(3) NOT NULL,
    account_status CHAR(1) NOT NULL,
    last_date_updated DATETIME NOT NULL,
    email_queued_date_1 DATETIME,
    email_queued_date_2 DATETIME,
    email_queued_date_3 DATETIME,
    store_email_queued_date_1 DATETIME,
    store_email_queued_date_2 DATETIME,
    store_purchase_date_1 DATETIME,
    store_purchase_date_2 DATETIME,
    signup_promotion_code VARCHAR(25),
    account_balance DECIMAL(19,4),
    email_address VARCHAR(255)
);
alter table  dbo.drf_bets_customer add CONSTRAINT ixcustcomp_unq UNIQUE (customer_id, company_code);
alter table  dbo.drf_bets_customer add CONSTRAINT ixdbetscust_unq UNIQUE (external_customer_id, company_code);


insert INTO dbo.drf_bets_customer (customer_id, external_customer_id, company_code, residential_street, residential_zip_code,
  residential_city, mailing_street, mailing_zip_code, mailing_city, phone_number, birth_date, promotional_materials_ind,
  signup_date, signup_status, account_status,  last_date_updated


) VALUES (1234567, 511111, 'X', '15 ABC Ave', '07410', 'Manahattan', null, null, null, '973-471-2222',
           parsedatetime('1986-09-17 00:00:00', 'yyyy-MM-dd hh:mm:ss'), 'Y', CURRENT_TIMESTAMP(), 'NEW', 'O',  CURRENT_TIMESTAMP()  );

-- next try the simplest stored proc call.
-- TO DO --
/*
-- create alias r_drfwebValidateLogin as '

r_drfwebValidateLogin(Connection conn, String loginName, String password) throws SQLException {
    return conn.createStatement().executeQuery("select customer_id as customer_ID, ...")
}

*/

-- ';

/*
create alias r_drfBetsCustomer as $$
  java.sql.ResultSet  r_drfBetsCustomer(java.sql.Connection conn, String customerIdType, Long customerId)throws SQLException {

        java.sql.ResultSet rs = conn.createStatement().executeQuery( "SELECT  customer_id, external_customer_id, " +
          "company_code, residential_street, residential_zip_code, residential_city, mailing_street, mailing_zip_code, " +
          "mailing_city, phone_number, birth_date, promotional_materials_ind, signup_date, signup_status, account_status, " +
          " last_date_updated  from drf_bets_customer WHERE customer_id=" + customerId + " and company_code= '" + customerIdType +
          "' and customer_id_type=" + customerIdType);

          return rs;

  }
$$;

*/

create alias r_drfBetsCustomer as '
  java.sql.ResultSet  r_drfBetsCustomer(java.sql.Connection conn, String customerIdType, Long customerId)throws SQLException {
        //query statement
       String companyCode = "X";
         String stmt = "SELECT  customer_id, external_customer_id, " +
          "company_code, residential_street, residential_zip_code, residential_city, mailing_street, mailing_zip_code, " +
          "mailing_city, phone_number, birth_date, promotional_materials_ind, signup_date, signup_status, account_status, " +
          " last_date_updated  from drf_bets_customer WHERE customer_id=" + customerId + " and company_code= ''" + companyCode  +
          "'' and customer_id_type=''" + customerIdType + "''";
        java.sql.ResultSet rs = conn.createStatement().executeQuery( stmt);
        System.out.println("This part executed . . .  . ");
          return rs;

  } ';
