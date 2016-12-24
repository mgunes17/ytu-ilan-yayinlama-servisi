CREATE TABLE user_type(
  type_no smallint PRIMARY KEY,
  type_name varchar(20) UNIQUE,
  main_page char(50),
  unauthorized_page char(50)
);

CREATE TABLE membership_status (
  id int primary key,
  status char(70) NOT NULL
);

CREATE TABLE users (
  user_name  varchar(20) PRIMARY KEY,
  passwordFor varchar(16) NOT NULL,
  user_type_no smallint REFERENCES user_type(type_no),
  membership_status int REFERENCES membership_status(id)
);

CREATE TABLE student (
  user_name varchar(20) references users(user_name),
  name varchar(30) not null,
  surname varchar(30) not null,
  department varchar(30) not null,
  penalty_point int DEFAULT 0,
  primary key(user_name)
);

CREATE TABLE company (
  user_name varchar(20) references users(user_name),
  company_name varchar(30) not null,
  location varchar(30),
  primary key(user_name)
);

CREATE TABLE donation_accept_unit (
  unit_name varchar(40),
  balance int DEFAULT 0,
  primary key(unit_name),
  created_date timestamp
);

CREATE TABLE dau_user (
  user_name varchar(20) REFERENCES users(user_name),
  unit_name varchar(40) REFERENCES donation_accept_unit(unit_name),
  name varchar(40) NOT NULL,
  surname varchar(40) NOT NULL,
  primary key(user_name)
);

CREATE TABLE bank_account_info (
  owner_unit_name varchar(40),
  bank_name varchar(30) NOT NULL,
  branch_bank_name varchar(30) NOT NULL,
  bank_account_number numeric(16) NOT NULL,
  iban char(34),
  currency int not null,
  PRIMARY KEY(iban)
);

CREATE TABLE donation (
  donation_id int primary key,
  company_username varchar(30) not null,
  donate_accept_unit_username varchar(30) not null,
  packet_id int not null,
  iban char,
  amount int,
  approved boolean default false
);

CREATE TABLE announcement_state (
  id int primary key,
  title varchar(30) not null
);

create table announcement_type (
  id int primary key,
  title varchar(30)
);

CREATE TABLE communication_way (
  comm_type varchar(30),
  comm_value varchar(70),
  primary key(comm_type, comm_value),
  user_name varchar(20) REFERENCES users(user_name)
);

CREATE TABLE department (
  code char(3) primary key,
  name varchar(50) unique
);

CREATE TABLE message (
  message_no serial,
  sender_name varchar(30) NOT NULL,
  sender_surname varchar(30) NOT NULL,
  message_title varchar(30) NOT NULL,
  message_body text NOT NULL,
  sender_email_address varchar(50) NOT NULL,
  sender_ip_address varchar(16) NOT NULL,
  is_read boolean default false,
  date_time timestamp NOT NULL,
  primary key(sender_email_address, date_time)
  --time?
);

CREATE TABLE announcement_category (
  id int primary key,
  category_name char(70) NOT NULL UNIQUE,
  references_count int DEFAULT 0,
  parent_category_id int REFERENCES announcement_category(id)
);

CREATE TABLE announcement (
  id int primary key,
  title varchar(70),
  brief text NOT NULL,
  content text NOT NULL,
  number_of_page_views int,
  state int REFERENCES announcement_state(id),
  owner_company varchar(30) REFERENCES company(user_name),
  owner_packet int,
  announcement_type int not null,
  announcement_category int REFERENCES announcement_category(id),
  announcement_language char(20),
  publish_date timestamp,
  expired_date timestamp,
  proper_complaint boolean DEFAULT TRUE
);

CREATE TABLE announcement_packet (
  packet_id int primary key,
  announcement_count int not null,
  price int not null,
  last_date_used timestamp not null,
  active_time int not null,
  currency int not null,
  condition text not null,
  bank_account_info varchar(30) REFERENCES bank_account_info(iban)
);

CREATE TABLE currency (
  id int primary key,
  title varchar(20) not null
);

CREATE TABLE announcement_packet_state (
  id int primary key,
  title char(50)
);

CREATE TABLE  company_own_packet (
  id int primary key,
  owner_company varchar(30) REFERENCES company(user_name),
  packet int REFERENCES announcement_packet(packet_id),
  announcement_packet_state int REFERENCES announcement_packet_state(id),
  used_announcements int,
  approved boolean,
  user_for_approved varchar(30),
  time_to_request timestamp NOT NULL,
  time_to_approved timestamp,
  time_to_expired timestamp
);

CREATE TABLE application (
  application_no serial,
  username varchar(20) REFERENCES users(user_name),
  announcement_id int REFERENCES announcement(id),
  time_to_application timestamp NOT NULL,
  ip_address char(16) NOT NULL,
  primary key(username , announcement_id)
);

CREATE TABLE accounting (
  unit_name varchar(40) REFERENCES donation_accept_unit(unit_name),
  user_name varchar(20) REFERENCES dau_user(user_name),
  date_time timestamp NOT NULL,
  amount int NOT NULL,
  primary key(unit_name, date_time)
);

CREATE TABLE spending_request_state (
  id int primary key,
  title char(50)
);

CREATE TABLE spending_request (
  id int primary key,
  title char(60),
  content text,
  amount int,
  sent_date_time timestamp,
  dau varchar(40) REFERENCES donation_accept_unit(unit_name),
  state int REFERENCES spending_request_state(id),
  updater varchar(20) REFERENCES dau_user(user_name),
  updated_date_time timestamp,
  answer_from_updater text,
  pdf_path varchar(100),
  image_path varchar(100)
);

CREATE TABLE complaint (
  id int primary key,
  student varchar(20) REFERENCES student (user_name),
  announcement int REFERENCES announcement (id),
  description text NOT NULL,
  complaint_time timestamp,
  result char(40),
  result_time timestamp,
  result_reply text
);

CREATE OR REPLACE FUNCTION updateUnitBalance()
  RETURNS TRIGGER AS $donation_accept_unit$
BEGIN
  UPDATE donation_accept_unit d
  SET balance = (select sum(amount) from accounting a group by a.unit_name
  having d.unit_name = a.unit_name);

  UPDATE donation_accept_unit
  SET balance = 0 WHERE balance is null;

  RETURN new;
END;
$donation_accept_unit$ LANGUAGE plpgsql;

CREATE TRIGGER updateBalance
AFTER INSERT ON accounting
FOR EACH ROW EXECUTE PROCEDURE updateUnitBalance();

CREATE OR REPLACE FUNCTION insertAccounting()
  RETURNS TRIGGER AS $spending_request$
BEGIN
  if new.state = 2 then
    INSERT INTO accounting (unit_name, user_name, date_time, amount)
    VALUES(new.dau, new.updater, new.updated_date_time, -new.amount);
  end if;
  RETURN new;
END;
$spending_request$ LANGUAGE plpgsql;

CREATE TRIGGER insertAccounting
AFTER UPDATE ON spending_request
FOR EACH ROW EXECUTE PROCEDURE insertAccounting();

CREATE OR REPLACE FUNCTION countReferenceForCategory()
  RETURNS TRIGGER AS $announcement$
BEGIN
  update announcement_category ac
  set references_count = (
    select count(a.announcement_category) from announcement a group by a.announcement_category
    having ac.id = a.announcement_category);

  update announcement_category set references_count = 0 WHERE references_count is null;

  return new;

END;
$announcement$ LANGUAGE plpgsql;

CREATE TRIGGER isDeleteable
AFTER INSERT OR UPDATE OR DELETE ON announcement
FOR EACH ROW EXECUTE PROCEDURE countReferenceForCategory();


INSERT INTO announcement_type VALUES
  (1, 'Staj'),
  (2, 'Yarı zamanlı'),
  (3, 'Tam zamanlı'),
  (4, 'freelance'),
  (5, '-Duyuru İlanı-'),
  (-1, 'Tüm Tipler');

INSERT INTO user_type (type_no, type_name, main_page, unauthorized_page) VALUES
  (0, 'admin', 'admin/index.jsp', 'admin/erisim-izni-yok.jsp'),
  (1, 'donation_accept_unit', 'dau/index.jsp', 'dau/erisim-izni-yok.jsp'),
  (2, 'company', 'company/index.jsp', 'company/erisim-izni-yok.jsp'),
  (3, 'student', 'student/index.jsp', 'student/erisim-izni-yok.jsp') ;

INSERT INTO announcement_state VALUES
  (1, 'passive'),
  (2, 'active'),
  (3, 'expired'),
  (4, 'suspended') ;

INSERT INTO membership_status (id, status) VALUES
  (0, 'onay bekleniyor'),
  (1, 'aktif'),
  (2, 'süreli cezalı'),
  (3, 'süresiz cezalı'),
  (4, 'admin onayı bekleniyor'),
  (5, 'kullanıcı tarafından pasif hale getirilmiş');

INSERT INTO currency VALUES
  (1, 'Türk Lirası'),
  (2, 'Euro'),
  (3, 'Amerikan Doları');

INSERT INTO announcement_packet_state (id, title) VALUES
  (1, 'Onay Bekleniyor'),
  (2, 'Kullanılabilir'),
  (3, 'Kullanım süresi sona erdi');

INSERT INTO department (code, name) VALUES
  ('011', 'Bilgisayar Mühendisliği'),
  ('012', 'Elektrik Mühendisliği'),
  ('014', 'Elektronik ve Haberleşme Mühendisliği'),
  ('015', 'Kontrol ve Otomasyon Mühendisliği'),
  ('021', 'Felsefe'),
  ('022', 'Fizik'),
  ('023', 'İstatistik'),
  ('024', 'Kimya'),
  ('025', 'Matematik'),
  ('026', 'Mütercim-Tercümanlık (Fransızca)'),
  ('027', 'Türk Dili ve Edebiyatı'),
  ('028', 'Moleküler Biyoloji ve Genetik'),
  ('029', 'İnsan ve Toplum Bilimleri'),
  ('02B', 'Sosyoloji'),
  ('02D', 'Kimya (İngilizce)');

INSERT INTO spending_request_state (id, title) VALUES
  (1, 'Harcama Bekleniyor'),
  (2, 'Harcama Yapıldı'),
  (3, 'Harcama İsteği Reddedildi'),
  (4, 'Yönetici tarafından askıya alındı');

INSERT INTO announcement_category (id, category_name, parent_category_id)  VALUES
  (-1, 'Tüm Kategoriler', 0, 0),
  (0, 'root-category', 0),
  (1, 'Diğer', 0),
  (2, 'Etkinlik', 1);