# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#Criando usuário
user1 = User.new
user1.name = 'Daniel'
user1.email = 'daniel@blando.com'
user1.password = '123'
user1.save

user2 = User.new
user2.name = 'Joao'
user2.email = 'joao@joao.com'
user2.password = '123'
user2.save

#Criando Temas
select = Theme.new
select.name = "SELECT"
select.description = "Duvidas sobre comando SELECT"
select.save

update = Theme.new
update.name = "UPDATE"
update.description = "Duvidas sobre comando UPDATE"
update.save

insert = Theme.new
insert.name = "INSERT"
insert.description = "Duvidas sobre comando INSERT"
insert.save

delete = Theme.new
delete.name = "DELETE"
delete.description = "Duvidas sobre comando DELETE"
delete.save

#Criando Forum
selectf1 = Forum.new
selectf1.name = "Exemplo de SELECT"
selectf1.description = "Gostaria de receber um exemplo de SELECT"
selectf1.theme_id = select.id
selectf1.save

selectf2 = Forum.new
selectf2.name = "Erro no SELECT"
selectf2.description = "Comente seus error no select"
selectf2.theme_id = select.id
selectf2.save

updatef1 = Forum.new
updatef1.name = "Exemplo de UPDATE"
updatef1.description = "Gostaria de receber um exemplo de UPDATE"
updatef1.theme_id = update.id
updatef1.save


#Criando Interaction
i1 = Interaction.new
i1.user_id = user1.id
i1.snap_id = -1
i1.description = "Select * from country order by name desc"
i1.forum_id = selectf1.id
i1.save

i2 = Interaction.new
i2.user_id = user2.id
i2.snap_id = -1
i2.description = "O que siginifica esse desc?"
i2.upper_interaction = i1.id
i2.forum_id = selectf1.id
i2.save

i3 = Interaction.new
i3.user_id = user1.id
i3.snap_id = -1
i3.description = "Desc eh para ordernar em order decrescente"
i3.upper_interaction = i1.id
i3.forum_id = selectf1.id
i3.save

i4 = Interaction.new
i4.user_id = user2.id
i4.snap_id = -1
i4.description = "Select id, name, region from country group by name "
i4.forum_id = selectf2.id
i4.save

i5 = Interaction.new
i5.user_id = user1.id
i5.snap_id = -1
i5.description = "Todas as colunas do select tem que ser usadas em group by a nao ser funcoes"
i5.upper_interaction = i4.id
i5.forum_id = selectf2.id
i5.save

































#Criacao database
db1 = Database.new
db1.db_sql = 
"
--
-- PostgreSQL database dump
--

-- Dumped from database version 9.2.4
-- Dumped by pg_dump version 9.2.2
-- Started on 2013-07-02 04:17:35 BRT

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

DROP DATABASE carrental;
--
-- TOC entry 2205 (class 1262 OID 17055)
-- Name: carrental; Type: DATABASE; Schema: -; Owner: Daniel
--

CREATE DATABASE carrental WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'pt_BR.UTF-8' LC_CTYPE = 'pt_BR.UTF-8';


\connect carrental

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 5 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: Daniel
--

CREATE SCHEMA public;


--
-- TOC entry 2206 (class 0 OID 0)
-- Dependencies: 5
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: Daniel
--

COMMENT ON SCHEMA public IS 'standard public schema';


--
-- TOC entry 171 (class 3079 OID 11995)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2208 (class 0 OID 0)
-- Dependencies: 171
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 168 (class 1259 OID 17056)
-- Name: customers; Type: TABLE; Schema: public; Owner: Daniel; Tablespace: 
--

CREATE TABLE customers (
    cid character varying(5) NOT NULL,
    first_name character varying(20),
    last_name character varying(15),
    address character varying(30)
);


--
-- TOC entry 170 (class 1259 OID 17068)
-- Name: reservation; Type: TABLE; Schema: public; Owner: Daniel; Tablespace: 
--

CREATE TABLE reservation (
    cid character varying(5) NOT NULL,
    vid character varying(5) NOT NULL,
    start_date date,
    end_date date
);


--
-- TOC entry 169 (class 1259 OID 17061)
-- Name: vehicle; Type: TABLE; Schema: public; Owner: Daniel; Tablespace: 
--

CREATE TABLE vehicle (
    vid character varying(5) NOT NULL,
    mileage integer,
    location character varying(20),
    vsize character varying(30),
    transmission character varying(10),
    CONSTRAINT vehicle_transmission_check CHECK (((transmission)::text = ANY ((ARRAY['MANUAL'::character varying, 'AUTOMATIC'::character varying])::text[]))),
    CONSTRAINT vehicle_vsize_check CHECK (((vsize)::text = ANY ((ARRAY['COMPACT'::character varying, 'MID-SIZE'::character varying, 'FULL-SIZE'::character varying, 'PREMIUM'::character varying, 'LUXURY'::character varying])::text[])))
);


--
-- TOC entry 2198 (class 0 OID 17056)
-- Dependencies: 168
-- Data for Name: customers; Type: TABLE DATA; Schema: public; Owner: Daniel
--

INSERT INTO customers (cid, first_name, last_name, address) VALUES ('101', 'KRUNAL', 'PATEL', 'MANINAGAR,AHMD');
INSERT INTO customers (cid, first_name, last_name, address) VALUES ('102', 'BHAVESH', 'MODI', 'VADAJ,AHMD');
INSERT INTO customers (cid, first_name, last_name, address) VALUES ('103', 'DARSHAN', 'DERASARI', 'HIMANTNAGAR');
INSERT INTO customers (cid, first_name, last_name, address) VALUES ('104', 'VISHAL', 'DAVE', 'ISSANPUR,AHMD');
INSERT INTO customers (cid, first_name, last_name, address) VALUES ('105', 'SAGAR', 'SHAH', 'VATVA,AHMD');


--
-- TOC entry 2200 (class 0 OID 17068)
-- Dependencies: 170
-- Data for Name: reservation; Type: TABLE DATA; Schema: public; Owner: Daniel
--

INSERT INTO reservation (cid, vid, start_date, end_date) VALUES ('101', 'V-101', '2001-01-10', '2005-02-10');
INSERT INTO reservation (cid, vid, start_date, end_date) VALUES ('102', 'V-102', '2001-03-12', '2006-06-10');
INSERT INTO reservation (cid, vid, start_date, end_date) VALUES ('103', 'V-103', '1999-02-15', '2005-09-09');
INSERT INTO reservation (cid, vid, start_date, end_date) VALUES ('105', 'V-105', '2003-02-15', '2005-09-09');


--
-- TOC entry 2199 (class 0 OID 17061)
-- Dependencies: 169
-- Data for Name: vehicle; Type: TABLE DATA; Schema: public; Owner: Daniel
--

INSERT INTO vehicle (vid, mileage, location, vsize, transmission) VALUES ('V-101', 70, 'AHMD', 'COMPACT', 'AUTOMATIC');
INSERT INTO vehicle (vid, mileage, location, vsize, transmission) VALUES ('V-102', 50, 'SURAT', 'COMPACT', 'AUTOMATIC');
INSERT INTO vehicle (vid, mileage, location, vsize, transmission) VALUES ('V-103', 10, 'AHMD', 'MID-SIZE', 'MANUAL');
INSERT INTO vehicle (vid, mileage, location, vsize, transmission) VALUES ('V-104', 30, 'AHMD', 'MID-SIZE', 'AUTOMATIC');
INSERT INTO vehicle (vid, mileage, location, vsize, transmission) VALUES ('V-105', 15, 'VADODARA', 'FULL-SIZE', 'AUTOMATIC');
INSERT INTO vehicle (vid, mileage, location, vsize, transmission) VALUES ('V-106', 20, 'AHMD', 'LUXURY', 'AUTOMATIC');
INSERT INTO vehicle (vid, mileage, location, vsize, transmission) VALUES ('V-107', 50, 'AHMD', 'LUXURY', 'MANUAL');


--
-- TOC entry 2191 (class 2606 OID 17060)
-- Name: customers_pkey; Type: CONSTRAINT; Schema: public; Owner: Daniel; Tablespace: 
--

ALTER TABLE ONLY customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (cid);


--
-- TOC entry 2195 (class 2606 OID 17072)
-- Name: reservation_pkey; Type: CONSTRAINT; Schema: public; Owner: Daniel; Tablespace: 
--

ALTER TABLE ONLY reservation
    ADD CONSTRAINT reservation_pkey PRIMARY KEY (cid, vid);


--
-- TOC entry 2193 (class 2606 OID 17067)
-- Name: vehicle_pkey; Type: CONSTRAINT; Schema: public; Owner: Daniel; Tablespace: 
--

ALTER TABLE ONLY vehicle
    ADD CONSTRAINT vehicle_pkey PRIMARY KEY (vid);


--
-- TOC entry 2196 (class 2606 OID 17073)
-- Name: reservation_cid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: Daniel
--

ALTER TABLE ONLY reservation
    ADD CONSTRAINT reservation_cid_fkey FOREIGN KEY (cid) REFERENCES customers(cid);


--
-- TOC entry 2197 (class 2606 OID 17078)
-- Name: reservation_vid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: Daniel
--

ALTER TABLE ONLY reservation
    ADD CONSTRAINT reservation_vid_fkey FOREIGN KEY (vid) REFERENCES vehicle(vid);


--
-- TOC entry 2207 (class 0 OID 0)
-- Dependencies: 5
-- Name: public; Type: ACL; Schema: -; Owner: Daniel
--


--
-- TOC entry 2209 (class 0 OID 0)
-- Dependencies: 168
-- Name: customers; Type: ACL; Schema: public; Owner: Daniel
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE customers TO student;


--
-- TOC entry 2210 (class 0 OID 0)
-- Dependencies: 170
-- Name: reservation; Type: ACL; Schema: public; Owner: Daniel
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE reservation TO student;


--
-- TOC entry 2211 (class 0 OID 0)
-- Dependencies: 169
-- Name: vehicle; Type: ACL; Schema: public; Owner: Daniel
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE vehicle TO student;


-- Completed on 2013-07-02 04:17:35 BRT

--
-- PostgreSQL database dump complete
--
"
db1.db_image = "carrental"
db1.save

#####################################################################################################################################
#####################################################################################################################################
#####################################################################################################################################

db2 = Database.new
db2.db_sql = 
"--
-- PostgreSQL database dump
--

-- Dumped from database version 9.2.4
-- Dumped by pg_dump version 9.2.2
-- Started on 2013-07-02 04:26:29 BRT

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

DROP DATABASE world;
--
-- TOC entry 2219 (class 1262 OID 17019)
-- Name: world; Type: DATABASE; Schema: -; Owner: Daniel
--

CREATE DATABASE world WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'pt_BR.UTF-8' LC_CTYPE = 'pt_BR.UTF-8';


\connect world

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 5 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: Daniel
--

CREATE SCHEMA public;


--
-- TOC entry 2220 (class 0 OID 0)
-- Dependencies: 5
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: Daniel
--

COMMENT ON SCHEMA public IS 'standard public schema';


--
-- TOC entry 171 (class 3079 OID 11995)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2222 (class 0 OID 0)
-- Dependencies: 171
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 168 (class 1259 OID 17020)
-- Name: city; Type: TABLE; Schema: public; Owner: Daniel; Tablespace: 
--

CREATE TABLE city (
    id integer NOT NULL,
    name character(35) DEFAULT ''::bpchar NOT NULL,
    countrycode character(3) DEFAULT ''::bpchar NOT NULL,
    district character(20) DEFAULT ''::bpchar NOT NULL,
    population integer DEFAULT 0 NOT NULL
);


--
-- TOC entry 169 (class 1259 OID 17031)
-- Name: country; Type: TABLE; Schema: public; Owner: Daniel; Tablespace: 
--

CREATE TABLE country (
    code character(3) DEFAULT ''::bpchar NOT NULL,
    name character(52) DEFAULT ''::bpchar NOT NULL,
    continent character(100) DEFAULT 'Asia'::bpchar NOT NULL,
    region character(26) DEFAULT ''::bpchar NOT NULL,
    surfacearea double precision DEFAULT 0::double precision NOT NULL,
    indepyear smallint,
    population integer DEFAULT 0 NOT NULL,
    lifeexpectancy double precision,
    gnp double precision,
    gnpold double precision,
    localname character(45) DEFAULT ''::bpchar NOT NULL,
    governmentform character(45) DEFAULT ''::bpchar NOT NULL,
    headofstate character(60) DEFAULT NULL::bpchar,
    capital integer,
    code2 character(2) DEFAULT ''::bpchar NOT NULL
);


--
-- TOC entry 170 (class 1259 OID 17046)
-- Name: countrylanguage; Type: TABLE; Schema: public; Owner: Daniel; Tablespace: 
--

CREATE TABLE countrylanguage (
    countrycode character(3) DEFAULT ''::bpchar NOT NULL,
    language character(30) DEFAULT ''::bpchar NOT NULL,
    isofficial character(1) DEFAULT 'F'::bpchar NOT NULL,
    percentage double precision DEFAULT 0::double precision NOT NULL
);

--
-- TOC entry 2212 (class 0 OID 17020)
-- Dependencies: 168
-- Data for Name: city; Type: TABLE DATA; Schema: public; Owner: Daniel
--

INSERT INTO city VALUES (1, 'Kabul                              ', 'AFG', 'Kabol               ', 1780000);
INSERT INTO city VALUES (2, 'Qandahar                           ', 'AFG', 'Qandahar            ', 237500);
INSERT INTO city VALUES (3, 'Herat                              ', 'AFG', 'Herat               ', 186800);
INSERT INTO city VALUES (4, 'Mazar-e-Sharif                     ', 'AFG', 'Balkh               ', 127800);
INSERT INTO city VALUES (5, 'Amsterdam                          ', 'NLD', 'Noord-Holland       ', 731200);
INSERT INTO city VALUES (6, 'Rotterdam                          ', 'NLD', 'Zuid-Holland        ', 593321);
INSERT INTO city VALUES (7, 'Haag                               ', 'NLD', 'Zuid-Holland        ', 440900);
INSERT INTO city VALUES (8, 'Utrecht                            ', 'NLD', 'Utrecht             ', 234323);
INSERT INTO city VALUES (9, 'Eindhoven                          ', 'NLD', 'Noord-Brabant       ', 201843);
INSERT INTO city VALUES (10, 'Tilburg                            ', 'NLD', 'Noord-Brabant       ', 193238);
INSERT INTO city VALUES (11, 'Groningen                          ', 'NLD', 'Groningen           ', 172701);
INSERT INTO city VALUES (12, 'Breda                              ', 'NLD', 'Noord-Brabant       ', 160398);
INSERT INTO city VALUES (13, 'Apeldoorn                          ', 'NLD', 'Gelderland          ', 153491);
INSERT INTO city VALUES (14, 'Nijmegen                           ', 'NLD', 'Gelderland          ', 152463);
INSERT INTO city VALUES (15, 'Enschede                           ', 'NLD', 'Overijssel          ', 149544);
INSERT INTO city VALUES (16, 'Haarlem                            ', 'NLD', 'Noord-Holland       ', 148772);
INSERT INTO city VALUES (17, 'Almere                             ', 'NLD', 'Flevoland           ', 142465);
INSERT INTO city VALUES (18, 'Arnhem                             ', 'NLD', 'Gelderland          ', 138020);
INSERT INTO city VALUES (19, 'Zaanstad                           ', 'NLD', 'Noord-Holland       ', 135621);
INSERT INTO city VALUES (20, 'Ys-Hertogenbosch                   ', 'NLD', 'Noord-Brabant       ', 129170);
INSERT INTO city VALUES (21, 'Amersfoort                         ', 'NLD', 'Utrecht             ', 126270);
INSERT INTO city VALUES (22, 'Maastricht                         ', 'NLD', 'Limburg             ', 122087);
INSERT INTO city VALUES (23, 'Dordrecht                          ', 'NLD', 'Zuid-Holland        ', 119811);
INSERT INTO city VALUES (24, 'Leiden                             ', 'NLD', 'Zuid-Holland        ', 117196);
INSERT INTO city VALUES (25, 'Haarlemmermeer                     ', 'NLD', 'Noord-Holland       ', 110722);
INSERT INTO city VALUES (26, 'Zoetermeer                         ', 'NLD', 'Zuid-Holland        ', 110214);
INSERT INTO city VALUES (27, 'Emmen                              ', 'NLD', 'Drenthe             ', 105853);
INSERT INTO city VALUES (28, 'Zwolle                             ', 'NLD', 'Overijssel          ', 105819);
INSERT INTO city VALUES (29, 'Ede                                ', 'NLD', 'Gelderland          ', 101574);
INSERT INTO city VALUES (30, 'Delft                              ', 'NLD', 'Zuid-Holland        ', 95268);
INSERT INTO city VALUES (31, 'Heerlen                            ', 'NLD', 'Limburg             ', 95052);
INSERT INTO city VALUES (32, 'Alkmaar                            ', 'NLD', 'Noord-Holland       ', 92713);
INSERT INTO city VALUES (33, 'Willemstad                         ', 'ANT', 'Curaaao             ', 2345);
INSERT INTO city VALUES (34, 'Tirana                             ', 'ALB', 'Tirana              ', 270000);
INSERT INTO city VALUES (35, 'Alger                              ', 'DZA', 'Alger               ', 2168000);
INSERT INTO city VALUES (36, 'Oran                               ', 'DZA', 'Oran                ', 609823);
INSERT INTO city VALUES (37, 'Constantine                        ', 'DZA', 'Constantine         ', 443727);
INSERT INTO city VALUES (38, 'Annaba                             ', 'DZA', 'Annaba              ', 222518);
INSERT INTO city VALUES (39, 'Batna                              ', 'DZA', 'Batna               ', 183377);
INSERT INTO city VALUES (40, 'Setif                              ', 'DZA', 'Setif               ', 179055);
INSERT INTO city VALUES (41, 'Sidi Bel Abbes                     ', 'DZA', 'Sidi Bel Abbes      ', 153106);
INSERT INTO city VALUES (42, 'Skikda                             ', 'DZA', 'Skikda              ', 128747);
INSERT INTO city VALUES (43, 'Biskra                             ', 'DZA', 'Biskra              ', 128281);
INSERT INTO city VALUES (44, 'Blida (el-Boulaida)                ', 'DZA', 'Blida               ', 127284);
INSERT INTO city VALUES (45, 'Bejaoa                             ', 'DZA', 'Bejaoa              ', 117162);
INSERT INTO city VALUES (46, 'Mostaganem                         ', 'DZA', 'Mostaganem          ', 115212);
INSERT INTO city VALUES (47, 'Tebessa                            ', 'DZA', 'Tebessa             ', 112007);
INSERT INTO city VALUES (48, 'Tlemcen (Tilimsen)                 ', 'DZA', 'Tlemcen             ', 110242);
INSERT INTO city VALUES (49, 'Bechar                             ', 'DZA', 'Bechar              ', 107311);
INSERT INTO city VALUES (50, 'Tiaret                             ', 'DZA', 'Tiaret              ', 100118);
INSERT INTO city VALUES (51, 'Ech-Chleff (el-Asnam)              ', 'DZA', 'Chlef               ', 96794);
INSERT INTO city VALUES (52, 'Ghardaoa                           ', 'DZA', 'Ghardaoa            ', 89415);
INSERT INTO city VALUES (53, 'Tafuna                             ', 'ASM', 'Tutuila             ', 5200);
INSERT INTO city VALUES (54, 'Fagatogo                           ', 'ASM', 'Tutuila             ', 2323);
INSERT INTO city VALUES (55, 'Andorra la Vella                   ', 'AND', 'Andorra la Vella    ', 21189);
INSERT INTO city VALUES (56, 'Luanda                             ', 'AGO', 'Luanda              ', 2022000);
INSERT INTO city VALUES (57, 'Huambo                             ', 'AGO', 'Huambo              ', 163100);
INSERT INTO city VALUES (58, 'Lobito                             ', 'AGO', 'Benguela            ', 130000);
INSERT INTO city VALUES (59, 'Benguela                           ', 'AGO', 'Benguela            ', 128300);
INSERT INTO city VALUES (60, 'Namibe                             ', 'AGO', 'Namibe              ', 118200);
INSERT INTO city VALUES (61, 'South Hill                         ', 'AIA', 'n                   ', 961);
INSERT INTO city VALUES (62, 'The Valley                         ', 'AIA', 'n                   ', 595);
INSERT INTO city VALUES (63, 'Saint JohnYs                       ', 'ATG', 'St John             ', 24000);
INSERT INTO city VALUES (64, 'Dubai                              ', 'ARE', 'Dubai               ', 669181);
INSERT INTO city VALUES (65, 'Abu Dhabi                          ', 'ARE', 'Abu Dhabi           ', 398695);
INSERT INTO city VALUES (66, 'Sharja                             ', 'ARE', 'Sharja              ', 320095);
INSERT INTO city VALUES (67, 'al-Ayn                             ', 'ARE', 'Abu Dhabi           ', 225970);
INSERT INTO city VALUES (68, 'Ajman                              ', 'ARE', 'Ajman               ', 114395);
INSERT INTO city VALUES (69, 'Buenos Aires                       ', 'ARG', 'Distrito Federal    ', 2982146);
INSERT INTO city VALUES (70, 'La Matanza                         ', 'ARG', 'Buenos Aires        ', 1266461);
INSERT INTO city VALUES (71, 'Curdoba                            ', 'ARG', 'Curdoba             ', 1157507);
INSERT INTO city VALUES (72, 'Rosario                            ', 'ARG', 'Santa Fe            ', 907718);
INSERT INTO city VALUES (73, 'Lomas de Zamora                    ', 'ARG', 'Buenos Aires        ', 622013);
INSERT INTO city VALUES (74, 'Quilmes                            ', 'ARG', 'Buenos Aires        ', 559249);
INSERT INTO city VALUES (75, 'Almirante Brown                    ', 'ARG', 'Buenos Aires        ', 538918);
INSERT INTO city VALUES (76, 'La Plata                           ', 'ARG', 'Buenos Aires        ', 521936);
INSERT INTO city VALUES (77, 'Mar del Plata                      ', 'ARG', 'Buenos Aires        ', 512880);
INSERT INTO city VALUES (78, 'San Miguel de Tucumn               ', 'ARG', 'Tucumn              ', 470809);
INSERT INTO city VALUES (79, 'Lans                               ', 'ARG', 'Buenos Aires        ', 469735);
INSERT INTO city VALUES (80, 'Merlo                              ', 'ARG', 'Buenos Aires        ', 463846);
INSERT INTO city VALUES (81, 'General San Martin                 ', 'ARG', 'Buenos Aires        ', 422542);
INSERT INTO city VALUES (82, 'Salta                              ', 'ARG', 'Salta               ', 367550);
INSERT INTO city VALUES (83, 'Moreno                             ', 'ARG', 'Buenos Aires        ', 356993);
INSERT INTO city VALUES (84, 'Santa Fe                           ', 'ARG', 'Santa Fe            ', 353063);
INSERT INTO city VALUES (85, 'Avellaneda                         ', 'ARG', 'Buenos Aires        ', 353046);
INSERT INTO city VALUES (86, 'Tres de Febrero                    ', 'ARG', 'Buenos Aires        ', 352311);
INSERT INTO city VALUES (87, 'Morun                              ', 'ARG', 'Buenos Aires        ', 349246);
INSERT INTO city VALUES (88, 'Florencio Varela                   ', 'ARG', 'Buenos Aires        ', 315432);
INSERT INTO city VALUES (89, 'San Isidro                         ', 'ARG', 'Buenos Aires        ', 306341);
INSERT INTO city VALUES (90, 'Tigre                              ', 'ARG', 'Buenos Aires        ', 296226);
INSERT INTO city VALUES (91, 'Malvinas Argentinas                ', 'ARG', 'Buenos Aires        ', 290335);
INSERT INTO city VALUES (92, 'Vicente Lupez                      ', 'ARG', 'Buenos Aires        ', 288341);
INSERT INTO city VALUES (93, 'Berazategui                        ', 'ARG', 'Buenos Aires        ', 276916);
INSERT INTO city VALUES (94, 'Corrientes                         ', 'ARG', 'Corrientes          ', 258103);
INSERT INTO city VALUES (95, 'San Miguel                         ', 'ARG', 'Buenos Aires        ', 248700);
INSERT INTO city VALUES (96, 'Bahia Blanca                       ', 'ARG', 'Buenos Aires        ', 239810);
INSERT INTO city VALUES (97, 'Esteban Echeverria                 ', 'ARG', 'Buenos Aires        ', 235760);
INSERT INTO city VALUES (98, 'Resistencia                        ', 'ARG', 'Chaco               ', 229212);
INSERT INTO city VALUES (99, 'Jose C. Paz                        ', 'ARG', 'Buenos Aires        ', 221754);
INSERT INTO city VALUES (100, 'Paran                              ', 'ARG', 'Entre Rios          ', 207041);
INSERT INTO city VALUES (101, 'Godoy Cruz                         ', 'ARG', 'Mendoza             ', 206998);
INSERT INTO city VALUES (102, 'Posadas                            ', 'ARG', 'Misiones            ', 201273);
INSERT INTO city VALUES (103, 'Guaymallen                         ', 'ARG', 'Mendoza             ', 200595);
INSERT INTO city VALUES (104, 'Santiago del Estero                ', 'ARG', 'Santiago del Estero ', 189947);
INSERT INTO city VALUES (105, 'San Salvador de Jujuy              ', 'ARG', 'Jujuy               ', 178748);
INSERT INTO city VALUES (106, 'Hurlingham                         ', 'ARG', 'Buenos Aires        ', 170028);
INSERT INTO city VALUES (107, 'Neuquen                            ', 'ARG', 'Neuquen             ', 167296);
INSERT INTO city VALUES (108, 'Ituzaingu                          ', 'ARG', 'Buenos Aires        ', 158197);
INSERT INTO city VALUES (109, 'San Fernando                       ', 'ARG', 'Buenos Aires        ', 153036);
INSERT INTO city VALUES (110, 'Formosa                            ', 'ARG', 'Formosa             ', 147636);
INSERT INTO city VALUES (111, 'Las Heras                          ', 'ARG', 'Mendoza             ', 145823);
INSERT INTO city VALUES (112, 'La Rioja                           ', 'ARG', 'La Rioja            ', 138117);
INSERT INTO city VALUES (113, 'San Fernando del Valle de Cata     ', 'ARG', 'Catamarca           ', 134935);
INSERT INTO city VALUES (114, 'Rio Cuarto                         ', 'ARG', 'Curdoba             ', 134355);
INSERT INTO city VALUES (115, 'Comodoro Rivadavia                 ', 'ARG', 'Chubut              ', 124104);
INSERT INTO city VALUES (116, 'Mendoza                            ', 'ARG', 'Mendoza             ', 123027);
INSERT INTO city VALUES (117, 'San Nicols de los Arroyos          ', 'ARG', 'Buenos Aires        ', 119302);
INSERT INTO city VALUES (118, 'San Juan                           ', 'ARG', 'San Juan            ', 119152);
INSERT INTO city VALUES (119, 'Escobar                            ', 'ARG', 'Buenos Aires        ', 116675);
INSERT INTO city VALUES (120, 'Concordia                          ', 'ARG', 'Entre Rios          ', 116485);
INSERT INTO city VALUES (121, 'Pilar                              ', 'ARG', 'Buenos Aires        ', 113428);
INSERT INTO city VALUES (122, 'San Luis                           ', 'ARG', 'San Luis            ', 110136);
INSERT INTO city VALUES (123, 'Ezeiza                             ', 'ARG', 'Buenos Aires        ', 99578);
INSERT INTO city VALUES (124, 'San Rafael                         ', 'ARG', 'Mendoza             ', 94651);
INSERT INTO city VALUES (125, 'Tandil                             ', 'ARG', 'Buenos Aires        ', 91101);
INSERT INTO city VALUES (126, 'Yerevan                            ', 'ARM', 'Yerevan             ', 1248700);
INSERT INTO city VALUES (127, 'Gjumri                             ', 'ARM', 'airak               ', 211700);
INSERT INTO city VALUES (128, 'Vanadzor                           ', 'ARM', 'Lori                ', 172700);
INSERT INTO city VALUES (129, 'Oranjestad                         ', 'ABW', 'n                   ', 29034);
INSERT INTO city VALUES (130, 'Sydney                             ', 'AUS', 'New South Wales     ', 3276207);
INSERT INTO city VALUES (131, 'Melbourne                          ', 'AUS', 'Victoria            ', 2865329);
INSERT INTO city VALUES (132, 'Brisbane                           ', 'AUS', 'Queensland          ', 1291117);
INSERT INTO city VALUES (133, 'Perth                              ', 'AUS', 'West Australia      ', 1096829);
INSERT INTO city VALUES (134, 'Adelaide                           ', 'AUS', 'South Australia     ', 978100);
INSERT INTO city VALUES (135, 'Canberra                           ', 'AUS', 'Capital Region      ', 322723);
INSERT INTO city VALUES (136, 'Gold Coast                         ', 'AUS', 'Queensland          ', 311932);
INSERT INTO city VALUES (137, 'Newcastle                          ', 'AUS', 'New South Wales     ', 270324);
INSERT INTO city VALUES (138, 'Central Coast                      ', 'AUS', 'New South Wales     ', 227657);
INSERT INTO city VALUES (139, 'Wollongong                         ', 'AUS', 'New South Wales     ', 219761);
INSERT INTO city VALUES (140, 'Hobart                             ', 'AUS', 'Tasmania            ', 126118);
INSERT INTO city VALUES (141, 'Geelong                            ', 'AUS', 'Victoria            ', 125382);
INSERT INTO city VALUES (142, 'Townsville                         ', 'AUS', 'Queensland          ', 109914);
INSERT INTO city VALUES (143, 'Cairns                             ', 'AUS', 'Queensland          ', 92273);
INSERT INTO city VALUES (144, 'Baku                               ', 'AZE', 'Baki                ', 1787800);
INSERT INTO city VALUES (145, 'Ganca                              ', 'AZE', 'Ganca               ', 299300);
INSERT INTO city VALUES (146, 'Sumqayit                           ', 'AZE', 'Sumqayit            ', 283000);
INSERT INTO city VALUES (147, 'Mingaevir                          ', 'AZE', 'Mingaevir           ', 93900);
INSERT INTO city VALUES (148, 'Nassau                             ', 'BHS', 'New Providence      ', 172000);
INSERT INTO city VALUES (149, 'al-Manama                          ', 'BHR', 'al-Manama           ', 148000);
INSERT INTO city VALUES (150, 'Dhaka                              ', 'BGD', 'Dhaka               ', 3612850);
INSERT INTO city VALUES (151, 'Chittagong                         ', 'BGD', 'Chittagong          ', 1392860);
INSERT INTO city VALUES (152, 'Khulna                             ', 'BGD', 'Khulna              ', 663340);
INSERT INTO city VALUES (153, 'Rajshahi                           ', 'BGD', 'Rajshahi            ', 294056);
INSERT INTO city VALUES (154, 'Narayanganj                        ', 'BGD', 'Dhaka               ', 202134);
INSERT INTO city VALUES (155, 'Rangpur                            ', 'BGD', 'Rajshahi            ', 191398);
INSERT INTO city VALUES (156, 'Mymensingh                         ', 'BGD', 'Dhaka               ', 188713);
INSERT INTO city VALUES (157, 'Barisal                            ', 'BGD', 'Barisal             ', 170232);
INSERT INTO city VALUES (158, 'Tungi                              ', 'BGD', 'Dhaka               ', 168702);
INSERT INTO city VALUES (159, 'Jessore                            ', 'BGD', 'Khulna              ', 139710);
INSERT INTO city VALUES (160, 'Comilla                            ', 'BGD', 'Chittagong          ', 135313);
INSERT INTO city VALUES (161, 'Nawabganj                          ', 'BGD', 'Rajshahi            ', 130577);
INSERT INTO city VALUES (162, 'Dinajpur                           ', 'BGD', 'Rajshahi            ', 127815);
INSERT INTO city VALUES (163, 'Bogra                              ', 'BGD', 'Rajshahi            ', 120170);
INSERT INTO city VALUES (164, 'Sylhet                             ', 'BGD', 'Sylhet              ', 117396);
INSERT INTO city VALUES (165, 'Brahmanbaria                       ', 'BGD', 'Chittagong          ', 109032);
INSERT INTO city VALUES (166, 'Tangail                            ', 'BGD', 'Dhaka               ', 106004);
INSERT INTO city VALUES (167, 'Jamalpur                           ', 'BGD', 'Dhaka               ', 103556);
INSERT INTO city VALUES (168, 'Pabna                              ', 'BGD', 'Rajshahi            ', 103277);
INSERT INTO city VALUES (169, 'Naogaon                            ', 'BGD', 'Rajshahi            ', 101266);
INSERT INTO city VALUES (170, 'Sirajganj                          ', 'BGD', 'Rajshahi            ', 99669);
INSERT INTO city VALUES (171, 'Narsinghdi                         ', 'BGD', 'Dhaka               ', 98342);
INSERT INTO city VALUES (172, 'Saidpur                            ', 'BGD', 'Rajshahi            ', 96777);
INSERT INTO city VALUES (173, 'Gazipur                            ', 'BGD', 'Dhaka               ', 96717);
INSERT INTO city VALUES (174, 'Bridgetown                         ', 'BRB', 'St Michael          ', 6070);
INSERT INTO city VALUES (175, 'Antwerpen                          ', 'BEL', 'Antwerpen           ', 446525);
INSERT INTO city VALUES (176, 'Gent                               ', 'BEL', 'East Flanderi       ', 224180);
INSERT INTO city VALUES (177, 'Charleroi                          ', 'BEL', 'Hainaut             ', 200827);
INSERT INTO city VALUES (178, 'Liege                              ', 'BEL', 'Liege               ', 185639);
INSERT INTO city VALUES (179, 'Bruxelles [Brussel]                ', 'BEL', 'Bryssel             ', 133859);
INSERT INTO city VALUES (180, 'Brugge                             ', 'BEL', 'West Flanderi       ', 116246);
INSERT INTO city VALUES (181, 'Schaerbeek                         ', 'BEL', 'Bryssel             ', 105692);
INSERT INTO city VALUES (182, 'Namur                              ', 'BEL', 'Namur               ', 105419);
INSERT INTO city VALUES (183, 'Mons                               ', 'BEL', 'Hainaut             ', 90935);
INSERT INTO city VALUES (184, 'Belize City                        ', 'BLZ', 'Belize City         ', 55810);
INSERT INTO city VALUES (185, 'Belmopan                           ', 'BLZ', 'Cayo                ', 7105);
INSERT INTO city VALUES (186, 'Cotonou                            ', 'BEN', 'Atlantique          ', 536827);
INSERT INTO city VALUES (187, 'Porto-Novo                         ', 'BEN', 'Oueme               ', 194000);
INSERT INTO city VALUES (188, 'Djougou                            ', 'BEN', 'Atacora             ', 134099);
INSERT INTO city VALUES (189, 'Parakou                            ', 'BEN', 'Borgou              ', 103577);
INSERT INTO city VALUES (190, 'Saint George                       ', 'BMU', 'Saint GeorgeYs      ', 1800);
INSERT INTO city VALUES (191, 'Hamilton                           ', 'BMU', 'Hamilton            ', 1200);
INSERT INTO city VALUES (192, 'Thimphu                            ', 'BTN', 'Thimphu             ', 22000);
INSERT INTO city VALUES (193, 'Santa Cruz de la Sierra            ', 'BOL', 'Santa Cruz          ', 935361);
INSERT INTO city VALUES (194, 'La Paz                             ', 'BOL', 'La Paz              ', 758141);
INSERT INTO city VALUES (195, 'El Alto                            ', 'BOL', 'La Paz              ', 534466);
INSERT INTO city VALUES (196, 'Cochabamba                         ', 'BOL', 'Cochabamba          ', 482800);
INSERT INTO city VALUES (197, 'Oruro                              ', 'BOL', 'Oruro               ', 223553);
INSERT INTO city VALUES (198, 'Sucre                              ', 'BOL', 'Chuquisaca          ', 178426);
INSERT INTO city VALUES (199, 'Potosi                             ', 'BOL', 'Potosi              ', 140642);
INSERT INTO city VALUES (200, 'Tarija                             ', 'BOL', 'Tarija              ', 125255);
INSERT INTO city VALUES (201, 'Sarajevo                           ', 'BIH', 'Federaatio          ', 360000);
INSERT INTO city VALUES (202, 'Banja Luka                         ', 'BIH', 'Republika Srpska    ', 143079);
INSERT INTO city VALUES (203, 'Zenica                             ', 'BIH', 'Federaatio          ', 96027);
INSERT INTO city VALUES (204, 'Gaborone                           ', 'BWA', 'Gaborone            ', 213017);
INSERT INTO city VALUES (205, 'Francistown                        ', 'BWA', 'Francistown         ', 101805);
INSERT INTO city VALUES (206, 'Sao Paulo                          ', 'BRA', 'Sao Paulo           ', 9968485);
INSERT INTO city VALUES (207, 'Rio de Janeiro                     ', 'BRA', 'Rio de Janeiro      ', 5598953);
INSERT INTO city VALUES (208, 'Salvador                           ', 'BRA', 'Bahia               ', 2302832);
INSERT INTO city VALUES (209, 'Belo Horizonte                     ', 'BRA', 'Minas Gerais        ', 2139125);
INSERT INTO city VALUES (210, 'Fortaleza                          ', 'BRA', 'Ceara               ', 2097757);
INSERT INTO city VALUES (211, 'Brasilia                           ', 'BRA', 'Distrito Federal    ', 1969868);
INSERT INTO city VALUES (212, 'Curitiba                           ', 'BRA', 'Parana              ', 1584232);
INSERT INTO city VALUES (213, 'Recife                             ', 'BRA', 'Pernambuco          ', 1378087);
INSERT INTO city VALUES (214, 'Porto Alegre                       ', 'BRA', 'Rio Grande do Sul   ', 1314032);
INSERT INTO city VALUES (215, 'Manaus                             ', 'BRA', 'Amazonas            ', 1255049);
INSERT INTO city VALUES (216, 'Belem                              ', 'BRA', 'Para                ', 1186926);
INSERT INTO city VALUES (217, 'Guarulhos                          ', 'BRA', 'Sao Paulo           ', 1095874);
INSERT INTO city VALUES (218, 'Goiania                            ', 'BRA', 'Goias               ', 1056330);
INSERT INTO city VALUES (219, 'Campinas                           ', 'BRA', 'Sao Paulo           ', 950043);
INSERT INTO city VALUES (220, 'Sao Goncalo                        ', 'BRA', 'Rio de Janeiro      ', 869254);
INSERT INTO city VALUES (221, 'Nova Iguacu                        ', 'BRA', 'Rio de Janeiro      ', 862225);
INSERT INTO city VALUES (222, 'Sao Luis                           ', 'BRA', 'Maranhao            ', 837588);
INSERT INTO city VALUES (223, 'Maceio                             ', 'BRA', 'Alagoas             ', 786288);
INSERT INTO city VALUES (224, 'Duque de Caxias                    ', 'BRA', 'Rio de Janeiro      ', 746758);
INSERT INTO city VALUES (225, 'Sao Bernardo do Campo              ', 'BRA', 'Sao Paulo           ', 723132);
INSERT INTO city VALUES (226, 'Teresina                           ', 'BRA', 'Piaui               ', 691942);
INSERT INTO city VALUES (227, 'Natal                              ', 'BRA', 'Rio Grande do Norte ', 688955);
INSERT INTO city VALUES (228, 'Osasco                             ', 'BRA', 'Sao Paulo           ', 659604);
INSERT INTO city VALUES (229, 'Campo Grande                       ', 'BRA', 'Mato Grosso do Sul  ', 649593);
INSERT INTO city VALUES (230, 'Santo Andra                        ', 'BRA', 'Sao Paulo           ', 630073);
INSERT INTO city VALUES (231, 'Joao Pessoa                        ', 'BRA', 'Paraiba             ', 584029);
INSERT INTO city VALUES (232, 'Jaboatao dos Guararapes            ', 'BRA', 'Pernambuco          ', 558680);
INSERT INTO city VALUES (233, 'Contagem                           ', 'BRA', 'Minas Gerais        ', 520801);
INSERT INTO city VALUES (234, 'Sao Josa dos Campos                ', 'BRA', 'Sao Paulo           ', 515553);
INSERT INTO city VALUES (235, 'Uberlandia                         ', 'BRA', 'Minas Gerais        ', 487222);
INSERT INTO city VALUES (236, 'Feira de Santana                   ', 'BRA', 'Bahia               ', 479992);
INSERT INTO city VALUES (237, 'Ribeirao Preto                     ', 'BRA', 'Sao Paulo           ', 473276);
INSERT INTO city VALUES (238, 'Sorocaba                           ', 'BRA', 'Sao Paulo           ', 466823);
INSERT INTO city VALUES (239, 'Niteroi                            ', 'BRA', 'Rio de Janeiro      ', 459884);
INSERT INTO city VALUES (240, 'Cuiaba                             ', 'BRA', 'Mato Grosso         ', 453813);
INSERT INTO city VALUES (241, 'Juiz de Fora                       ', 'BRA', 'Minas Gerais        ', 450288);
INSERT INTO city VALUES (242, 'Aracaju                            ', 'BRA', 'Sergipe             ', 445555);
INSERT INTO city VALUES (243, 'Sao Joao de Meriti                 ', 'BRA', 'Rio de Janeiro      ', 440052);
INSERT INTO city VALUES (244, 'Londrina                           ', 'BRA', 'Parana              ', 432257);
INSERT INTO city VALUES (245, 'Joinville                          ', 'BRA', 'Santa Catarina      ', 428011);
INSERT INTO city VALUES (246, 'Belford Roxo                       ', 'BRA', 'Rio de Janeiro      ', 425194);
INSERT INTO city VALUES (247, 'Santos                             ', 'BRA', 'Sao Paulo           ', 408748);
INSERT INTO city VALUES (248, 'Ananindeua                         ', 'BRA', 'Para                ', 400940);
INSERT INTO city VALUES (249, 'Campos dos Goytacazes              ', 'BRA', 'Rio de Janeiro      ', 398418);
INSERT INTO city VALUES (250, 'Maua                               ', 'BRA', 'Sao Paulo           ', 375055);
INSERT INTO city VALUES (251, 'Carapicuiba                        ', 'BRA', 'Sao Paulo           ', 357552);
INSERT INTO city VALUES (252, 'Olinda                             ', 'BRA', 'Pernambuco          ', 354732);
INSERT INTO city VALUES (253, 'Campina Grande                     ', 'BRA', 'Paraiba             ', 352497);
INSERT INTO city VALUES (254, 'Sao Jose do Rio Preto              ', 'BRA', 'Sao Paulo           ', 351944);
INSERT INTO city VALUES (255, 'Caxias do Sul                      ', 'BRA', 'Rio Grande do Sul   ', 349581);
INSERT INTO city VALUES (256, 'Moji das Cruzes                    ', 'BRA', 'Sao Paulo           ', 339194);
INSERT INTO city VALUES (257, 'Diadema                            ', 'BRA', 'Sao Paulo           ', 335078);
INSERT INTO city VALUES (258, 'Aparecida de Goiania               ', 'BRA', 'Goias               ', 324662);
INSERT INTO city VALUES (259, 'Piracicaba                         ', 'BRA', 'Sao Paulo           ', 319104);
INSERT INTO city VALUES (260, 'Cariacica                          ', 'BRA', 'Espirito Santo      ', 319033);
INSERT INTO city VALUES (261, 'Vila Velha                         ', 'BRA', 'Espirito Santo      ', 318758);
INSERT INTO city VALUES (262, 'Pelotas                            ', 'BRA', 'Rio Grande do Sul   ', 315415);
INSERT INTO city VALUES (263, 'Bauru                              ', 'BRA', 'Sao Paulo           ', 313670);
INSERT INTO city VALUES (264, 'Porto Velho                        ', 'BRA', 'Rondonia            ', 309750);
INSERT INTO city VALUES (265, 'Serra                              ', 'BRA', 'Espirito Santo      ', 302666);
INSERT INTO city VALUES (266, 'Betim                              ', 'BRA', 'Minas Gerais        ', 302108);
INSERT INTO city VALUES (267, 'Jundiai                            ', 'BRA', 'Sao Paulo           ', 296127);
INSERT INTO city VALUES (268, 'Canoas                             ', 'BRA', 'Rio Grande do Sul   ', 294125);
INSERT INTO city VALUES (269, 'Franca                             ', 'BRA', 'Sao Paulo           ', 290139);
INSERT INTO city VALUES (270, 'Sao Vicente                        ', 'BRA', 'Sao Paulo           ', 286848);
INSERT INTO city VALUES (271, 'Maringa                            ', 'BRA', 'Parana              ', 286461);
INSERT INTO city VALUES (272, 'Montes Claros                      ', 'BRA', 'Minas Gerais        ', 286058);
INSERT INTO city VALUES (273, 'Anapolis                           ', 'BRA', 'Goias               ', 282197);
INSERT INTO city VALUES (274, 'Florianopolis                      ', 'BRA', 'Santa Catarina      ', 281928);
INSERT INTO city VALUES (275, 'Petropolis                         ', 'BRA', 'Rio de Janeiro      ', 279183);
INSERT INTO city VALUES (276, 'Itaquaquecetuba                    ', 'BRA', 'Sao Paulo           ', 270874);
INSERT INTO city VALUES (277, 'Vitoria                            ', 'BRA', 'Espirito Santo      ', 270626);
INSERT INTO city VALUES (278, 'Ponta Grossa                       ', 'BRA', 'Parana              ', 268013);
INSERT INTO city VALUES (279, 'Rio Branco                         ', 'BRA', 'Acre                ', 259537);
INSERT INTO city VALUES (280, 'Foz do Iguacu                      ', 'BRA', 'Parana              ', 259425);
INSERT INTO city VALUES (281, 'Macapa                             ', 'BRA', 'Amapa               ', 256033);
INSERT INTO city VALUES (282, 'Ilheus                             ', 'BRA', 'Bahia               ', 254970);
INSERT INTO city VALUES (283, 'Vitoria da Conquista               ', 'BRA', 'Bahia               ', 253587);
INSERT INTO city VALUES (284, 'Uberaba                            ', 'BRA', 'Minas Gerais        ', 249225);
INSERT INTO city VALUES (285, 'Paulista                           ', 'BRA', 'Pernambuco          ', 248473);
INSERT INTO city VALUES (286, 'Limeira                            ', 'BRA', 'Sao Paulo           ', 245497);
INSERT INTO city VALUES (287, 'Blumenau                           ', 'BRA', 'Santa Catarina      ', 244379);
INSERT INTO city VALUES (288, 'Caruaru                            ', 'BRA', 'Pernambuco          ', 244247);
INSERT INTO city VALUES (289, 'Santarem                           ', 'BRA', 'Para                ', 241771);
INSERT INTO city VALUES (290, 'Volta Redonda                      ', 'BRA', 'Rio de Janeiro      ', 240315);
INSERT INTO city VALUES (291, 'Novo Hamburgo                      ', 'BRA', 'Rio Grande do Sul   ', 239940);
INSERT INTO city VALUES (292, 'Caucaia                            ', 'BRA', 'Ceara               ', 238738);
INSERT INTO city VALUES (293, 'Santa Maria                        ', 'BRA', 'Rio Grande do Sul   ', 238473);
INSERT INTO city VALUES (294, 'Cascavel                           ', 'BRA', 'Parana              ', 237510);
INSERT INTO city VALUES (295, 'Guaruja                            ', 'BRA', 'Sao Paulo           ', 237206);
INSERT INTO city VALUES (296, 'Ribeirao das Neves                 ', 'BRA', 'Minas Gerais        ', 232685);
INSERT INTO city VALUES (297, 'Governador Valadares               ', 'BRA', 'Minas Gerais        ', 231724);
INSERT INTO city VALUES (298, 'Taubate                            ', 'BRA', 'Sao Paulo           ', 229130);
INSERT INTO city VALUES (299, 'Imperatriz                         ', 'BRA', 'Maranhao            ', 224564);
INSERT INTO city VALUES (300, 'Gravatai                           ', 'BRA', 'Rio Grande do Sul   ', 223011);
INSERT INTO city VALUES (301, 'Embu                               ', 'BRA', 'Sao Paulo           ', 222223);
INSERT INTO city VALUES (302, 'Mossoru                            ', 'BRA', 'Rio Grande do Norte ', 214901);
INSERT INTO city VALUES (303, 'Varzea Grande                      ', 'BRA', 'Mato Grosso         ', 214435);
INSERT INTO city VALUES (304, 'Petrolina                          ', 'BRA', 'Pernambuco          ', 210540);
INSERT INTO city VALUES (305, 'Barueri                            ', 'BRA', 'Sao Paulo           ', 208426);
INSERT INTO city VALUES (306, 'Viamao                             ', 'BRA', 'Rio Grande do Sul   ', 207557);
INSERT INTO city VALUES (307, 'Ipatinga                           ', 'BRA', 'Minas Gerais        ', 206338);
INSERT INTO city VALUES (308, 'Juazeiro                           ', 'BRA', 'Bahia               ', 201073);
INSERT INTO city VALUES (309, 'Juazeiro do Norte                  ', 'BRA', 'Ceara               ', 199636);
INSERT INTO city VALUES (310, 'Taboao da Serra                    ', 'BRA', 'Sao Paulo           ', 197550);
INSERT INTO city VALUES (311, 'Sao Jose dos Pinhais               ', 'BRA', 'Parana              ', 196884);
INSERT INTO city VALUES (312, 'Mage                               ', 'BRA', 'Rio de Janeiro      ', 196147);
INSERT INTO city VALUES (313, 'Suzano                             ', 'BRA', 'Sao Paulo           ', 195434);
INSERT INTO city VALUES (314, 'Sao Leopoldo                       ', 'BRA', 'Rio Grande do Sul   ', 189258);
INSERT INTO city VALUES (315, 'Marilia                            ', 'BRA', 'Sao Paulo           ', 188691);
INSERT INTO city VALUES (316, 'Sao Carlos                         ', 'BRA', 'Sao Paulo           ', 187122);
INSERT INTO city VALUES (317, 'Sumare                             ', 'BRA', 'Sao Paulo           ', 186205);
INSERT INTO city VALUES (318, 'Presidente Prudente                ', 'BRA', 'Sao Paulo           ', 185340);
INSERT INTO city VALUES (319, 'Divinopolis                        ', 'BRA', 'Minas Gerais        ', 185047);
INSERT INTO city VALUES (320, 'Sete Lagoas                        ', 'BRA', 'Minas Gerais        ', 182984);
INSERT INTO city VALUES (321, 'Rio Grande                         ', 'BRA', 'Rio Grande do Sul   ', 182222);
INSERT INTO city VALUES (322, 'Itabuna                            ', 'BRA', 'Bahia               ', 182148);
INSERT INTO city VALUES (323, 'Jequie                             ', 'BRA', 'Bahia               ', 179128);
INSERT INTO city VALUES (324, 'Arapiraca                          ', 'BRA', 'Alagoas             ', 178988);
INSERT INTO city VALUES (325, 'Colombo                            ', 'BRA', 'Parana              ', 177764);
INSERT INTO city VALUES (326, 'Americana                          ', 'BRA', 'Sao Paulo           ', 177409);
INSERT INTO city VALUES (327, 'Alvorada                           ', 'BRA', 'Rio Grande do Sul   ', 175574);
INSERT INTO city VALUES (328, 'Araraquara                         ', 'BRA', 'Sao Paulo           ', 174381);
INSERT INTO city VALUES (329, 'Itaborai                           ', 'BRA', 'Rio de Janeiro      ', 173977);
INSERT INTO city VALUES (330, 'Santa Barbara doeste               ', 'BRA', 'Sao Paulo           ', 171657);
INSERT INTO city VALUES (331, 'Nova Friburgo                      ', 'BRA', 'Rio de Janeiro      ', 170697);
INSERT INTO city VALUES (332, 'Jacarei                            ', 'BRA', 'Sao Paulo           ', 170356);
INSERT INTO city VALUES (333, 'Aracatuba                          ', 'BRA', 'Sao Paulo           ', 169303);
INSERT INTO city VALUES (334, 'Barra Mansa                        ', 'BRA', 'Rio de Janeiro      ', 168953);
INSERT INTO city VALUES (335, 'Praia Grande                       ', 'BRA', 'Sao Paulo           ', 168434);
INSERT INTO city VALUES (336, 'Maraba                             ', 'BRA', 'Para                ', 167795);
INSERT INTO city VALUES (337, 'Cricicma                           ', 'BRA', 'Santa Catarina      ', 167661);
INSERT INTO city VALUES (338, 'Boa Vista                          ', 'BRA', 'Roraima             ', 167185);
INSERT INTO city VALUES (339, 'Passo Fundo                        ', 'BRA', 'Rio Grande do Sul   ', 166343);
INSERT INTO city VALUES (340, 'Dourados                           ', 'BRA', 'Mato Grosso do Sul  ', 164716);
INSERT INTO city VALUES (341, 'Santa Luzia                        ', 'BRA', 'Minas Gerais        ', 164704);
INSERT INTO city VALUES (342, 'Rio Claro                          ', 'BRA', 'Sao Paulo           ', 163551);
INSERT INTO city VALUES (343, 'Maracana                           ', 'BRA', 'Ceara               ', 162022);
INSERT INTO city VALUES (344, 'Guarapuava                         ', 'BRA', 'Parana              ', 160510);
INSERT INTO city VALUES (345, 'Rondonopolis                       ', 'BRA', 'Mato Grosso         ', 155115);
INSERT INTO city VALUES (346, 'Sao Jose                           ', 'BRA', 'Santa Catarina      ', 155105);
INSERT INTO city VALUES (347, 'Cachoeiro de Itapemirim            ', 'BRA', 'Espirito Santo      ', 155024);
INSERT INTO city VALUES (348, 'Nilopolis                          ', 'BRA', 'Rio de Janeiro      ', 153383);
INSERT INTO city VALUES (349, 'Itapevi                            ', 'BRA', 'Sao Paulo           ', 150664);
INSERT INTO city VALUES (350, 'Cabo de Santo Agostinho            ', 'BRA', 'Pernambuco          ', 149964);
INSERT INTO city VALUES (351, 'Camacari                           ', 'BRA', 'Bahia               ', 149146);
INSERT INTO city VALUES (352, 'Sobral                             ', 'BRA', 'Ceara               ', 146005);
INSERT INTO city VALUES (353, 'Itajai                             ', 'BRA', 'Santa Catarina      ', 145197);
INSERT INTO city VALUES (354, 'Chapeco                            ', 'BRA', 'Santa Catarina      ', 144158);
INSERT INTO city VALUES (355, 'Cotia                              ', 'BRA', 'Sao Paulo           ', 140042);
INSERT INTO city VALUES (356, 'Lages                              ', 'BRA', 'Santa Catarina      ', 139570);
INSERT INTO city VALUES (357, 'Ferraz de Vasconcelos              ', 'BRA', 'Sao Paulo           ', 139283);
INSERT INTO city VALUES (358, 'Indaiatuba                         ', 'BRA', 'Sao Paulo           ', 135968);
INSERT INTO city VALUES (359, 'Hortolandia                        ', 'BRA', 'Sao Paulo           ', 135755);
INSERT INTO city VALUES (360, 'Caxias                             ', 'BRA', 'Maranhao            ', 133980);
INSERT INTO city VALUES (361, 'Sao Caetano do Sul                 ', 'BRA', 'Sao Paulo           ', 133321);
INSERT INTO city VALUES (362, 'Itu                                ', 'BRA', 'Sao Paulo           ', 132736);
INSERT INTO city VALUES (363, 'Nossa Senhora do Socorro           ', 'BRA', 'Sergipe             ', 131351);
INSERT INTO city VALUES (364, 'Parnaiba                           ', 'BRA', 'Piaui               ', 129756);
INSERT INTO city VALUES (365, 'Pocos de Caldas                    ', 'BRA', 'Minas Gerais        ', 129683);
INSERT INTO city VALUES (366, 'Teresopolis                        ', 'BRA', 'Rio de Janeiro      ', 128079);
INSERT INTO city VALUES (367, 'Barreiras                          ', 'BRA', 'Bahia               ', 127801);
INSERT INTO city VALUES (368, 'Castanhal                          ', 'BRA', 'Para                ', 127634);
INSERT INTO city VALUES (369, 'Alagoinhas                         ', 'BRA', 'Bahia               ', 126820);
INSERT INTO city VALUES (370, 'Itapecerica da Serra               ', 'BRA', 'Sao Paulo           ', 126672);
INSERT INTO city VALUES (371, 'Uruguaiana                         ', 'BRA', 'Rio Grande do Sul   ', 126305);
INSERT INTO city VALUES (372, 'Paranagu                           ', 'BRA', 'Parana              ', 126076);
INSERT INTO city VALUES (373, 'Ibirite                            ', 'BRA', 'Minas Gerais        ', 125982);
INSERT INTO city VALUES (374, 'Timon                              ', 'BRA', 'Maranhao            ', 125812);
INSERT INTO city VALUES (375, 'Luziania                           ', 'BRA', 'Goias               ', 125597);
INSERT INTO city VALUES (376, 'Macae                              ', 'BRA', 'Rio de Janeiro      ', 125597);
INSERT INTO city VALUES (377, 'Teofilo Otoni                      ', 'BRA', 'Minas Gerais        ', 124489);
INSERT INTO city VALUES (378, 'Moji-Guacu                         ', 'BRA', 'Sao Paulo           ', 123782);
INSERT INTO city VALUES (379, 'Palmas                             ', 'BRA', 'Tocantins           ', 121919);
INSERT INTO city VALUES (380, 'Pindamonhangaba                    ', 'BRA', 'Sao Paulo           ', 121904);
INSERT INTO city VALUES (381, 'Francisco Morato                   ', 'BRA', 'Sao Paulo           ', 121197);
INSERT INTO city VALUES (382, 'Bage                               ', 'BRA', 'Rio Grande do Sul   ', 120793);
INSERT INTO city VALUES (383, 'Sapucaia do Sul                    ', 'BRA', 'Rio Grande do Sul   ', 120217);
INSERT INTO city VALUES (384, 'Cabo Frio                          ', 'BRA', 'Rio de Janeiro      ', 119503);
INSERT INTO city VALUES (385, 'Itapetininga                       ', 'BRA', 'Sao Paulo           ', 119391);
INSERT INTO city VALUES (386, 'Patos de Minas                     ', 'BRA', 'Minas Gerais        ', 119262);
INSERT INTO city VALUES (387, 'Camaragibe                         ', 'BRA', 'Pernambuco          ', 118968);
INSERT INTO city VALUES (388, 'Braganca Paulista                  ', 'BRA', 'Sao Paulo           ', 116929);
INSERT INTO city VALUES (389, 'Queimados                          ', 'BRA', 'Rio de Janeiro      ', 115020);
INSERT INTO city VALUES (390, 'Araguaina                          ', 'BRA', 'Tocantins           ', 114948);
INSERT INTO city VALUES (391, 'Garanhuns                          ', 'BRA', 'Pernambuco          ', 114603);
INSERT INTO city VALUES (392, 'Vitoria de Santo Antao             ', 'BRA', 'Pernambuco          ', 113595);
INSERT INTO city VALUES (393, 'Santa Rita                         ', 'BRA', 'Paraiba             ', 113135);
INSERT INTO city VALUES (394, 'Barbacena                          ', 'BRA', 'Minas Gerais        ', 113079);
INSERT INTO city VALUES (395, 'Abaetetuba                         ', 'BRA', 'Para                ', 111258);
INSERT INTO city VALUES (396, 'Ja                                 ', 'BRA', 'Sao Paulo           ', 109965);
INSERT INTO city VALUES (397, 'Lauro de Freitas                   ', 'BRA', 'Bahia               ', 109236);
INSERT INTO city VALUES (398, 'Franco da Rocha                    ', 'BRA', 'Sao Paulo           ', 108964);
INSERT INTO city VALUES (399, 'Teixeira de Freitas                ', 'BRA', 'Bahia               ', 108441);
INSERT INTO city VALUES (400, 'Varginha                           ', 'BRA', 'Minas Gerais        ', 108314);
INSERT INTO city VALUES (401, 'Ribeirao Pires                     ', 'BRA', 'Sao Paulo           ', 108121);
INSERT INTO city VALUES (402, 'Sabar                              ', 'BRA', 'Minas Gerais        ', 107781);
INSERT INTO city VALUES (403, 'Catanduva                          ', 'BRA', 'Sao Paulo           ', 107761);
INSERT INTO city VALUES (404, 'Rio Verde                          ', 'BRA', 'Goias               ', 107755);
INSERT INTO city VALUES (405, 'Botucatu                           ', 'BRA', 'Sao Paulo           ', 107663);
INSERT INTO city VALUES (406, 'Colatina                           ', 'BRA', 'Espirito Santo      ', 107354);
INSERT INTO city VALUES (407, 'Santa Cruz do Sul                  ', 'BRA', 'Rio Grande do Sul   ', 106734);
INSERT INTO city VALUES (408, 'Linhares                           ', 'BRA', 'Espirito Santo      ', 106278);
INSERT INTO city VALUES (409, 'Apucarana                          ', 'BRA', 'Parana              ', 105114);
INSERT INTO city VALUES (410, 'Barretos                           ', 'BRA', 'Sao Paulo           ', 104156);
INSERT INTO city VALUES (411, 'Guaratingueta                      ', 'BRA', 'Sao Paulo           ', 103433);
INSERT INTO city VALUES (412, 'Cachoeirinha                       ', 'BRA', 'Rio Grande do Sul   ', 103240);
INSERT INTO city VALUES (413, 'Codo                               ', 'BRA', 'Maranhao            ', 103153);
INSERT INTO city VALUES (414, 'Jaragu do Sul                      ', 'BRA', 'Santa Catarina      ', 102580);
INSERT INTO city VALUES (415, 'Cubatao                            ', 'BRA', 'Sao Paulo           ', 102372);
INSERT INTO city VALUES (416, 'Itabira                            ', 'BRA', 'Minas Gerais        ', 102217);
INSERT INTO city VALUES (417, 'Itaituba                           ', 'BRA', 'Para                ', 101320);
INSERT INTO city VALUES (418, 'Araras                             ', 'BRA', 'Sao Paulo           ', 101046);
INSERT INTO city VALUES (419, 'Resende                            ', 'BRA', 'Rio de Janeiro      ', 100627);
INSERT INTO city VALUES (420, 'Atibaia                            ', 'BRA', 'Sao Paulo           ', 100356);
INSERT INTO city VALUES (421, 'Pouso Alegre                       ', 'BRA', 'Minas Gerais        ', 100028);
INSERT INTO city VALUES (422, 'Toledo                             ', 'BRA', 'Parana              ', 99387);
INSERT INTO city VALUES (423, 'Crato                              ', 'BRA', 'Ceara               ', 98965);
INSERT INTO city VALUES (424, 'Passos                             ', 'BRA', 'Minas Gerais        ', 98570);
INSERT INTO city VALUES (425, 'Araguari                           ', 'BRA', 'Minas Gerais        ', 98399);
INSERT INTO city VALUES (426, 'Sao Jose de Ribamar                ', 'BRA', 'Maranhao            ', 98318);
INSERT INTO city VALUES (427, 'Pinhais                            ', 'BRA', 'Parana              ', 98198);
INSERT INTO city VALUES (428, 'Sertaozinho                        ', 'BRA', 'Sao Paulo           ', 98140);
INSERT INTO city VALUES (429, 'Conselheiro Lafaiete               ', 'BRA', 'Minas Gerais        ', 97507);
INSERT INTO city VALUES (430, 'Paulo Afonso                       ', 'BRA', 'Bahia               ', 97291);
INSERT INTO city VALUES (431, 'Angra dos Reis                     ', 'BRA', 'Rio de Janeiro      ', 96864);
INSERT INTO city VALUES (432, 'Eunpolis                           ', 'BRA', 'Bahia               ', 96610);
INSERT INTO city VALUES (433, 'Salto                              ', 'BRA', 'Sao Paulo           ', 96348);
INSERT INTO city VALUES (434, 'Ourinhos                           ', 'BRA', 'Sao Paulo           ', 96291);
INSERT INTO city VALUES (435, 'Parnamirim                         ', 'BRA', 'Rio Grande do Norte ', 96210);
INSERT INTO city VALUES (436, 'Jacobina                           ', 'BRA', 'Bahia               ', 96131);
INSERT INTO city VALUES (437, 'Coronel Fabriciano                 ', 'BRA', 'Minas Gerais        ', 95933);
INSERT INTO city VALUES (438, 'Birigui                            ', 'BRA', 'Sao Paulo           ', 94685);
INSERT INTO city VALUES (439, 'Tatui                              ', 'BRA', 'Sao Paulo           ', 93897);
INSERT INTO city VALUES (440, 'Ji-Paran                           ', 'BRA', 'Rondonia            ', 93346);
INSERT INTO city VALUES (441, 'Bacabal                            ', 'BRA', 'Maranhao            ', 93121);
INSERT INTO city VALUES (442, 'Camet                              ', 'BRA', 'Para                ', 92779);
INSERT INTO city VALUES (443, 'Guaiba                             ', 'BRA', 'Rio Grande do Sul   ', 92224);
INSERT INTO city VALUES (444, 'Sao Lourenao da Mata               ', 'BRA', 'Pernambuco          ', 91999);
INSERT INTO city VALUES (445, 'Santana do Livramento              ', 'BRA', 'Rio Grande do Sul   ', 91779);
INSERT INTO city VALUES (446, 'Votorantim                         ', 'BRA', 'Sao Paulo           ', 91777);
INSERT INTO city VALUES (447, 'Campo Largo                        ', 'BRA', 'Parana              ', 91203);
INSERT INTO city VALUES (448, 'Patos                              ', 'BRA', 'Paraiba             ', 90519);
INSERT INTO city VALUES (449, 'Ituiutaba                          ', 'BRA', 'Minas Gerais        ', 90507);
INSERT INTO city VALUES (450, 'Corumba                            ', 'BRA', 'Mato Grosso do Sul  ', 90111);
INSERT INTO city VALUES (451, 'Palhoca                            ', 'BRA', 'Santa Catarina      ', 89465);
INSERT INTO city VALUES (452, 'Barra do Pirai                     ', 'BRA', 'Rio de Janeiro      ', 89388);
INSERT INTO city VALUES (453, 'Bento Goncalves                    ', 'BRA', 'Rio Grande do Sul   ', 89254);
INSERT INTO city VALUES (454, 'Po                                 ', 'BRA', 'Sao Paulo           ', 89236);
INSERT INTO city VALUES (455, 'aguas Lindas de Goias              ', 'BRA', 'Goias               ', 89200);
INSERT INTO city VALUES (456, 'London                             ', 'GBR', 'England             ', 7285000);
INSERT INTO city VALUES (457, 'Birmingham                         ', 'GBR', 'England             ', 1013000);
INSERT INTO city VALUES (458, 'Glasgow                            ', 'GBR', 'Scotland            ', 619680);
INSERT INTO city VALUES (459, 'Liverpool                          ', 'GBR', 'England             ', 461000);
INSERT INTO city VALUES (460, 'Edinburgh                          ', 'GBR', 'Scotland            ', 450180);
INSERT INTO city VALUES (461, 'Sheffield                          ', 'GBR', 'England             ', 431607);
INSERT INTO city VALUES (462, 'Manchester                         ', 'GBR', 'England             ', 430000);
INSERT INTO city VALUES (463, 'Leeds                              ', 'GBR', 'England             ', 424194);
INSERT INTO city VALUES (464, 'Bristol                            ', 'GBR', 'England             ', 402000);
INSERT INTO city VALUES (465, 'Cardiff                            ', 'GBR', 'Wales               ', 321000);
INSERT INTO city VALUES (466, 'Coventry                           ', 'GBR', 'England             ', 304000);
INSERT INTO city VALUES (467, 'Leicester                          ', 'GBR', 'England             ', 294000);
INSERT INTO city VALUES (468, 'Bradford                           ', 'GBR', 'England             ', 289376);
INSERT INTO city VALUES (469, 'Belfast                            ', 'GBR', 'North Ireland       ', 287500);
INSERT INTO city VALUES (470, 'Nottingham                         ', 'GBR', 'England             ', 287000);
INSERT INTO city VALUES (471, 'Kingston upon Hull                 ', 'GBR', 'England             ', 262000);
INSERT INTO city VALUES (472, 'Plymouth                           ', 'GBR', 'England             ', 253000);
INSERT INTO city VALUES (473, 'Stoke-on-Trent                     ', 'GBR', 'England             ', 252000);
INSERT INTO city VALUES (474, 'Wolverhampton                      ', 'GBR', 'England             ', 242000);
INSERT INTO city VALUES (475, 'Derby                              ', 'GBR', 'England             ', 236000);
INSERT INTO city VALUES (476, 'Swansea                            ', 'GBR', 'Wales               ', 230000);
INSERT INTO city VALUES (477, 'Southampton                        ', 'GBR', 'England             ', 216000);
INSERT INTO city VALUES (478, 'Aberdeen                           ', 'GBR', 'Scotland            ', 213070);
INSERT INTO city VALUES (479, 'Northampton                        ', 'GBR', 'England             ', 196000);
INSERT INTO city VALUES (480, 'Dudley                             ', 'GBR', 'England             ', 192171);
INSERT INTO city VALUES (481, 'Portsmouth                         ', 'GBR', 'England             ', 190000);
INSERT INTO city VALUES (482, 'Newcastle upon Tyne                ', 'GBR', 'England             ', 189150);
INSERT INTO city VALUES (483, 'Sunderland                         ', 'GBR', 'England             ', 183310);
INSERT INTO city VALUES (484, 'Luton                              ', 'GBR', 'England             ', 183000);
INSERT INTO city VALUES (485, 'Swindon                            ', 'GBR', 'England             ', 180000);
INSERT INTO city VALUES (486, 'Southend-on-Sea                    ', 'GBR', 'England             ', 176000);
INSERT INTO city VALUES (487, 'Walsall                            ', 'GBR', 'England             ', 174739);
INSERT INTO city VALUES (488, 'Bournemouth                        ', 'GBR', 'England             ', 162000);
INSERT INTO city VALUES (489, 'Peterborough                       ', 'GBR', 'England             ', 156000);
INSERT INTO city VALUES (490, 'Brighton                           ', 'GBR', 'England             ', 156124);
INSERT INTO city VALUES (491, 'Blackpool                          ', 'GBR', 'England             ', 151000);
INSERT INTO city VALUES (492, 'Dundee                             ', 'GBR', 'Scotland            ', 146690);
INSERT INTO city VALUES (493, 'West Bromwich                      ', 'GBR', 'England             ', 146386);
INSERT INTO city VALUES (494, 'Reading                            ', 'GBR', 'England             ', 148000);
INSERT INTO city VALUES (495, 'Oldbury/Smethwick (Warley)         ', 'GBR', 'England             ', 145542);
INSERT INTO city VALUES (496, 'Middlesbrough                      ', 'GBR', 'England             ', 145000);
INSERT INTO city VALUES (497, 'Huddersfield                       ', 'GBR', 'England             ', 143726);
INSERT INTO city VALUES (498, 'Oxford                             ', 'GBR', 'England             ', 144000);
INSERT INTO city VALUES (499, 'Poole                              ', 'GBR', 'England             ', 141000);
INSERT INTO city VALUES (500, 'Bolton                             ', 'GBR', 'England             ', 139020);
INSERT INTO city VALUES (501, 'Blackburn                          ', 'GBR', 'England             ', 140000);
INSERT INTO city VALUES (502, 'Newport                            ', 'GBR', 'Wales               ', 139000);
INSERT INTO city VALUES (503, 'Preston                            ', 'GBR', 'England             ', 135000);
INSERT INTO city VALUES (504, 'Stockport                          ', 'GBR', 'England             ', 132813);
INSERT INTO city VALUES (505, 'Norwich                            ', 'GBR', 'England             ', 124000);
INSERT INTO city VALUES (506, 'Rotherham                          ', 'GBR', 'England             ', 121380);
INSERT INTO city VALUES (507, 'Cambridge                          ', 'GBR', 'England             ', 121000);
INSERT INTO city VALUES (508, 'Watford                            ', 'GBR', 'England             ', 113080);
INSERT INTO city VALUES (509, 'Ipswich                            ', 'GBR', 'England             ', 114000);
INSERT INTO city VALUES (510, 'Slough                             ', 'GBR', 'England             ', 112000);
INSERT INTO city VALUES (511, 'Exeter                             ', 'GBR', 'England             ', 111000);
INSERT INTO city VALUES (512, 'Cheltenham                         ', 'GBR', 'England             ', 106000);
INSERT INTO city VALUES (513, 'Gloucester                         ', 'GBR', 'England             ', 107000);
INSERT INTO city VALUES (514, 'Saint Helens                       ', 'GBR', 'England             ', 106293);
INSERT INTO city VALUES (515, 'Sutton Coldfield                   ', 'GBR', 'England             ', 106001);
INSERT INTO city VALUES (516, 'York                               ', 'GBR', 'England             ', 104425);
INSERT INTO city VALUES (517, 'Oldham                             ', 'GBR', 'England             ', 103931);
INSERT INTO city VALUES (518, 'Basildon                           ', 'GBR', 'England             ', 100924);
INSERT INTO city VALUES (519, 'Worthing                           ', 'GBR', 'England             ', 100000);
INSERT INTO city VALUES (520, 'Chelmsford                         ', 'GBR', 'England             ', 97451);
INSERT INTO city VALUES (521, 'Colchester                         ', 'GBR', 'England             ', 96063);
INSERT INTO city VALUES (522, 'Crawley                            ', 'GBR', 'England             ', 97000);
INSERT INTO city VALUES (523, 'Gillingham                         ', 'GBR', 'England             ', 92000);
INSERT INTO city VALUES (524, 'Solihull                           ', 'GBR', 'England             ', 94531);
INSERT INTO city VALUES (525, 'Rochdale                           ', 'GBR', 'England             ', 94313);
INSERT INTO city VALUES (526, 'Birkenhead                         ', 'GBR', 'England             ', 93087);
INSERT INTO city VALUES (527, 'Worcester                          ', 'GBR', 'England             ', 95000);
INSERT INTO city VALUES (528, 'Hartlepool                         ', 'GBR', 'England             ', 92000);
INSERT INTO city VALUES (529, 'Halifax                            ', 'GBR', 'England             ', 91069);
INSERT INTO city VALUES (530, 'Woking/Byfleet                     ', 'GBR', 'England             ', 92000);
INSERT INTO city VALUES (531, 'Southport                          ', 'GBR', 'England             ', 90959);
INSERT INTO city VALUES (532, 'Maidstone                          ', 'GBR', 'England             ', 90878);
INSERT INTO city VALUES (533, 'Eastbourne                         ', 'GBR', 'England             ', 90000);
INSERT INTO city VALUES (534, 'Grimsby                            ', 'GBR', 'England             ', 89000);
INSERT INTO city VALUES (535, 'Saint Helier                       ', 'GBR', 'Jersey              ', 27523);
INSERT INTO city VALUES (536, 'Douglas                            ', 'GBR', 'n                   ', 23487);
INSERT INTO city VALUES (537, 'Road Town                          ', 'VGB', 'Tortola             ', 8000);
INSERT INTO city VALUES (538, 'Bandar Seri Begawan                ', 'BRN', 'Brunei and Muara    ', 21484);
INSERT INTO city VALUES (539, 'Sofija                             ', 'BGR', 'Grad Sofija         ', 1122302);
INSERT INTO city VALUES (540, 'Plovdiv                            ', 'BGR', 'Plovdiv             ', 342584);
INSERT INTO city VALUES (541, 'Varna                              ', 'BGR', 'Varna               ', 299801);
INSERT INTO city VALUES (542, 'Burgas                             ', 'BGR', 'Burgas              ', 195255);
INSERT INTO city VALUES (543, 'Ruse                               ', 'BGR', 'Ruse                ', 166467);
INSERT INTO city VALUES (544, 'Stara Zagora                       ', 'BGR', 'Haskovo             ', 147939);
INSERT INTO city VALUES (545, 'Pleven                             ', 'BGR', 'Lovec               ', 121952);
INSERT INTO city VALUES (546, 'Sliven                             ', 'BGR', 'Burgas              ', 105530);
INSERT INTO city VALUES (547, 'Dobric                             ', 'BGR', 'Varna               ', 100399);
INSERT INTO city VALUES (548, 'aumen                              ', 'BGR', 'Varna               ', 94686);


--
-- TOC entry 2213 (class 0 OID 17031)
-- Dependencies: 169
-- Data for Name: country; Type: TABLE DATA; Schema: public; Owner: Daniel
--

INSERT INTO country VALUES ('ABW', 'Aruba                                               ', 'North America                                                                                       ', 'Caribbean                 ', 193, NULL, 103000, 78.4000000000000057, 828, 793, 'Aruba                                        ', 'Nonmetropolitan Territory of The Netherlands ', 'Beatrix                                                     ', 129, 'AW');
INSERT INTO country VALUES ('AFG', 'Afghanistan                                         ', 'Asia                                                                                                ', 'Southern and Central Asia ', 652090, 1919, 22720000, 45.8999999999999986, 5976, NULL, 'Afganistan/Afqanestan                        ', 'Islamic Emirate                              ', 'Mohammad Omar                                               ', 1, 'AF');
INSERT INTO country VALUES ('AGO', 'Angola                                              ', 'Africa                                                                                              ', 'Central Africa            ', 1246700, 1975, 12878000, 38.2999999999999972, 6648, 7984, 'Angola                                       ', 'Republic                                     ', 'Jose Eduardo dos Santos                                     ', 56, 'AO');
INSERT INTO country VALUES ('AIA', 'Anguilla                                            ', 'North America                                                                                       ', 'Caribbean                 ', 96, NULL, 8000, 76.0999999999999943, 63.2000000000000028, NULL, 'Anguilla                                     ', 'Dependent Territory of the UK                ', 'Elisabeth II                                                ', 62, 'AI');
INSERT INTO country VALUES ('ALB', 'Albania                                             ', 'Europe                                                                                              ', 'Southern Europe           ', 28748, 1912, 3401200, 71.5999999999999943, 3205, 2500, 'Shqipiria                                    ', 'Republic                                     ', 'Rexhep Mejdani                                              ', 34, 'AL');
INSERT INTO country VALUES ('AND', 'Andorra                                             ', 'Europe                                                                                              ', 'Southern Europe           ', 468, 1278, 78000, 83.5, 1630, NULL, 'Andorra                                      ', 'Parliamentary Coprincipality                 ', '                                                            ', 55, 'AD');
INSERT INTO country VALUES ('ANT', 'Netherlands Antilles                                ', 'North America                                                                                       ', 'Caribbean                 ', 800, NULL, 217000, 74.7000000000000028, 1941, NULL, 'Nederlandse Antillen                         ', 'Nonmetropolitan Territory of The Netherlands ', 'Beatrix                                                     ', 33, 'AN');
INSERT INTO country VALUES ('ARE', 'United Arab Emirates                                ', 'Asia                                                                                                ', 'Middle East               ', 83600, 1971, 2441000, 74.0999999999999943, 37966, 36846, 'Al-Imarat al-YArabiya al-Muttahida           ', 'Emirate Federation                           ', 'Zayid bin Sultan al-Nahayan                                 ', 65, 'AE');
INSERT INTO country VALUES ('ARG', 'Argentina                                           ', 'South America                                                                                       ', 'South America             ', 2780400, 1816, 37032000, 75.0999999999999943, 340238, 323310, 'Argentina                                    ', 'Federal Republic                             ', 'Fernando de la Raa                                          ', 69, 'AR');
INSERT INTO country VALUES ('ARM', 'Armenia                                             ', 'Asia                                                                                                ', 'Middle East               ', 29800, 1991, 3520000, 66.4000000000000057, 1813, 1627, 'Hajastan                                     ', 'Republic                                     ', 'Robert Kotoarjan                                            ', 126, 'AM');
INSERT INTO country VALUES ('ASM', 'American Samoa                                      ', 'Oceania                                                                                             ', 'Polynesia                 ', 199, NULL, 68000, 75.0999999999999943, 334, NULL, 'Amerika Samoa                                ', 'US Territory                                 ', 'George W. Bush                                              ', 54, 'AS');
INSERT INTO country VALUES ('ATA', 'Antarctica                                          ', 'Antarctica                                                                                          ', 'Antarctica                ', 13120000, NULL, 0, NULL, 0, NULL, 'n                                            ', 'Co-administrated                             ', '                                                            ', NULL, 'AQ');
INSERT INTO country VALUES ('ATF', 'French Southern territories                         ', 'Antarctica                                                                                          ', 'Antarctica                ', 7780, NULL, 0, NULL, 0, NULL, 'Terres australes franaaises                  ', 'Nonmetropolitan Territory of France          ', 'Jacques Chirac                                              ', NULL, 'TF');
INSERT INTO country VALUES ('ATG', 'Antigua and Barbuda                                 ', 'North America                                                                                       ', 'Caribbean                 ', 442, 1981, 68000, 70.5, 612, 584, 'Antigua and Barbuda                          ', 'Constitutional Monarchy                      ', 'Elisabeth II                                                ', 63, 'AG');
INSERT INTO country VALUES ('AUS', 'Australia                                           ', 'Oceania                                                                                             ', 'Australia and New Zealand ', 7741220, 1901, 18886000, 79.7999999999999972, 351182, 392911, 'Australia                                    ', 'Constitutional Monarchy, Federation          ', 'Elisabeth II                                                ', 135, 'AU');
INSERT INTO country VALUES ('AUT', 'Austria                                             ', 'Europe                                                                                              ', 'Western Europe            ', 83859, 1918, 8091800, 77.7000000000000028, 211860, 206025, 'sterreich                                   ', 'Federal Republic                             ', 'Thomas Klestil                                              ', 1523, 'AT');
INSERT INTO country VALUES ('AZE', 'Azerbaijan                                          ', 'Asia                                                                                                ', 'Middle East               ', 86600, 1991, 7734000, 62.8999999999999986, 4127, 4100, 'Azrbaycan                                   ', 'Federal Republic                             ', 'Heydr fliyev                                               ', 144, 'AZ');
INSERT INTO country VALUES ('BDI', 'Burundi                                             ', 'Africa                                                                                              ', 'Eastern Africa            ', 27834, 1962, 6695000, 46.2000000000000028, 903, 982, 'Burundi/Uburundi                             ', 'Republic                                     ', 'Pierre Buyoya                                               ', 552, 'BI');
INSERT INTO country VALUES ('BEL', 'Belgium                                             ', 'Europe                                                                                              ', 'Western Europe            ', 30518, 1830, 10239000, 77.7999999999999972, 249704, 243948, 'Belgii/Belgique                              ', 'Constitutional Monarchy, Federation          ', 'Albert II                                                   ', 179, 'BE');
INSERT INTO country VALUES ('BEN', 'Benin                                               ', 'Africa                                                                                              ', 'Western Africa            ', 112622, 1960, 6097000, 50.2000000000000028, 2357, 2141, 'Benin                                        ', 'Republic                                     ', 'Mathieu Kerekou                                             ', 187, 'BJ');
INSERT INTO country VALUES ('BFA', 'Burkina Faso                                        ', 'Africa                                                                                              ', 'Western Africa            ', 274000, 1960, 11937000, 46.7000000000000028, 2425, 2201, 'Burkina Faso                                 ', 'Republic                                     ', 'Blaise Compaore                                             ', 549, 'BF');
INSERT INTO country VALUES ('BGD', 'Bangladesh                                          ', 'Asia                                                                                                ', 'Southern and Central Asia ', 143998, 1971, 129155000, 60.2000000000000028, 32852, 31966, 'Bangladesh                                   ', 'Republic                                     ', 'Shahabuddin Ahmad                                           ', 150, 'BD');
INSERT INTO country VALUES ('BGR', 'Bulgaria                                            ', 'Europe                                                                                              ', 'Eastern Europe            ', 110994, 1908, 8190900, 70.9000000000000057, 12178, 10169, 'Balgarija                                    ', 'Republic                                     ', 'Petar Stojanov                                              ', 539, 'BG');
INSERT INTO country VALUES ('BHR', 'Bahrain                                             ', 'Asia                                                                                                ', 'Middle East               ', 694, 1971, 617000, 73, 6366, 6097, 'Al-Bahrayn                                   ', 'Monarchy (Emirate)                           ', 'Hamad ibn Isa al-Khalifa                                    ', 149, 'BH');
INSERT INTO country VALUES ('BHS', 'Bahamas                                             ', 'North America                                                                                       ', 'Caribbean                 ', 13878, 1973, 307000, 71.0999999999999943, 3527, 3347, 'The Bahamas                                  ', 'Constitutional Monarchy                      ', 'Elisabeth II                                                ', 148, 'BS');
INSERT INTO country VALUES ('BIH', 'Bosnia and Herzegovina                              ', 'Europe                                                                                              ', 'Southern Europe           ', 51197, 1992, 3972000, 71.5, 2841, NULL, 'Bosna i Hercegovina                          ', 'Federal Republic                             ', 'Ante Jelavic                                                ', 201, 'BA');
INSERT INTO country VALUES ('BLR', 'Belarus                                             ', 'Europe                                                                                              ', 'Eastern Europe            ', 207600, 1991, 10236000, 68, 13714, NULL, 'Belarus                                      ', 'Republic                                     ', 'Aljaksandr Lukaoenka                                        ', 3520, 'BY');
INSERT INTO country VALUES ('BLZ', 'Belize                                              ', 'North America                                                                                       ', 'Central America           ', 22696, 1981, 241000, 70.9000000000000057, 630, 616, 'Belize                                       ', 'Constitutional Monarchy                      ', 'Elisabeth II                                                ', 185, 'BZ');
INSERT INTO country VALUES ('BMU', 'Bermuda                                             ', 'North America                                                                                       ', 'North America             ', 53, NULL, 65000, 76.9000000000000057, 2328, 2190, 'Bermuda                                      ', 'Dependent Territory of the UK                ', 'Elisabeth II                                                ', 191, 'BM');
INSERT INTO country VALUES ('BOL', 'Bolivia                                             ', 'South America                                                                                       ', 'South America             ', 1098581, 1825, 8329000, 63.7000000000000028, 8571, 7967, 'Bolivia                                      ', 'Republic                                     ', 'Hugo Bnzer Surez                                          ', 194, 'BO');
INSERT INTO country VALUES ('BRA', 'Brazil                                              ', 'South America                                                                                       ', 'South America             ', 8547403, 1822, 170115000, 62.8999999999999986, 776739, 804108, 'Brasil                                       ', 'Federal Republic                             ', 'Fernando Henrique Cardoso                                   ', 211, 'BR');
INSERT INTO country VALUES ('BRB', 'Barbados                                            ', 'North America                                                                                       ', 'Caribbean                 ', 430, 1966, 270000, 73, 2223, 2186, 'Barbados                                     ', 'Constitutional Monarchy                      ', 'Elisabeth II                                                ', 174, 'BB');
INSERT INTO country VALUES ('BRN', 'Brunei                                              ', 'Asia                                                                                                ', 'Southeast Asia            ', 5765, 1984, 328000, 73.5999999999999943, 11705, 12460, 'Brunei Darussalam                            ', 'Monarchy (Sultanate)                         ', 'Haji Hassan al-Bolkiah                                      ', 538, 'BN');
INSERT INTO country VALUES ('BTN', 'Bhutan                                              ', 'Asia                                                                                                ', 'Southern and Central Asia ', 47000, 1910, 2124000, 52.3999999999999986, 372, 383, 'Druk-Yul                                     ', 'Monarchy                                     ', 'Jigme Singye Wangchuk                                       ', 192, 'BT');
INSERT INTO country VALUES ('BVT', 'Bouvet Island                                       ', 'Antarctica                                                                                          ', 'Antarctica                ', 59, NULL, 0, NULL, 0, NULL, 'Bouvetya                                    ', 'Dependent Territory of Norway                ', 'Harald V                                                    ', NULL, 'BV');
INSERT INTO country VALUES ('BWA', 'Botswana                                            ', 'Africa                                                                                              ', 'Southern Africa           ', 581730, 1966, 1622000, 39.2999999999999972, 4834, 4935, 'Botswana                                     ', 'Republic                                     ', 'Festus G. Mogae                                             ', 204, 'BW');
INSERT INTO country VALUES ('CAF', 'Central African Republic                            ', 'Africa                                                                                              ', 'Central Africa            ', 622984, 1960, 3615000, 44, 1054, 993, 'Centrafrique/Bi-Afroka                       ', 'Republic                                     ', 'Ange-Felix Patasse                                          ', 1889, 'CF');
INSERT INTO country VALUES ('CAN', 'Canada                                              ', 'North America                                                                                       ', 'North America             ', 9970610, 1867, 31147000, 79.4000000000000057, 598862, 625626, 'Canada                                       ', 'Constitutional Monarchy, Federation          ', 'Elisabeth II                                                ', 1822, 'CA');
INSERT INTO country VALUES ('CCK', 'Cocos (Keeling) Islands                             ', 'Oceania                                                                                             ', 'Australia and New Zealand ', 14, NULL, 600, NULL, 0, NULL, 'Cocos (Keeling) Islands                      ', 'Territory of Australia                       ', 'Elisabeth II                                                ', 2317, 'CC');
INSERT INTO country VALUES ('CHE', 'Switzerland                                         ', 'Europe                                                                                              ', 'Western Europe            ', 41284, 1499, 7160400, 79.5999999999999943, 264478, 256092, 'Schweiz/Suisse/Svizzera/Svizra               ', 'Federation                                   ', 'Adolf Ogi                                                   ', 3248, 'CH');
INSERT INTO country VALUES ('CHL', 'Chile                                               ', 'South America                                                                                       ', 'South America             ', 756626, 1810, 15211000, 75.7000000000000028, 72949, 75780, 'Chile                                        ', 'Republic                                     ', 'Ricardo Lagos Escobar                                       ', 554, 'CL');


--
-- TOC entry 2214 (class 0 OID 17046)
-- Dependencies: 170
-- Data for Name: countrylanguage; Type: TABLE DATA; Schema: public; Owner: Daniel
--

INSERT INTO countrylanguage VALUES ('ABW', 'Dutch                         ', 'T', 5.29999999999999982);
INSERT INTO countrylanguage VALUES ('ABW', 'English                       ', 'F', 9.5);
INSERT INTO countrylanguage VALUES ('ABW', 'Papiamento                    ', 'F', 76.7000000000000028);
INSERT INTO countrylanguage VALUES ('ABW', 'Spanish                       ', 'F', 7.40000000000000036);
INSERT INTO countrylanguage VALUES ('AFG', 'Balochi                       ', 'F', 0.900000000000000022);
INSERT INTO countrylanguage VALUES ('AFG', 'Dari                          ', 'T', 32.1000000000000014);
INSERT INTO countrylanguage VALUES ('AFG', 'Pashto                        ', 'T', 52.3999999999999986);
INSERT INTO countrylanguage VALUES ('AFG', 'Turkmenian                    ', 'F', 1.89999999999999991);
INSERT INTO countrylanguage VALUES ('AFG', 'Uzbek                         ', 'F', 8.80000000000000071);
INSERT INTO countrylanguage VALUES ('AGO', 'Ambo                          ', 'F', 2.39999999999999991);
INSERT INTO countrylanguage VALUES ('AGO', 'Chokwe                        ', 'F', 4.20000000000000018);
INSERT INTO countrylanguage VALUES ('AGO', 'Kongo                         ', 'F', 13.1999999999999993);
INSERT INTO countrylanguage VALUES ('AGO', 'Luchazi                       ', 'F', 2.39999999999999991);
INSERT INTO countrylanguage VALUES ('AGO', 'Luimbe-nganguela              ', 'F', 5.40000000000000036);
INSERT INTO countrylanguage VALUES ('AGO', 'Luvale                        ', 'F', 3.60000000000000009);
INSERT INTO countrylanguage VALUES ('AGO', 'Mbundu                        ', 'F', 21.6000000000000014);
INSERT INTO countrylanguage VALUES ('AGO', 'Nyaneka-nkhumbi               ', 'F', 5.40000000000000036);
INSERT INTO countrylanguage VALUES ('AGO', 'Ovimbundu                     ', 'F', 37.2000000000000028);
INSERT INTO countrylanguage VALUES ('AIA', 'English                       ', 'T', 0);
INSERT INTO countrylanguage VALUES ('ALB', 'Albaniana                     ', 'T', 97.9000000000000057);
INSERT INTO countrylanguage VALUES ('ALB', 'Greek                         ', 'F', 1.80000000000000004);
INSERT INTO countrylanguage VALUES ('ALB', 'Macedonian                    ', 'F', 0.100000000000000006);
INSERT INTO countrylanguage VALUES ('AND', 'Catalan                       ', 'T', 32.2999999999999972);
INSERT INTO countrylanguage VALUES ('AND', 'French                        ', 'F', 6.20000000000000018);
INSERT INTO countrylanguage VALUES ('AND', 'Portuguese                    ', 'F', 10.8000000000000007);
INSERT INTO countrylanguage VALUES ('AND', 'Spanish                       ', 'F', 44.6000000000000014);
INSERT INTO countrylanguage VALUES ('ANT', 'Dutch                         ', 'T', 0);
INSERT INTO countrylanguage VALUES ('ANT', 'English                       ', 'F', 7.79999999999999982);
INSERT INTO countrylanguage VALUES ('ANT', 'Papiamento                    ', 'T', 86.2000000000000028);
INSERT INTO countrylanguage VALUES ('ARE', 'Arabic                        ', 'T', 42);
INSERT INTO countrylanguage VALUES ('ARE', 'Hindi                         ', 'F', 0);
INSERT INTO countrylanguage VALUES ('ARG', 'Indian Languages              ', 'F', 0.299999999999999989);
INSERT INTO countrylanguage VALUES ('ARG', 'Italian                       ', 'F', 1.69999999999999996);
INSERT INTO countrylanguage VALUES ('ARG', 'Spanish                       ', 'T', 96.7999999999999972);
INSERT INTO countrylanguage VALUES ('ARM', 'Armenian                      ', 'T', 93.4000000000000057);
INSERT INTO countrylanguage VALUES ('ARM', 'Azerbaijani                   ', 'F', 2.60000000000000009);
INSERT INTO countrylanguage VALUES ('ASM', 'English                       ', 'T', 3.10000000000000009);
INSERT INTO countrylanguage VALUES ('ASM', 'Samoan                        ', 'T', 90.5999999999999943);
INSERT INTO countrylanguage VALUES ('ASM', 'Tongan                        ', 'F', 3.10000000000000009);
INSERT INTO countrylanguage VALUES ('ATG', 'Creole English                ', 'F', 95.7000000000000028);
INSERT INTO countrylanguage VALUES ('ATG', 'English                       ', 'T', 0);
INSERT INTO countrylanguage VALUES ('AUS', 'Arabic                        ', 'F', 1);
INSERT INTO countrylanguage VALUES ('AUS', 'Canton Chinese                ', 'F', 1.10000000000000009);
INSERT INTO countrylanguage VALUES ('AUS', 'English                       ', 'T', 81.2000000000000028);
INSERT INTO countrylanguage VALUES ('AUS', 'German                        ', 'F', 0.599999999999999978);
INSERT INTO countrylanguage VALUES ('AUS', 'Greek                         ', 'F', 1.60000000000000009);
INSERT INTO countrylanguage VALUES ('AUS', 'Italian                       ', 'F', 2.20000000000000018);
INSERT INTO countrylanguage VALUES ('AUS', 'Serbo-Croatian                ', 'F', 0.599999999999999978);
INSERT INTO countrylanguage VALUES ('AUS', 'Vietnamese                    ', 'F', 0.800000000000000044);
INSERT INTO countrylanguage VALUES ('AUT', 'Czech                         ', 'F', 0.200000000000000011);
INSERT INTO countrylanguage VALUES ('AUT', 'German                        ', 'T', 92);
INSERT INTO countrylanguage VALUES ('AUT', 'Hungarian                     ', 'F', 0.400000000000000022);
INSERT INTO countrylanguage VALUES ('AUT', 'Polish                        ', 'F', 0.200000000000000011);
INSERT INTO countrylanguage VALUES ('AUT', 'Romanian                      ', 'F', 0.200000000000000011);
INSERT INTO countrylanguage VALUES ('AUT', 'Serbo-Croatian                ', 'F', 2.20000000000000018);
INSERT INTO countrylanguage VALUES ('AUT', 'Slovene                       ', 'F', 0.400000000000000022);
INSERT INTO countrylanguage VALUES ('AUT', 'Turkish                       ', 'F', 1.5);
INSERT INTO countrylanguage VALUES ('AZE', 'Armenian                      ', 'F', 2);
INSERT INTO countrylanguage VALUES ('AZE', 'Azerbaijani                   ', 'T', 89);
INSERT INTO countrylanguage VALUES ('AZE', 'Lezgian                       ', 'F', 2.29999999999999982);
INSERT INTO countrylanguage VALUES ('AZE', 'Russian                       ', 'F', 3);
INSERT INTO countrylanguage VALUES ('BDI', 'French                        ', 'T', 0);
INSERT INTO countrylanguage VALUES ('BDI', 'Kirundi                       ', 'T', 98.0999999999999943);
INSERT INTO countrylanguage VALUES ('BDI', 'Swahili                       ', 'F', 0);
INSERT INTO countrylanguage VALUES ('BEL', 'Arabic                        ', 'F', 1.60000000000000009);
INSERT INTO countrylanguage VALUES ('BEL', 'Dutch                         ', 'T', 59.2000000000000028);
INSERT INTO countrylanguage VALUES ('BEL', 'French                        ', 'T', 32.6000000000000014);
INSERT INTO countrylanguage VALUES ('BEL', 'German                        ', 'T', 1);
INSERT INTO countrylanguage VALUES ('BEL', 'Italian                       ', 'F', 2.39999999999999991);
INSERT INTO countrylanguage VALUES ('BEL', 'Turkish                       ', 'F', 0.900000000000000022);
INSERT INTO countrylanguage VALUES ('BEN', 'Adja                          ', 'F', 11.0999999999999996);
INSERT INTO countrylanguage VALUES ('BEN', 'Aizo                          ', 'F', 8.69999999999999929);
INSERT INTO countrylanguage VALUES ('BEN', 'Bariba                        ', 'F', 8.69999999999999929);
INSERT INTO countrylanguage VALUES ('BEN', 'Fon                           ', 'F', 39.7999999999999972);
INSERT INTO countrylanguage VALUES ('BEN', 'Ful                           ', 'F', 5.59999999999999964);
INSERT INTO countrylanguage VALUES ('BEN', 'Joruba                        ', 'F', 12.1999999999999993);
INSERT INTO countrylanguage VALUES ('BEN', 'Somba                         ', 'F', 6.70000000000000018);
INSERT INTO countrylanguage VALUES ('BFA', 'Busansi                       ', 'F', 3.5);
INSERT INTO countrylanguage VALUES ('BFA', 'Dagara                        ', 'F', 3.10000000000000009);
INSERT INTO countrylanguage VALUES ('BFA', 'Dyula                         ', 'F', 2.60000000000000009);
INSERT INTO countrylanguage VALUES ('BFA', 'Ful                           ', 'F', 9.69999999999999929);
INSERT INTO countrylanguage VALUES ('BFA', 'Gurma                         ', 'F', 5.70000000000000018);
INSERT INTO countrylanguage VALUES ('BFA', 'Mossi                         ', 'F', 50.2000000000000028);
INSERT INTO countrylanguage VALUES ('BGD', 'Bengali                       ', 'T', 97.7000000000000028);
INSERT INTO countrylanguage VALUES ('BGD', 'Chakma                        ', 'F', 0.400000000000000022);
INSERT INTO countrylanguage VALUES ('BGD', 'Garo                          ', 'F', 0.100000000000000006);
INSERT INTO countrylanguage VALUES ('BGD', 'Khasi                         ', 'F', 0.100000000000000006);
INSERT INTO countrylanguage VALUES ('BGD', 'Marma                         ', 'F', 0.200000000000000011);
INSERT INTO countrylanguage VALUES ('BGD', 'Santhali                      ', 'F', 0.100000000000000006);
INSERT INTO countrylanguage VALUES ('BGD', 'Tripuri                       ', 'F', 0.100000000000000006);
INSERT INTO countrylanguage VALUES ('BGR', 'Bulgariana                    ', 'T', 83.2000000000000028);
INSERT INTO countrylanguage VALUES ('BGR', 'Macedonian                    ', 'F', 2.60000000000000009);
INSERT INTO countrylanguage VALUES ('BGR', 'Romani                        ', 'F', 3.70000000000000018);
INSERT INTO countrylanguage VALUES ('BGR', 'Turkish                       ', 'F', 9.40000000000000036);
INSERT INTO countrylanguage VALUES ('BHR', 'Arabic                        ', 'T', 67.7000000000000028);
INSERT INTO countrylanguage VALUES ('BHR', 'English                       ', 'F', 0);
INSERT INTO countrylanguage VALUES ('BHS', 'Creole English                ', 'F', 89.7000000000000028);
INSERT INTO countrylanguage VALUES ('BHS', 'Creole French                 ', 'F', 10.3000000000000007);
INSERT INTO countrylanguage VALUES ('BIH', 'Serbo-Croatian                ', 'T', 99.2000000000000028);
INSERT INTO countrylanguage VALUES ('BLR', 'Belorussian                   ', 'T', 65.5999999999999943);
INSERT INTO countrylanguage VALUES ('BLR', 'Polish                        ', 'F', 0.599999999999999978);
INSERT INTO countrylanguage VALUES ('BLR', 'Russian                       ', 'T', 32);
INSERT INTO countrylanguage VALUES ('BLR', 'Ukrainian                     ', 'F', 1.30000000000000004);
INSERT INTO countrylanguage VALUES ('BLZ', 'English                       ', 'T', 50.7999999999999972);
INSERT INTO countrylanguage VALUES ('BLZ', 'Garifuna                      ', 'F', 6.79999999999999982);
INSERT INTO countrylanguage VALUES ('BLZ', 'Maya Languages                ', 'F', 9.59999999999999964);
INSERT INTO countrylanguage VALUES ('BLZ', 'Spanish                       ', 'F', 31.6000000000000014);
INSERT INTO countrylanguage VALUES ('BMU', 'English                       ', 'T', 100);
INSERT INTO countrylanguage VALUES ('BOL', 'Aimar                         ', 'T', 3.20000000000000018);
INSERT INTO countrylanguage VALUES ('BOL', 'Guarani                       ', 'F', 0.100000000000000006);
INSERT INTO countrylanguage VALUES ('BOL', 'Ketoua                        ', 'T', 8.09999999999999964);
INSERT INTO countrylanguage VALUES ('BOL', 'Spanish                       ', 'T', 87.7000000000000028);
INSERT INTO countrylanguage VALUES ('BRA', 'German                        ', 'F', 0.5);
INSERT INTO countrylanguage VALUES ('BRA', 'Indian Languages              ', 'F', 0.200000000000000011);
INSERT INTO countrylanguage VALUES ('BRA', 'Italian                       ', 'F', 0.400000000000000022);
INSERT INTO countrylanguage VALUES ('BRA', 'Japanese                      ', 'F', 0.400000000000000022);
INSERT INTO countrylanguage VALUES ('BRA', 'Portuguese                    ', 'T', 97.5);
INSERT INTO countrylanguage VALUES ('BRB', 'Bajan                         ', 'F', 95.0999999999999943);
INSERT INTO countrylanguage VALUES ('BRB', 'English                       ', 'T', 0);
INSERT INTO countrylanguage VALUES ('BRN', 'Chinese                       ', 'F', 9.30000000000000071);
INSERT INTO countrylanguage VALUES ('BRN', 'English                       ', 'F', 3.10000000000000009);
INSERT INTO countrylanguage VALUES ('BRN', 'Malay                         ', 'T', 45.5);
INSERT INTO countrylanguage VALUES ('BRN', 'Malay-English                 ', 'F', 28.8000000000000007);
INSERT INTO countrylanguage VALUES ('BTN', 'Asami                         ', 'F', 15.1999999999999993);
INSERT INTO countrylanguage VALUES ('BTN', 'Dzongkha                      ', 'T', 50);
INSERT INTO countrylanguage VALUES ('BTN', 'Nepali                        ', 'F', 34.7999999999999972);
INSERT INTO countrylanguage VALUES ('BWA', 'Khoekhoe                      ', 'F', 2.5);
INSERT INTO countrylanguage VALUES ('BWA', 'Ndebele                       ', 'F', 1.30000000000000004);
INSERT INTO countrylanguage VALUES ('BWA', 'San                           ', 'F', 3.5);
INSERT INTO countrylanguage VALUES ('BWA', 'Shona                         ', 'F', 12.3000000000000007);
INSERT INTO countrylanguage VALUES ('BWA', 'Tswana                        ', 'F', 75.5);
INSERT INTO countrylanguage VALUES ('CAF', 'Banda                         ', 'F', 23.5);
INSERT INTO countrylanguage VALUES ('CAF', 'Gbaya                         ', 'F', 23.8000000000000007);
INSERT INTO countrylanguage VALUES ('CAF', 'Mandjia                       ', 'F', 14.8000000000000007);
INSERT INTO countrylanguage VALUES ('CAF', 'Mbum                          ', 'F', 6.40000000000000036);
INSERT INTO countrylanguage VALUES ('CAF', 'Ngbaka                        ', 'F', 7.5);
INSERT INTO countrylanguage VALUES ('CAF', 'Sara                          ', 'F', 6.40000000000000036);
INSERT INTO countrylanguage VALUES ('CAN', 'Chinese                       ', 'F', 2.5);
INSERT INTO countrylanguage VALUES ('CAN', 'Dutch                         ', 'F', 0.5);
INSERT INTO countrylanguage VALUES ('CAN', 'English                       ', 'T', 60.3999999999999986);
INSERT INTO countrylanguage VALUES ('CAN', 'Eskimo Languages              ', 'F', 0.100000000000000006);
INSERT INTO countrylanguage VALUES ('CAN', 'French                        ', 'T', 23.3999999999999986);
INSERT INTO countrylanguage VALUES ('CAN', 'German                        ', 'F', 1.60000000000000009);
INSERT INTO countrylanguage VALUES ('CAN', 'Italian                       ', 'F', 1.69999999999999996);
INSERT INTO countrylanguage VALUES ('CAN', 'Polish                        ', 'F', 0.699999999999999956);
INSERT INTO countrylanguage VALUES ('CAN', 'Portuguese                    ', 'F', 0.699999999999999956);
INSERT INTO countrylanguage VALUES ('CAN', 'Punjabi                       ', 'F', 0.699999999999999956);
INSERT INTO countrylanguage VALUES ('CAN', 'Spanish                       ', 'F', 0.699999999999999956);
INSERT INTO countrylanguage VALUES ('CAN', 'Ukrainian                     ', 'F', 0.599999999999999978);
INSERT INTO countrylanguage VALUES ('CCK', 'English                       ', 'T', 0);
INSERT INTO countrylanguage VALUES ('CCK', 'Malay                         ', 'F', 0);
INSERT INTO countrylanguage VALUES ('CHE', 'French                        ', 'T', 19.1999999999999993);
INSERT INTO countrylanguage VALUES ('CHE', 'German                        ', 'T', 63.6000000000000014);
INSERT INTO countrylanguage VALUES ('CHE', 'Italian                       ', 'T', 7.70000000000000018);
INSERT INTO countrylanguage VALUES ('CHE', 'Romansh                       ', 'T', 0.599999999999999978);
INSERT INTO countrylanguage VALUES ('CHL', 'Aimar                         ', 'F', 0.5);
INSERT INTO countrylanguage VALUES ('CHL', 'Araucan                       ', 'F', 9.59999999999999964);
INSERT INTO countrylanguage VALUES ('CHL', 'Rapa nui                      ', 'F', 0.200000000000000011);
INSERT INTO countrylanguage VALUES ('CHL', 'Spanish                       ', 'T', 89.7000000000000028);
INSERT INTO countrylanguage VALUES ('CHN', 'Chinese                       ', 'T', 92);
INSERT INTO countrylanguage VALUES ('CHN', 'Dong                          ', 'F', 0.200000000000000011);
INSERT INTO countrylanguage VALUES ('CHN', 'Hui                           ', 'F', 0.800000000000000044);
INSERT INTO countrylanguage VALUES ('CHN', 'Mantou                        ', 'F', 0.900000000000000022);
INSERT INTO countrylanguage VALUES ('CHN', 'Miao                          ', 'F', 0.699999999999999956);
INSERT INTO countrylanguage VALUES ('CHN', 'Mongolian                     ', 'F', 0.400000000000000022);
INSERT INTO countrylanguage VALUES ('CHN', 'Puyi                          ', 'F', 0.200000000000000011);
INSERT INTO countrylanguage VALUES ('CHN', 'Tibetan                       ', 'F', 0.400000000000000022);
INSERT INTO countrylanguage VALUES ('CHN', 'Tujia                         ', 'F', 0.5);
INSERT INTO countrylanguage VALUES ('CHN', 'Uighur                        ', 'F', 0.599999999999999978);
INSERT INTO countrylanguage VALUES ('CHN', 'Yi                            ', 'F', 0.599999999999999978);
INSERT INTO countrylanguage VALUES ('CHN', 'Zhuang                        ', 'F', 1.39999999999999991);
INSERT INTO countrylanguage VALUES ('CIV', 'Akan                          ', 'F', 30);
INSERT INTO countrylanguage VALUES ('CIV', 'Gur                           ', 'F', 11.6999999999999993);
INSERT INTO countrylanguage VALUES ('CIV', 'Kru                           ', 'F', 10.5);
INSERT INTO countrylanguage VALUES ('CIV', 'Malinke                       ', 'F', 11.4000000000000004);
INSERT INTO countrylanguage VALUES ('CIV', 'SouthMande                    ', 'F', 7.70000000000000018);
INSERT INTO countrylanguage VALUES ('CMR', 'Bamileke-bamum                ', 'F', 18.6000000000000014);
INSERT INTO countrylanguage VALUES ('CMR', 'Duala                         ', 'F', 10.9000000000000004);
INSERT INTO countrylanguage VALUES ('CMR', 'Fang                          ', 'F', 19.6999999999999993);
INSERT INTO countrylanguage VALUES ('CMR', 'Ful                           ', 'F', 9.59999999999999964);
INSERT INTO countrylanguage VALUES ('CMR', 'Maka                          ', 'F', 4.90000000000000036);
INSERT INTO countrylanguage VALUES ('CMR', 'Mandara                       ', 'F', 5.70000000000000018);
INSERT INTO countrylanguage VALUES ('CMR', 'Masana                        ', 'F', 3.89999999999999991);
INSERT INTO countrylanguage VALUES ('CMR', 'Tikar                         ', 'F', 7.40000000000000036);
INSERT INTO countrylanguage VALUES ('COD', 'Boa                           ', 'F', 2.29999999999999982);
INSERT INTO countrylanguage VALUES ('COD', 'Chokwe                        ', 'F', 1.80000000000000004);
INSERT INTO countrylanguage VALUES ('COD', 'Kongo                         ', 'F', 16);
INSERT INTO countrylanguage VALUES ('COD', 'Luba                          ', 'F', 18);
INSERT INTO countrylanguage VALUES ('COD', 'Mongo                         ', 'F', 13.5);
INSERT INTO countrylanguage VALUES ('COD', 'Ngala and Bangi               ', 'F', 5.79999999999999982);
INSERT INTO countrylanguage VALUES ('COD', 'Rundi                         ', 'F', 3.79999999999999982);
INSERT INTO countrylanguage VALUES ('COD', 'Rwanda                        ', 'F', 10.3000000000000007);
INSERT INTO countrylanguage VALUES ('COD', 'Teke                          ', 'F', 2.70000000000000018);
INSERT INTO countrylanguage VALUES ('COD', 'Zande                         ', 'F', 6.09999999999999964);
INSERT INTO countrylanguage VALUES ('COG', 'Kongo                         ', 'F', 51.5);
INSERT INTO countrylanguage VALUES ('COG', 'Mbete                         ', 'F', 4.79999999999999982);
INSERT INTO countrylanguage VALUES ('COG', 'Mboshi                        ', 'F', 11.4000000000000004);
INSERT INTO countrylanguage VALUES ('COG', 'Punu                          ', 'F', 2.89999999999999991);
INSERT INTO countrylanguage VALUES ('COG', 'Sango                         ', 'F', 2.60000000000000009);
INSERT INTO countrylanguage VALUES ('COG', 'Teke                          ', 'F', 17.3000000000000007);
INSERT INTO countrylanguage VALUES ('COK', 'English                       ', 'F', 0);
INSERT INTO countrylanguage VALUES ('COK', 'Maori                         ', 'T', 0);
INSERT INTO countrylanguage VALUES ('COL', 'Arawakan                      ', 'F', 0.100000000000000006);
INSERT INTO countrylanguage VALUES ('COL', 'Caribbean                     ', 'F', 0.100000000000000006);
INSERT INTO countrylanguage VALUES ('COL', 'Chibcha                       ', 'F', 0.400000000000000022);
INSERT INTO countrylanguage VALUES ('COL', 'Creole English                ', 'F', 0.100000000000000006);
INSERT INTO countrylanguage VALUES ('COL', 'Spanish                       ', 'T', 99);
INSERT INTO countrylanguage VALUES ('COM', 'Comorian                      ', 'T', 75);
INSERT INTO countrylanguage VALUES ('COM', 'Comorian-Arabic               ', 'F', 1.60000000000000009);
INSERT INTO countrylanguage VALUES ('COM', 'Comorian-French               ', 'F', 12.9000000000000004);
INSERT INTO countrylanguage VALUES ('COM', 'Comorian-madagassi            ', 'F', 5.5);
INSERT INTO countrylanguage VALUES ('COM', 'Comorian-Swahili              ', 'F', 0.5);
INSERT INTO countrylanguage VALUES ('CPV', 'Crioulo                       ', 'F', 100);
INSERT INTO countrylanguage VALUES ('CPV', 'Portuguese                    ', 'T', 0);
INSERT INTO countrylanguage VALUES ('CRI', 'Chibcha                       ', 'F', 0.299999999999999989);
INSERT INTO countrylanguage VALUES ('CRI', 'Chinese                       ', 'F', 0.200000000000000011);
INSERT INTO countrylanguage VALUES ('CRI', 'Creole English                ', 'F', 2);
INSERT INTO countrylanguage VALUES ('CRI', 'Spanish                       ', 'T', 97.5);
INSERT INTO countrylanguage VALUES ('CUB', 'Spanish                       ', 'T', 100);
INSERT INTO countrylanguage VALUES ('CXR', 'Chinese                       ', 'F', 0);
INSERT INTO countrylanguage VALUES ('CXR', 'English                       ', 'T', 0);
INSERT INTO countrylanguage VALUES ('CYM', 'English                       ', 'T', 0);
INSERT INTO countrylanguage VALUES ('CYP', 'Greek                         ', 'T', 74.0999999999999943);
INSERT INTO countrylanguage VALUES ('CYP', 'Turkish                       ', 'T', 22.3999999999999986);
INSERT INTO countrylanguage VALUES ('CZE', 'Czech                         ', 'T', 81.2000000000000028);
INSERT INTO countrylanguage VALUES ('CZE', 'German                        ', 'F', 0.5);
INSERT INTO countrylanguage VALUES ('CZE', 'Hungarian                     ', 'F', 0.200000000000000011);
INSERT INTO countrylanguage VALUES ('CZE', 'Moravian                      ', 'F', 12.9000000000000004);
INSERT INTO countrylanguage VALUES ('CZE', 'Polish                        ', 'F', 0.599999999999999978);
INSERT INTO countrylanguage VALUES ('CZE', 'Romani                        ', 'F', 0.299999999999999989);
INSERT INTO countrylanguage VALUES ('CZE', 'Silesiana                     ', 'F', 0.400000000000000022);
INSERT INTO countrylanguage VALUES ('CZE', 'Slovak                        ', 'F', 3.10000000000000009);
INSERT INTO countrylanguage VALUES ('DEU', 'German                        ', 'T', 91.2999999999999972);
INSERT INTO countrylanguage VALUES ('DEU', 'Greek                         ', 'F', 0.400000000000000022);
INSERT INTO countrylanguage VALUES ('DEU', 'Italian                       ', 'F', 0.699999999999999956);
INSERT INTO countrylanguage VALUES ('DEU', 'Polish                        ', 'F', 0.299999999999999989);
INSERT INTO countrylanguage VALUES ('DEU', 'Southern Slavic Languages     ', 'F', 1.39999999999999991);
INSERT INTO countrylanguage VALUES ('DEU', 'Turkish                       ', 'F', 2.60000000000000009);
INSERT INTO countrylanguage VALUES ('DJI', 'Afar                          ', 'F', 34.7999999999999972);
INSERT INTO countrylanguage VALUES ('DJI', 'Arabic                        ', 'T', 10.5999999999999996);
INSERT INTO countrylanguage VALUES ('DJI', 'Somali                        ', 'F', 43.8999999999999986);
INSERT INTO countrylanguage VALUES ('DMA', 'Creole English                ', 'F', 100);
INSERT INTO countrylanguage VALUES ('DMA', 'Creole French                 ', 'F', 0);
INSERT INTO countrylanguage VALUES ('DNK', 'Arabic                        ', 'F', 0.699999999999999956);
INSERT INTO countrylanguage VALUES ('DNK', 'Danish                        ', 'T', 93.5);
INSERT INTO countrylanguage VALUES ('DNK', 'English                       ', 'F', 0.299999999999999989);
INSERT INTO countrylanguage VALUES ('DNK', 'German                        ', 'F', 0.5);
INSERT INTO countrylanguage VALUES ('DNK', 'Norwegian                     ', 'F', 0.299999999999999989);
INSERT INTO countrylanguage VALUES ('DNK', 'Swedish                       ', 'F', 0.299999999999999989);
INSERT INTO countrylanguage VALUES ('DNK', 'Turkish                       ', 'F', 0.800000000000000044);
INSERT INTO countrylanguage VALUES ('DOM', 'Creole French                 ', 'F', 2);
INSERT INTO countrylanguage VALUES ('DOM', 'Spanish                       ', 'T', 98);
INSERT INTO countrylanguage VALUES ('DZA', 'Arabic                        ', 'T', 86);
INSERT INTO countrylanguage VALUES ('DZA', 'Berberi                       ', 'F', 14);
INSERT INTO countrylanguage VALUES ('ECU', 'Ketoua                        ', 'F', 7);
INSERT INTO countrylanguage VALUES ('ECU', 'Spanish                       ', 'T', 93);
INSERT INTO countrylanguage VALUES ('EGY', 'Arabic                        ', 'T', 98.7999999999999972);
INSERT INTO countrylanguage VALUES ('EGY', 'Sinaberberi                   ', 'F', 0);
INSERT INTO countrylanguage VALUES ('ERI', 'Afar                          ', 'F', 4.29999999999999982);
INSERT INTO countrylanguage VALUES ('ERI', 'Bilin                         ', 'F', 3);
INSERT INTO countrylanguage VALUES ('ERI', 'Hadareb                       ', 'F', 3.79999999999999982);
INSERT INTO countrylanguage VALUES ('ERI', 'Saho                          ', 'F', 3);
INSERT INTO countrylanguage VALUES ('ERI', 'Tigre                         ', 'F', 31.6999999999999993);
INSERT INTO countrylanguage VALUES ('ERI', 'Tigrinja                      ', 'T', 49.1000000000000014);
INSERT INTO countrylanguage VALUES ('ESH', 'Arabic                        ', 'T', 100);
INSERT INTO countrylanguage VALUES ('ESP', 'Basque                        ', 'F', 1.60000000000000009);
INSERT INTO countrylanguage VALUES ('ESP', 'Catalan                       ', 'F', 16.8999999999999986);
INSERT INTO countrylanguage VALUES ('ESP', 'Galecian                      ', 'F', 6.40000000000000036);
INSERT INTO countrylanguage VALUES ('ESP', 'Spanish                       ', 'T', 74.4000000000000057);
INSERT INTO countrylanguage VALUES ('EST', 'Belorussian                   ', 'F', 1.39999999999999991);
INSERT INTO countrylanguage VALUES ('EST', 'Estonian                      ', 'T', 65.2999999999999972);
INSERT INTO countrylanguage VALUES ('EST', 'Finnish                       ', 'F', 0.699999999999999956);
INSERT INTO countrylanguage VALUES ('EST', 'Russian                       ', 'F', 27.8000000000000007);
INSERT INTO countrylanguage VALUES ('EST', 'Ukrainian                     ', 'F', 2.79999999999999982);
INSERT INTO countrylanguage VALUES ('ETH', 'Amhara                        ', 'F', 30);
INSERT INTO countrylanguage VALUES ('ETH', 'Gurage                        ', 'F', 4.70000000000000018);
INSERT INTO countrylanguage VALUES ('ETH', 'Oromo                         ', 'F', 31);
INSERT INTO countrylanguage VALUES ('ETH', 'Sidamo                        ', 'F', 3.20000000000000018);
INSERT INTO countrylanguage VALUES ('ETH', 'Somali                        ', 'F', 4.09999999999999964);
INSERT INTO countrylanguage VALUES ('ETH', 'Tigrinja                      ', 'F', 7.20000000000000018);
INSERT INTO countrylanguage VALUES ('ETH', 'Walaita                       ', 'F', 2.79999999999999982);
INSERT INTO countrylanguage VALUES ('FIN', 'Estonian                      ', 'F', 0.200000000000000011);
INSERT INTO countrylanguage VALUES ('FIN', 'Finnish                       ', 'T', 92.7000000000000028);
INSERT INTO countrylanguage VALUES ('FIN', 'Russian                       ', 'F', 0.400000000000000022);
INSERT INTO countrylanguage VALUES ('FIN', 'Saame                         ', 'F', 0);
INSERT INTO countrylanguage VALUES ('FIN', 'Swedish                       ', 'T', 5.70000000000000018);
INSERT INTO countrylanguage VALUES ('FJI', 'Fijian                        ', 'T', 50.7999999999999972);
INSERT INTO countrylanguage VALUES ('FJI', 'Hindi                         ', 'F', 43.7000000000000028);
INSERT INTO countrylanguage VALUES ('FLK', 'English                       ', 'T', 0);
INSERT INTO countrylanguage VALUES ('FRA', 'Arabic                        ', 'F', 2.5);
INSERT INTO countrylanguage VALUES ('FRA', 'French                        ', 'T', 93.5999999999999943);
INSERT INTO countrylanguage VALUES ('FRA', 'Italian                       ', 'F', 0.400000000000000022);
INSERT INTO countrylanguage VALUES ('FRA', 'Portuguese                    ', 'F', 1.19999999999999996);
INSERT INTO countrylanguage VALUES ('FRA', 'Spanish                       ', 'F', 0.400000000000000022);
INSERT INTO countrylanguage VALUES ('FRA', 'Turkish                       ', 'F', 0.400000000000000022);
INSERT INTO countrylanguage VALUES ('FRO', 'Danish                        ', 'T', 0);
INSERT INTO countrylanguage VALUES ('FRO', 'Faroese                       ', 'T', 100);
INSERT INTO countrylanguage VALUES ('FSM', 'Kosrean                       ', 'F', 7.29999999999999982);
INSERT INTO countrylanguage VALUES ('FSM', 'Mortlock                      ', 'F', 7.59999999999999964);
INSERT INTO countrylanguage VALUES ('FSM', 'Pohnpei                       ', 'F', 23.8000000000000007);
INSERT INTO countrylanguage VALUES ('FSM', 'Trukese                       ', 'F', 41.6000000000000014);
INSERT INTO countrylanguage VALUES ('FSM', 'Wolea                         ', 'F', 3.70000000000000018);
INSERT INTO countrylanguage VALUES ('FSM', 'Yap                           ', 'F', 5.79999999999999982);
INSERT INTO countrylanguage VALUES ('GAB', 'Fang                          ', 'F', 35.7999999999999972);
INSERT INTO countrylanguage VALUES ('GAB', 'Mbete                         ', 'F', 13.8000000000000007);
INSERT INTO countrylanguage VALUES ('GAB', 'Mpongwe                       ', 'F', 14.5999999999999996);
INSERT INTO countrylanguage VALUES ('GAB', 'Punu-sira-nzebi               ', 'F', 17.1000000000000014);
INSERT INTO countrylanguage VALUES ('GBR', 'English                       ', 'T', 97.2999999999999972);
INSERT INTO countrylanguage VALUES ('GBR', 'Gaeli                         ', 'F', 0.100000000000000006);
INSERT INTO countrylanguage VALUES ('GBR', 'Kymri                         ', 'F', 0.900000000000000022);
INSERT INTO countrylanguage VALUES ('GEO', 'Abhyasi                       ', 'F', 1.69999999999999996);
INSERT INTO countrylanguage VALUES ('GEO', 'Armenian                      ', 'F', 6.79999999999999982);
INSERT INTO countrylanguage VALUES ('GEO', 'Azerbaijani                   ', 'F', 5.5);
INSERT INTO countrylanguage VALUES ('GEO', 'Georgiana                     ', 'T', 71.7000000000000028);
INSERT INTO countrylanguage VALUES ('GEO', 'Osseetti                      ', 'F', 2.39999999999999991);
INSERT INTO countrylanguage VALUES ('GEO', 'Russian                       ', 'F', 8.80000000000000071);
INSERT INTO countrylanguage VALUES ('GHA', 'Akan                          ', 'F', 52.3999999999999986);
INSERT INTO countrylanguage VALUES ('GHA', 'Ewe                           ', 'F', 11.9000000000000004);
INSERT INTO countrylanguage VALUES ('GHA', 'Ga-adangme                    ', 'F', 7.79999999999999982);
INSERT INTO countrylanguage VALUES ('GHA', 'Gurma                         ', 'F', 3.29999999999999982);
INSERT INTO countrylanguage VALUES ('GHA', 'Joruba                        ', 'F', 1.30000000000000004);
INSERT INTO countrylanguage VALUES ('GHA', 'Mossi                         ', 'F', 15.8000000000000007);
INSERT INTO countrylanguage VALUES ('GIB', 'Arabic                        ', 'F', 7.40000000000000036);
INSERT INTO countrylanguage VALUES ('GIB', 'English                       ', 'T', 88.9000000000000057);
INSERT INTO countrylanguage VALUES ('GIN', 'Ful                           ', 'F', 38.6000000000000014);
INSERT INTO countrylanguage VALUES ('GIN', 'Kissi                         ', 'F', 6);
INSERT INTO countrylanguage VALUES ('GIN', 'Kpelle                        ', 'F', 4.59999999999999964);
INSERT INTO countrylanguage VALUES ('GIN', 'Loma                          ', 'F', 2.29999999999999982);
INSERT INTO countrylanguage VALUES ('GIN', 'Malinke                       ', 'F', 23.1999999999999993);
INSERT INTO countrylanguage VALUES ('GIN', 'Susu                          ', 'F', 11);
INSERT INTO countrylanguage VALUES ('GIN', 'Yalunka                       ', 'F', 2.89999999999999991);
INSERT INTO countrylanguage VALUES ('GLP', 'Creole French                 ', 'F', 95);
INSERT INTO countrylanguage VALUES ('GLP', 'French                        ', 'T', 0);
INSERT INTO countrylanguage VALUES ('GMB', 'Diola                         ', 'F', 9.19999999999999929);
INSERT INTO countrylanguage VALUES ('GMB', 'Ful                           ', 'F', 16.1999999999999993);
INSERT INTO countrylanguage VALUES ('GMB', 'Malinke                       ', 'F', 34.1000000000000014);
INSERT INTO countrylanguage VALUES ('GMB', 'Soninke                       ', 'F', 7.59999999999999964);
INSERT INTO countrylanguage VALUES ('GMB', 'Wolof                         ', 'F', 12.5999999999999996);
INSERT INTO countrylanguage VALUES ('GNB', 'Balante                       ', 'F', 14.5999999999999996);
INSERT INTO countrylanguage VALUES ('GNB', 'Crioulo                       ', 'F', 36.3999999999999986);
INSERT INTO countrylanguage VALUES ('GNB', 'Ful                           ', 'F', 16.6000000000000014);
INSERT INTO countrylanguage VALUES ('GNB', 'Malinke                       ', 'F', 6.90000000000000036);
INSERT INTO countrylanguage VALUES ('GNB', 'Mandyako                      ', 'F', 4.90000000000000036);
INSERT INTO countrylanguage VALUES ('GNB', 'Portuguese                    ', 'T', 8.09999999999999964);
INSERT INTO countrylanguage VALUES ('GNQ', 'Bubi                          ', 'F', 8.69999999999999929);
INSERT INTO countrylanguage VALUES ('GNQ', 'Fang                          ', 'F', 84.7999999999999972);
INSERT INTO countrylanguage VALUES ('GRC', 'Greek                         ', 'T', 98.5);
INSERT INTO countrylanguage VALUES ('GRC', 'Turkish                       ', 'F', 0.900000000000000022);
INSERT INTO countrylanguage VALUES ('GRD', 'Creole English                ', 'F', 100);
INSERT INTO countrylanguage VALUES ('GRL', 'Danish                        ', 'T', 12.5);
INSERT INTO countrylanguage VALUES ('GRL', 'Greenlandic                   ', 'T', 87.5);
INSERT INTO countrylanguage VALUES ('GTM', 'Cakchiquel                    ', 'F', 8.90000000000000036);
INSERT INTO countrylanguage VALUES ('GTM', 'Kekchi                        ', 'F', 4.90000000000000036);
INSERT INTO countrylanguage VALUES ('GTM', 'Mam                           ', 'F', 2.70000000000000018);
INSERT INTO countrylanguage VALUES ('GTM', 'Quiche                        ', 'F', 10.0999999999999996);
INSERT INTO countrylanguage VALUES ('GTM', 'Spanish                       ', 'T', 64.7000000000000028);
INSERT INTO countrylanguage VALUES ('GUF', 'Creole French                 ', 'F', 94.2999999999999972);
INSERT INTO countrylanguage VALUES ('GUF', 'Indian Languages              ', 'F', 1.89999999999999991);
INSERT INTO countrylanguage VALUES ('GUM', 'Chamorro                      ', 'T', 29.6000000000000014);
INSERT INTO countrylanguage VALUES ('GUM', 'English                       ', 'T', 37.5);
INSERT INTO countrylanguage VALUES ('GUM', 'Japanese                      ', 'F', 2);
INSERT INTO countrylanguage VALUES ('GUM', 'Korean                        ', 'F', 3.29999999999999982);
INSERT INTO countrylanguage VALUES ('GUM', 'Philippene Languages          ', 'F', 19.6999999999999993);
INSERT INTO countrylanguage VALUES ('GUY', 'Arawakan                      ', 'F', 1.39999999999999991);
INSERT INTO countrylanguage VALUES ('GUY', 'Caribbean                     ', 'F', 2.20000000000000018);
INSERT INTO countrylanguage VALUES ('GUY', 'Creole English                ', 'F', 96.4000000000000057);
INSERT INTO countrylanguage VALUES ('HKG', 'Canton Chinese                ', 'F', 88.7000000000000028);
INSERT INTO countrylanguage VALUES ('HKG', 'Chiu chau                     ', 'F', 1.39999999999999991);
INSERT INTO countrylanguage VALUES ('HKG', 'English                       ', 'T', 2.20000000000000018);
INSERT INTO countrylanguage VALUES ('HKG', 'Fukien                        ', 'F', 1.89999999999999991);
INSERT INTO countrylanguage VALUES ('HKG', 'Hakka                         ', 'F', 1.60000000000000009);
INSERT INTO countrylanguage VALUES ('HND', 'Creole English                ', 'F', 0.200000000000000011);
INSERT INTO countrylanguage VALUES ('HND', 'Garifuna                      ', 'F', 1.30000000000000004);
INSERT INTO countrylanguage VALUES ('HND', 'Miskito                       ', 'F', 0.200000000000000011);
INSERT INTO countrylanguage VALUES ('HND', 'Spanish                       ', 'T', 97.2000000000000028);
INSERT INTO countrylanguage VALUES ('HRV', 'Serbo-Croatian                ', 'T', 95.9000000000000057);
INSERT INTO countrylanguage VALUES ('HRV', 'Slovene                       ', 'F', 0);
INSERT INTO countrylanguage VALUES ('HTI', 'French                        ', 'T', 0);
INSERT INTO countrylanguage VALUES ('HTI', 'Haiti Creole                  ', 'F', 100);
INSERT INTO countrylanguage VALUES ('HUN', 'German                        ', 'F', 0.400000000000000022);
INSERT INTO countrylanguage VALUES ('HUN', 'Hungarian                     ', 'T', 98.5);
INSERT INTO countrylanguage VALUES ('HUN', 'Romani                        ', 'F', 0.5);
INSERT INTO countrylanguage VALUES ('HUN', 'Romanian                      ', 'F', 0.100000000000000006);
INSERT INTO countrylanguage VALUES ('HUN', 'Serbo-Croatian                ', 'F', 0.200000000000000011);
INSERT INTO countrylanguage VALUES ('HUN', 'Slovak                        ', 'F', 0.100000000000000006);
INSERT INTO countrylanguage VALUES ('IDN', 'Bali                          ', 'F', 1.69999999999999996);
INSERT INTO countrylanguage VALUES ('IDN', 'Banja                         ', 'F', 1.80000000000000004);
INSERT INTO countrylanguage VALUES ('IDN', 'Batakki                       ', 'F', 2.20000000000000018);
INSERT INTO countrylanguage VALUES ('IDN', 'Bugi                          ', 'F', 2.20000000000000018);
INSERT INTO countrylanguage VALUES ('IDN', 'Javanese                      ', 'F', 39.3999999999999986);
INSERT INTO countrylanguage VALUES ('IDN', 'Madura                        ', 'F', 4.29999999999999982);
INSERT INTO countrylanguage VALUES ('IDN', 'Malay                         ', 'T', 12.0999999999999996);
INSERT INTO countrylanguage VALUES ('IDN', 'Minangkabau                   ', 'F', 2.39999999999999991);
INSERT INTO countrylanguage VALUES ('IDN', 'Sunda                         ', 'F', 15.8000000000000007);
INSERT INTO countrylanguage VALUES ('IND', 'Asami                         ', 'F', 1.5);
INSERT INTO countrylanguage VALUES ('IND', 'Bengali                       ', 'F', 8.19999999999999929);
INSERT INTO countrylanguage VALUES ('IND', 'Gujarati                      ', 'F', 4.79999999999999982);
INSERT INTO countrylanguage VALUES ('IND', 'Hindi                         ', 'T', 39.8999999999999986);
INSERT INTO countrylanguage VALUES ('IND', 'Kannada                       ', 'F', 3.89999999999999991);
INSERT INTO countrylanguage VALUES ('IND', 'Malajalam                     ', 'F', 3.60000000000000009);
INSERT INTO countrylanguage VALUES ('IND', 'Marathi                       ', 'F', 7.40000000000000036);
INSERT INTO countrylanguage VALUES ('IND', 'Orija                         ', 'F', 3.29999999999999982);
INSERT INTO countrylanguage VALUES ('IND', 'Punjabi                       ', 'F', 2.79999999999999982);
INSERT INTO countrylanguage VALUES ('IND', 'Tamil                         ', 'F', 6.29999999999999982);
INSERT INTO countrylanguage VALUES ('IND', 'Telugu                        ', 'F', 7.79999999999999982);
INSERT INTO countrylanguage VALUES ('IND', 'Urdu                          ', 'F', 5.09999999999999964);
INSERT INTO countrylanguage VALUES ('IRL', 'English                       ', 'T', 98.4000000000000057);
INSERT INTO countrylanguage VALUES ('IRL', 'Irish                         ', 'T', 1.60000000000000009);
INSERT INTO countrylanguage VALUES ('IRN', 'Arabic                        ', 'F', 2.20000000000000018);
INSERT INTO countrylanguage VALUES ('IRN', 'Azerbaijani                   ', 'F', 16.8000000000000007);
INSERT INTO countrylanguage VALUES ('IRN', 'Bakhtyari                     ', 'F', 1.69999999999999996);
INSERT INTO countrylanguage VALUES ('IRN', 'Balochi                       ', 'F', 2.29999999999999982);
INSERT INTO countrylanguage VALUES ('IRN', 'Gilaki                        ', 'F', 5.29999999999999982);
INSERT INTO countrylanguage VALUES ('IRN', 'Kurdish                       ', 'F', 9.09999999999999964);
INSERT INTO countrylanguage VALUES ('IRN', 'Luri                          ', 'F', 4.29999999999999982);
INSERT INTO countrylanguage VALUES ('IRN', 'Mazandarani                   ', 'F', 3.60000000000000009);
INSERT INTO countrylanguage VALUES ('IRN', 'Persian                       ', 'T', 45.7000000000000028);
INSERT INTO countrylanguage VALUES ('IRN', 'Turkmenian                    ', 'F', 1.60000000000000009);
INSERT INTO countrylanguage VALUES ('IRQ', 'Arabic                        ', 'T', 77.2000000000000028);
INSERT INTO countrylanguage VALUES ('IRQ', 'Assyrian                      ', 'F', 0.800000000000000044);
INSERT INTO countrylanguage VALUES ('IRQ', 'Azerbaijani                   ', 'F', 1.69999999999999996);
INSERT INTO countrylanguage VALUES ('IRQ', 'Kurdish                       ', 'F', 19);
INSERT INTO countrylanguage VALUES ('IRQ', 'Persian                       ', 'F', 0.800000000000000044);
INSERT INTO countrylanguage VALUES ('ISL', 'English                       ', 'F', 0);
INSERT INTO countrylanguage VALUES ('ISL', 'Icelandic                     ', 'T', 95.7000000000000028);
INSERT INTO countrylanguage VALUES ('ISR', 'Arabic                        ', 'T', 18);
INSERT INTO countrylanguage VALUES ('ISR', 'Hebrew                        ', 'T', 63.1000000000000014);
INSERT INTO countrylanguage VALUES ('ISR', 'Russian                       ', 'F', 8.90000000000000036);
INSERT INTO countrylanguage VALUES ('ITA', 'Albaniana                     ', 'F', 0.200000000000000011);
INSERT INTO countrylanguage VALUES ('ITA', 'French                        ', 'F', 0.5);
INSERT INTO countrylanguage VALUES ('ITA', 'Friuli                        ', 'F', 1.19999999999999996);
INSERT INTO countrylanguage VALUES ('ITA', 'German                        ', 'F', 0.5);
INSERT INTO countrylanguage VALUES ('ITA', 'Italian                       ', 'T', 94.0999999999999943);
INSERT INTO countrylanguage VALUES ('ITA', 'Romani                        ', 'F', 0.200000000000000011);
INSERT INTO countrylanguage VALUES ('ITA', 'Sardinian                     ', 'F', 2.70000000000000018);
INSERT INTO countrylanguage VALUES ('ITA', 'Slovene                       ', 'F', 0.200000000000000011);
INSERT INTO countrylanguage VALUES ('JAM', 'Creole English                ', 'F', 94.2000000000000028);
INSERT INTO countrylanguage VALUES ('JAM', 'Hindi                         ', 'F', 1.89999999999999991);
INSERT INTO countrylanguage VALUES ('JOR', 'Arabic                        ', 'T', 97.9000000000000057);
INSERT INTO countrylanguage VALUES ('JOR', 'Armenian                      ', 'F', 1);
INSERT INTO countrylanguage VALUES ('JOR', 'Circassian                    ', 'F', 1);
INSERT INTO countrylanguage VALUES ('JPN', 'Ainu                          ', 'F', 0);
INSERT INTO countrylanguage VALUES ('JPN', 'Chinese                       ', 'F', 0.200000000000000011);
INSERT INTO countrylanguage VALUES ('JPN', 'English                       ', 'F', 0.100000000000000006);
INSERT INTO countrylanguage VALUES ('JPN', 'Japanese                      ', 'T', 99.0999999999999943);
INSERT INTO countrylanguage VALUES ('JPN', 'Korean                        ', 'F', 0.5);
INSERT INTO countrylanguage VALUES ('JPN', 'Philippene Languages          ', 'F', 0.100000000000000006);
INSERT INTO countrylanguage VALUES ('KAZ', 'German                        ', 'F', 3.10000000000000009);
INSERT INTO countrylanguage VALUES ('KAZ', 'Kazakh                        ', 'T', 46);
INSERT INTO countrylanguage VALUES ('KAZ', 'Russian                       ', 'F', 34.7000000000000028);
INSERT INTO countrylanguage VALUES ('KAZ', 'Tatar                         ', 'F', 2);
INSERT INTO countrylanguage VALUES ('KAZ', 'Ukrainian                     ', 'F', 5);
INSERT INTO countrylanguage VALUES ('KAZ', 'Uzbek                         ', 'F', 2.29999999999999982);
INSERT INTO countrylanguage VALUES ('KEN', 'Gusii                         ', 'F', 6.09999999999999964);
INSERT INTO countrylanguage VALUES ('KEN', 'Kalenjin                      ', 'F', 10.8000000000000007);
INSERT INTO countrylanguage VALUES ('KEN', 'Kamba                         ', 'F', 11.1999999999999993);
INSERT INTO countrylanguage VALUES ('KEN', 'Kikuyu                        ', 'F', 20.8999999999999986);
INSERT INTO countrylanguage VALUES ('KEN', 'Luhya                         ', 'F', 13.8000000000000007);
INSERT INTO countrylanguage VALUES ('KEN', 'Luo                           ', 'F', 12.8000000000000007);
INSERT INTO countrylanguage VALUES ('KEN', 'Masai                         ', 'F', 1.60000000000000009);
INSERT INTO countrylanguage VALUES ('KEN', 'Meru                          ', 'F', 5.5);
INSERT INTO countrylanguage VALUES ('KEN', 'Nyika                         ', 'F', 4.79999999999999982);
INSERT INTO countrylanguage VALUES ('KEN', 'Turkana                       ', 'F', 1.39999999999999991);
INSERT INTO countrylanguage VALUES ('KGZ', 'Kazakh                        ', 'F', 0.800000000000000044);
INSERT INTO countrylanguage VALUES ('KGZ', 'Kirgiz                        ', 'T', 59.7000000000000028);
INSERT INTO countrylanguage VALUES ('KGZ', 'Russian                       ', 'T', 16.1999999999999993);
INSERT INTO countrylanguage VALUES ('KGZ', 'Tadzhik                       ', 'F', 0.800000000000000044);
INSERT INTO countrylanguage VALUES ('KGZ', 'Tatar                         ', 'F', 1.30000000000000004);
INSERT INTO countrylanguage VALUES ('KGZ', 'Ukrainian                     ', 'F', 1.69999999999999996);
INSERT INTO countrylanguage VALUES ('KGZ', 'Uzbek                         ', 'F', 14.0999999999999996);
INSERT INTO countrylanguage VALUES ('KHM', 'Chinese                       ', 'F', 3.10000000000000009);
INSERT INTO countrylanguage VALUES ('KHM', 'Khmer                         ', 'T', 88.5999999999999943);
INSERT INTO countrylanguage VALUES ('KHM', 'Toam                          ', 'F', 2.39999999999999991);
INSERT INTO countrylanguage VALUES ('KHM', 'Vietnamese                    ', 'F', 5.5);
INSERT INTO countrylanguage VALUES ('KIR', 'Kiribati                      ', 'T', 98.9000000000000057);
INSERT INTO countrylanguage VALUES ('KIR', 'Tuvalu                        ', 'F', 0.5);
INSERT INTO countrylanguage VALUES ('KNA', 'Creole English                ', 'F', 100);
INSERT INTO countrylanguage VALUES ('KNA', 'English                       ', 'T', 0);
INSERT INTO countrylanguage VALUES ('KOR', 'Chinese                       ', 'F', 0.100000000000000006);
INSERT INTO countrylanguage VALUES ('KOR', 'Korean                        ', 'T', 99.9000000000000057);
INSERT INTO countrylanguage VALUES ('KWT', 'Arabic                        ', 'T', 78.0999999999999943);
INSERT INTO countrylanguage VALUES ('KWT', 'English                       ', 'F', 0);
INSERT INTO countrylanguage VALUES ('LAO', 'Lao                           ', 'T', 67.2000000000000028);
INSERT INTO countrylanguage VALUES ('LAO', 'Lao-Soung                     ', 'F', 5.20000000000000018);
INSERT INTO countrylanguage VALUES ('LAO', 'Mon-khmer                     ', 'F', 16.5);
INSERT INTO countrylanguage VALUES ('LAO', 'Thai                          ', 'F', 7.79999999999999982);
INSERT INTO countrylanguage VALUES ('LBN', 'Arabic                        ', 'T', 93);
INSERT INTO countrylanguage VALUES ('LBN', 'Armenian                      ', 'F', 5.90000000000000036);
INSERT INTO countrylanguage VALUES ('LBN', 'French                        ', 'F', 0);
INSERT INTO countrylanguage VALUES ('LBR', 'Bassa                         ', 'F', 13.6999999999999993);
INSERT INTO countrylanguage VALUES ('LBR', 'Gio                           ', 'F', 7.90000000000000036);
INSERT INTO countrylanguage VALUES ('LBR', 'Grebo                         ', 'F', 8.90000000000000036);
INSERT INTO countrylanguage VALUES ('LBR', 'Kpelle                        ', 'F', 19.5);
INSERT INTO countrylanguage VALUES ('LBR', 'Kru                           ', 'F', 7.20000000000000018);
INSERT INTO countrylanguage VALUES ('LBR', 'Loma                          ', 'F', 5.79999999999999982);
INSERT INTO countrylanguage VALUES ('LBR', 'Malinke                       ', 'F', 5.09999999999999964);
INSERT INTO countrylanguage VALUES ('LBR', 'Mano                          ', 'F', 7.20000000000000018);
INSERT INTO countrylanguage VALUES ('LBY', 'Arabic                        ', 'T', 96);
INSERT INTO countrylanguage VALUES ('LBY', 'Berberi                       ', 'F', 1);
INSERT INTO countrylanguage VALUES ('LCA', 'Creole French                 ', 'F', 80);
INSERT INTO countrylanguage VALUES ('LCA', 'English                       ', 'T', 20);
INSERT INTO countrylanguage VALUES ('LIE', 'German                        ', 'T', 89);
INSERT INTO countrylanguage VALUES ('LIE', 'Italian                       ', 'F', 2.5);
INSERT INTO countrylanguage VALUES ('LIE', 'Turkish                       ', 'F', 2.5);
INSERT INTO countrylanguage VALUES ('LKA', 'Mixed Languages               ', 'F', 19.6000000000000014);
INSERT INTO countrylanguage VALUES ('LKA', 'Singali                       ', 'T', 60.2999999999999972);
INSERT INTO countrylanguage VALUES ('LKA', 'Tamil                         ', 'T', 19.6000000000000014);
INSERT INTO countrylanguage VALUES ('LSO', 'English                       ', 'T', 0);
INSERT INTO countrylanguage VALUES ('LSO', 'Sotho                         ', 'T', 85);
INSERT INTO countrylanguage VALUES ('LSO', 'Zulu                          ', 'F', 15);
INSERT INTO countrylanguage VALUES ('LTU', 'Belorussian                   ', 'F', 1.39999999999999991);
INSERT INTO countrylanguage VALUES ('LTU', 'Lithuanian                    ', 'T', 81.5999999999999943);
INSERT INTO countrylanguage VALUES ('LTU', 'Polish                        ', 'F', 7);
INSERT INTO countrylanguage VALUES ('LTU', 'Russian                       ', 'F', 8.09999999999999964);
INSERT INTO countrylanguage VALUES ('LTU', 'Ukrainian                     ', 'F', 1.10000000000000009);
INSERT INTO countrylanguage VALUES ('LUX', 'French                        ', 'T', 4.20000000000000018);
INSERT INTO countrylanguage VALUES ('LUX', 'German                        ', 'T', 2.29999999999999982);
INSERT INTO countrylanguage VALUES ('LUX', 'Italian                       ', 'F', 4.59999999999999964);
INSERT INTO countrylanguage VALUES ('LUX', 'Luxembourgish                 ', 'T', 64.4000000000000057);
INSERT INTO countrylanguage VALUES ('LUX', 'Portuguese                    ', 'F', 13);
INSERT INTO countrylanguage VALUES ('LVA', 'Belorussian                   ', 'F', 4.09999999999999964);
INSERT INTO countrylanguage VALUES ('LVA', 'Latvian                       ', 'T', 55.1000000000000014);
INSERT INTO countrylanguage VALUES ('LVA', 'Lithuanian                    ', 'F', 1.19999999999999996);
INSERT INTO countrylanguage VALUES ('LVA', 'Polish                        ', 'F', 2.10000000000000009);
INSERT INTO countrylanguage VALUES ('LVA', 'Russian                       ', 'F', 32.5);
INSERT INTO countrylanguage VALUES ('LVA', 'Ukrainian                     ', 'F', 2.89999999999999991);
INSERT INTO countrylanguage VALUES ('MAC', 'Canton Chinese                ', 'F', 85.5999999999999943);
INSERT INTO countrylanguage VALUES ('MAC', 'English                       ', 'F', 0.5);
INSERT INTO countrylanguage VALUES ('MAC', 'Mandarin Chinese              ', 'F', 1.19999999999999996);
INSERT INTO countrylanguage VALUES ('MAC', 'Portuguese                    ', 'T', 2.29999999999999982);
INSERT INTO countrylanguage VALUES ('MAR', 'Arabic                        ', 'T', 65);
INSERT INTO countrylanguage VALUES ('MAR', 'Berberi                       ', 'F', 33);
INSERT INTO countrylanguage VALUES ('MCO', 'English                       ', 'F', 6.5);
INSERT INTO countrylanguage VALUES ('MCO', 'French                        ', 'T', 41.8999999999999986);
INSERT INTO countrylanguage VALUES ('MCO', 'Italian                       ', 'F', 16.1000000000000014);
INSERT INTO countrylanguage VALUES ('MCO', 'Monegasque                    ', 'F', 16.1000000000000014);
INSERT INTO countrylanguage VALUES ('MDA', 'Bulgariana                    ', 'F', 1.60000000000000009);
INSERT INTO countrylanguage VALUES ('MDA', 'Gagauzi                       ', 'F', 3.20000000000000018);
INSERT INTO countrylanguage VALUES ('MDA', 'Romanian                      ', 'T', 61.8999999999999986);
INSERT INTO countrylanguage VALUES ('MDA', 'Russian                       ', 'F', 23.1999999999999993);
INSERT INTO countrylanguage VALUES ('MDA', 'Ukrainian                     ', 'F', 8.59999999999999964);
INSERT INTO countrylanguage VALUES ('MDG', 'French                        ', 'T', 0);
INSERT INTO countrylanguage VALUES ('MDG', 'Malagasy                      ', 'T', 98.9000000000000057);
INSERT INTO countrylanguage VALUES ('MDV', 'Dhivehi                       ', 'T', 100);
INSERT INTO countrylanguage VALUES ('MDV', 'English                       ', 'F', 0);
INSERT INTO countrylanguage VALUES ('MEX', 'Mixtec                        ', 'F', 0.599999999999999978);
INSERT INTO countrylanguage VALUES ('MEX', 'Nhuatl                        ', 'F', 1.80000000000000004);
INSERT INTO countrylanguage VALUES ('MEX', 'Otomi                         ', 'F', 0.400000000000000022);
INSERT INTO countrylanguage VALUES ('MEX', 'Spanish                       ', 'T', 92.0999999999999943);
INSERT INTO countrylanguage VALUES ('MEX', 'Yucatec                       ', 'F', 1.10000000000000009);
INSERT INTO countrylanguage VALUES ('MEX', 'Zapotec                       ', 'F', 0.599999999999999978);
INSERT INTO countrylanguage VALUES ('MHL', 'English                       ', 'T', 0);
INSERT INTO countrylanguage VALUES ('MHL', 'Marshallese                   ', 'T', 96.7999999999999972);
INSERT INTO countrylanguage VALUES ('MKD', 'Albaniana                     ', 'F', 22.8999999999999986);
INSERT INTO countrylanguage VALUES ('MKD', 'Macedonian                    ', 'T', 66.5);
INSERT INTO countrylanguage VALUES ('MKD', 'Romani                        ', 'F', 2.29999999999999982);
INSERT INTO countrylanguage VALUES ('MKD', 'Serbo-Croatian                ', 'F', 2);
INSERT INTO countrylanguage VALUES ('MKD', 'Turkish                       ', 'F', 4);
INSERT INTO countrylanguage VALUES ('MLI', 'Bambara                       ', 'F', 31.8000000000000007);
INSERT INTO countrylanguage VALUES ('MLI', 'Ful                           ', 'F', 13.9000000000000004);
INSERT INTO countrylanguage VALUES ('MLI', 'Senufo and Minianka           ', 'F', 12);
INSERT INTO countrylanguage VALUES ('MLI', 'Songhai                       ', 'F', 6.90000000000000036);
INSERT INTO countrylanguage VALUES ('MLI', 'Soninke                       ', 'F', 8.69999999999999929);
INSERT INTO countrylanguage VALUES ('MLI', 'Tamashek                      ', 'F', 7.29999999999999982);
INSERT INTO countrylanguage VALUES ('MLT', 'English                       ', 'T', 2.10000000000000009);
INSERT INTO countrylanguage VALUES ('MLT', 'Maltese                       ', 'T', 95.7999999999999972);
INSERT INTO countrylanguage VALUES ('MMR', 'Burmese                       ', 'T', 69);
INSERT INTO countrylanguage VALUES ('MMR', 'Chin                          ', 'F', 2.20000000000000018);
INSERT INTO countrylanguage VALUES ('MMR', 'Kachin                        ', 'F', 1.39999999999999991);
INSERT INTO countrylanguage VALUES ('MMR', 'Karen                         ', 'F', 6.20000000000000018);
INSERT INTO countrylanguage VALUES ('MMR', 'Kayah                         ', 'F', 0.400000000000000022);
INSERT INTO countrylanguage VALUES ('MMR', 'Mon                           ', 'F', 2.39999999999999991);
INSERT INTO countrylanguage VALUES ('MMR', 'Rakhine                       ', 'F', 4.5);
INSERT INTO countrylanguage VALUES ('MMR', 'Shan                          ', 'F', 8.5);
INSERT INTO countrylanguage VALUES ('MNG', 'Bajad                         ', 'F', 1.89999999999999991);
INSERT INTO countrylanguage VALUES ('MNG', 'Buryat                        ', 'F', 1.69999999999999996);
INSERT INTO countrylanguage VALUES ('MNG', 'Dariganga                     ', 'F', 1.39999999999999991);
INSERT INTO countrylanguage VALUES ('MNG', 'Dorbet                        ', 'F', 2.70000000000000018);
INSERT INTO countrylanguage VALUES ('MNG', 'Kazakh                        ', 'F', 5.90000000000000036);
INSERT INTO countrylanguage VALUES ('MNG', 'Mongolian                     ', 'T', 78.7999999999999972);
INSERT INTO countrylanguage VALUES ('MNP', 'Carolinian                    ', 'F', 4.79999999999999982);
INSERT INTO countrylanguage VALUES ('MNP', 'Chamorro                      ', 'F', 30);
INSERT INTO countrylanguage VALUES ('MNP', 'Chinese                       ', 'F', 7.09999999999999964);
INSERT INTO countrylanguage VALUES ('MNP', 'English                       ', 'T', 4.79999999999999982);
INSERT INTO countrylanguage VALUES ('MNP', 'Korean                        ', 'F', 6.5);
INSERT INTO countrylanguage VALUES ('MNP', 'Philippene Languages          ', 'F', 34.1000000000000014);
INSERT INTO countrylanguage VALUES ('MOZ', 'Chuabo                        ', 'F', 5.70000000000000018);
INSERT INTO countrylanguage VALUES ('MOZ', 'Lomwe                         ', 'F', 7.79999999999999982);
INSERT INTO countrylanguage VALUES ('MOZ', 'Makua                         ', 'F', 27.8000000000000007);
INSERT INTO countrylanguage VALUES ('MOZ', 'Marendje                      ', 'F', 3.5);
INSERT INTO countrylanguage VALUES ('MOZ', 'Nyanja                        ', 'F', 3.29999999999999982);
INSERT INTO countrylanguage VALUES ('MOZ', 'Ronga                         ', 'F', 3.70000000000000018);
INSERT INTO countrylanguage VALUES ('MOZ', 'Sena                          ', 'F', 9.40000000000000036);
INSERT INTO countrylanguage VALUES ('MOZ', 'Shona                         ', 'F', 6.5);
INSERT INTO countrylanguage VALUES ('MOZ', 'Tsonga                        ', 'F', 12.4000000000000004);
INSERT INTO countrylanguage VALUES ('MOZ', 'Tswa                          ', 'F', 6);
INSERT INTO countrylanguage VALUES ('MRT', 'Ful                           ', 'F', 1.19999999999999996);
INSERT INTO countrylanguage VALUES ('MRT', 'Hassaniya                     ', 'F', 81.7000000000000028);
INSERT INTO countrylanguage VALUES ('MRT', 'Soninke                       ', 'F', 2.70000000000000018);
INSERT INTO countrylanguage VALUES ('MRT', 'Tukulor                       ', 'F', 5.40000000000000036);
INSERT INTO countrylanguage VALUES ('MRT', 'Wolof                         ', 'F', 6.59999999999999964);
INSERT INTO countrylanguage VALUES ('MRT', 'Zenaga                        ', 'F', 1.19999999999999996);
INSERT INTO countrylanguage VALUES ('MSR', 'English                       ', 'T', 0);
INSERT INTO countrylanguage VALUES ('MTQ', 'Creole French                 ', 'F', 96.5999999999999943);
INSERT INTO countrylanguage VALUES ('MTQ', 'French                        ', 'T', 0);
INSERT INTO countrylanguage VALUES ('MUS', 'Bhojpuri                      ', 'F', 21.1000000000000014);
INSERT INTO countrylanguage VALUES ('MUS', 'Creole French                 ', 'F', 70.5999999999999943);
INSERT INTO countrylanguage VALUES ('MUS', 'French                        ', 'F', 3.39999999999999991);
INSERT INTO countrylanguage VALUES ('MUS', 'Hindi                         ', 'F', 1.19999999999999996);
INSERT INTO countrylanguage VALUES ('MUS', 'Marathi                       ', 'F', 0.699999999999999956);
INSERT INTO countrylanguage VALUES ('MUS', 'Tamil                         ', 'F', 0.800000000000000044);
INSERT INTO countrylanguage VALUES ('MWI', 'Chichewa                      ', 'T', 58.2999999999999972);
INSERT INTO countrylanguage VALUES ('MWI', 'Lomwe                         ', 'F', 18.3999999999999986);
INSERT INTO countrylanguage VALUES ('MWI', 'Ngoni                         ', 'F', 6.70000000000000018);
INSERT INTO countrylanguage VALUES ('MWI', 'Yao                           ', 'F', 13.1999999999999993);
INSERT INTO countrylanguage VALUES ('MYS', 'Chinese                       ', 'F', 9);
INSERT INTO countrylanguage VALUES ('MYS', 'Dusun                         ', 'F', 1.10000000000000009);
INSERT INTO countrylanguage VALUES ('MYS', 'English                       ', 'F', 1.60000000000000009);
INSERT INTO countrylanguage VALUES ('MYS', 'Iban                          ', 'F', 2.79999999999999982);
INSERT INTO countrylanguage VALUES ('MYS', 'Malay                         ', 'T', 58.3999999999999986);
INSERT INTO countrylanguage VALUES ('MYS', 'Tamil                         ', 'F', 3.89999999999999991);
INSERT INTO countrylanguage VALUES ('MYT', 'French                        ', 'T', 20.3000000000000007);
INSERT INTO countrylanguage VALUES ('MYT', 'Mahore                        ', 'F', 41.8999999999999986);
INSERT INTO countrylanguage VALUES ('MYT', 'Malagasy                      ', 'F', 16.1000000000000014);
INSERT INTO countrylanguage VALUES ('NAM', 'Afrikaans                     ', 'F', 9.5);
INSERT INTO countrylanguage VALUES ('NAM', 'Caprivi                       ', 'F', 4.70000000000000018);
INSERT INTO countrylanguage VALUES ('NAM', 'German                        ', 'F', 0.900000000000000022);
INSERT INTO countrylanguage VALUES ('NAM', 'Herero                        ', 'F', 8);
INSERT INTO countrylanguage VALUES ('NAM', 'Kavango                       ', 'F', 9.69999999999999929);
INSERT INTO countrylanguage VALUES ('NAM', 'Nama                          ', 'F', 12.4000000000000004);
INSERT INTO countrylanguage VALUES ('NAM', 'Ovambo                        ', 'F', 50.7000000000000028);
INSERT INTO countrylanguage VALUES ('NAM', 'San                           ', 'F', 1.89999999999999991);
INSERT INTO countrylanguage VALUES ('NCL', 'French                        ', 'T', 34.2999999999999972);
INSERT INTO countrylanguage VALUES ('NCL', 'Malenasian Languages          ', 'F', 45.3999999999999986);
INSERT INTO countrylanguage VALUES ('NCL', 'Polynesian Languages          ', 'F', 11.5999999999999996);
INSERT INTO countrylanguage VALUES ('NER', 'Ful                           ', 'F', 9.69999999999999929);
INSERT INTO countrylanguage VALUES ('NER', 'Hausa                         ', 'F', 53.1000000000000014);
INSERT INTO countrylanguage VALUES ('NER', 'Kanuri                        ', 'F', 4.40000000000000036);
INSERT INTO countrylanguage VALUES ('NER', 'Songhai-zerma                 ', 'F', 21.1999999999999993);
INSERT INTO countrylanguage VALUES ('NER', 'Tamashek                      ', 'F', 10.4000000000000004);
INSERT INTO countrylanguage VALUES ('NFK', 'English                       ', 'T', 0);
INSERT INTO countrylanguage VALUES ('NGA', 'Bura                          ', 'F', 1.60000000000000009);
INSERT INTO countrylanguage VALUES ('NGA', 'Edo                           ', 'F', 3.29999999999999982);
INSERT INTO countrylanguage VALUES ('NGA', 'Ful                           ', 'F', 11.3000000000000007);
INSERT INTO countrylanguage VALUES ('NGA', 'Hausa                         ', 'F', 21.1000000000000014);
INSERT INTO countrylanguage VALUES ('NGA', 'Ibibio                        ', 'F', 5.59999999999999964);
INSERT INTO countrylanguage VALUES ('NGA', 'Ibo                           ', 'F', 18.1000000000000014);
INSERT INTO countrylanguage VALUES ('NGA', 'Ijo                           ', 'F', 1.80000000000000004);
INSERT INTO countrylanguage VALUES ('NGA', 'Joruba                        ', 'F', 21.3999999999999986);
INSERT INTO countrylanguage VALUES ('NGA', 'Kanuri                        ', 'F', 4.09999999999999964);
INSERT INTO countrylanguage VALUES ('NGA', 'Tiv                           ', 'F', 2.29999999999999982);
INSERT INTO countrylanguage VALUES ('NIC', 'Creole English                ', 'F', 0.5);
INSERT INTO countrylanguage VALUES ('NIC', 'Miskito                       ', 'F', 1.60000000000000009);
INSERT INTO countrylanguage VALUES ('NIC', 'Spanish                       ', 'T', 97.5999999999999943);
INSERT INTO countrylanguage VALUES ('NIC', 'Sumo                          ', 'F', 0.200000000000000011);
INSERT INTO countrylanguage VALUES ('NIU', 'English                       ', 'T', 0);
INSERT INTO countrylanguage VALUES ('NIU', 'Niue                          ', 'F', 0);
INSERT INTO countrylanguage VALUES ('NLD', 'Arabic                        ', 'F', 0.900000000000000022);
INSERT INTO countrylanguage VALUES ('NLD', 'Dutch                         ', 'T', 95.5999999999999943);
INSERT INTO countrylanguage VALUES ('NLD', 'Fries                         ', 'F', 3.70000000000000018);
INSERT INTO countrylanguage VALUES ('NLD', 'Turkish                       ', 'F', 0.800000000000000044);
INSERT INTO countrylanguage VALUES ('NOR', 'Danish                        ', 'F', 0.400000000000000022);
INSERT INTO countrylanguage VALUES ('NOR', 'English                       ', 'F', 0.5);
INSERT INTO countrylanguage VALUES ('NOR', 'Norwegian                     ', 'T', 96.5999999999999943);
INSERT INTO countrylanguage VALUES ('NOR', 'Saame                         ', 'F', 0);
INSERT INTO countrylanguage VALUES ('NOR', 'Swedish                       ', 'F', 0.299999999999999989);
INSERT INTO countrylanguage VALUES ('NPL', 'Bhojpuri                      ', 'F', 7.5);
INSERT INTO countrylanguage VALUES ('NPL', 'Hindi                         ', 'F', 3);
INSERT INTO countrylanguage VALUES ('NPL', 'Maithili                      ', 'F', 11.9000000000000004);
INSERT INTO countrylanguage VALUES ('NPL', 'Nepali                        ', 'T', 50.3999999999999986);
INSERT INTO countrylanguage VALUES ('NPL', 'Newari                        ', 'F', 3.70000000000000018);
INSERT INTO countrylanguage VALUES ('NPL', 'Tamang                        ', 'F', 4.90000000000000036);
INSERT INTO countrylanguage VALUES ('NPL', 'Tharu                         ', 'F', 5.40000000000000036);
INSERT INTO countrylanguage VALUES ('NRU', 'Chinese                       ', 'F', 8.5);
INSERT INTO countrylanguage VALUES ('NRU', 'English                       ', 'T', 7.5);
INSERT INTO countrylanguage VALUES ('NRU', 'Kiribati                      ', 'F', 17.8999999999999986);
INSERT INTO countrylanguage VALUES ('NRU', 'Nauru                         ', 'T', 57.5);
INSERT INTO countrylanguage VALUES ('NRU', 'Tuvalu                        ', 'F', 8.5);
INSERT INTO countrylanguage VALUES ('NZL', 'English                       ', 'T', 87);
INSERT INTO countrylanguage VALUES ('NZL', 'Maori                         ', 'F', 4.29999999999999982);
INSERT INTO countrylanguage VALUES ('OMN', 'Arabic                        ', 'T', 76.7000000000000028);
INSERT INTO countrylanguage VALUES ('OMN', 'Balochi                       ', 'F', 0);
INSERT INTO countrylanguage VALUES ('PAK', 'Balochi                       ', 'F', 3);
INSERT INTO countrylanguage VALUES ('PAK', 'Brahui                        ', 'F', 1.19999999999999996);
INSERT INTO countrylanguage VALUES ('PAK', 'Hindko                        ', 'F', 2.39999999999999991);
INSERT INTO countrylanguage VALUES ('PAK', 'Pashto                        ', 'F', 13.0999999999999996);
INSERT INTO countrylanguage VALUES ('PAK', 'Punjabi                       ', 'F', 48.2000000000000028);
INSERT INTO countrylanguage VALUES ('PAK', 'Saraiki                       ', 'F', 9.80000000000000071);
INSERT INTO countrylanguage VALUES ('PAK', 'Sindhi                        ', 'F', 11.8000000000000007);
INSERT INTO countrylanguage VALUES ('PAK', 'Urdu                          ', 'T', 7.59999999999999964);
INSERT INTO countrylanguage VALUES ('PAN', 'Arabic                        ', 'F', 0.599999999999999978);
INSERT INTO countrylanguage VALUES ('PAN', 'Creole English                ', 'F', 14);
INSERT INTO countrylanguage VALUES ('PAN', 'Cuna                          ', 'F', 2);
INSERT INTO countrylanguage VALUES ('PAN', 'Embera                        ', 'F', 0.599999999999999978);
INSERT INTO countrylanguage VALUES ('PAN', 'Guaymi                        ', 'F', 5.29999999999999982);
INSERT INTO countrylanguage VALUES ('PAN', 'Spanish                       ', 'T', 76.7999999999999972);
INSERT INTO countrylanguage VALUES ('PCN', 'Pitcairnese                   ', 'F', 0);
INSERT INTO countrylanguage VALUES ('PER', 'Aimar                         ', 'T', 2.29999999999999982);
INSERT INTO countrylanguage VALUES ('PER', 'Ketoua                        ', 'T', 16.3999999999999986);
INSERT INTO countrylanguage VALUES ('PER', 'Spanish                       ', 'T', 79.7999999999999972);
INSERT INTO countrylanguage VALUES ('PHL', 'Bicol                         ', 'F', 5.70000000000000018);
INSERT INTO countrylanguage VALUES ('PHL', 'Cebuano                       ', 'F', 23.3000000000000007);
INSERT INTO countrylanguage VALUES ('PHL', 'Hiligaynon                    ', 'F', 9.09999999999999964);
INSERT INTO countrylanguage VALUES ('PHL', 'Ilocano                       ', 'F', 9.30000000000000071);
INSERT INTO countrylanguage VALUES ('PHL', 'Maguindanao                   ', 'F', 1.39999999999999991);
INSERT INTO countrylanguage VALUES ('PHL', 'Maranao                       ', 'F', 1.30000000000000004);
INSERT INTO countrylanguage VALUES ('PHL', 'Pampango                      ', 'F', 3);
INSERT INTO countrylanguage VALUES ('PHL', 'Pangasinan                    ', 'F', 1.80000000000000004);
INSERT INTO countrylanguage VALUES ('PHL', 'Pilipino                      ', 'T', 29.3000000000000007);
INSERT INTO countrylanguage VALUES ('PHL', 'Waray-waray                   ', 'F', 3.79999999999999982);
INSERT INTO countrylanguage VALUES ('PLW', 'Chinese                       ', 'F', 1.60000000000000009);
INSERT INTO countrylanguage VALUES ('PLW', 'English                       ', 'T', 3.20000000000000018);
INSERT INTO countrylanguage VALUES ('PLW', 'Palau                         ', 'T', 82.2000000000000028);
INSERT INTO countrylanguage VALUES ('PLW', 'Philippene Languages          ', 'F', 9.19999999999999929);
INSERT INTO countrylanguage VALUES ('PNG', 'Malenasian Languages          ', 'F', 20);
INSERT INTO countrylanguage VALUES ('PNG', 'Papuan Languages              ', 'F', 78.0999999999999943);
INSERT INTO countrylanguage VALUES ('POL', 'Belorussian                   ', 'F', 0.5);
INSERT INTO countrylanguage VALUES ('POL', 'German                        ', 'F', 1.30000000000000004);
INSERT INTO countrylanguage VALUES ('POL', 'Polish                        ', 'T', 97.5999999999999943);
INSERT INTO countrylanguage VALUES ('POL', 'Ukrainian                     ', 'F', 0.599999999999999978);
INSERT INTO countrylanguage VALUES ('PRI', 'English                       ', 'F', 47.3999999999999986);
INSERT INTO countrylanguage VALUES ('PRI', 'Spanish                       ', 'T', 51.2999999999999972);
INSERT INTO countrylanguage VALUES ('PRK', 'Chinese                       ', 'F', 0.100000000000000006);
INSERT INTO countrylanguage VALUES ('PRK', 'Korean                        ', 'T', 99.9000000000000057);
INSERT INTO countrylanguage VALUES ('PRT', 'Portuguese                    ', 'T', 99);
INSERT INTO countrylanguage VALUES ('PRY', 'German                        ', 'F', 0.900000000000000022);
INSERT INTO countrylanguage VALUES ('PRY', 'Guarani                       ', 'T', 40.1000000000000014);
INSERT INTO countrylanguage VALUES ('PRY', 'Portuguese                    ', 'F', 3.20000000000000018);
INSERT INTO countrylanguage VALUES ('PRY', 'Spanish                       ', 'T', 55.1000000000000014);
INSERT INTO countrylanguage VALUES ('PSE', 'Arabic                        ', 'F', 95.9000000000000057);
INSERT INTO countrylanguage VALUES ('PSE', 'Hebrew                        ', 'F', 4.09999999999999964);
INSERT INTO countrylanguage VALUES ('PYF', 'Chinese                       ', 'F', 2.89999999999999991);
INSERT INTO countrylanguage VALUES ('PYF', 'French                        ', 'T', 40.7999999999999972);
INSERT INTO countrylanguage VALUES ('PYF', 'Tahitian                      ', 'F', 46.3999999999999986);
INSERT INTO countrylanguage VALUES ('QAT', 'Arabic                        ', 'T', 40.7000000000000028);
INSERT INTO countrylanguage VALUES ('QAT', 'Urdu                          ', 'F', 0);
INSERT INTO countrylanguage VALUES ('REU', 'Chinese                       ', 'F', 2.79999999999999982);
INSERT INTO countrylanguage VALUES ('REU', 'Comorian                      ', 'F', 2.79999999999999982);
INSERT INTO countrylanguage VALUES ('REU', 'Creole French                 ', 'F', 91.5);
INSERT INTO countrylanguage VALUES ('REU', 'Malagasy                      ', 'F', 1.39999999999999991);
INSERT INTO countrylanguage VALUES ('REU', 'Tamil                         ', 'F', 0);
INSERT INTO countrylanguage VALUES ('ROM', 'German                        ', 'F', 0.400000000000000022);
INSERT INTO countrylanguage VALUES ('ROM', 'Hungarian                     ', 'F', 7.20000000000000018);
INSERT INTO countrylanguage VALUES ('ROM', 'Romani                        ', 'T', 0.699999999999999956);
INSERT INTO countrylanguage VALUES ('ROM', 'Romanian                      ', 'T', 90.7000000000000028);
INSERT INTO countrylanguage VALUES ('ROM', 'Serbo-Croatian                ', 'F', 0.100000000000000006);
INSERT INTO countrylanguage VALUES ('ROM', 'Ukrainian                     ', 'F', 0.299999999999999989);
INSERT INTO countrylanguage VALUES ('RUS', 'Avarian                       ', 'F', 0.400000000000000022);
INSERT INTO countrylanguage VALUES ('RUS', 'Bashkir                       ', 'F', 0.699999999999999956);
INSERT INTO countrylanguage VALUES ('RUS', 'Belorussian                   ', 'F', 0.299999999999999989);
INSERT INTO countrylanguage VALUES ('RUS', 'Chechen                       ', 'F', 0.599999999999999978);
INSERT INTO countrylanguage VALUES ('RUS', 'Chuvash                       ', 'F', 0.900000000000000022);
INSERT INTO countrylanguage VALUES ('RUS', 'Kazakh                        ', 'F', 0.400000000000000022);
INSERT INTO countrylanguage VALUES ('RUS', 'Mari                          ', 'F', 0.400000000000000022);
INSERT INTO countrylanguage VALUES ('RUS', 'Mordva                        ', 'F', 0.5);
INSERT INTO countrylanguage VALUES ('RUS', 'Russian                       ', 'T', 86.5999999999999943);
INSERT INTO countrylanguage VALUES ('RUS', 'Tatar                         ', 'F', 3.20000000000000018);
INSERT INTO countrylanguage VALUES ('RUS', 'Udmur                         ', 'F', 0.299999999999999989);
INSERT INTO countrylanguage VALUES ('RUS', 'Ukrainian                     ', 'F', 1.30000000000000004);
INSERT INTO countrylanguage VALUES ('RWA', 'French                        ', 'T', 0);
INSERT INTO countrylanguage VALUES ('RWA', 'Rwanda                        ', 'T', 100);
INSERT INTO countrylanguage VALUES ('SAU', 'Arabic                        ', 'T', 95);
INSERT INTO countrylanguage VALUES ('SDN', 'Arabic                        ', 'T', 49.3999999999999986);
INSERT INTO countrylanguage VALUES ('SDN', 'Bari                          ', 'F', 2.5);
INSERT INTO countrylanguage VALUES ('SDN', 'Beja                          ', 'F', 6.40000000000000036);
INSERT INTO countrylanguage VALUES ('SDN', 'Chilluk                       ', 'F', 1.69999999999999996);
INSERT INTO countrylanguage VALUES ('SDN', 'Dinka                         ', 'F', 11.5);
INSERT INTO countrylanguage VALUES ('SDN', 'Fur                           ', 'F', 2.10000000000000009);
INSERT INTO countrylanguage VALUES ('SDN', 'Lotuko                        ', 'F', 1.5);
INSERT INTO countrylanguage VALUES ('SDN', 'Nubian Languages              ', 'F', 8.09999999999999964);
INSERT INTO countrylanguage VALUES ('SDN', 'Nuer                          ', 'F', 4.90000000000000036);
INSERT INTO countrylanguage VALUES ('SDN', 'Zande                         ', 'F', 2.70000000000000018);
INSERT INTO countrylanguage VALUES ('SEN', 'Diola                         ', 'F', 5);
INSERT INTO countrylanguage VALUES ('SEN', 'Ful                           ', 'F', 21.6999999999999993);
INSERT INTO countrylanguage VALUES ('SEN', 'Malinke                       ', 'F', 3.79999999999999982);
INSERT INTO countrylanguage VALUES ('SEN', 'Serer                         ', 'F', 12.5);
INSERT INTO countrylanguage VALUES ('SEN', 'Soninke                       ', 'F', 1.30000000000000004);
INSERT INTO countrylanguage VALUES ('SEN', 'Wolof                         ', 'T', 48.1000000000000014);
INSERT INTO countrylanguage VALUES ('SGP', 'Chinese                       ', 'T', 77.0999999999999943);
INSERT INTO countrylanguage VALUES ('SGP', 'Malay                         ', 'T', 14.0999999999999996);
INSERT INTO countrylanguage VALUES ('SGP', 'Tamil                         ', 'T', 7.40000000000000036);
INSERT INTO countrylanguage VALUES ('SHN', 'English                       ', 'T', 0);
INSERT INTO countrylanguage VALUES ('SJM', 'Norwegian                     ', 'T', 0);
INSERT INTO countrylanguage VALUES ('SJM', 'Russian                       ', 'F', 0);
INSERT INTO countrylanguage VALUES ('SLB', 'Malenasian Languages          ', 'F', 85.5999999999999943);
INSERT INTO countrylanguage VALUES ('SLB', 'Papuan Languages              ', 'F', 8.59999999999999964);
INSERT INTO countrylanguage VALUES ('SLB', 'Polynesian Languages          ', 'F', 3.79999999999999982);
INSERT INTO countrylanguage VALUES ('SLE', 'Bullom-sherbro                ', 'F', 3.79999999999999982);
INSERT INTO countrylanguage VALUES ('SLE', 'Ful                           ', 'F', 3.79999999999999982);
INSERT INTO countrylanguage VALUES ('SLE', 'Kono-vai                      ', 'F', 5.09999999999999964);
INSERT INTO countrylanguage VALUES ('SLE', 'Kuranko                       ', 'F', 3.39999999999999991);
INSERT INTO countrylanguage VALUES ('SLE', 'Limba                         ', 'F', 8.30000000000000071);
INSERT INTO countrylanguage VALUES ('SLE', 'Mende                         ', 'F', 34.7999999999999972);
INSERT INTO countrylanguage VALUES ('SLE', 'Temne                         ', 'F', 31.8000000000000007);
INSERT INTO countrylanguage VALUES ('SLE', 'Yalunka                       ', 'F', 3.39999999999999991);
INSERT INTO countrylanguage VALUES ('SLV', 'Nahua                         ', 'F', 0);
INSERT INTO countrylanguage VALUES ('SLV', 'Spanish                       ', 'T', 100);
INSERT INTO countrylanguage VALUES ('SMR', 'Italian                       ', 'T', 100);
INSERT INTO countrylanguage VALUES ('SOM', 'Arabic                        ', 'T', 0);
INSERT INTO countrylanguage VALUES ('SOM', 'Somali                        ', 'T', 98.2999999999999972);
INSERT INTO countrylanguage VALUES ('SPM', 'French                        ', 'T', 0);
INSERT INTO countrylanguage VALUES ('STP', 'Crioulo                       ', 'F', 86.2999999999999972);
INSERT INTO countrylanguage VALUES ('STP', 'French                        ', 'F', 0.699999999999999956);
INSERT INTO countrylanguage VALUES ('SUR', 'Hindi                         ', 'F', 0);
INSERT INTO countrylanguage VALUES ('SUR', 'Sranantonga                   ', 'F', 81);
INSERT INTO countrylanguage VALUES ('SVK', 'Czech and Moravian            ', 'F', 1.10000000000000009);
INSERT INTO countrylanguage VALUES ('SVK', 'Hungarian                     ', 'F', 10.5);
INSERT INTO countrylanguage VALUES ('SVK', 'Romani                        ', 'F', 1.69999999999999996);
INSERT INTO countrylanguage VALUES ('SVK', 'Slovak                        ', 'T', 85.5999999999999943);
INSERT INTO countrylanguage VALUES ('SVK', 'Ukrainian and Russian         ', 'F', 0.599999999999999978);
INSERT INTO countrylanguage VALUES ('SVN', 'Hungarian                     ', 'F', 0.5);
INSERT INTO countrylanguage VALUES ('SVN', 'Serbo-Croatian                ', 'F', 7.90000000000000036);
INSERT INTO countrylanguage VALUES ('SVN', 'Slovene                       ', 'T', 87.9000000000000057);
INSERT INTO countrylanguage VALUES ('SWE', 'Arabic                        ', 'F', 0.800000000000000044);
INSERT INTO countrylanguage VALUES ('SWE', 'Finnish                       ', 'F', 2.39999999999999991);
INSERT INTO countrylanguage VALUES ('SWE', 'Norwegian                     ', 'F', 0.5);
INSERT INTO countrylanguage VALUES ('SWE', 'Southern Slavic Languages     ', 'F', 1.30000000000000004);
INSERT INTO countrylanguage VALUES ('SWE', 'Spanish                       ', 'F', 0.599999999999999978);
INSERT INTO countrylanguage VALUES ('SWE', 'Swedish                       ', 'T', 89.5);
INSERT INTO countrylanguage VALUES ('SWZ', 'Swazi                         ', 'T', 89.9000000000000057);
INSERT INTO countrylanguage VALUES ('SWZ', 'Zulu                          ', 'F', 2);
INSERT INTO countrylanguage VALUES ('SYC', 'English                       ', 'T', 3.79999999999999982);
INSERT INTO countrylanguage VALUES ('SYC', 'French                        ', 'T', 1.30000000000000004);
INSERT INTO countrylanguage VALUES ('SYC', 'Seselwa                       ', 'F', 91.2999999999999972);
INSERT INTO countrylanguage VALUES ('SYR', 'Arabic                        ', 'T', 90);
INSERT INTO countrylanguage VALUES ('SYR', 'Kurdish                       ', 'F', 9);
INSERT INTO countrylanguage VALUES ('TCA', 'English                       ', 'T', 0);
INSERT INTO countrylanguage VALUES ('TCD', 'Arabic                        ', 'T', 12.3000000000000007);
INSERT INTO countrylanguage VALUES ('TCD', 'Gorane                        ', 'F', 6.20000000000000018);
INSERT INTO countrylanguage VALUES ('TCD', 'Hadjarai                      ', 'F', 6.70000000000000018);
INSERT INTO countrylanguage VALUES ('TCD', 'Kanem-bornu                   ', 'F', 9);
INSERT INTO countrylanguage VALUES ('TCD', 'Mayo-kebbi                    ', 'F', 11.5);
INSERT INTO countrylanguage VALUES ('TCD', 'Ouaddai                       ', 'F', 8.69999999999999929);
INSERT INTO countrylanguage VALUES ('TCD', 'Sara                          ', 'F', 27.6999999999999993);
INSERT INTO countrylanguage VALUES ('TCD', 'Tandjile                      ', 'F', 6.5);
INSERT INTO countrylanguage VALUES ('TGO', 'Ane                           ', 'F', 5.70000000000000018);
INSERT INTO countrylanguage VALUES ('TGO', 'Ewe                           ', 'T', 23.1999999999999993);
INSERT INTO countrylanguage VALUES ('TGO', 'Gurma                         ', 'F', 3.39999999999999991);
INSERT INTO countrylanguage VALUES ('TGO', 'Kabye                         ', 'T', 13.8000000000000007);
INSERT INTO countrylanguage VALUES ('TGO', 'Kotokoli                      ', 'F', 5.70000000000000018);
INSERT INTO countrylanguage VALUES ('TGO', 'Moba                          ', 'F', 5.40000000000000036);
INSERT INTO countrylanguage VALUES ('TGO', 'Naudemba                      ', 'F', 4.09999999999999964);
INSERT INTO countrylanguage VALUES ('TGO', 'Watyi                         ', 'F', 10.3000000000000007);
INSERT INTO countrylanguage VALUES ('THA', 'Chinese                       ', 'F', 12.0999999999999996);
INSERT INTO countrylanguage VALUES ('THA', 'Khmer                         ', 'F', 1.30000000000000004);
INSERT INTO countrylanguage VALUES ('THA', 'Kuy                           ', 'F', 1.10000000000000009);
INSERT INTO countrylanguage VALUES ('THA', 'Lao                           ', 'F', 26.8999999999999986);
INSERT INTO countrylanguage VALUES ('THA', 'Malay                         ', 'F', 3.60000000000000009);
INSERT INTO countrylanguage VALUES ('THA', 'Thai                          ', 'T', 52.6000000000000014);
INSERT INTO countrylanguage VALUES ('TJK', 'Russian                       ', 'F', 9.69999999999999929);
INSERT INTO countrylanguage VALUES ('TJK', 'Tadzhik                       ', 'T', 62.2000000000000028);
INSERT INTO countrylanguage VALUES ('TJK', 'Uzbek                         ', 'F', 23.1999999999999993);
INSERT INTO countrylanguage VALUES ('TKL', 'English                       ', 'T', 0);
INSERT INTO countrylanguage VALUES ('TKL', 'Tokelau                       ', 'F', 0);
INSERT INTO countrylanguage VALUES ('TKM', 'Kazakh                        ', 'F', 2);
INSERT INTO countrylanguage VALUES ('TKM', 'Russian                       ', 'F', 6.70000000000000018);
INSERT INTO countrylanguage VALUES ('TKM', 'Turkmenian                    ', 'T', 76.7000000000000028);
INSERT INTO countrylanguage VALUES ('TKM', 'Uzbek                         ', 'F', 9.19999999999999929);
INSERT INTO countrylanguage VALUES ('TMP', 'Portuguese                    ', 'T', 0);
INSERT INTO countrylanguage VALUES ('TMP', 'Sunda                         ', 'F', 0);
INSERT INTO countrylanguage VALUES ('TON', 'English                       ', 'T', 0);
INSERT INTO countrylanguage VALUES ('TON', 'Tongan                        ', 'T', 98.2999999999999972);
INSERT INTO countrylanguage VALUES ('TTO', 'Creole English                ', 'F', 2.89999999999999991);
INSERT INTO countrylanguage VALUES ('TTO', 'English                       ', 'F', 93.5);
INSERT INTO countrylanguage VALUES ('TTO', 'Hindi                         ', 'F', 3.39999999999999991);
INSERT INTO countrylanguage VALUES ('TUN', 'Arabic                        ', 'T', 69.9000000000000057);
INSERT INTO countrylanguage VALUES ('TUN', 'Arabic-French                 ', 'F', 26.3000000000000007);
INSERT INTO countrylanguage VALUES ('TUN', 'Arabic-French-English         ', 'F', 3.20000000000000018);
INSERT INTO countrylanguage VALUES ('TUR', 'Arabic                        ', 'F', 1.39999999999999991);
INSERT INTO countrylanguage VALUES ('TUR', 'Kurdish                       ', 'F', 10.5999999999999996);
INSERT INTO countrylanguage VALUES ('TUR', 'Turkish                       ', 'T', 87.5999999999999943);
INSERT INTO countrylanguage VALUES ('TUV', 'English                       ', 'T', 0);
INSERT INTO countrylanguage VALUES ('TUV', 'Kiribati                      ', 'F', 7.5);
INSERT INTO countrylanguage VALUES ('TUV', 'Tuvalu                        ', 'T', 92.5);
INSERT INTO countrylanguage VALUES ('TWN', 'Ami                           ', 'F', 0.599999999999999978);
INSERT INTO countrylanguage VALUES ('TWN', 'Atayal                        ', 'F', 0.400000000000000022);
INSERT INTO countrylanguage VALUES ('TWN', 'Hakka                         ', 'F', 11);
INSERT INTO countrylanguage VALUES ('TWN', 'Mandarin Chinese              ', 'T', 20.1000000000000014);
INSERT INTO countrylanguage VALUES ('TWN', 'Min                           ', 'F', 66.7000000000000028);
INSERT INTO countrylanguage VALUES ('TWN', 'Paiwan                        ', 'F', 0.299999999999999989);
INSERT INTO countrylanguage VALUES ('TZA', 'Chaga and Pare                ', 'F', 4.90000000000000036);
INSERT INTO countrylanguage VALUES ('TZA', 'Gogo                          ', 'F', 3.89999999999999991);
INSERT INTO countrylanguage VALUES ('TZA', 'Ha                            ', 'F', 3.5);
INSERT INTO countrylanguage VALUES ('TZA', 'Haya                          ', 'F', 5.90000000000000036);
INSERT INTO countrylanguage VALUES ('TZA', 'Hehet                         ', 'F', 6.90000000000000036);
INSERT INTO countrylanguage VALUES ('TZA', 'Luguru                        ', 'F', 4.90000000000000036);
INSERT INTO countrylanguage VALUES ('TZA', 'Makonde                       ', 'F', 5.90000000000000036);
INSERT INTO countrylanguage VALUES ('TZA', 'Nyakusa                       ', 'F', 5.40000000000000036);
INSERT INTO countrylanguage VALUES ('TZA', 'Nyamwesi                      ', 'F', 21.1000000000000014);
INSERT INTO countrylanguage VALUES ('TZA', 'Shambala                      ', 'F', 4.29999999999999982);
INSERT INTO countrylanguage VALUES ('TZA', 'Swahili                       ', 'T', 8.80000000000000071);
INSERT INTO countrylanguage VALUES ('UGA', 'Acholi                        ', 'F', 4.40000000000000036);
INSERT INTO countrylanguage VALUES ('UGA', 'Ganda                         ', 'F', 18.1000000000000014);
INSERT INTO countrylanguage VALUES ('UGA', 'Gisu                          ', 'F', 4.5);
INSERT INTO countrylanguage VALUES ('UGA', 'Kiga                          ', 'F', 8.30000000000000071);
INSERT INTO countrylanguage VALUES ('UGA', 'Lango                         ', 'F', 5.90000000000000036);
INSERT INTO countrylanguage VALUES ('UGA', 'Lugbara                       ', 'F', 4.70000000000000018);
INSERT INTO countrylanguage VALUES ('UGA', 'Nkole                         ', 'F', 10.6999999999999993);
INSERT INTO countrylanguage VALUES ('UGA', 'Rwanda                        ', 'F', 3.20000000000000018);
INSERT INTO countrylanguage VALUES ('UGA', 'Soga                          ', 'F', 8.19999999999999929);
INSERT INTO countrylanguage VALUES ('UGA', 'Teso                          ', 'F', 6);
INSERT INTO countrylanguage VALUES ('UKR', 'Belorussian                   ', 'F', 0.299999999999999989);
INSERT INTO countrylanguage VALUES ('UKR', 'Bulgariana                    ', 'F', 0.299999999999999989);
INSERT INTO countrylanguage VALUES ('UKR', 'Hungarian                     ', 'F', 0.299999999999999989);
INSERT INTO countrylanguage VALUES ('UKR', 'Polish                        ', 'F', 0.100000000000000006);
INSERT INTO countrylanguage VALUES ('UKR', 'Romanian                      ', 'F', 0.699999999999999956);
INSERT INTO countrylanguage VALUES ('UKR', 'Russian                       ', 'F', 32.8999999999999986);
INSERT INTO countrylanguage VALUES ('UKR', 'Ukrainian                     ', 'T', 64.7000000000000028);
INSERT INTO countrylanguage VALUES ('UMI', 'English                       ', 'T', 0);
INSERT INTO countrylanguage VALUES ('URY', 'Spanish                       ', 'T', 95.7000000000000028);
INSERT INTO countrylanguage VALUES ('USA', 'Chinese                       ', 'F', 0.599999999999999978);
INSERT INTO countrylanguage VALUES ('USA', 'English                       ', 'T', 86.2000000000000028);
INSERT INTO countrylanguage VALUES ('USA', 'French                        ', 'F', 0.699999999999999956);
INSERT INTO countrylanguage VALUES ('USA', 'German                        ', 'F', 0.699999999999999956);
INSERT INTO countrylanguage VALUES ('USA', 'Italian                       ', 'F', 0.599999999999999978);
INSERT INTO countrylanguage VALUES ('USA', 'Japanese                      ', 'F', 0.200000000000000011);
INSERT INTO countrylanguage VALUES ('USA', 'Korean                        ', 'F', 0.299999999999999989);
INSERT INTO countrylanguage VALUES ('USA', 'Polish                        ', 'F', 0.299999999999999989);
INSERT INTO countrylanguage VALUES ('USA', 'Portuguese                    ', 'F', 0.200000000000000011);
INSERT INTO countrylanguage VALUES ('USA', 'Spanish                       ', 'F', 7.5);
INSERT INTO countrylanguage VALUES ('USA', 'Tagalog                       ', 'F', 0.400000000000000022);
INSERT INTO countrylanguage VALUES ('USA', 'Vietnamese                    ', 'F', 0.200000000000000011);
INSERT INTO countrylanguage VALUES ('UZB', 'Karakalpak                    ', 'F', 2);
INSERT INTO countrylanguage VALUES ('UZB', 'Kazakh                        ', 'F', 3.79999999999999982);
INSERT INTO countrylanguage VALUES ('UZB', 'Russian                       ', 'F', 10.9000000000000004);
INSERT INTO countrylanguage VALUES ('UZB', 'Tadzhik                       ', 'F', 4.40000000000000036);
INSERT INTO countrylanguage VALUES ('UZB', 'Tatar                         ', 'F', 1.80000000000000004);
INSERT INTO countrylanguage VALUES ('UZB', 'Uzbek                         ', 'T', 72.5999999999999943);
INSERT INTO countrylanguage VALUES ('VAT', 'Italian                       ', 'T', 0);
INSERT INTO countrylanguage VALUES ('VCT', 'Creole English                ', 'F', 99.0999999999999943);
INSERT INTO countrylanguage VALUES ('VCT', 'English                       ', 'T', 0);
INSERT INTO countrylanguage VALUES ('VEN', 'Goajiro                       ', 'F', 0.400000000000000022);
INSERT INTO countrylanguage VALUES ('VEN', 'Spanish                       ', 'T', 96.9000000000000057);
INSERT INTO countrylanguage VALUES ('VEN', 'Warrau                        ', 'F', 0.100000000000000006);
INSERT INTO countrylanguage VALUES ('VGB', 'English                       ', 'T', 0);
INSERT INTO countrylanguage VALUES ('VIR', 'English                       ', 'T', 81.7000000000000028);
INSERT INTO countrylanguage VALUES ('VIR', 'French                        ', 'F', 2.5);
INSERT INTO countrylanguage VALUES ('VIR', 'Spanish                       ', 'F', 13.3000000000000007);
INSERT INTO countrylanguage VALUES ('VNM', 'Chinese                       ', 'F', 1.39999999999999991);
INSERT INTO countrylanguage VALUES ('VNM', 'Khmer                         ', 'F', 1.39999999999999991);
INSERT INTO countrylanguage VALUES ('VNM', 'Man                           ', 'F', 0.699999999999999956);
INSERT INTO countrylanguage VALUES ('VNM', 'Miao                          ', 'F', 0.900000000000000022);
INSERT INTO countrylanguage VALUES ('VNM', 'Muong                         ', 'F', 1.5);
INSERT INTO countrylanguage VALUES ('VNM', 'Nung                          ', 'F', 1.10000000000000009);
INSERT INTO countrylanguage VALUES ('VNM', 'Thai                          ', 'F', 1.60000000000000009);
INSERT INTO countrylanguage VALUES ('VNM', 'Tho                           ', 'F', 1.80000000000000004);
INSERT INTO countrylanguage VALUES ('VNM', 'Vietnamese                    ', 'T', 86.7999999999999972);
INSERT INTO countrylanguage VALUES ('VUT', 'Bislama                       ', 'T', 56.6000000000000014);
INSERT INTO countrylanguage VALUES ('VUT', 'English                       ', 'T', 28.3000000000000007);
INSERT INTO countrylanguage VALUES ('VUT', 'French                        ', 'T', 14.1999999999999993);
INSERT INTO countrylanguage VALUES ('WLF', 'Futuna                        ', 'F', 0);
INSERT INTO countrylanguage VALUES ('WLF', 'Wallis                        ', 'F', 0);
INSERT INTO countrylanguage VALUES ('WSM', 'English                       ', 'T', 0.599999999999999978);
INSERT INTO countrylanguage VALUES ('WSM', 'Samoan                        ', 'T', 47.5);
INSERT INTO countrylanguage VALUES ('WSM', 'Samoan-English                ', 'F', 52);
INSERT INTO countrylanguage VALUES ('YEM', 'Arabic                        ', 'T', 99.5999999999999943);
INSERT INTO countrylanguage VALUES ('YEM', 'Soqutri                       ', 'F', 0);
INSERT INTO countrylanguage VALUES ('YUG', 'Albaniana                     ', 'F', 16.5);
INSERT INTO countrylanguage VALUES ('YUG', 'Hungarian                     ', 'F', 3.39999999999999991);
INSERT INTO countrylanguage VALUES ('YUG', 'Macedonian                    ', 'F', 0.5);
INSERT INTO countrylanguage VALUES ('YUG', 'Romani                        ', 'F', 1.39999999999999991);
INSERT INTO countrylanguage VALUES ('YUG', 'Serbo-Croatian                ', 'T', 75.2000000000000028);
INSERT INTO countrylanguage VALUES ('YUG', 'Slovak                        ', 'F', 0.699999999999999956);
INSERT INTO countrylanguage VALUES ('ZAF', 'Afrikaans                     ', 'T', 14.3000000000000007);
INSERT INTO countrylanguage VALUES ('ZAF', 'English                       ', 'T', 8.5);
INSERT INTO countrylanguage VALUES ('ZAF', 'Ndebele                       ', 'F', 1.5);
INSERT INTO countrylanguage VALUES ('ZAF', 'Northsotho                    ', 'F', 9.09999999999999964);
INSERT INTO countrylanguage VALUES ('ZAF', 'Southsotho                    ', 'F', 7.59999999999999964);
INSERT INTO countrylanguage VALUES ('ZAF', 'Swazi                         ', 'F', 2.5);
INSERT INTO countrylanguage VALUES ('ZAF', 'Tsonga                        ', 'F', 4.29999999999999982);
INSERT INTO countrylanguage VALUES ('ZAF', 'Tswana                        ', 'F', 8.09999999999999964);
INSERT INTO countrylanguage VALUES ('ZAF', 'Venda                         ', 'F', 2.20000000000000018);
INSERT INTO countrylanguage VALUES ('ZAF', 'Xhosa                         ', 'T', 17.6999999999999993);
INSERT INTO countrylanguage VALUES ('ZAF', 'Zulu                          ', 'T', 22.6999999999999993);
INSERT INTO countrylanguage VALUES ('ZMB', 'Bemba                         ', 'F', 29.6999999999999993);
INSERT INTO countrylanguage VALUES ('ZMB', 'Chewa                         ', 'F', 5.70000000000000018);
INSERT INTO countrylanguage VALUES ('ZMB', 'Lozi                          ', 'F', 6.40000000000000036);
INSERT INTO countrylanguage VALUES ('ZMB', 'Nsenga                        ', 'F', 4.29999999999999982);
INSERT INTO countrylanguage VALUES ('ZMB', 'Nyanja                        ', 'F', 7.79999999999999982);
INSERT INTO countrylanguage VALUES ('ZMB', 'Tongan                        ', 'F', 11);
INSERT INTO countrylanguage VALUES ('ZWE', 'English                       ', 'T', 2.20000000000000018);
INSERT INTO countrylanguage VALUES ('ZWE', 'Ndebele                       ', 'F', 16.1999999999999993);
INSERT INTO countrylanguage VALUES ('ZWE', 'Nyanja                        ', 'F', 2.20000000000000018);
INSERT INTO countrylanguage VALUES ('ZWE', 'Shona                         ', 'F', 72.0999999999999943);


--
-- TOC entry 2207 (class 2606 OID 17028)
-- Name: city_pkey; Type: CONSTRAINT; Schema: public; Owner: Daniel; Tablespace: 
--

ALTER TABLE ONLY city
    ADD CONSTRAINT city_pkey PRIMARY KEY (id);


--
-- TOC entry 2209 (class 2606 OID 17045)
-- Name: country_pkey; Type: CONSTRAINT; Schema: public; Owner: Daniel; Tablespace: 
--

ALTER TABLE ONLY country
    ADD CONSTRAINT country_pkey PRIMARY KEY (code);


--
-- TOC entry 2211 (class 2606 OID 17054)
-- Name: countrylanguage_pkey; Type: CONSTRAINT; Schema: public; Owner: Daniel; Tablespace: 
--

ALTER TABLE ONLY countrylanguage
    ADD CONSTRAINT countrylanguage_pkey PRIMARY KEY (countrycode, language);


--
-- TOC entry 2221 (class 0 OID 0)
-- Dependencies: 5
-- Name: public; Type: ACL; Schema: -; Owner: Daniel
--


--
-- TOC entry 2223 (class 0 OID 0)
-- Dependencies: 168
-- Name: city; Type: ACL; Schema: public; Owner: Daniel
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE city TO student;


--
-- TOC entry 2224 (class 0 OID 0)
-- Dependencies: 169
-- Name: country; Type: ACL; Schema: public; Owner: Daniel
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE country TO student;


--
-- TOC entry 2225 (class 0 OID 0)
-- Dependencies: 170
-- Name: countrylanguage; Type: ACL; Schema: public; Owner: Daniel
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE countrylanguage TO student;


-- Completed on 2013-07-02 04:26:29 BRT

--
-- PostgreSQL database dump complete
--
"

db2.db_image = 'world'
db2.save