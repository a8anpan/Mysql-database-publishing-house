create database ekdotikos_oikos;
use ekdotikos_oikos;

create table efimerida(
ef_onoma VARCHAR (25)	default 'unknown' NOT NULL,
idiokthths VARCHAR (25) default 'unknown' NOT NULL,
syxnothta_ekdoshs  ENUM('hmerhsia', 'evdomadiaia', 'mhniaia'),
PRIMARY KEY(ef_onoma)
) engine=InnoDB;

create table ergazomenos(
onoma_efhmeridas VARCHAR (25)	default 'unknown' NOT NULL,
email VARCHAR (25)	default 'unknown' NOT NULL,
erg_onoma  VARCHAR (25)	default 'unknown' NOT NULL,
erg_epitheto  VARCHAR (25)	default 'unknown' NOT NULL,
erg_misthos INT(25) NOT NULL,
erg_proslhpsh DATE NOT NULL,
PRIMARY KEY (email),
CONSTRAINT ergergazetai FOREIGN KEY (onoma_efhmeridas) REFERENCES efimerida(ef_onoma)
ON UPDATE CASCADE ON DELETE CASCADE 
) engine=InnoDB;

create table fyllo( 
ef_onoma VARCHAR (25) default 'unknown' NOT NULL,
ar_fyllou INT(255) NOT NULL,
selides INT(3) NOT NULL,
hmer_kykloforias DATE NOT NULL,
patharthrou CHAR(255) default 'unknown'  NOT NULL,
CONSTRAINT fyllo_ekdidetai FOREIGN KEY (ef_onoma) REFERENCES efimerida(ef_onoma)
ON UPDATE CASCADE ON DELETE CASCADE	
)engine=InnoDB;

create table dhmosiografos(
email VARCHAR(25) default 'unknown' NOT NULL,
proyphresia INT(2) NOT NULL,
biografiko text  NOT NULL,
PRIMARY KEY(email),
FOREIGN KEY (email) REFERENCES ergazomenos(email)
)engine=InnoDB;


create table dioikhtikos(
email VARCHAR(25) default 'unknown' NOT NULL,
kathikonta enum('Secretary','Logistics') NOT NULL,
odos VARCHAR(25) default 'unknown' NOT NULL,
arithmos INT(25) NOT NULL,
polh VARCHAR(25) default 'unknown' NOT NULL,
PRIMARY KEY(email),
FOREIGN KEY (email) REFERENCES ergazomenos(email)
)engine=InnoDB;

create table  thlefwna(
arithmos_thl BIGINT(20) NOT NULL,
dioikhtikos_email VARCHAR(25) NOT NULL,
PRIMARY KEY(arithmos_thl,dioikhtikos_email),
CONSTRAINT dthl
  FOREIGN KEY(dioikhtikos_email) REFERENCES dioikhtikos(email)
  ON DELETE CASCADE ON UPDATE CASCADE
) engine=InnoDB;

	create table arthro(
	onoma_ef VARCHAR (25)	default 'unknown' NOT NULL,
	path CHAR(255) default 'unknown'  NOT NULL,
	titlos VARCHAR(255) default 'unknown' NOT NULL,
	perilhpsh text NOT NULL,
	kod_kathg_arthrou INT(25) NOT NULL,
	selida_ekkinhshs int(3),
	plhthos_selidwn int(3),
	ari8mos_fyllou int(255),
	primary key (path),
	CONSTRAINT dymosieush FOREIGN KEY (onoma_ef) REFERENCES fyllo(ef_onoma)
	ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT kathgarthrou FOREIGN KEY(kod_kathg_arthrou) REFERENCES kathgoria(kodikos)
	ON DELETE CASCADE ON UPDATE CASCADE
	)engine=InnoDB;

create table leksh_kleidi(
lekshkleidi VARCHAR(25) default 'unknown' NOT NULL,
arthro_path CHAR(255) default 'unknown' NOT NULL,
PRIMARY KEY(lekshkleidi,arthro_path),
CONSTRAINT leksh_arthro FOREIGN KEY (arthro_path) REFERENCES arthro(path)
ON DELETE CASCADE ON UPDATE CASCADE
)engine=InnoDB;

Create table ypovolh(
path_arthro  CHAR(255) default 'unknown' NOT NULL,
dhmosiografos_email VARCHAR(25) default 'unknown' NOT NULL,
primary key(path_arthro,dhmosiografos_email),
CONSTRAINT arthro_ypovolh FOREIGN KEY (path_arthro) REFERENCES arthro(path)
ON DELETE CASCADE ON UPDATE CASCADE ,
CONSTRAINT dhmosiografos_ypovolh FOREIGN KEY (dhmosiografos_email) REFERENCES dhmosiografos(email)
ON DELETE CASCADE ON UPDATE CASCADE
)engine=InnoDB;	

create table kathgoria(
kodikos INT(25) NOT NULL,
kodikos_kat int(25) not null,
onoma_kathgoria VARCHAR(25) default 'unknown' NOT NULL,
perigrafh VARCHAR(25) default 'unknown' NOT NULL,
Primary key (kodikos),
constraint goneas foreign key(kodikos_kat) references kathgoria(kodikos)
on delete cascade on update cascade
)engine=InnoDB;

create table arxisyntakths(
email_arx VARCHAR(25) default 'unknown' NOT NULL,
PRIMARY KEY (email_arx),
FOREIGN KEY (email_arx) REFERENCES ergazomenos(email)
)engine=InnoDB;

create table elegxos(
path_ar CHAR(255) default 'unknown' NOT NULL,
arx_email VARCHAR(25) default 'unknown' NOT NULL,
krish ENUM('egkrish','aporripsh','allagh') NOT NULL,
hmeromhnia_egkrishs date,
primary key(path_ar,arx_email),
CONSTRAINT elegxos_ar FOREIGN KEY (path_ar) REFERENCES arthro(path)
ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT elegxos_arx FOREIGN KEY (arx_email) REFERENCES arxisyntakths(email_arx)
ON DELETE CASCADE ON UPDATE CASCADE
)engine=InnoDB;

INSERT INTO efimerida VALUES ('kathimerinh','savvidis','hmerhsia'),
('ta nea','marinakhs','evdomadiaia');

INSERT INTO ergazomenos VALUES('kathimerinh','ioannou@gmail.com','dimitris','ioannou','1000','2015-07-02'),
('ta nea','sinas@gmail.com','rigers','sinas','1100','2017-02-11'),
('kathimerinh','athanasopoulos@gmail.com','panagioths','athanasopoulos','1200','2014-09-01'),
('ta nea','georgiou@gmail.com','hlias','georgiou','1300','2017-08-02'),
('kathimerinh','konstantinou@gmail.com','dimitris','konstantinou','1400','2011-02-09'),
('ta nea','kosmidis@gmail.com','alexandros','kosmidis','1500','2012-12-11');

INSERT INTO fyllo VALUES('kathimerinh','223','45','2019-05-12','C:\Users\Articles\Submitted\Article956.doc'),('ta nea','227','42','2019-04-14','C:\Users\Articles\Submitted\Article951.doc'),('kathimerinh','105','74','2018-11-23','C:\Users\Articles\Submitted\Article9555.doc'),
('ta nea','250','50','2019-07-09','C:\Users\Articles\Submitted\Article9501.doc');
INSERT INTO fyllo VALUES('kathimerinh','1','2','2019-05-12');
 
INSERT INTO dhmosiografos VALUES('ioannou@gmail.com','7','spoudase sthn panteio'),
('sinas@gmail.com','4','spoudase sthn patra');

INSERT INTO dioikhtikos VALUES('athanasopoulos@gmail.com','Secretary','patrewn','12','patra'),
('georgiou@gmail.com','Logistics','poukevil','28','patra');

INSERT INTO thlefwna VALUES ('6945031262','athanasopoulos@gmail.com'),('6945127823','georgiou@gmail.com');

INSERT INTO arthro VALUES('kathimerinh','C:\Users\Articles\Submitted\Article32.doc','prosfuges sto aigaio','megalos arithmos prosfugwn sto aigaio','1723'),
('ta nea','C:\Users\Articles\Submitted\Article30.doc','coronavirus','auksanontai ta thumata tou iou','2216');
INSERT INTO arthro VALUES('eleutheros tupos','C:\Users\Articles\Submitted\Article50.doc','nomosxedio gia thn paidia','psyfoforia thn voulh gia thn paidia',50,25,3);
INSERT INTO arthro VALUES('ta nea','C:\Users\Articles\Submitted\Article95.doc','iatriko synedrio','omilia lektora','1723',4,3,1);
INSERT INTO  leksh_kleidi VALUES('prosfuges','C:\Users\Articles\Submitted\Article32.doc'),
('ios','C:\Users\Articles\Submitted\Article30.doc');
INSERT INTO arthro VALUES('ta nea','C:\Users\Articles\Submitted\Article90.doc','pitino sthn ethnikh','neos proponhths ths ethnikhs o pitino','1723',25,3,223);
INSERT INTO arthro VALUES('ta nea','C:\Users\Articles\Submitted\Article96.doc','epistrofh stis nikes','nikh olympiakou epi ths cska','1723',4,3,1);
INSERT INTO arthro VALUES('ta nea','C:\Users\Articles\Submitted\Article97.doc','synanthsh mhtsotakh','deipno prothupourgou me erntogan','1723',4,3,1);
INSERT INTO arthro VALUES('ta nea','C:\Users\Articles\Submitted\Article98.doc','synaulia sto hrodio','sunaulia gia to xamogelo tou paidiou','1723',4,3,1);

INSERT INTO ypovolh VALUES ('C:\Users\Articles\Submitted\Article32.doc','ioannou@gmail.com'),
('C:\Users\Articles\Submitted\Article30.doc','sinas@gmail.com');

INSERT INTO kathgoria VALUES ('1823','1823','politika','ekloges'),('2216','2216','athlitika','agwnas podosfairou');

INSERT INTO arxisyntakths VALUES('konstantinou@gmail.com'),
('kosmidis@gmail.com');

INSERT INTO elegxos VALUES('C:\Users\Articles\Submitted\Article32.doc','konstantinou@gmail.com','egkrish'),
('C:\Users\Articles\Submitted\Article30.doc','kosmidis@gmail.com','allagh');

DELIMITER $
create procedure stoixeia_arthrwn(in arithmos_fyllou int(255),in onoma_efhmeridas varchar(25))
begin 
declare name_efhmeridas varchar(25);
declare not_found int;
declare selides_fyllou int(3);
declare dia8esimes_selides int(3);

declare bcursor cursor for
select ef_onoma 
from fyllo 
where ef_onoma=onoma_efhmeridas and ar_fyllou=arithmos_fyllou;

declare continue handler for not found 
set not_found=1;

set dia8esimes_selides=0;
set selides_fyllou=0;
select selides into selides_fyllou
from fyllo
where ef_onoma=onoma_efhmeridas and ar_fyllou=arithmos_fyllou;

if ( selides_fyllou < 50 ) 
then
set dia8esimes_selides = 50 - selides_fyllou;
select dia8esimes_selides as 'dia8esimes selides fyllou';
end if;

set not_found=0;
open bcursor;

repeat
fetch bcursor into name_efhmeridas;
if (not_found=0)
then 
select * from arthro where onoma_ef=name_efhmeridas;
select hmeromhnia_egkrishs
from arthro
inner join elegxos on path=path_ar
where onoma_ef=name_efhmeridas;
select erg_onoma,erg_epitheto
from arthro 
inner join ypovolh on path=path_arthro
inner join dhmosiografos on dhmosiografos_email=email
inner join ergazomenos on dhmosiografos.email=ergazomenos.email
where onoma_ef=name_efhmeridas;
end if;
until(not_found=1)
end repeat;
close bcursor;
END$
DELIMITER ;

delimiter $
create procedure misthos_ergazomenou(in onoma_dhmosiografou varchar(25),in epitheto_dhmosiografou varchar(25))
begin
declare email_dhmosiografou varchar(25);
declare hmeromhnia_proslhpshs date;
declare mhnes_ergasias_sthn_efhmerida int(2);
declare proyphresia_dhmosiografou int(2);
declare sunolikoi_mhnes_proyphresias int(2);
declare epanaypologismos_basikou_misthou int(25);
declare not_found int;
declare misthos_ergazomenou int(25); 

declare bcursor cursor for 
select email
from ergazomenos
where erg_onoma=onoma_dhmosiografou and erg_epitheto=epitheto_dhmosiografou;

declare continue handler for not found 
set not_found=1;

set epanaypologismos_basikou_misthou=0;
set email_dhmosiografou=null;
set misthos_ergazomenou=0;
set  mhnes_ergasias_sthn_efhmerida=0;
set proyphresia_dhmosiografou=0;
set  sunolikoi_mhnes_proyphresias=0;
set hmeromhnia_proslhpshs=null;
select erg_proslhpsh into hmeromhnia_proslhpshs
from ergazomenos
where erg_onoma=onoma_dhmosiografou and erg_epitheto=epitheto_dhmosiografou;

select timestampdiff(month,hmeromhnia_proslhpshs,curdate()) into mhnes_ergasias_sthn_efhmerida;
 
set not_found=0;        
open bcursor;

repeat
fetch bcursor into email_dhmosiografou;
if (not_found=0)
then 
select proyphresia into proyphresia_dhmosiografou
from ergazomenos
inner join dhmosiografos on ergazomenos.email=dhmosiografos.email
where dhmosiografos.email=email_dhmosiografou;

select erg_misthos into misthos_ergazomenou 
from ergazomenos 
inner join dhmosiografos on ergazomenos.email=dhmosiografos.email
where dhmosiografos.email=email_dhmosiografou;

set sunolikoi_mhnes_proyphresias = mhnes_ergasias_sthn_efhmerida + proyphresia_dhmosiografou;
set epanaypologismos_basikou_misthou =(misthos_ergazomenou * 0.005 * sunolikoi_mhnes_proyphresias) + misthos_ergazomenou;
select epanaypologismos_basikou_misthou as 'epanaupologismos basikou misthou me aukshsh 0,5% gia kathe mhna proyphresias';

end if;
until(not_found=1)
end repeat;
close bcursor;
end$
delimiter ;

delimiter $
create trigger eisagwgh_upallhlou  before insert on ergazomenos 
for each row 
begin
declare misthos_upallhlou int(25);
set misthos_upallhlou=650;
set new.erg_misthos=misthos_upallhlou;
end$
delimiter ;

delimiter $
create trigger elegxos_dhmosiografou before insert on ypovolh
for each row
begin
declare email_count int;

select count(*) into email_count
from arxisyntakths
where new.dhmosiografos_email=email_arx;

if (email_count=0)  
then
insert into ypovolh(path_arthro) values (null);
end if;
end$
delimiter ;

DELIMITER $
CREATE TRIGGER elegxos_xwrou BEFORE insert ON fyllo          
FOR EACH ROW
BEGIN
declare selides_arthrou_pou_eisagoume int;
declare selides_fyllou int;
declare dia8esimos_xwros int;

select plhthos_selidwn into selides_arthrou_pou_eisagoume 
from arthro 
inner join fyllo on onoma_ef=ef_onoma  
where arthro.onoma_ef=new.ef_onoma and arthro.ari8mos_fyllou=new.ar_fyllou;

select selides into selides_fyllou 
from fyllo
inner join arthro on ef_onoma=onoma_ef 
where new.ar_fyllou=arthro.ari8mos_fyllou and  fyllo.ef_onoma=arthro.onoma_ef; 

set dia8esimos_xwros = 50 - selides_fyllou;

IF ( dia8esimos_xwros >= selides_arthrou_pou_eisagoume ) 
THEN	
SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'den eparkei o xwros tou fyllou.';
END IF;
END$
DELIMITER ;